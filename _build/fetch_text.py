#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""fetch_text.py — 把 CSP-J/S 第一轮试卷 PDF 抽成结构化 JSON。

两种后端：
  * 文字层（默认）: pdftohtml -xml 取每个 span 的 top/left/height/font，
    按 top 聚类成行、按字号差判上下标、按字体族判代码与数学。
  * OCR（`--ocr local-vision`）: 逐页 pdftoppm 渲染后交给本地视觉模型转写，
    适用于纯扫描件。后端可切 `mineru`（需 MINERU_TOKEN），协议见
    https://mineru.net/apiManage/docs

用法：
  cd 0x0c00_真题整理
  python3 _build/fetch_text.py CSP-J_S/Round1/2023/2023J1.pdf \\
      --out _build/raw/2023J1.json

输出 JSON 结构：
  {
    "serial": "2023J1",
    "source": "CSP-J_S/Round1/2023/2023J1.pdf",
    "pages": 9,
    "items": [
      {"t": "title",  "text": "2023 CCF ..."},
      {"t": "section","text": "一、单项选择题…"},
      {"t": "sub",    "text": "(1)"},
      {"t": "q",      "num": 1, "text": "…（ ）"},
      {"t": "opt",    "label": "A", "text": "…"},
      {"t": "code",   "text": "int main() {…}"},
      {"t": "para",   "text": "…"},
      {"t": "group",  "text": "判断题"}
    ]
  }
行内记号：上下标写作 `^{…}` / `_{…}`，数学写作 `$…$`，代码写作 `\\`…\\``。
"""
from __future__ import annotations

import argparse
import base64
import html
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
import time
import urllib.error
import urllib.request
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent  # 0x0c00_真题整理

# ---------------------------------------------------------------------------
# 常量
# ---------------------------------------------------------------------------
CJK = re.compile(r"[\u3400-\u9fff\u3000-\u303f\uff00-\uffef]")

CODE_FONT = re.compile(
    r"FiraCode|FiraMono|Sarasa|Consolas|Courier|DejaVuSansMono|JetBrainsMono|SourceCode|Monaco",
    re.I,
)
# LaTeX 卷（xdvipdfmx）的数学用 Computer Modern 系列：CMR/CMMI/CMSY/CMEX
MATH_FONT = re.compile(
    r"NewCMMath|CambriaMath|STIX|MathJax|Symbol|LibertinusSerif|"
    r"\bCM(?:R|MI|SY|EX|BSY|TI)\d*|MSBM|EUFM",
    re.I,
)

PAGE_FOOTER = [
    re.compile(r"^\s*\d{1,3}\s*/\s*\d{1,3}\s*$"),
    re.compile(r"^\s*第\s*\d+\s*页\s*[，,]?\s*共\s*\d+\s*页\s*$"),
    re.compile(r"^\s*第\s*\d+\s*页\s*共\s*\d+\s*页\s*$"),
    re.compile(r"^\s*CCF\s*CSP-[JS]\s*\d{4}\s*第一轮.*$"),
    re.compile(r"^\s*CSP-[JS]\s*\d{4}\s*第一轮.*$"),
    # NOIP 卷脚：「CCF NOIP2016 初赛提高组 C++语言试题」「NOIP2014 初赛…」
    re.compile(r"^\s*CCF\s*NOIP\s*\d{4}.*$"),
    re.compile(r"^\s*NOIP\s*\d{4}.*$"),
    re.compile(r"^\s*\d+\s*$"),
]

SECTION = re.compile(r"^\s*([一二三四五六七八九十]+)\s*[、.．]\s*(.+)$")
SUBHEAD = re.compile(r"^\s*[（(]\s*(\d{1,2})\s*[)）]\s*(.*)$")
# 2004–2010 的老卷题号写成 `1、` `2、`，选项写成 `A)`，而且是五选一（A–E）。
QUESTION = re.compile(r"^\s*(\d{1,2})\s*[.．、)）]\s*(.*)$")
OPTION = re.compile(r"^\s*([A-EＡ-Ｅ])\s*[.．、)）]\s*(.*)$")
CODELN = re.compile(r"^\s*(\d{1,3})\s{2,}(\S.*)$")
# 分组提示：`• 判断题` 里 bullet 可能是 $•$ 或缺字；PDF 里常与相邻文字粘成
# 一行（如「程序总是输出四位小数。( )•  单选题」），所以既要能匹配独立行，
# 也要能在一行中间切开。
GROUP = re.compile(r"^\s*(?:[•·‧∙\$]\s*)?(判断题|单选题|选择题)\s*$")
# 正文取自**原始行**（保留行内代码反引号），匹配则用去反引号的版本
BODY_Q = re.compile(r"^[\s`]*\d{1,2}\s*[.．、)）]\s*`?\s*(.*)$")
BODY_O = re.compile(r"^[\s`]*[A-EＡ-Ｅ]\s*[.．、)）]\s*`?\s*(.*)$")
# 题号行：`1. 题干`（也认 `1)` `1）` `1、`）
QMD = re.compile(r"^\s*(\d{1,2})\s*[.．、)）]\s*(.+)$")

GROUP_INLINE = re.compile(r"[\$]?\s*[•·‧∙]\s*[\$]?\s*(判断题|单选题|选择题)")


def log(*a):
    print(*a, file=sys.stderr, flush=True)


def has_cjk(s: str) -> bool:
    return bool(CJK.search(s))


# ---------------------------------------------------------------------------
# 文字层：span → 行 → 结构化
# ---------------------------------------------------------------------------
def run(cmd, **kw):
    # 老 NOIP 卷的 pdftohtml 输出夹着 GBK 字节，按 utf-8 解码会抛异常；
    # 用 replace 兜底（坏字节只是个别符号，不影响结构判断）。
    kw.setdefault("errors", "replace")
    return subprocess.run(cmd, capture_output=True, text=True, **kw)


def pdf_has_text(pdf: Path) -> tuple[bool, int, int]:
    """返回 (是否有文字层, 有文字页数, 总页数)。"""
    info = run(["pdfinfo", str(pdf)])
    pages = 0
    for ln in info.stdout.splitlines():
        if ln.startswith("Pages:"):
            pages = int(ln.split()[1])
    empties = 0
    for p in range(1, pages + 1):
        t = run(["pdftotext", "-f", str(p), "-l", str(p), str(pdf), "-"]).stdout
        if len(re.sub(r"\s", "", t)) < 20:
            empties += 1
    return (empties <= pages * 0.2), pages - empties, pages


def pdf_spans(pdf: Path) -> list[dict]:
    """pdftohtml -xml 抽出全部 span，带页号。

    注意：不能用 `<page ...>.*?</page>` 去切页——那样一旦匹配成功就把整页
    连同里面的所有 <text> 一起吞掉。这里按出现顺序扫描两类标签。
    """
    res = run(["pdftohtml", "-xml", "-stdout", str(pdf)])
    xml = res.stdout
    if "<pdf2xml" not in xml:
        return []
    fonts: dict[str, tuple[float, str]] = {}
    for m in re.finditer(r'<fontspec id="(\d+)" size="(\d+)" family="([^"]+)"', xml):
        fonts[m.group(1)] = (float(m.group(2)), m.group(3))
    spans = []
    page = 0
    tag = re.compile(
        r'<page number="(\d+)"(?:[^>]*?height="(\d+)")?'
        r'|<text top="(-?\d+)" left="(-?\d+)" width="(\d+)" height="(\d+)" font="(\d+)">(.*?)</text>',
        re.S,
    )
    page = 0
    page_h = 0
    for m in tag.finditer(xml):
        if m.group(1):
            page = int(m.group(1))
            page_h = int(m.group(2) or 0)
            continue
        top, left, w, h, f, txt = (
            int(m.group(3)), int(m.group(4)), int(m.group(5)),
            int(m.group(6)), m.group(7), m.group(8),
        )
        txt = re.sub(r"<[^>]+>", "", txt)
        txt = html.unescape(txt)
        # LaTeX 字体把 `;` 映射成 U+037E（GREEK QUESTION MARK），
        # 会让代码判定和正则失效，先归一。
        txt = txt.replace("\u037e", ";")
        # LaTeX 的不等号是「组合斜杠 U+0338 + =」。斜杠单独成一个 span，
        # 与 `=` 有重叠（同一位置），这里先占位，配对后再换。
        if "\u0338" in txt:
            txt = txt.replace("\u0338", "\x03")
        if not txt.strip():
            continue
        size, fam = fonts.get(f, (float(h), ""))
        spans.append(dict(page=page, ph=page_h, top=top, left=left, w=w, h=h,
                          size=size, fam=fam, text=txt))
    return spans


def drop_watermark(spans: list[dict]) -> list[dict]:
    """丢掉水印：字号远超正文的 span（如扫描卷上的 150pt 「福建」大字）。

    正文最大字号一般是标题的 1.5~2 倍；高于正文中位字号 3 倍的都视为水印。
    """
    if not spans:
        return spans
    sizes = sorted(s["size"] for s in spans if s["size"] > 0)
    median = sizes[len(sizes) // 2] if sizes else 0
    limit = max(median * 3, 40)
    kept = [s for s in spans if s["size"] <= limit]
    dropped = len(spans) - len(kept)
    if dropped:
        log(f"  丢弃水印 span {dropped} 个（中位字号 {median:g}pt，阈值 {limit:g}pt）")
    return kept


def cluster_lines(spans: list[dict]) -> list[dict]:
    """按页 + 基线聚类成行。

    容差取「行内最大字高」的一半，而不是当前 span 自己的高度——上下标
    字高只有正文的 60%，若用自身高度做容差就会被切成独立一行。
    """
    lines = []
    for sp in sorted(spans, key=lambda s: (s["page"], s["top"], s["left"])):
        if lines and lines[-1]["page"] == sp["page"]:
            ln = lines[-1]
            h = max(ln["height"], sp["h"])
            base_ln = ln["top"] + ln["height"]
            base_sp = sp["top"] + sp["h"]
            if abs(base_sp - base_ln) <= h * 0.55 or abs(sp["top"] - ln["top"]) <= h * 0.55:
                ln["spans"].append(sp)
                ln["top"] = min(ln["top"], sp["top"])
                ln["height"] = h
                continue
        lines.append(dict(page=sp["page"], top=sp["top"], height=sp["h"], spans=[sp]))
    for ln in lines:
        ln["spans"].sort(key=lambda s: s["left"])
        ln["height"] = max(s["h"] for s in ln["spans"])
        ln["size"] = max(s["size"] for s in ln["spans"])
    return lines


def make_classifiers(profile: dict):
    """返回 (is_code_span, is_math_span)，作用于行内 span。

    Word 卷（2021/2022）正文里的数字用 Consolas 排，若一律当行内代码，
    `8`、`50`、`5 4 3 6 1 2` 这些全会被包成反引号。所以额外要求：纯数字
    与纯数学符号的 span 按普通文字处理。
    """
    inline_fams = profile["inline_code_fams"]
    math_fams = profile["math_fams"]

    def fam_of(s):
        # `Courier New,Bold` 这类粗体/斜体子族按基本族处理：老卷正文本就
        # 是 Courier，若把粗体子族当成行内代码，`ASCII`、`队列` 会被包成反引号。
        f = re.sub(r"^[A-Z]{6}\+", "", s["fam"])
        return f.split(",")[0].strip()

    NUMERIC = re.compile(r"^[\s0-9.,\-+×÷*/^=<>~|&%]+$")

    def is_code(s: dict) -> bool:
        f = fam_of(s)
        # 子集名会变（CourierNewPS / CourierNewPSMT），按前缀族判断，
        # 但要排除承担正文的字体和数学字体。
        if f not in inline_fams:
            if not CODE_FONT.search(f) or f in math_fams or f == profile.get("body_latin"):
                return False
        if has_cjk(s["text"]):
            return False
        return not NUMERIC.match(s["text"])

    def is_math(s: dict) -> bool:
        return fam_of(s) in math_fams

    # 供 classify_line 判断「本卷没有等宽字体，代码只能按内容认」
    is_code.no_mono = profile.get("no_mono", False)
    return is_code, is_math


def doc_font_profile(spans: list[dict], lines: list[dict]) -> dict:
    """统计字体用量，定出「行内代码字体」与「数学字体」。

    难点：2023 起的卷子是 Typst 排的，代码块正文用 FiraCode，而 FiraCode 同时
    也是正文西文字体；代码行号用 DejaVuSansMono，而行内代码也是它。所以字体名
    本身不能区分代码块——代码块改由「行号列 x 对齐」识别（见 code_num_x）。
    这里只负责：哪些字体是行内代码、哪些是数学。
    """
    cnt: dict[str, int] = {}
    for sp in spans:
        fam = re.sub(r"^[A-Z]{6}\+", "", sp["fam"])
        cnt[fam] = cnt.get(fam, 0) + len(sp["text"])
    # 统计每个字体出现在「与中文同行」的行里的字符量
    mixed: dict[str, int] = {}
    for ln in lines:
        if any(has_cjk(s["text"]) for s in ln["spans"]):
            for sp in ln["spans"]:
                fam = re.sub(r"^[A-Z]{6}\+", "", sp["fam"])
                mixed[fam] = mixed.get(fam, 0) + len(sp["text"])

    ranked = sorted(cnt.items(), key=lambda kv: -kv[1])
    math_fams = {f for f in cnt if MATH_FONT.search(f)}

    CJK_TEXT = re.compile(
        r"Sarasa|LXGW|WenKai|SimSun|NSimSun|DengXian|MicrosoftYaHei|Songti|Heiti|KaiTi|FangSong|STSongti|MS-Mincho",
        re.I,
    )

    # 等宽字体里：与中文大量同行的那个其实是「正文西文」（2023+ 的 Typst 卷用
    # FiraCode 排正文），与中文几乎不同行的才是真正的行内代码字体（DejaVuSansMono
    # 或 Word 卷的 Consolas/Courier）。
    inline_code_fams = set()
    body_latin = None
    for f, c in cnt.items():
        if f in math_fams or CJK_TEXT.search(f):
            continue
        if not CODE_FONT.search(f):
            if body_latin is None or c > cnt[body_latin]:
                body_latin = f
            continue
        ratio = mixed.get(f, 0) / max(1, c)
        if ratio > 0.5:
            body_latin = f  # 等宽但承担正文
        elif c >= 20:
            inline_code_fams.add(f)

    # 全篇没有等宽字体的卷子（2012PJ：代码也用 Helvetica 排），字体完全
    # 区分不了代码与正文，只能退回内容判据（见 classify_line 的路径 3）。
    no_mono = not inline_code_fams
    if no_mono:
        log("  无等宽字体：代码行改按内容判据识别")
    return dict(counts=cnt, total=sum(cnt.values()) or 1, ranked=ranked,
                math_fams=math_fams, inline_code_fams=inline_code_fams,
                body_latin=body_latin, mixed=mixed, no_mono=no_mono)


def code_line_columns(lines: list[dict]) -> set[float]:
    """找出所有代码行号列的 x 坐标。

    代码块的每一行都以「行号 + 留白 + 代码」开头，行号列 x 固定。同一份卷里
    可能有多列（正文里的示例代码常比大题代码缩进更靠右），所以返回集合，
    取出现次数 ≥3 的那些列。
    """
    freq: dict[float, int] = {}
    for ln in lines:
        spans = ln["spans"]
        if len(spans) < 2:
            continue
        first = spans[0]
        if not re.fullmatch(r"\d{1,3}", first["text"].strip()):
            continue
        gap = spans[1]["left"] - (first["left"] + first["w"])
        if gap < 3:
            continue
        # 题号后面紧跟的一定是中文/标点，且题号列通常贴版心左缘（x<100）
        if has_cjk(spans[1]["text"]):
            continue
        x = round(first["left"] / 4) * 4
        freq[x] = freq.get(x, 0) + 1
    return {x for x, c in freq.items() if c >= 3}


def line_is_codeline(ln: dict, cols: set[float], is_math) -> tuple[bool, dict | None]:
    """整行是否是代码块的一行；是则返回该行的位置信息。

    返回 (是否代码行, dict(text, x, size, charw, spans))。

    两条识别路径：
      1. **行号列**：2023+ 的 Typst 卷把行号单独排成 span，行号列 x 固定；
      2. **单 span 自带行号**：Word 卷（2021/2022）整行是一个 Courier/Consolas
         span，形如 `01 #include <iostream>`，靠「前导数字 + 等宽字体 + 无中文」认。
    """
    if not ln["spans"]:
        return False, None
    size = ln["size"] or 16
    first = ln["spans"][0]

    # 路径 2：单 span 自带行号
    if len(ln["spans"]) == 1:
        txt = first["text"]
        m = re.match(r"^\s*(\d{1,3})(?:[ \t]+(\S.*?))?[ \t]*$", txt)
        if m and not has_cjk(txt) and CODE_FONT.search(first["fam"]):
            body = (m.group(2) or "").rstrip()
            if not body or re.search(r"[#;{}()<>]|[A-Za-z_]{3,}", body):
                return True, dict(text=body, x=first["left"], size=size,
                                  charw=size * 0.6, single=True,
                                  spans=[dict(left=first["left"], w=first["w"], text=body)])
        return False, None

    # 路径 1：行号列
    if not cols:
        return False, None
    if not re.fullmatch(r"\d{1,3}", first["text"].strip()):
        return False, None
    if not any(abs(first["left"] - c) <= 4 for c in cols):
        return False, None
    gap = ln["spans"][1]["left"] - (first["left"] + first["w"])
    if gap < 3:
        return False, None
    # 行号后面不能是中文：`4 个。为使原图…` 这种正文折行，数字刚好落在行号列上，
    # 但正文是中文。代码行的主体必须是等宽字体且不含中文。
    rest = "".join(s["text"] for s in ln["spans"][1:])
    if has_cjk(rest) or not any(CODE_FONT.search(s["fam"]) for s in ln["spans"][1:]):
        return False, None

    parts: list[str] = []
    prev_right = None
    size = ln["size"] or 16
    x0 = None
    charw = None
    for s in ln["spans"][1:]:
        t = s["text"]
        if not t:
            continue
        if x0 is None:
            x0 = s["left"]
            if t.strip():
                charw = s["w"] / max(1, len(t))
        if prev_right is not None and s["left"] - prev_right > size * 0.18:
            n = max(1, int(round((s["left"] - prev_right) / max(1.0, size * 0.28))))
            parts.append(" " * n)
        parts.append(t)
        prev_right = s["left"] + s["w"]

    body = "".join(parts).rstrip()
    return True, dict(text=body, x=x0 if x0 is not None else first["left"],
                      size=size, charw=charw or size * 0.6,
                      spans=[dict(left=s["left"], w=s["w"], text=s["text"])
                             for s in ln["spans"][1:]])


def line_text(ln: dict, is_code, is_math) -> tuple[str, dict]:
    """把一行的 span 拼成带行内记号的文本，返回 (text, 统计)。

    记号：
      ^{…} / _{…}  上下标（只对正文/数学生效；代码 span 不参与）
      $…$          数学段（连续数学字体 span 合并成一段）
      `…`          行内代码（连续代码 span 合并成一段）

    pdftohtml 会把同一行切成很多 span，span 之间的原始空格不在 text 里，
    所以按「前一个 span 右边界 ↔ 本 span 左边界」的间距补空格；否则代码
    会粘成 `unionData{`，`int num;` 的缩进也会丢。
    """
    out: list[str] = []
    stats = dict(code=0, math=0, tot=0, cjk=0)
    prev_right: float | None = None
    code_buf: list[str] = []
    math_buf: list[str] = []
    math_base = 0.0

    def flush_code():
        nonlocal code_buf
        if code_buf:
            body = "".join(code_buf)
            if body.strip():
                out.append("`" + body.strip("`") + "`")
            code_buf = []

    def flush_math():
        nonlocal math_buf, math_base
        if math_buf:
            out.append("$" + "".join(math_buf) + "$")
            math_buf, math_base = [], 0.0

    def is_small(s):
        # 必须「明显更小」：Word 卷里西文常用小 1pt 的字体（Calibri 15 vs
        # SimSun 16），不能算上下标；真正的上下标一般是正文的 60~70%。
        return s["h"] < ln["size"] * 0.78

    def v_offset(s) -> float:
        """相对本行主基线的垂直偏移（正=更靠上）。"""
        base = ln["top"] + ln["size"]
        return base - (s["top"] + s["h"])

    def push_sup(t: str, span, into_math: bool):
        # 阈值用「本行正文字号」，不要用 math_base——LaTeX 的 `|` `−` 是 21pt
        # 大号符号，会把阈值抬高，导致真正的下标（`r_i` 的 i）被认为不够偏移。
        ref = ln["size"]
        off = v_offset(span)
        # 上下标的双条件：字号够小 **且** 基线明显偏移（约 1/5 字高）。
        # 只满足其一（例如行内代码、小 1pt 的西文字体）按普通文字处理。
        if abs(off) < ref * 0.22:
            (math_buf if into_math else out).append(t)
            return
        # 纯运算符/括号不可能是上下标，按普通文字输出。
        # 例外：`n⁺` / `n⁻` 这类表示「经过的正/负边」的写法，单独一个 + 或 −
        # 且处在数学段里，应按上标处理。
        one = t.strip()
        if re.fullmatch(r"[+\-−]", one) and into_math and math_buf:
            math_buf.append("^(" + one + ")")
            return
        if re.fullmatch(r"[+\-*/=<>()\[\]{},.;:!?|&^%$#@~]+", one):
            (math_buf if into_math else out).append(t)
            return
        up = span["top"] + span["h"] * 0.4 < ln["top"] + ref * 0.55
        if into_math:
            math_buf.append(("^{" if up else "_{") + t + "}")
        else:
            # 纯文本里没有 ^{} / _{} 语法，用 Typst 的 #super / #sub
            out.append(("#" + ("super" if up else "sub") + "[" + t + "]"))

    for s in ln["spans"]:
        t = s["text"]
        if not t:
            continue
        stats["tot"] += len(t)
        if has_cjk(t):
            stats["cjk"] += len(t)

        # 补空格：先算出本 span 前面的间距
        pad = 0
        if prev_right is not None and s["left"] - prev_right > ln["size"] * 0.18:
            pad = max(1, int(round((s["left"] - prev_right) / max(1.0, ln["size"] * 0.28))))
        prev_right = s["left"] + s["w"]

        code = is_code(s)
        mth = is_math(s)
        small = is_small(s)

        if code:
            stats["code"] += len(t)
            flush_math()
            # 代码段内的间距按比例换算成空格（等宽字体 1 字符 ≈ 0.6em）
            if pad:
                code_buf.append(" " * max(1, int(round(pad * 0.6))))
            code_buf.append(t)
            continue
        flush_code()

        if mth:
            stats["math"] += len(t)
            # 数学 span 里偶有字面 `$`（字体映射残留），会让数学段提前闭合；
            # 直接删掉，因为数学模式里不存在合法的 `$`。
            t = t.replace("$", "")
            if small and math_buf:
                push_sup(t, s, True)
                continue
            if pad and math_buf:
                math_buf.append(" ")
            math_base = max(math_base, s["h"])
            math_buf.append(t)
            continue
        flush_math()

        # 普通文字
        if small:
            push_sup(t, s, False)
            continue
        out.append((" " * pad if pad else "") + t)

    flush_code()
    flush_math()
    text = "".join(out).strip()
    # 组合斜杠占位与相邻的 `=` 合成 ≠（LaTeX 的 \not= 排法）
    text = text.replace("\x03=", "≠").replace("=\x03", "≠").replace("\x03", "")
    return text, stats


def emit_inline(text: str) -> str:
    """把 `$x$`、`^{..}`、`` `..` `` 统一成 md2typ 认识的 LaTeX 风格。"""
    def math_repl(m):
        body = m.group(1)
        body = re.sub(r"\$([^$]*)\$", r"\1", body)
        return "$" + body + "$"
    return re.sub(r"\$([^$]*)\$", math_repl, text)


def strip_inline_code_ticks(s: str) -> str:
    """把反引号去掉，用于结构判定（题号/选项/小节）。

    Word 卷的题号与选项字母用 Courier New 排，抽取后被包成 `` `1. ` ``、
    `` `A. ` ``，直接匹配 QUESTION/OPTION 会失败。
    """
    return s.replace("`", "")


def classify_line(ln: dict, is_code, is_math, cols: set[float]) -> dict:
    """判定整行的性质。

    返回 dict(kind, text, lineno, meta, stats)，kind ∈ {"code","text","empty"}。
    代码块按行号列识别（cols）；行首 `A.` `12.` 即使被包成行内代码也算正文。
    """
    ok, meta = line_is_codeline(ln, cols, is_math)
    if ok:
        _, st = line_text(ln, is_code, is_math)
        mnum = re.match(r"^\s*(\d{1,3})", ln["spans"][0]["text"])
        return dict(kind="code", text=meta["text"],
                    lineno=int(mnum.group(1)) if mnum else None, meta=meta, stats=st)
    text, st = line_text(ln, is_code, is_math)
    if not text.strip():
        return dict(kind="empty", text="", lineno=None, meta=None, stats=st)
    # 路径 3：Word 卷题干里的示例代码（无行号，整行几乎都是等宽字体）。
    # 排除选项（A. xxx）与题号（15. xxx），它们也用等宽字体但属于正文。
    plain = strip_inline_code_ticks(text)
    ratio = st["code"] / max(1, st["tot"])
    # 注释行：以 `//` 开头、且首段是等宽字体（后面可能夹中文）
    if plain.lstrip().startswith("//") and st["code"] > 0:
        x = ln["spans"][0]["left"] if ln["spans"] else 0
        return dict(kind="code", text=plain.rstrip(), lineno=None,
                    meta=dict(text=plain.rstrip(), x=x, size=ln["size"],
                              charw=(ln["size"] or 16) * 0.6, single=True,
                              spans=[]), stats=st)
    # 老卷的填空占位 `① ;` / `② ;`：圈号被算成 CJK，但它是代码行，
    # 不特殊处理会把一行行代码块切断。
    if re.fullmatch(r"\s*[①-⑳]\s*;?\s*", plain) and st["code"] > 0:
        x = ln["spans"][0]["left"] if ln["spans"] else 0
        return dict(kind="code", text=plain.rstrip(), lineno=None,
                    meta=dict(text=plain.rstrip(), x=x, size=ln["size"],
                              charw=(ln["size"] or 16) * 0.6, single=True,
                              spans=[]), stats=st)
    # 代码行也可能带中文注释（`tmp[k++] = a[i++]; // 取左半段元素`）。
    # 老 NOIP 卷的空格式（`int len[100];    // 记录…`）注释较长，代码占比
    # 只有 0.43 左右；阈值放到 0.32 才能把它留在代码块里。
    has_comment = ("//" in plain and re.search(r"[;{}()]", plain)
                   and ratio > 0.32)
    body_ok = (st["tot"] and (st["cjk"] == 0 or has_comment)
               and (ratio > 0.85 or has_comment))
    # 无等宽字体的卷（2012PJ）：代码字体就是正文西文字体，ratio 恒为 0，
    # 长度判据失效；此时改由下面的 obvious/grid 内容判据负全责。
    if getattr(is_code, "no_mono", False) and st["tot"] and st["cjk"] == 0:
        body_ok = True
    # 2010TG 的「烽火传递」整段代码用 Times New Roman 排（和正文同字体、
    # 无缩进），字体判据完全失效，只剩内容可依：整行无中文且以 `;`/`{`/`}` 收尾
    # 的就是代码语句。函数头、`if (...)`、`else` 这类会被判成段落，再由
    # merge_code_fragments 按上下文并回代码块。
    if (not body_ok and st["tot"] and st["cjk"] == 0
            and re.search(r"[;{}]\s*$", plain)
            and not OPTION.match(plain) and not QUESTION.match(plain)):
        body_ok = True
    if body_ok and not OPTION.match(plain) and not QUESTION.match(plain):
        # 只认「确有代码结构」的行——仅凭「全是等宽字体」会把 Word 卷的
        # 选项（字母也是 Courier）一并吞掉。ASCII 网格单独例外。
        # `#define` / 函数定义行（`int main()`、`void sort(...)`）没有
        # `;{}`，但确实是代码；漏判会让它们被当成文字段落、把代码块切断。
        obvious = re.search(
            r"[;{}]|#include|#define|#pragma|\breturn\b|\bif\s*\(|\bfor\s*\("
            r"|\bwhile\s*\(|\bdo\b|\bswitch\s*\(|\bcase\b|\bstruct\b|\bclass\b"
            r"|\belse\b|->|\+\+|<<|>>"
            r"|\b(?:int|void|bool|char|float|double|long|short)\s+[A-Za-z_]\w*\s*\(",
            plain)
        grid = (ratio > 0.9 and len(plain) >= 5
                and re.fullmatch(r"[#.SE ]+", plain) is not None)
        if obvious or grid:
            x = ln["spans"][0]["left"] if ln["spans"] else 0
            return dict(kind="code", text=plain.rstrip(), lineno=None,
                        meta=dict(text=plain.rstrip(), x=x, size=ln["size"],
                                  charw=(ln["size"] or 16) * 0.6, single=True,
                                  spans=[]), stats=st)
    return dict(kind="text", text=text, lineno=None, meta=None, stats=st)


def _dollar_count(s: str) -> int:
    """统计未转义的 `$` 个数（用于判断数学段是否跨 item 断开）。"""
    return len(re.findall(r"(?<!\\)\$", s))


def _merge_unbalanced(items: list[dict]) -> list[dict]:
    """把被页/行切开的数学段重新拼回上一项。

    PDF 里公式常跨行，`𝑓(1) = 1` 可能被切成 `已知$𝑓` + `1` + `= 1$...`。
    这里按 `$` 的配对情况判断：上一项 `$` 数为奇数时，把后续项拼进去，
    直到配对闭合。拼进来的 `sub` 还原成 `（N）` 文本（那是被误判的括号编号）。
    """
    out: list[dict] = []
    for it in items:
        if out and _dollar_count(out[-1].get("text", "")) % 2 == 1 \
                and it["t"] in ("q", "opt", "para", "sub"):
            frag = it["text"]
            if it["t"] == "sub":
                frag = f"（{frag}）"
            merged = dict(out[-1])
            merged["text"] = merged["text"] + frag
            out[-1] = merged
            continue
        out.append(it)
    return out


def demote_list_items(items: list[dict]) -> list[dict]:
    """把「阅读程序/完善程序」里被误当题号的列表项还原成段落。

    典型：汉诺塔规则
        1. 只能从一根柱子的顶部取出圆盘……
        2. 每次只能移动一个圆盘
        3. 小圆盘必须始终在大圆盘之上。试补全程序。

    判据（三者同时满足才降级，避免误伤真题）：
      * 当前处于第二个章节之后的阅读/完善程序段（单选段里 1..15 是真题）；
      * 出现从 1 开始、连续递增的一段 q，且个数 ≥ 2；
      * 这段 q 后面没有紧跟选项（真题目一定带 A-D）。
    """
    out: list[dict] = []
    i = 0
    n = len(items)
    section_idx = 0
    while i < n:
        it = items[i]
        if it["t"] == "section":
            section_idx += 1
            out.append(it)
            i += 1
            continue
        if it["t"] != "q" or it.get("num") != 1 or section_idx < 2:
            out.append(it)
            i += 1
            continue
        run = [it]
        j = i + 1
        expect = 2
        while j < n and items[j]["t"] == "q" and items[j].get("num") == expect:
            run.append(items[j])
            expect += 1
            j += 1
        has_opt = j < n and items[j]["t"] == "opt"
        # 单项但属于「完善程序」开头题面：`1. （题目名）…` 后紧跟代码块
        single_intro = (len(run) == 1 and j < n and items[j]["t"] == "code"
                        and run[0]["text"].startswith(("（", "(")))
        if (len(run) >= 2 and not has_opt) or single_intro:
            for r in run:
                out.append(dict(t="para", text=f"{r['num']}. {r['text']}"))
        else:
            out.extend(run)
        i = j
    return out


def _unsub_in_stem(items: list[dict]) -> list[dict]:
    """把题干里被误判成小节的 `(5)` 还原。

    `函数 calc(n) 的定义如下，则 calc(5) 的返回值是多少?` 在 PDF 里
    `(5)` 单独占一段，被 SUBHEAD 当成小节「5」。判据：sub 紧跟在 q 之后、
    且后面紧跟的还是 para（题干续行）——真正的小节后面跟的是代码块。
    """
    out: list[dict] = []
    i = 0
    n = len(items)
    while i < n:
        it = items[i]
        if (it["t"] == "sub" and out and out[-1]["t"] == "q"
                and i + 1 < n and items[i + 1]["t"] == "para"):
            # 还原成题干里的（N）
            q = dict(out[-1])
            q["text"] = q["text"] + f"（{it['text']}）"
            out[-1] = q
            i += 1
            continue
        out.append(it)
        i += 1
    return out


def split_inline_options(items: list[dict]) -> list[dict]:
    """把挤在同一行的多个选项拆成独立 opt 项。

    2026 的两份卷子是 LaTeX 排的，四个选项常并排一行：
        A. float      B. long long     C. double     D. int
    抽取时只会认出第一个 `A.`，其余三个留在正文里。这里按「两个及以上空格 +
    选项字母 + 点」切开。
    """
    # 两个层次：
    #   1) 2+ 空格分隔（LaTeX 卷的并排选项）；
    #   2) 单空格分隔（OCR 输出常见 `A. 甲 B. 乙 C. 丙 D. 丁`）——
    #      只在同一行出现 ≥3 个选项标记时才切，避免误伤正文。
    # 2004–2010 的五选一卷：选项可能是 `E.`，分隔符可能是 `)`。
    SPLIT2 = re.compile(r"\s{2,}(?=[A-EＡ-Ｅ]\s*[.．)）]\s*`?\(?[^\s])")
    SPLIT1 = re.compile(r"(?:\s+|(?<=[。！？）)】]))(?=[A-EＡ-Ｅ]\s*[.．)）]\s*\S)")
    out: list[dict] = []
    for it in items:
        if it["t"] not in ("q", "opt", "para"):
            out.append(it)
            continue
        text = it["text"]
        segs = SPLIT2.split(text)
        if len(segs) < 2:
            # 单空格版本：要求至少 3 个标记，才认为这行是并排选项
            cand = SPLIT1.split(text)
            if len(cand) >= 4 and sum(
                    1 for c in cand[1:] if re.match(r"^[A-EＡ-Ｅ]\s*[.．)）]", c.strip())) >= 3:
                segs = cand
        if len(segs) < 2:
            out.append(it)
            continue
        # 第一段是当前项的正文；后面每段以选项字母开头
        head = segs[0].strip()
        if "`" in head:
            # 切分点落在行内代码中间，两端会残留反引号；整段是代码就重包一层
            head = "`" + head.replace("`", "").strip() + "`"
        if head:
            out.append(dict(it, text=head))
        start_ord = ord("A")
        if it["t"] == "opt" and it.get("label"):
            start_ord = ord(it["label"]) + 1
        for k, seg in enumerate(segs[1:]):
            m = re.match(r"^\s*`?\s*([A-EＡ-Ｅ])\s*[.．)）]\s*`?\s*(.*)$", seg)
            if not m:
                out.append(dict(t="para", text=seg.strip()))
                continue
            lab = m.group(1).replace("Ａ", "A").replace("Ｂ", "B") \
                .replace("Ｃ", "C").replace("Ｄ", "D").replace("Ｅ", "E")
            body = m.group(2).strip()
            # 切分点落在行内代码中间时，两端会残留反引号；
            # 整段原本是代码的话，去掉残引号后重新包一层。
            if "`" in body:
                body = "`" + body.replace("`", "").strip() + "`"
            out.append(dict(t="opt", label=lab, text=body))
    return out


# 大运算符独占一行、极限在下一行（LaTeX 的 display 公式就是这样排的）
BIG_OP = re.compile(r"^\s*\$?\s*([∑∏∫⋃⋂])([_^]\{[^{}]*\})*\s*\$?\s*$")


def merge_option_continuation(items: list[dict]) -> list[dict]:
    """选项被折行时，续行会变成 para（2004 提高组第 7 题的 `E.` 换行成 `内存`）。

    判据：上一项是 opt、且正文不以选项字母开头、长度很短（≤12 字），就并回去。
    """
    out: list[dict] = []
    for it in items:
        if (it["t"] == "para" and out and out[-1]["t"] == "opt"
                and len((it.get("text") or "").strip()) <= 12
                and not OPTION.match((it.get("text") or "").strip())
                and not QUESTION.match((it.get("text") or "").strip())):
            prev = out[-1]
            # `D 主板       E.` 这种：D 的正文后面跟了一个空的 `E.`，
            # 拆成 D + E 两项，续行归 E。
            m = re.match(r"^(.*?)\s+([A-E])\.\s*$", prev["text"])
            if m and (m.group(2) != prev.get("label")):
                out[-1] = dict(prev, text=m.group(1).strip())
                out.append(dict(t="opt", label=m.group(2),
                                text=it["text"].strip()))
                continue
            out[-1] = dict(prev, text=prev["text"].rstrip() + " "
                                        + it["text"].strip())
            continue
        out.append(it)
    return out


def merge_big_operators(items: list[dict]) -> list[dict]:
    """把孤立的 `$∑_{n}$` 与其后的上下标/正文合并成一句。

    原卷排版：
        ∑ⁿ
        ᵢ₌₁ |rᵢ − xᵢ| 尽可能大。
    抽出来会是 `para '$∑_{n}$'` + `para '给定…使$i_{=1} |r…|'`，
    这里把 `∑` 与下一段拼起来，并把上标/下标并进同一个数学段。
    """
    out: list[dict] = []
    i = 0
    n = len(items)
    while i < n:
        it = items[i]
        m = BIG_OP.match(it.get("text", ""))
        if not m or it["t"] not in ("para", "q", "opt"):
            out.append(it)
            i += 1
            continue
        op = m.group(1)
        sup = ""
        mm = re.search(r"\^\{([^{}]*)\}", it["text"])
        if mm:
            sup = mm.group(1)
        # 找下一个带数学段的项（`使$i_{=1} …$`）
        j = i + 1
        while j < n and items[j]["t"] == "para" and not items[j]["text"].strip():
            j += 1
        if j >= n or items[j]["t"] not in ("para", "q", "opt"):
            out.append(it)
            i += 1
            continue
        nxt = dict(items[j])
        t = nxt["text"]
        mm2 = re.search(r"\$([^$]*)\$", t)
        if mm2:
            body = mm2.group(1)
            # `i_{=1}` → 作为下标接到 ∑ 之后
            mp = re.match(r"^([A-Za-z])_\{([^{}]*)\}\s*(.*)$", body.strip())
            if mp:
                joined = op + ("^" + "{" + sup + "}" if sup else "") \
                    + "_{" + mp.group(1) + mp.group(2) + "} " + mp.group(3).strip()
                t = t[:mm2.start()] + "$" + joined + "$" + t[mm2.end():]
            else:
                t = t[:mm2.start()] + "$" + op + " " + body + "$" + t[mm2.end():]
        nxt["text"] = t
        out.append(nxt)
        i = j + 1
    return out


CJK_CH = r"\u3000-\u303f\u4e00-\u9fff\uff00-\uff65\u2018\u2019\u201c\u201d"


def collapse_cjk_spaces(text: str) -> str:
    """去掉汉字之间的「排版空格」。

    2004–2010 的部分 .doc 用两端对齐 + 字间距排，转成 PDF 后每个汉字之间都有
    一个空格（`设 全 集   I = {...}   ， 集 合`）。中文里的字间空格没有语义，
    可以压掉；但答题空位（`（     ，     ）`、`至少需要        次操作`）是连续
    长空白，有语义，必须保留。

    实现上只压「整段 1–2 个空格」的短间隔：前后断言空白边界，保证匹配的是
    一段完整空白，不会把 16 个空格的长空位分段吃掉。
    """
    if not text:
        return text
    short = r"[ \t]{1,2}"
    pat = re.compile(rf"(?<![ \t])(?<=[{CJK_CH}]){short}(?![ \t])(?=[{CJK_CH}])")
    prev = None
    out = text
    while prev != out:
        prev = out
        out = pat.sub("", out)
    # 汉字与全角标点之间被撑开的短空格也压掉
    out = re.sub(rf"(?<![ \t])(?<=[{CJK_CH}]){short}(?![ \t])(?=[，。；：、？！）】》])",
                 "", out)
    out = re.sub(rf"(?<![ \t])(?<=[（【《]){short}(?![ \t])(?=[{CJK_CH}])", "", out)
    return out


CODEY = re.compile(
    r"^\s*(?:[A-Za-z_#][\w\s\*\[\]\.\->,()]*$|[{}]\s*$)")
CODE_HEAD = re.compile(
    r"^\s*(?:if|for|while|else|do|switch|case|return|break|continue|"
    r"int|void|char|bool|double|float|long|short|struct|class|#include|"
    r"#define|#pragma|using)\b")


def _is_codey(text: str) -> bool:
    """这一行像不像代码（用于把散落在代码块里的段落并回去）。"""
    t = text.strip()
    if not t or len(t) > 120:
        return False
    if t.startswith("//"):
        return True
    if has_cjk(t):
        # 只有行尾 `//` 中文注释的代码行仍算代码（`void swap(int i,int j)//交换…`）
        head = t.split("//", 1)[0]
        if "//" not in t or not re.search(r"[;{}()]", head):
            return False
        return bool(CODE_HEAD.match(head) or head.rstrip().endswith(("{", ";", ")")))
    if OPTION.match(t) or QUESTION.match(t) or SECTION.match(t):
        return False
    return bool(re.search(r"[;{}()\[\]]\s*$", t) or CODE_HEAD.match(t))


def merge_code_fragments(items: list[dict]) -> list[dict]:
    """把夹在代码块中间的「代码样子」段落并回代码。

    老卷的代码不一定统一用等宽字体（2010 提高组整卷代码都是 Times New
    Roman），抽取器会把 `int main()`、`for (...)`、`else`、`if (...)` 判成段落，
    于是一段完整程序被切成十几块。做法：从代码项出发，向后吃掉连续的代码项
    与「代码样子的段落」，直到遇到真正的正文（含中文的长句、「输入：」等）。
    """
    out: list[dict] = []
    i = 0
    n = len(items)
    while i < n:
        it = items[i]
        if it["t"] != "code":
            out.append(it)
            i += 1
            continue
        buf = [it["text"]]
        j = i + 1
        while j < n:
            nx = items[j]
            if nx["t"] == "code":
                buf.append(nx["text"])
                j += 1
                continue
            if nx["t"] == "para" and _is_codey(nx.get("text") or ""):
                # 后面必须还有代码项，否则这些「像代码的段落」其实是正文
                k = j
                seen_code = False
                while k < n and (items[k]["t"] == "code"
                                 or (items[k]["t"] == "para"
                                     and _is_codey(items[k].get("text") or ""))):
                    if items[k]["t"] == "code":
                        seen_code = True
                    k += 1
                if not seen_code:
                    break
                buf.append(nx["text"].strip())
                j += 1
                continue
            break
        out.append(dict(t="code", text="\n".join(buf)))
        i = j
    return out


def _merge_comment_paras(items: list[dict]) -> list[dict]:
    """代码块中间的「整行注释」被抽成段落时并回代码。

    2013PJ 第 28 题的 `//（3 分，3 分，3 分）` 整行是中文注释，字体判据认不出
    是代码，结果把一段完整的程序切成两个代码块（行号还从头开始）。
    """
    out: list[dict] = []
    pending = False
    for it in items:
        t = (it.get("text") or "").strip()
        if it["t"] == "para" and t.startswith("//") and out and out[-1]["t"] == "code":
            out[-1] = dict(out[-1], text=out[-1]["text"] + "\n" + t)
            pending = True
            continue
        if it["t"] == "code" and pending and out and out[-1]["t"] == "code":
            out[-1] = dict(out[-1], text=out[-1]["text"] + "\n" + it["text"])
            pending = False
            continue
        pending = False
        out.append(it)
    return out


def post_process(items: list[dict]) -> list[dict]:
    """收尾清洗。

    原卷里几个结构常被挤到一行、或被页/行切开，这里统一整理：
      * 数学段被切断 → 拼回上一项（`_merge_unbalanced`）；
      * 项目符号被包进数学段（`$•$`）→ 还原成 `•`；
      * 题尾粘 `• 单选题` → 拆出 group；
      * 段落以 `(2) 标题…` 开头 → 拆出 sub + 后续段落；
      * 选项/题尾粘小节号 `(2) 题干…` → 同上。
    """
    for it in items:
        if "text" in it:
            it["text"] = collapse_cjk_spaces(it["text"])
    items = _merge_comment_paras(items)
    items = merge_code_fragments(items)
    items = _merge_unbalanced(items)
    items = split_inline_options(items)
    items = merge_option_continuation(items)
    items = _unsub_in_stem(items)
    out: list[dict] = []
    for it in items:
        if it["t"] not in ("q", "opt", "para"):
            out.append(it)
            continue
        text = it["text"]
        text = re.sub(r"\$\s*[•·‧∙]\s*\$", "•", text)

        # 行中或行首出现的 `(2)` 小节号——但不在数学段里（数学段里的括号是
        # 公式的一部分，比如 f(⌊n/2⌋) 被合进来的 `（1）`）
        masked = re.sub(r"\$[^$]*\$", lambda m: " " * len(m.group(0)), text)
        # 小节号 `(N) 标题…`：只认「段首」或「上一项是选项/题尾」的位置，
        # 题干中间的 `calc(5)` 不拆。
        masked = re.sub(r"\$[^$]*\$", lambda m: " " * len(m.group(0)), text)
        at_start = re.match(r"^\s*[（(]\s*(\d{1,2})\s*[)）]\s*(?=\S)", masked)
        if at_start:
            tail = text[at_start.end():].strip()
            out.append(dict(t="sub", text=at_start.group(1)))
            if tail:
                out.append(dict(t="para", text=tail))
            continue

        # 选项/题尾粘的小节号：`nums[n-1](2) 编辑距离…`
        # 要求 `(N)` 之后还有成段文字（≥4 字），否则它是题干里的函数调用
        # 如 `calc(5)的返回值…`，不能当小节。
        # 判据：`(N)` 前面是选项字母/代码符号（如 `nums[n-1]`），后面是
        # 题目描述式的长句；而 `calc（5）的返回值…` 前面是函数名、后面是
        # 续句，不是小节。
        if it["t"] == "opt":
            mm = re.search(r"[（(]\s*(\d{1,2})\s*[)）]\s*(?=\S)", masked)
            if mm and mm.start() > 0:
                head = text[:mm.start()].strip()
                tail = text[mm.end():].strip()
                if head:
                    out.append(dict(it, text=head))
                out.append(dict(t="sub", text=mm.group(1)))
                if tail:
                    out.append(dict(t="para", text=tail))
                continue

        m = GROUP_INLINE.search(text)
        if not m:
            out.append(dict(it, text=text))
            continue
        head = text[:m.start()].strip()
        tail = text[m.end():].strip()
        if head:
            out.append(dict(it, text=head))
        out.append(dict(t="group", text=m.group(1)))
        if tail:
            out.append(dict(t="para", text=tail))
    return out


def structure(lines: list[dict], pages: int, is_code, is_math, cols=frozenset(),
              noip: bool = False) -> list[dict]:
    """行序列 → items。

    关键防误判：
      * 题号只在「第一个章节标题之后」才认，否则注意事项里的 1. 2. 会被
        当成第 1、2 题；
      * 题号必须**递增**（允许跳号），回退则视为正文里的编号；
      * 代码段按整行的代码字体占比判定，不依赖印出来的行号（有的卷换页
        后行号会丢）。
    """
    items: list[dict] = []
    i = 0
    n = len(lines)
    seen_section = False
    last_q = 0
    last_label = 0

    def cl(idx):
        return classify_line(lines[idx], is_code, is_math, cols)

    def is_footer(tx):
        return any(p.match(tx) for p in PAGE_FOOTER)

    def consume_code(j):
        """从 j 开始连续吃代码行，返回 (代码文本, 下一个索引)。

        三类行都要处理：
          * 正常代码行（行号列对齐）；
          * 代码的**软换行续行**（PDF 排不下折到下一行，没有行号）；
          * 跨页断点（页脚 + 空行）。
        续行按「无行号 + 全是代码字体 + 首字符缩进超过行号列」判定，
        标记为 cont=True，最后直接拼到上一行末尾。
        """
        rows = []  # list[dict|None|dict(cont=True, text=...)]
        while j < n:
            c = cl(j)
            if c["kind"] == "code":
                meta = c["meta"]
                if meta is None:
                    # 路径 3（Word/LaTeX 卷的行内代码整行）没有几何信息，
                    # 直接用文本，标记 single 让后面跳过按列重建。
                    meta = dict(text=c["text"], x=0, size=lines[j]["size"] or 16,
                                charw=(lines[j]["size"] or 16) * 0.6,
                                single=True, spans=[])
                rows.append(meta)
                j += 1
                continue
            # 软换行续行
            if (c["kind"] == "text" and rows and rows[-1] is not None
                    and c["stats"]["tot"] and c["stats"]["cjk"] == 0
                    and c["stats"]["code"] / max(1, c["stats"]["tot"]) > 0.85
                    and lines[j]["spans"][0]["left"] > (min(cols) if cols else 0)
                    # 带行号的整行不是续行（Word 卷整行一个 span，且自带 `01 ` 前缀）
                    and not re.match(r"^\s*\d{1,3}\s{1,4}\S", strip_inline_code_ticks(c["text"]))
                    # 选项（A. xxx）和题号（12. xxx）不是续行
                    and not OPTION.match(strip_inline_code_ticks(c["text"]))
                    and not QUESTION.match(strip_inline_code_ticks(c["text"]))):
                cont = "".join(s["text"] for s in lines[j]["spans"]).strip()
                rows.append(dict(cont=True, text=cont))
                j += 1
                continue
            if c["kind"] == "empty" or is_footer(c["text"].strip()):
                k = j
                saw_blank = False
                while k < n and (cl(k)["kind"] == "empty"
                                 or is_footer(cl(k)["text"].strip())):
                    saw_blank = True
                    k += 1
                if saw_blank and k < n and cl(k)["kind"] == "code":
                    rows.append(None)  # 跨页：记一个空行
                    j = k
                    continue
                break
            break

        # single=True 的行（路径 3）没有 spans，但同样是代码行，不能滤掉
        real = [r for r in rows
                if r and not r.get("cont") and (r.get("spans") or r.get("single"))]
        if not real:
            return "", j
        widths = []
        for r in real:
            for sp in r["spans"]:
                n_ch = len(sp["text"])
                if n_ch:
                    widths.append(sp["w"] / n_ch)
        widths.sort()
        charw = widths[len(widths) // 2] if widths else (real[0]["size"] * 0.6)
        charw = max(3.0, charw)

        # 只负责「词间空格」：span 之间的水平间隙换算成一个空格。
        # 行首缩进交给 md2typ_csp.py 按花括号层级重算（PDF 前导空白不可靠）。
        # 单 span 行（Word/LaTeX 卷）按首字符 x 的差值还原缩进：
        # PDF 里没有可用的前导空格，只能靠坐标；2 个字符宽 = 1 级。
        single_xs = [r["x"] for r in rows if r and r.get("single")]
        x_min = min(single_xs) if single_xs else 0

        out = []
        for r in rows:
            if r is None:
                out.append("")
                continue
            if r.get("cont"):
                if out:
                    out[-1] = out[-1] + " " + r["text"]
                continue
            if r.get("single"):
                # Word/LaTeX 卷：整行是一个 span，文本已是「去掉行号后的代码」
                lead = 0
                if x_min and r["x"] > x_min:
                    lead = int(round((r["x"] - x_min) / max(1.0, r["size"] * 0.6)))
                out.append(" " * lead + r["text"].rstrip())
                continue
            if not r.get("spans"):
                out.append("")
                continue
            buf = ""
            prev_end = None
            for sp in r["spans"]:
                if prev_end is not None and sp["left"] - prev_end > charw * 0.45:
                    buf += " "
                buf += sp["text"]
                prev_end = sp["left"] + sp["w"]
            out.append(buf.rstrip())
        # 去掉首尾空行
        while out and not out[0].strip():
            out.pop(0)
        while out and not out[-1].strip():
            out.pop()
        return "\n".join(out), j

    while i < n:
        c = cl(i)
        t = c["text"].strip()
        if c["kind"] == "empty":
            i += 1
            continue
        if is_footer(t):
            i += 1
            continue
        # 结构判定用去掉行内代码反引号的版本（Word 卷的 `1. ` `A. ` 都带反引号）
        ts = strip_inline_code_ticks(t)

        # 章节标题（可能折行：下一行以「除」「殊说明」这类续写开头时并进来）
        if SECTION.match(ts) and not QUESTION.match(ts):
            sec = emit_inline(t)
            j = i + 1
            while j < n:
                c2 = cl(j)
                tt = c2["text"].strip()
                tts = strip_inline_code_ticks(tt)
                if (c2["kind"] != "text" or not tt or QUESTION.match(tts)
                        or OPTION.match(tts) or is_footer(tt) or GROUP.match(tts)
                        or SECTION.match(tts) or SUBHEAD.match(tts)):
                    break
                # 只并「同一句话的续行」：含分号/句号结尾的完整句、或非短句不并
                if len(tt) > 60 or re.match(r"^[（(0-9⚫•·]", tts) or tts.startswith("试补全"):
                    break
                if not re.search(r"[；;，,、）)]\s*$", tts):
                    break
                sec += emit_inline(tt)
                j += 1
            items.append(dict(t="section", text=sec))
            seen_section = True
            last_q = 0
            last_label = 0
            i = j
            continue

        # 代码段
        if c["kind"] == "code":
            body, j = consume_code(i)
            if body.strip():
                items.append(dict(t="code", text=body))
            i = j
            continue

        # 分组提示（独立行，或被粘在题尾）
        mg = GROUP.match(ts)
        if mg:
            items.append(dict(t="group", text=mg.group(1)))
            last_q = 0
            i += 1
            continue
        mi = GROUP_INLINE.search(t)
        if mi:
            head = t[:mi.start()].strip()
            if head:
                items.append(dict(t="para", text=emit_inline(head)))
            items.append(dict(t="group", text=mi.group(1)))
            last_q = 0
            tail = t[mi.end():].strip()
            if tail:
                items.append(dict(t="para", text=emit_inline(tail)))
            i += 1
            continue

        # 小节 (1)
        m = SUBHEAD.match(ts)
        if m and not QUESTION.match(ts):
            items.append(dict(t="sub", text=m.group(1)))
            rest = m.group(2).strip()
            if rest:
                items.append(dict(t="para", text=emit_inline(rest)))
            last_q = 0
            last_label = 0
            i += 1
            continue

        # 题目
        m = QUESTION.match(ts)
        if m and seen_section:
            num = int(m.group(1))
            body_head = m.group(2).lstrip()
            # 排除正文里被误认成题号的编号：
            #   * 题干以「（xxx）」开头（如「1. （Josephus 问题）…」）；
            #   * 题号在本节内不递增；
            #   * 编号与上一题同号（重复）。
            # 「27.（3.5分）…」仍是题目；只有「1.（Josephus 问题）…」这种
            # 括号后跟**中文标题**的才是列表项——即括号内容不含数字/分数。
            m_paren = re.match(r"^[（(]([^）)]{0,12})[）)]", body_head)
            # NOIP 的完善程序标题正是「1. （交朋友）…」，不能按列表项降级
            looks_like_list = (False if noip else bool(
                m_paren and not re.search(r"\d|分|题", m_paren.group(1))))
            # 小数误判（`1.80 米的同学…`）：点号后**紧跟**数字的才算小数；
            # `3.   1MB 等于…` 后面有空格，仍是题号。
            # 例外：编号正好接上上一题（`17` 之后出现 `18．1956 年…`）时，
            # 那是以年份开头的题目，不是小数。
            if re.match(r"^\s*\d{1,2}[.．]\d", t) and num != last_q + 1:
                looks_like_list = True
            if num > last_q and not looks_like_list:
                mb = BODY_Q.match(t)
                body = emit_inline((mb.group(1) if mb else m.group(2))).lstrip()
                j = i + 1
                extra = []
                while j < n:
                    c2 = cl(j)
                    tt = c2["text"].strip()
                    tts = strip_inline_code_ticks(tt)
                    if (c2["kind"] in ("empty", "code") or QUESTION.match(tts)
                            or OPTION.match(tts) or GROUP.match(tts) or SECTION.match(tts)
                            or SUBHEAD.match(tts) or is_footer(tt)
                            # 以 // 开头的行是下一段代码的注释，不是题干续行
                            or tts.startswith("//")):
                        break
                    extra.append(emit_inline(tt))
                    j += 1
                if extra:
                    body += "".join(extra)
                items.append(dict(t="q", num=num, text=body))
                last_q = num
                last_label = 0
                i = j
                continue

        # 选项
        m = OPTION.match(ts)
        if m:
            label = ord(m.group(1).replace("Ａ", "A").replace("Ｂ", "B")
                        .replace("Ｃ", "C").replace("Ｄ", "D")) - ord("A") + 1
            if label > last_label:
                last_label = label
                mo = BODY_O.match(t)
                opt_text = emit_inline(mo.group(1) if mo else m.group(2))
                # 双栏排版：`A. 1000 字节   B. 1024 字节` 会抽成一行，
                # 按「宽空白 + 下一个选项字母」拆开。
                chunks = re.split(r"\s{2,}(?=[B-DＢ-Ｄ]\s*[.．])", opt_text)
                if len(chunks) > 1:
                    lab_idx = label
                    for ch in chunks:
                        mm2 = OPTION.match(ch)
                        if mm2 and lab_idx <= 4:
                            items.append(dict(t="opt", label=chr(ord("A") + lab_idx - 1),
                                              text=mm2.group(2).strip()))
                            last_label = lab_idx
                            lab_idx += 1
                        else:
                            items.append(dict(t="opt", label=chr(ord("A") + lab_idx - 1),
                                              text=ch.strip()))
                            last_label = lab_idx
                            lab_idx += 1
                    i += 1
                    continue
                items.append(dict(t="opt", label=chr(ord("A") + label - 1),
                                  text=opt_text))
                j = i + 1
                extra = []
                while j < n:
                    c2 = cl(j)
                    tt = c2["text"].strip()
                    tts = strip_inline_code_ticks(tt)
                    if (c2["kind"] in ("empty", "code") or OPTION.match(tts)
                            or QUESTION.match(tts) or GROUP.match(tts) or SECTION.match(tts)
                            or SUBHEAD.match(tts) or is_footer(tt)):
                        break
                    extra.append(emit_inline(tt))
                    j += 1
                if extra:
                    items[-1]["text"] += "".join(extra)
                i = j
                continue

        # 普通段落
        items.append(dict(t="para" if seen_section else "title", text=emit_inline(t)))
        i += 1
    return items


# ---------------------------------------------------------------------------
# OCR 后端
# ---------------------------------------------------------------------------
def render_pages(pdf: Path, dpi: int = 150) -> list[Path]:
    tmp = Path(tempfile.mkdtemp(prefix="csp_ocr_"))
    subprocess.run(["pdftoppm", "-r", str(dpi), "-png", str(pdf), str(tmp / "p")], check=True)
    return sorted(tmp.glob("p-*.png")) + sorted(tmp.glob("p*.png"))


OCR_PROMPT = """把这一页竞赛试卷逐字转录为 Markdown，规则：
1. 保留原有题号（如 1. 2.）与选项（A. B. C. D.），不要改动编号；
2. 行内数学用 LaTeX 包在 $...$ 中（下标 _、上标 ^、分数 \\frac{}{}、乘号 \\times）；
3. 代码段用 ```cpp 围栏，保持缩进；
4. 判断题的括号写作（ ）；
5. 不要输出页眉页脚（页码、卷名）；
6. 只输出转录内容，不要任何解释或前后缀。"""


def ocr_local_vision(pages: list[Path], endpoint: str, model: str) -> str:
    chunks = []
    for p in pages:
        b64 = base64.b64encode(p.read_bytes()).decode()
        payload = json.dumps({
            "model": model,
            "messages": [{"role": "user", "content": [
                {"type": "text", "text": OCR_PROMPT},
                {"type": "image_url", "image_url": {"url": "data:image/png;base64," + b64}},
            ]}],
            "max_tokens": 8000,
            "temperature": 0,
        }).encode()
        last = None
        for attempt in range(3):
            try:
                req = urllib.request.Request(
                    endpoint, data=payload, headers={"Content-Type": "application/json"})
                with urllib.request.urlopen(req, timeout=600) as r:
                    data = json.load(r)
                msg = data["choices"][0]["message"]
                txt = msg.get("content") or ""
                if txt.strip():
                    chunks.append(txt.strip())
                    log(f"  OCR {p.name}: {len(txt)} chars")
                    last = None
                    break
                last = RuntimeError("empty content")
            except Exception as e:  # noqa: BLE001
                last = e
                log(f"  OCR {p.name} attempt {attempt + 1} failed: {e}")
                time.sleep(2 + attempt * 3)
        if last is not None:
            chunks.append(f"<!-- OCR-FAILED {p.name} -->")
    return "\n\n".join(chunks)


def ocr_mineru(pdf: Path, token: str, model_version: str = "vlm") -> str:
    """MinerU v4 精准解析：申请上传链接 → PUT → 轮询 → 取 full.md。"""
    base = "https://mineru.net/api/v4"
    hdr = {"Content-Type": "application/json", "Authorization": f"Bearer {token}"}
    req = urllib.request.Request(
        base + "/file-urls/batch",
        data=json.dumps({
            "files": [{"name": pdf.name, "is_ocr": True}],
            "model_version": model_version,
            "enable_formula": True,
            "enable_table": True,
            "language": "ch",
        }).encode(),
        headers=hdr,
    )
    with urllib.request.urlopen(req, timeout=60) as r:
        res = json.load(r)
    if res.get("code") != 0:
        raise RuntimeError(f"MinerU 申请链接失败: {res}")
    batch_id = res["data"]["batch_id"]
    url = res["data"]["file_urls"][0]

    put = urllib.request.Request(url, data=pdf.read_bytes(), method="PUT")
    with urllib.request.urlopen(put, timeout=600) as r:
        if r.status not in (200, 201):
            raise RuntimeError(f"MinerU 上传失败 HTTP {r.status}")

    for _ in range(120):
        time.sleep(5)
        q = urllib.request.Request(f"{base}/extract-results/batch/{batch_id}", headers=hdr)
        with urllib.request.urlopen(q, timeout=60) as r:
            res = json.load(r)
        for item in res["data"].get("extract_result", []):
            st = item.get("state")
            if st == "done":
                zip_url = item["full_zip_url"]
                import io
                import zipfile
                with urllib.request.urlopen(zip_url, timeout=300) as zr:
                    zb = zipfile.ZipFile(io.BytesIO(zr.read()))
                for name in zb.namelist():
                    if name.endswith("full.md"):
                        return zb.read(name).decode("utf-8", "replace")
                raise RuntimeError("MinerU 结果包里没有 full.md")
            if st == "failed":
                raise RuntimeError(f"MinerU 解析失败: {item.get('err_msg')}")
    raise RuntimeError("MinerU 轮询超时")



NOIP_FOOTER_SPAN = re.compile(r"NOIP\s*\d{4}|第\s*\d+\s*页|共\s*\d+\s*页")
# 页脚里的卷名/科目字样。正文里不会出现（2013PJ 的题干有「复赛」，不能算进去），
# 卷头用了同样的字，所以只在页面下半叶生效。
NOIP_FOOTER_WORD = re.compile(r"语言试题|初赛|提高组|普及组")
# 页码碎片：「第」「页」「共」、页码数字、C++ 这类孤立 token。
NOIP_FOOTER_FRAG = re.compile(
    r"第|页|共|^\s*(?:C\+\+|C|Pascal|CCF)\s*$|^\s*\d{1,3}\s*$")


def drop_noip_footer_spans(spans: list[dict]) -> list[dict]:
    """NOIP 老卷的页脚会与代码挤在同一基线，按文字特征 + 版面位置丢 span。

    页脚由多个 span 拼成（`初赛提高组` + `C++` + `语言试题` + `第` `2` `页，共`
    `13` `页`），单看文字都不像页脚。做法：

      1. 在下半叶找「卷名字样」span，取它（和它下面的页码行）作为页脚带，
         切线以下的 span 全部丢掉——被切散的 `C++`、`,`、页码数字一并清掉；
      2. 与页面最底部同一基线的页码碎片单独兜底；
      3. `NOIP20xx` / `第 N 页` / `共 N 页` 不受位置限制。

    不能全篇按「纯数字 span」删：正文里的下标数字（`A` 后面的小号 `0`，字号
    只有正文的 62%）也是纯数字，全局删会把 `A0`、选项数值全吃掉——2013PJ
    第 12 题就栽在这上面。
    """
    by_page: dict[int, list[dict]] = {}
    for s in spans:
        by_page.setdefault(s["page"], []).append(s)
    page_bottom = {pg: max(x["top"] for x in ss) for pg, ss in by_page.items()}

    cut: dict[int, float] = {}
    for pg, ss in by_page.items():
        ph = next((x["ph"] for x in ss if x.get("ph")), 0)
        if not ph:
            continue
        cands = [x["top"] for x in ss
                 if x["top"] > ph * 0.45 and NOIP_FOOTER_WORD.search(x["text"])]
        if cands:
            cut[pg] = min(cands) - 2

    out = []
    for s in spans:
        if NOIP_FOOTER_SPAN.search(s["text"]):
            continue
        if s["page"] in cut and s["top"] >= cut[s["page"]]:
            continue
        if (page_bottom.get(s["page"])
                and s["top"] >= page_bottom[s["page"]] - 6
                and NOIP_FOOTER_FRAG.search(s["text"])):
            continue
        out.append(s)
    return out


def split_heading_code(lines: list[dict], is_code) -> list[dict]:
    """`3. #include<iostream>` 这类「题号+代码同行」拆成两行。

    老 NOIP 卷的程序编号常和第一行代码排在同一基线，pdftohtml 会并成一个
    行；不拆的话代码首行会粘进题干。
    """
    out: list[dict] = []
    no_mono = getattr(is_code, "no_mono", False)
    for ln in lines:
        sp = ln["spans"]
        if len(sp) >= 2 and re.fullmatch(r"\s*\d{1,2}\.\s*", sp[0]["text"]):
            head_tx = "".join(s["text"] for s in sp[1:])
            # 无等宽字体的卷（2012PJ）里代码首行不是代码字体，只能按内容认：
            # `1. #include <iostream>`、`1. using namespace std;` 之类。
            code_like = is_code(sp[1]) or bool(no_mono and re.match(
                r"\s*(?:#\s*(?:include|define|pragma)|//|using\s+(?:namespace|std)|"
                r"(?:int|void|char|bool|double|float)\s+[A-Za-z_]\w*\s*[({])",
                head_tx))
            if code_like:
                head = dict(ln, spans=[sp[0]])
                rest = dict(ln, spans=sp[1:])
                out.extend([head, rest])
                continue
        out.append(ln)
    return out


_SHEET = re.compile(
    r"答卷纸|答卷部分|答卷|以下由考生填写|阅\s*卷|参考答案|密\s*封\s*线|"
    r"^\s*赛区\s+市\s+学校")
_SHEET_TAIL = re.compile(r"第\s*[一二三四五六七八九十]+\s*大\s*题|总\s*阅\s*卷\s*人")


def cut_answer_sheet(items: list[dict]) -> list[dict]:
    """2004–2010 的 .doc/.pdf 把「答卷纸」和「参考答案」也排在同一份文件里。

    这两部分题号又从 1 开始、行首是 `A)` 之类，会被误认成真题（多出 8 道题、
    选项数也对不上）。从第一个答卷标志出现处截断即可——真题在它之前。
    """
    for i, it in enumerate(items):
        t = (it.get("text") or "").strip()
        if i > 20 and (_SHEET.search(t) or _SHEET_TAIL.search(t)):
            return items[:i]
    return items


def merge_code_listing(items: list[dict]) -> list[dict]:
    """`1. 语句` 这种编号代码清单并回一个代码块。

    2009PJ 问题求解第 2 题给了一段带编号的程序清单（`1. a=1;` `2. b=a;` …），
    抽取时每行都被当成一道题，题量因此多出 13 道。判据要严：至少连着 3 组
    「编号 + 单行代码」，才认为是一段清单；2016TG 第 15 题的伪代码里偶有
    `4.` 单独成行，只有一两组，不能动。
    """
    out: list[dict] = []
    i = 0
    n = len(items)

    def head_num(it):
        t = (it.get("text") or "").strip()
        if it["t"] == "q" and not t:
            return it.get("num")
        if it["t"] == "para" and re.fullmatch(r"\d{1,2}\s*[.．]", t):
            return int(t.rstrip(". ．"))
        return None

    def single_line_code(it):
        return it["t"] == "code" and len(it["text"].split("\n")) <= 2

    while i < n:
        num = head_num(items[i])
        if num is not None and i + 1 < n and single_line_code(items[i + 1]):
            # 先数一数连续有几组
            pairs = []
            j = i
            while j < n:
                k = head_num(items[j])
                if k is None or j + 1 >= n or not single_line_code(items[j + 1]):
                    break
                pairs.append((k, items[j + 1]["text"].strip()))
                j += 2
            if len(pairs) >= 3:
                body = [f"{k}. {txt}" for k, txt in pairs]
                out.append(dict(t="code", text="\n".join(body)))
                i = j
                continue
        out.append(items[i])
        i += 1
    return out


def renumber_q(items: list[dict]) -> list[dict]:
    """NOIP 卷每节题号都从 1 开始；按出现顺序统一编号成 1..N。"""
    gq = 0
    out = []
    for it in items:
        if it["t"] == "q":
            gq += 1
            out.append(dict(it, num=gq))
        else:
            out.append(it)
    return out


def txt_to_items(text: str) -> list[dict]:
    """把「已清理的题卷纯文本」转成 items。

    输入是 prep_exam_text.py 的产物，缩进有固定含义：
        0 缩进  章节/题号/正文
        2 缩进  选项 `A. …`
        4 缩进  代码行（阅读程序/完善程序的编号代码，行号已去掉）
    """
    items: list[dict] = []
    code_buf: list[str] = []
    gq = 0                 # 全局题号（txt 里的题号已是连续的，这里只保证自增）
    last_q = 0
    seen_section = False
    cur_section = ""       # 用于识别「完善程序」里 `1. （标题）` 的程序小标题

    def flush_code():
        nonlocal code_buf
        if code_buf:
            body = "\n".join(code_buf).rstrip()
            if body.strip():
                items.append(dict(t="code", text=body))
            code_buf = []

    for raw in text.split("\n"):
        # 缩进按原始行算：先 rstrip 会把「4 个空格的代码空行」压成 0 缩进
        indent = len(raw) - len(raw.lstrip())
        line = raw.rstrip()
        if not line.strip():
            # 4 空格缩进的空行是代码块里的空行，不是块结束
            if indent >= 4:
                code_buf.append("")
            else:
                flush_code()
            continue
        t = line.strip()

        if indent >= 4:
            code_buf.append(t)
            continue
        flush_code()

        m = SECTION.match(t)
        if m and len(m.group(2)) > 4:
            items.append(dict(t="section", text=t))
            cur_section = t
            last_q = 0
            seen_section = True
            continue
        m = SUBHEAD.match(t)
        if m:
            items.append(dict(t="sub", text=m.group(1)))
            last_q = 0
            continue
        m = GROUP.match(t)
        if m:
            items.append(dict(t="group", text=m.group(1)))
            continue
        m = QMD.match(t)
        if m:
            gq += 1
            items.append(dict(t="q", num=gq, text=m.group(2).strip()))
            continue
        m = OPTION.match(t)
        if m:
            lab = m.group(1).replace("Ａ", "A").replace("Ｂ", "B") \
                .replace("Ｃ", "C").replace("Ｄ", "D").replace("Ｅ", "E")
            items.append(dict(t="opt", label=lab, text=m.group(2).strip()))
            continue
        # 正文：卷头阶段算 title（供转换器取 course/title/date），
        # 正文阶段接在上一段后面（题干折行）
        if not seen_section:
            items.append(dict(t="title", text=t))
        elif items and items[-1]["t"] in ("q", "para", "opt"):
            items[-1] = dict(items[-1], text=items[-1]["text"] + t)
        else:
            items.append(dict(t="para", text=t))
    flush_code()
    return items


OCR_ESC = re.compile(r"\\([\\`*_{}\[\]()#+\-.!<>~$%@|])")
INLINE_Q = re.compile(r"(?<=[。！？）)】])\s*(?=\d{1,2}\s*[.．]\s*[\u4e00-\u9fff（(A-Za-z])")


def clean_ocr_md(md: str) -> str:
    """OCR 输出的清理：

      * 去掉 markdown 反斜杠转义（`10\\~19` → `10~19`、`\\-` → `-`）；
      * `![](images/xxx.jpg)` 图片引用换成 `@@FIG@@` 占位；
      * 把「…。（）。12. 题干」这种行内题号切成新行。
    """
    md = OCR_ESC.sub(r"\1", md)
    md = re.sub(r"!\[[^\]]*\]\([^)]*\)", "@@FIG@@", md)
    out = []
    for line in md.split("\n"):
        parts = INLINE_Q.split(line)
        out.append("\n".join(parts) if len(parts) > 1 else line)
    return "\n".join(out)


def md_to_items(md: str) -> list[dict]:
    """把「题面 markdown」转成 items。

    支持的写法（2019S1 的解析稿就是这种）：
        ## 一、单项选择       → section
        ### 1.               → sub
        #### 判断题           → group
        ```cpp … ```         → code
        1. 题干              → q
           A. 选项            → opt（缩进可有可无）
    """
    items: list[dict] = []
    in_code = False
    buf: list[str] = []
    gq = 0          # 全局题号：md 稿多按小节重编，这里统一连续编号
    md = clean_ocr_md(md)
    QMD = re.compile(r"^\s*(\d{1,2})\s*[.．、)）]\s*(.+)$")
    blank_before = True      # 上一个源行是空行 → 新起一段

    for raw in md.split("\n"):
        line = raw.rstrip()
        if line.strip().startswith("```"):
            if in_code:
                items.append(dict(t="code", text="\n".join(buf)))
                buf = []
                in_code = False
            else:
                in_code = True
            blank_before = False
            continue
        if in_code:
            buf.append(raw)
            continue

        t = line.strip()
        if not t:
            blank_before = True
            continue
        if blank_before:
            prev_t = None
        else:
            prev_t = items[-1]["t"] if items else None
        blank_before = False
        if "@@FIG@@" in t:
            items.append(dict(t="figure", text="原卷配图"))
            rest = t.replace("@@FIG@@", "").strip()
            if rest:
                items.append(dict(t="para", text=rest))
            continue
        if t.startswith("#"):
            lvl = len(t) - len(t.lstrip("#"))
            title = t.lstrip("#").strip()
            title = re.sub(r"^[一二三四五六七八九十]+、\s*", "", title) if lvl <= 2 else title
            # `## - 判断题` / `## $\bullet$ 选择题` 其实是分组标签
            if re.fullmatch(r"[-\s*$\\bullet.]*(判断题|单选题|选择题)", title):
                items.append(dict(t="group",
                                  text=re.search(r"(判断题|单选题|选择题)", title).group(1)))
                continue
            # `## 3.` 这类是阅读程序的编号
            if lvl >= 2 and re.fullmatch(r"[（(]?\d{1,2}[)）]?\.?", title):
                items.append(dict(t="sub", text=re.sub(r"[^0-9]", "", title) or title))
                continue
            if lvl == 1:
                items.append(dict(t="title", text=title))
            elif lvl == 2:
                items.append(dict(t="section", text=title))
                last_q = 0
            elif lvl == 3:
                m = re.match(r"^([（(]?\d{1,2}[)）]?)\.?$", title)
                items.append(dict(t="sub", text=re.sub(r"[^0-9]", "", title) or title))
                last_q = 0
            else:
                items.append(dict(t="group", text=title))
            continue
        m = QMD.match(t)
        if m:
            gq += 1
            items.append(dict(t="q", num=gq, text=m.group(2).strip()))
            continue
        m = OPTION.match(t)
        if m:
            lab = m.group(1).replace("Ａ", "A").replace("Ｂ", "B") \
                .replace("Ｃ", "C").replace("Ｄ", "D").replace("Ｅ", "E")
            items.append(dict(t="opt", label=lab, text=m.group(2).strip()))
            continue
        if re.match(r"^[-*]\s*(判断题|单选题|选择题)\s*$", t):
            items.append(dict(t="group", text=re.search(r"(判断题|单选题|选择题)", t).group(1)))
            continue
        if re.match(r"^答案\s*[：:]", t) or re.match(r"^解析\s*[：:]", t):
            continue
        # 整行数学（如大矩阵）：单独成段，别粘进上一段题干
        if len(t) > 2 and t.startswith("$") and t.endswith("$") and t.count("$") == 2:
            items.append(dict(t="para", text=t))
            continue
        if prev_t in ("q", "para", "opt") and items:
            items[-1] = dict(items[-1], text=items[-1]["text"] + t)
        else:
            items.append(dict(t="para", text=t))
    if in_code and buf:
        items.append(dict(t="code", text="\n".join(buf)))
    return items


# ---------------------------------------------------------------------------
# 主流程
# ---------------------------------------------------------------------------
def guess_serial(pdf: Path) -> str:
    name = pdf.stem
    for pat in (r"(20\d{2})\s*([JS])1", r"([JS])1\s*(20\d{2})", r"(20\d{2})"):
        m = re.search(pat, name, re.I)
        if m:
            g = m.groups()
            if len(g) == 2 and g[0].isdigit():
                return f"{g[0]}{g[1].upper()}1"
            if len(g) == 2:
                return f"{g[1]}{g[0].upper()}1"
            return f"{g[0]}"
    parent = pdf.parent.name
    m = re.match(r"(20\d{2})", parent)
    if m:
        return m.group(1)
    return name


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("pdf")
    ap.add_argument("--out", required=True)
    ap.add_argument("--serial", default="")
    ap.add_argument("--ocr", default="auto",
                    choices=("auto", "never", "local-vision", "mineru"),
                    help="auto=无文字层时自动 OCR")
    ap.add_argument("--model", default="qwen3.8-flash")
    ap.add_argument("--endpoint", default="http://127.0.0.1:3425/v1/chat/completions")
    ap.add_argument("--dpi", type=int, default=150)
    ap.add_argument("--noip", action="store_true",
                    help="NOIP 老卷：每节题号重新从 1 开始，按出现顺序统一重排；"
                         "「1.（标题）」这类程序标题保留为题，不降级成段落")
    args = ap.parse_args()

    pdf = Path(args.pdf)
    if not pdf.is_absolute():
        pdf = (Path.cwd() / pdf).resolve()
    if not pdf.exists():
        log(f"找不到 {pdf}")
        return 2

    # 纯文本 / markdown：跳过 PDF 解析
    if pdf.suffix.lower() in (".txt", ".md"):
        raw = pdf.read_text(encoding="utf-8")
        items = post_process(txt_to_items(raw) if pdf.suffix.lower() == ".txt"
                             else md_to_items(raw))
        out = dict(serial=args.serial or pdf.stem, source=str(pdf), pages=0,
                   backend="text-file", items=items)
        Path(args.out).parent.mkdir(parents=True, exist_ok=True)
        Path(args.out).write_text(json.dumps(out, ensure_ascii=False, indent=1),
                                  encoding="utf-8")
        cnt = {}
        for it in items:
            cnt[it["t"]] = cnt.get(it["t"], 0) + 1
        log(f"写出 {args.out}  {cnt}")
        return 0

    serial = args.serial or guess_serial(pdf)
    text_ok, text_pages, pages = pdf_has_text(pdf)
    backend = "text"
    if args.ocr == "never":
        backend = "text"
    elif args.ocr in ("local-vision", "mineru"):
        backend = args.ocr
    elif not text_ok:
        backend = "local-vision"

    log(f"{serial}: {pages} 页，文字层页数 {text_pages}，后端 {backend}")

    if backend == "text":
        spans = drop_watermark(pdf_spans(pdf))
        if args.noip:
            spans = drop_noip_footer_spans(spans)
        if not spans:
            log("pdftohtml 没抽到 span，转 OCR")
            backend = "local-vision"
        else:
            lines = cluster_lines(spans)
            profile = doc_font_profile(spans, lines)
            cols = code_line_columns(lines)
            log("字体用量：" + ", ".join(f"{f}:{c}" for f, c in profile["ranked"][:6]))
            log("行内代码字体：" + (", ".join(sorted(profile["inline_code_fams"])) or "无")
                + "；代码行号列 x=" + ("无" if not cols else ",".join(f"{c:g}" for c in sorted(cols))))
            is_code, is_math = make_classifiers(profile)
            if args.noip:
                lines = [l for l in lines
                         if not any(NOIP_FOOTER_SPAN.search(x["text"]) for x in l["spans"])]
                lines = split_heading_code(lines, is_code)
            items = post_process(structure(lines, pages, is_code, is_math, cols,
                                           noip=args.noip))
            if args.noip:
                items = cut_answer_sheet(items)
                items = merge_code_listing(items)
                items = renumber_q(items)
            else:
                items = demote_list_items(items)
    if backend != "text":
        if backend == "mineru":
            token = os.environ.get("MINERU_TOKEN", "").strip()
            if not token:
                log("MINERU_TOKEN 未设置；如需使用 MinerU，请先 export MINERU_TOKEN=...")
                return 3
            md = ocr_mineru(pdf, token)
        else:
            pages_png = render_pages(pdf, args.dpi)
            md = ocr_local_vision(pages_png, args.endpoint, args.model)
            shutil.rmtree(pages_png[0].parent, ignore_errors=True)
        md_path = Path(args.out).with_suffix(".ocr.md")
        md_path.write_text(md, encoding="utf-8")
        log(f"OCR 原文 -> {md_path}")
        items = post_process(md_to_items(md))
        items = renumber_q(items) if args.noip else demote_list_items(items)

    out = dict(serial=serial, source=str(pdf), pages=pages, backend=backend, items=items)
    Path(args.out).parent.mkdir(parents=True, exist_ok=True)
    Path(args.out).write_text(json.dumps(out, ensure_ascii=False, indent=1), encoding="utf-8")

    cnt = {}
    for it in items:
        cnt[it["t"]] = cnt.get(it["t"], 0) + 1
    log(f"写出 {args.out}  {cnt}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
