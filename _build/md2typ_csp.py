#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""md2typ_csp.py — 把 fetch_text.py 抽出的 JSON 转成 Typst 试卷 / 答案。

用法：
  cd 0x0c00_真题整理
  python3 _build/md2typ_csp.py _build/raw/2023J1.json \\
      --out CSP-J_S/Round1/2023/2023J1.typ --kind paper
  python3 _build/md2typ_csp.py _build/raw/2023J1.json \\
      --out CSP-J_S/Round1/2023/2023J1-答案.typ --kind answers \\
      --answers _build/raw/2023J1.answers.json

数学与转义逻辑复用 GESP 教材的转换器（不复制代码）：
  0x0E00_GESP考级/0x0E18_GESP八级/教材/_cmp/md2typ.py
那边改了规则，这里自动受益。
"""
from __future__ import annotations

import argparse
import json
import re
import sys
import unicodedata
from pathlib import Path

GESP_CMP = Path("/home/wyao/Nutstore Files/aisichuang/0x0E00_GESP考级/0x0E18_GESP八级/教材/_cmp")
if not GESP_CMP.exists():
    sys.exit(
        "找不到 GESP 转换器（数学/转义规则复用自这里）：\n"
        f"  {GESP_CMP}\n"
        "如果那边挪了位置，改本文件顶部的 GESP_CMP 路径。"
    )
sys.path.insert(0, str(GESP_CMP))
import md2typ as G  # noqa: E402

HERE = Path(__file__).resolve().parent
ROOT = HERE.parent

HEADER = '''// ===========================================================================
// {serial} —— {course}{title_suffix}
// 由 _build/md2typ_csp.py 从 {source} 生成，人工补丁见 _build/patch_manual.py
// 编译：typst compile --root . {relpath}
// ===========================================================================
#import "/_typst/exam.typ": *

#show: doc => exam(
  serial: "{serial}",
  course: "{course}",
  title: "{title}",
  date: "{date}",
  doc,
)

'''


# ---------------------------------------------------------------------------
# 行内文本清洗
# ---------------------------------------------------------------------------
def fix_inline_code(s: str) -> str:
    """行内代码去掉首尾多余空格，但保留内部。"""
    def rep(m):
        body = m.group(1)
        return "`" + body.strip() + "`"
    return re.sub(r"`([^`\n]*)`", rep, s)


def normalize_code_block(code: str) -> str:
    """按花括号层级重排缩进（4 空格 / 级）。

    PDF 抽取拿不到可靠的前导空白（同一层有时 1 空格有时 3 空格），所以
    不做「还原原缩进」，而是按 C++ 代码结构重排：以 `{` 增多、`}` 减少来
    推层级。这样同一份卷子的所有代码块视觉一致，也更好维护。

    预处理：`} else {` 这类同一行先收一层再开一层；缩进本身不参与判断。
    """
    lines = [ln.rstrip() for ln in code.split("\n")]
    while lines and not lines[0].strip():
        lines.pop(0)
    while lines and not lines[-1].strip():
        lines.pop()
    if not lines:
        return ""

    def brace_delta(s: str) -> int:
        # 只数括号，不数字符串与注释里的（试卷代码里极少出现）
        core = re.sub(r"//.*$", "", s)
        core = re.sub(r'"[^"]*"', '""', core)
        core = re.sub(r"'[^']*'", "''", core)
        return core.count("{") - core.count("}")

    out = []
    depth = 0
    # 无花括号的控制语句（`if (x)` / `for (…)` / `while (…)` / `else`）：
    # 下一行要多缩进一级，否则 `if (root == 0)` 和它的 `return 1;` 会并排。
    dangling = 0
    for ln in lines:
        s = ln.strip()
        if not s:
            out.append("")
            continue
        # 完善程序的填空位：原卷用一长串空格把 ①②③ 推到行中，PDF 抽出来的
        # 空格数（有时 30 多个）会让整行超出版心，Typst 的网格随之溢出。
        # 压缩成固定留白，视觉上仍是「一行中间的空」。
        if re.search(r"[①-⑳]", s):
            s = re.sub(r"[ \t]{2,}([①-⑳])", r"    \1", s)
            s = re.sub(r"([①-⑳])[ \t]{2,}", r"\1   ", s)
        # 行尾注释后面又粘了下一行代码（软换行续行被并进来）：
        #   `if (...) &&                                 //（3 分） (is_bst(...) == 1) &&`
        # 拆成「注释行」+「续行」，否则注释会把代码吞掉。
        pieces = [s]
        if "//" in s:
            head, _, tail = s.partition("//")
            mc = re.match(r"^\s*([（(]\s*\d+\s*分[）)])\s*(\S.*)$", tail)
            if mc and re.search(r"[;{}()]", mc.group(2)):
                pieces = [head.rstrip() + "   //" + mc.group(1),
                          "    " + mc.group(2).strip()]
        # 行首就是 `}` 的行先减一层；单独的 `{` 行不额外缩进（花括号自己
        # 会开一层）；上一行条件表达式的续行（以 `(` 开头）保持悬垂层级。
        first = pieces[0]
        lead = 1 if first.startswith("}") else 0
        if lead or first.startswith("{"):
            dangling = 0
        indent = max(0, depth - lead) + dangling
        out.append("    " * indent + first)
        depth = max(0, depth + brace_delta(first))
        head = bool(re.match(r"^(?:if|for|while|else)\b", first)
                    and not first.rstrip().endswith(("{", ";"))
                    and "{" not in first)
        if head:
            dangling += 1
        elif not first.lstrip().startswith(("(", "//")):
            dangling = 0
        for extra in pieces[1:]:
            out.append("    " * indent + extra)
            depth = max(0, depth + brace_delta(extra))
    return "\n".join(out)


def fold_math_unicode(s: str) -> str:
    """把 Unicode 数学字母数字符号折回 ASCII（NFKC）。

    PDF 抽出的数学区常带 𝑀、𝐴、𝑛 这类数学斜体码位；Typst 会把连续字母当成
    多字母标识符而报 `unknown variable`。注意 NFKC 对普通全角字符也会生效，
    所以只处理 U+1D400–U+1D7FF 这一段。

    另外把「修饰字母」的逻辑符号折成正经的数学符号：2013PJ 第 4 题的
    `(A ˅ B) ˄ ¬A` 用的是 U+02C5/U+02C4（spacing modifier letter），排出来
    和 `^` 几乎一样，读者分不出与/或。
    """
    # 2004–2010 的 Word 卷用制表符形状的 `┓`（U+2513）当「非」，
    # 字形上是个空心方框，读者会以为是缺字。
    CHAR_MAP = {"\u02c4": "∧", "\u02c5": "∨",
                "\u2513": "¬", "\u2501": "¬", "\u250c": "¬"}
    out = []
    for ch in s:
        if ch in CHAR_MAP:
            out.append(CHAR_MAP[ch])
        elif 0x1D400 <= ord(ch) <= 0x1D7FF:
            out.append(unicodedata.normalize("NFKC", ch))
        else:
            out.append(ch)
    return "".join(out)


def split_math_identifiers(body: str) -> str:
    """在数学段里拆开「字母紧跟数字」与「已知函数名紧贴字母」。

    Typst 数学模式把连续字母当多字母标识符，`A0`、`nsqrt(2)` 都会报
    `unknown variable`。拆成 `A 0`、`n sqrt(2)` 后渲染一致（数学模式忽略空格）。
    """
    KNOWN = ("sqrt", "log", "ln", "sin", "cos", "tan", "max", "min", "abs",
             "exp", "sum", "prod", "floor", "ceil", "det", "gcd", "binom")
    for fn in KNOWN:
        # 函数名前面紧贴字母：`n sqrt(` ← `nsqrt(`
        body = re.sub(rf"(?<=[A-Za-z0-9)]){fn}\b", " " + fn, body)
        # 函数名后面紧贴字母：`sqrt n` ← `sqrtn`
        body = re.sub(rf"\b{fn}(?=[A-Za-z])", fn + " ", body)
    # italic("abc") 里的多字母仍被 Typst 当标识符而报错。数学模式对单字母
    # 本来就斜体，所以直接拆成单字母、去掉 italic() 外壳。
    def split_italic(m):
        w = m.group(1)
        if w.lower() in KNOWN:
            return w
        return " ".join(w)
    body = re.sub(r'italic\("([A-Za-z]{2,})"\)', split_italic, body)
    body = re.sub(r"([A-Za-z])(\d)", r"\1 \2", body)
    body = re.sub(r"(\d)([A-Za-z])", r"\1 \2", body)
    return body


def merge_broken_cjk(g: str) -> str:
    """修掉「新 节 点」这类单字被拆开的问题。

    PDF 抽取按 span 拼接，中文字之间若跨 span 会被补一个空格，打印出来
    变成「新 节 点」。规则：两个汉字之间的单个空格删掉；汉字与标点之间的
    单个空格删掉。英文单词之间的空格保留。

    例外：中文之间若有两个及以上空格，说明原文确有间隔（如「填空 ____ 处」），
    保留。
    """
    cjk = r"\u3400-\u9fff\u3000-\u303f\uff00-\uffef"
    for _ in range(3):
        g = re.sub(rf"(?<=[{cjk}]) (?=[{cjk}])", "", g)
    return g


def fix_section_spacing(s: str) -> str:
    """章节标题里的英文/数字与中文之间补回空格（PDF 里常被 span 切断）。"""
    cjk = r"\u3400-\u9fff"
    s = re.sub(rf"(?<=[{cjk}])(?=[A-Za-z0-9])", " ", s)
    s = re.sub(rf"(?<=[A-Za-z0-9])(?=[{cjk}])", " ", s)
    return s


def sanitize_math(body: str) -> str:
    """把 GESP 转换后的 Typst 数学再修一遍，避免语法错。

    只处理 PDF 抽取造成的确定错误，不动正常的 `x^2` / `a_(i,j)`：
      1. `√` 在 Typst 里是符号不是函数，且常被前面粘上变量（`n√n`）——
         统一改写成 `sqrt(...)`；
      2. **缺底数**的上下标（左邻是括号/逗号/运算符/行首）；
      3. 孤立的 `^` / `_`；
      4. 多字母标识符（Typst 会当未定义变量）在数学里补空格。
    """
    s = body
    # 0) `#` 在 Typst 数学里是插值符（`a#` 报 expected expression），一律转义
    s = re.sub(r"(?<!\\)#", r"\\#", s)
    # 1) √：n√n → n sqrt(n)；√n → sqrt(n)；√(x) → sqrt(x)
    s = re.sub(r"√\s*\^\s*\(([^()]*)\)", r"sqrt(\1)", s)
    s = re.sub(r"√\s*\(([^()]*)\)", r"sqrt(\1)", s)
    s = re.sub(r"√\s*([A-Za-z0-9])", r"sqrt(\1)", s)
    # 落单的 √（后面没有可作用的字母，多是填空括号被误认）直接去掉
    s = re.sub(r"√", "", s)
    # 2) 缺底数的上下标
    s = re.sub(r"(^|[\s(（\[{,，=+\-×·<>])[_^]\s*\(([^()]*)\)", r"\1\2", s)
    # 3) 孤立标记
    s = re.sub(r"(^|[\s(（\[{,，=+\-×·<>])[_^](?![({])", r"\1", s)
    # 5) 落单的 `"`：Word 卷的数学字体把上标错映射成 `"`（`2ⁿ` → `2"`），
    #    而 Typst 数学里 `"` 会开启字符串并把后续整段吞掉。成对出现才保留。
    if s.count('"') % 2 == 1:
        s = s.replace('"', "")
    s = re.sub(r"\s{2,}", " ", s)
    return s.strip()


def typ_math(md_text: str) -> str:
    """md 风格的 `$..$` 数学与转义 → Typst。

    数学转换复用 GESP 的 conv_inline；之后再对每个数学段做标识符拆分、
    语法清洗，最后修掉中文被拆字带来的空格。
    """
    # 嵌套的 `$a$`（如 `$O($m^n$_(n) log $m^n$_(n))$`）会让 conv_inline 产出
    # `$$`；先把内层 `$` 去掉，整段当一个数学式处理
    md_text = re.sub(r"\$([^$]*)\$", lambda m: m.group(0), md_text)
    nested = re.match(r"^\$(.*)\$$", md_text, re.S)
    if nested and "$" in nested.group(1):
        md_text = "$" + nested.group(1).replace("$", "") + "$"

    # 老 NOIP 卷的文字层带着 Word 的上下标标记（`n#super[2]`）
    md_text = re.sub(r"([A-Za-z0-9)]+)#super\[([^\]]+)\]", r"$\1^{\2}$", md_text)
    md_text = re.sub(r"([A-Za-z0-9)]+)#sub\[([^\]]+)\]", r"$\1_{\2}$", md_text)
    # 落单的上下标标记（前面没有可依附的字符）直接丢掉
    md_text = re.sub(r"#\s*(?:sub|super)\[[^\]]*\]", "", md_text)
    out = G.conv_inline(fold_math_unicode(md_text))

    def rep(m):
        return "$" + split_math_identifiers(sanitize_math(m.group(1))) + "$"
    out = re.sub(r"\$([^$]*)\$", rep, out)
    # 数学段之外的裸上下标（PDF 抽出把 N² 写成 N^{2}）包进 $..$。
    # 必须跳过行内代码：`__builtin_ctzll` 里的 `_c` 会被误当成下标。
    code_pieces = re.split(r"(`[^`\n]*`)", out)
    for ci in range(0, len(code_pieces), 2):
        segs = re.split(r"(\$[^$]*\$)", code_pieces[ci])
        for k in range(0, len(segs), 2):
            t = segs[k]
            t = re.sub(r"([A-Za-z0-9])([_^]\{[^{}]*\})", r"$\1\2$", t)
            # 裸上下标只在「标识符开头」处包数学：`N^2`、`x_i` 要包，
            # 但 `left_child`、`right_child` 里的 `t_c` 是标识符的一部分，
            # 包成 `lef$t_c$hild` 会整词断掉（2013PJ 第 28 题就中招了）。
            t = re.sub(r"(?<![A-Za-z0-9_])([A-Za-z0-9])([_^][A-Za-z0-9])",
                       r"$\1\2$", t)
            segs[k] = t
        code_pieces[ci] = "".join(segs)
    out = "".join(code_pieces)
    # 同一行的数学被非数学字体切成 `$a$log$b$` 时并回一段。
    # 只认「函数名/运算符」这类正体短词（log、lim、mod、×…），
    # 不认普通变量名（fa、cnt）——那些是落在数学外的正文标识符，
    # 并进来会变成未定义变量。
    FUNC_MID = re.compile(
        r"^(?:(?:log|ln|lim|max|min|gcd|mod|and|or|not|exp|sin|cos|tan|"
        r"sqrt|abs|det|arg|dim|ker|Pr)|[×·⋅÷±≤≥≠≈→←⇒⇔∈∉⊆⊂∪∩∞])$")
    segs = re.split(r"(\$[^$]*\$)", out)
    merged: list[str] = []
    i = 0
    while i < len(segs):
        cur = segs[i]
        if (cur.startswith("$") and i + 2 < len(segs)
                and segs[i + 1] and len(segs[i + 1]) <= 12
                and FUNC_MID.match(segs[i + 1].strip())
                and segs[i + 2].startswith("$")):
            merged.append("$" + cur[1:-1] + " " + segs[i + 1].strip() + " "
                          + segs[i + 2][1:-1] + "$")
            i += 3
            continue
        merged.append(cur)
        i += 1
    out = "".join(merged)

    # LaTeX 卷的变量名偶尔落在数学字体之外，夹在两个数学段之间：
    #     `$1 ≤$ fa$[i] < i$`
    # Typst 会把裸 `fa` 当成未定义变量 → 包成行内代码。
    KNOWN_FN = (r"log|ln|lim|max|min|gcd|mod|and|or|not|inf|sup|exp|sin|cos|"
                r"tan|sqrt|abs|det|arg|dim|ker|Pr")
    def wrap_bare(m):
        word = m.group(2)
        if re.fullmatch(KNOWN_FN, word):
            return m.group(0)
        # 并进同一个数学段、用直立文本表示变量名：
        # `$1 ≤$ fa$[i] < i$` → `$1 ≤ "fa"[i] < i$`
        # （拆成 `$1 ≤$ `fa` $[i]…` 会在 `[` 前多出一个空格）
        return '$' + m.group(1) + ' "' + word + '" ' + m.group(3) + '$' 
    out = re.sub(r"\$([^$]*)\$\s*([A-Za-z][A-Za-z0-9]{1,})\s*\$([^$]*)\$",
                 wrap_bare, out)

    parts = re.split(r"(\$[^$]*\$)", out)
    for k in range(0, len(parts), 2):
        seg = merge_broken_cjk(parts[k])
        # GESP 把每个 `<` 单独转成 `#"<"`，连续的 `<<` 会印成 `< <`。
        # 先还原，再用 #sym.lt / #sym.gt 输出：它们是一个符号，左右不留空隙，
        # `<<`、`->`、`<=` 都能保持连写；同时避免裸 `<` 被当成标签起始。
        seg = seg.replace('#"<" ', "<").replace('#"<"', "<")
        seg = seg.replace('#">" ', ">").replace('#">"', ">")
        # 行内代码里的内容原样保留（Typst 在 raw 里不解析 < >）
        pieces = re.split(r"(`[^`\n]*`)", seg)
        for m in range(0, len(pieces), 2):
            pieces[m] = (pieces[m]
                         .replace("\x00", "").replace("\x01", "").replace("\x02", "")
                         .replace("<", "#(sym.lt)")
                         .replace(">", "#(sym.gt)"))
            # 老 NOIP 卷的填空是连续下划线；Typst 会把 `__` 当强调/下标，
            # 成对数量不符就报 unclosed delimiter。用 `#blank` 画成可见横线
            # （`#underline[#h()]` 只包空白是画不出线的）。
            pieces[m] = re.sub(
                r"_{2,}",
                lambda mm: "#blank(" + f"{0.36 * len(mm.group(0)):.1f}" + "em)",
                pieces[m])
            # Typst 会把连续空格压成一个，`（      ）` 这种答题空位会缩成
            # `（ ）`。统一换成显式空白（按原空白长度换算 em，1 个全角空格
            # ≈ 1em、半角 ≈ 0.5em），留出与原卷相当的书写空间。
            def gap_expr(gap: str) -> str:
                # 原卷空位宽度差异很大（1 个到 20 个空格），但全库视觉要统一：
                # 短空位统一 2.6em，特别长的（坐标题、连续填空）按长度放大到 6em。
                em = sum(1.0 if ch == "\u3000" else 0.5 for ch in gap)
                return f"#h({min(max(em, 2.6), 6.0):g}em)"

            # 括号内只有空白（老卷甚至一个空格都没有）= 一个答题空位，
            # 宽度统一 2.6em（全库视觉一致）
            pieces[m] = re.sub(r"[（(][ \u3000]*[）)]", "（#h(2.6em)）", pieces[m])
            # 括号里夹着逗号等分隔符的空位（`（        ，        ）`）：每段空白
            # 各给一个显式留白，否则 Typst 会把它们各压成一个空格。
            def inparen(mm):
                inner = mm.group(1)
                if re.search(r".", re.sub(r"[ \u3000，、,;/／]", "", inner)):
                    return mm.group(0)  # 括号里有实义内容，不动
                return "（" + re.sub(r"[ \u3000]{2,}",
                                     lambda g: gap_expr(g.group(0)), inner) + "）"
            pieces[m] = re.sub(r"（([ \u3000，、,;/／]{2,})）", inparen, pieces[m])
            # 括号外的长空白（`至少需要        次操作`）同样是答题空位；
            # 只认「两边都是汉字」的空位，`共   20 题` 这种是排版空格，不动。
            pieces[m] = re.sub(
                r"(?<=[\u4e00-\u9fff])[ \u3000]{4,}(?=[\u4e00-\u9fff])",
                lambda g: gap_expr(g.group(0)), pieces[m])
        parts[k] = "".join(pieces)
    out = "".join(parts)
    # 落单的反引号会让 Typst 把后面整段吞成 raw。抽取时行内代码被切碎
    # （`` `string`……`\0` `` 之类）就会这样；成对时保留，否则一律写成字面量。
    if out.count("`") % 2 == 1:
        # Typst 没有 `#"`"` 这种字符串插值写法（会报 expected function,
        # found string）；反引号要用 #raw("`") 输出。
        out = out.replace('#"`" ', "` ").replace('#"`"', "`")
        # Typst 里反引号用 `\`` 转义最稳（#raw("#") 之类会和后续括号冲突）
        out = out.replace("`", "\\`")
    return out


def esc_typ_raw(s: str) -> str:
    """Typst 字符串字面量转义。"""
    return s.replace("\\", "\\\\").replace('"', '\\"')


# ---------------------------------------------------------------------------
# 主转换
# ---------------------------------------------------------------------------
def convert(data: dict, kind: str, answers: dict | None, relpath: str) -> str:
    items = data["items"]
    serial = data["serial"]

    # 卷头：前几个 title/para 项里找 course / title / date
    course, title, date = "", "", ""
    for it in items:
        if it["t"] != "title":
            continue
        t = it["text"].strip()
        if not course and ("CCF" in t or "认证" in t):
            course = t
        elif not title and ("CSP" in t or "试题" in t):
            title = t
        elif not date and ("时间" in t or "年" in t and "月" in t):
            date = re.sub(r"^时间[：:]\s*", "", t)
    def clean_header(x: str) -> str:
        """卷头文本清洗：去行内代码反引号、去多余空白、中英之间补空格。"""
        x = x.replace("`", "")
        x = re.sub(r"\s{2,}", " ", x).strip()
        return x

    # Word 卷的卷头常被切成交替的多行（`…认证第一` + `轮`、`…语言试题`），
    # 按顺序拼回去：认证机构行 + 组别行。
    heads = []
    for it in items[:12]:
        if it["t"] != "title":
            continue
        h = clean_header(it["text"])
        if "注意事项" in h or re.match(r"^[⚫•·l]\s", h):
            break
        heads.append(h)
    merged = ""
    for h in heads:
        if re.match(r"^[（(]?CSP", h) or "语言试题" in h:
            merged += " " + h if merged else h
        elif "CCF" in h or "认证" in h:
            merged = (merged + h) if merged and not merged.endswith(("轮", "第一")) else (merged + h)
        else:
            merged += h
    # 把「认证时间/竞赛时间/时间：…」从标题串里切出来单独用。
    # `竞赛` 两个字也要一起切掉：老 NOIP 卷的卷头行是「竞赛时间：2012 年…」，
    # 拼进标题后若不吞掉它，会变成「…语言试题竞」+时间。
    mtime = re.search(r"(?:竞赛|考试|认证)?时间[：:]\s*(.+)$", merged)
    if mtime:
        if not date:
            date = mtime.group(1).strip()
        merged = merged[:mtime.start()].strip()
    merged = re.sub(r"\s{2,}", " ", merged).strip()
    if merged:
        # 第一段是认证机构，后面是组别+科目
        m2 = re.match(r"^(.*?(?:第一轮|第二轮|初赛))\s*(.*)$", merged)
        if m2:
            course = m2.group(1)
            title = m2.group(2) or title
        else:
            title = merged

    course = clean_header(course) or f"{serial} CCF 非专业级别软件能力认证第一轮"
    title = clean_header(title)
    date = clean_header(date) if date else ""
    date = re.sub(r"^[^\d]*(?=\d{4}\s*年)", "", date)  # 去掉「认证时间：」前缀

    # 卷标：data["serial"] 可能只是年份（从父目录猜出来的），用输出文件名补全
    if re.fullmatch(r"\d{4}", serial):
        serial = Path(relpath).stem
    out = [HEADER.format(
        serial=serial, course=esc_typ_raw(course), title=esc_typ_raw(title),
        date=esc_typ_raw(date), source=data["source"], relpath=relpath,
        title_suffix="",
    )]

    # 卷头之后的正文
    body_items = []
    started = False
    for it in items:
        if it["t"] == "section":
            started = True
        if not started:
            continue
        body_items.append(it)

    in_question = False
    last_q = None
    skip_next = False
    for idx, it in enumerate(body_items):
        if skip_next:
            skip_next = False
            continue
        t = it["t"]
        if t == "section":
            sec = it["text"]
            m = re.match(r"^([一二三四五六七八九十]+)\s*[、.．]\s*(.*)$", sec)
            body = m.group(2).strip() if m else sec
            out.append(f"= {fix_section_spacing(typ_math(body))}\n\n")
            in_question = False
            last_q = None
        elif t == "sub":
            # 原卷的小节号 (1)(2)(3)；有时自带标题，有时没有（标题在下一段）
            nxt = body_items[idx + 1] if idx + 1 < len(body_items) else None
            sub_title = ""
            if nxt and nxt["t"] == "para" and not in_question:
                # 紧跟的短段落就是小节标题（如「寻找被移除的元素」）
                cand = nxt["text"].strip()
                if len(cand) <= 20 and not cand.endswith(("。", "，", "；", "：")):
                    sub_title = cand
                    skip_next = True
            if sub_title:
                out.append(f"== {typ_math(sub_title)}\n\n")
            else:
                out.append("#heading(level: 2)[]\n\n")
            in_question = False
            last_q = None
        elif t == "group":
            out.append(f"#grouplabel[{it['text']}]\n\n")
            in_question = False
        elif t == "q":
            num = it["num"]
            # `#include <stdio.h>` 被单独抽成题干：它其实是下一段代码的首行
            # （2004–2010 的阅读程序题都是这种形态），粘回代码块。题干正文
            # 后面粘着的 include（2010 提高组第 29 题）也照样切出来。
            nxt = body_items[idx + 1] if idx + 1 < len(body_items) else None
            stem = re.sub(r"(`|\$[^$]*\$|\s*中国计算机学会[^#]*$)", "",
                          it["text"]).strip()
            m_inc = re.search(r"((?:#\s*include\s*[<\"][^>\"]*[>\"]\s*)+)$", stem)
            inc, stem_body = "", stem
            if m_inc:
                inc = m_inc.group(1)
                stem_body = stem[:m_inc.start()].strip()
            if (inc and nxt and nxt["t"] == "code"):
                if stem_body:
                    out.append(f"{num}. {typ_math(stem_body)}\n")
                else:
                    out.append(f"{num}. 阅读下面的程序，写出运行结果。\n")
                code = normalize_code_block(inc + "\n" + nxt["text"])
                out.append("\n  ```cpp\n"
                           + "\n".join("  " + ln if ln else "" for ln in code.split("\n"))
                           + "\n  ```\n\n")
                skip_next = True
                in_question = True
                last_q = num
                continue
            out.append(f"{num}. {typ_math(it['text'])}\n")
            in_question = True
            last_q = num
        elif t == "opt":
            body = typ_math(it["text"])
            # 选项后面的单行代码其实是同一选项的第二行（2010 卷的链表删除
            # 语句 A/B/C/D 各两行），并回选项里用 #linebreak() 断行。
            nxt2 = body_items[idx + 1] if idx + 1 < len(body_items) else None
            if (nxt2 and nxt2["t"] == "code"
                    and len(nxt2["text"].split("\n")) == 1
                    and idx + 2 < len(body_items)
                    and body_items[idx + 2]["t"] in ("opt", "q", "section")):
                merged = it["text"].strip() + "\n" + nxt2["text"].strip()
                if re.fullmatch(r"[\w\s\-\>\[\]\.\(\)&;,=+*/]+", merged):
                    body = ("`" + it["text"].strip() + "` #linebreak() `"
                            + nxt2["text"].strip() + "`")
                    skip_next = True
            # 选项本身就是一段代码（2010 提高组第 19 题的链表删除语句）：
            # 用行内 raw 排，别让 `->`、`llink` 变成正文斜体。
            if (not skip_next
                    and re.fullmatch(r"[\w\s\-\>\[\]\.\(\)&;,=+*/]+",
                                     it["text"].strip())
                    and re.search(r"->|\w\[|\w\(", it["text"])):
                body = "`" + it["text"].strip() + "`"
            # 行内 raw 只适合真代码；含中文的选项（`英特尔公司收购…(McAfee)`）
            # 是被误包成代码的，去掉反引号。
            if body.startswith("`") and re.search(r"[\u4e00-\u9fff]", body):
                body = typ_math(it["text"].replace("`", ""))
            out.append(f"  + {body}\n")
        elif t == "para":
            line = typ_math(it["text"])
            # `1. …` 开头的段落是伪代码/算法步骤，不是题目：前面垫一个零宽
            # 指令，避免被 Typst 当成 enum 编号（在题目里会渲染成 A. B. C.）。
            if re.match(r"^\d{1,2}\s*[.．、]\s*\S", line):
                line = "#h(0pt) " + line
            if in_question:
                out.append(f"  {line}\n")
            else:
                out.append(f"{line}\n\n")
        elif t == "figure":
            line = f'#figure-missing(note: "{serial} 原图见官方 PDF")'
            if in_question:
                out.append(f"  {line}\n")
            else:
                out.append(f"{line}\n\n")
        elif t == "code":
            code = normalize_code_block(it["text"])
            if in_question:
                indented = "\n".join("  " + ln if ln else "" for ln in code.split("\n"))
                out.append(f"\n  ```cpp\n{indented}\n  ```\n\n")
            else:
                out.append(f"\n```cpp\n{code}\n```\n\n")

    body = "".join(out)

    if kind == "answers":
        body += "\n#pagebreak()\n\n= 答案与解析\n\n"
        if not answers:
            body += "_本卷答案解析待补。_\n"
        else:
            for num in sorted(answers, key=lambda x: int(x)):
                a = answers[num]
                # 老 NOIP 卷答案里常有 C++ 代码（`c>='0'&&c<='9'`），
                # 直接写进正文会被 Typst 当作标签/强调，先做符号级转义。
                ans_txt = str(a.get("answer", "?"))
                ans_txt = (ans_txt.replace("\\", "\\\\")
                           .replace("#", "\\#")
                           .replace("<", "#(sym.lt)")
                           .replace(">", "#(sym.gt)")
                           .replace("_", "\\_")
                           .replace("*", "\\*")
                           .replace("$", "\\$"))
                body += f"=== 第 {num} 题　答案：{ans_txt}\n\n"
                expl = (a.get("explain") or "").strip()
                if expl:
                    body += typ_math(expl) + "\n\n"
    return body


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("json")
    ap.add_argument("--out", required=True)
    ap.add_argument("--kind", default="paper", choices=("paper", "answers"))
    ap.add_argument("--answers", default="")
    args = ap.parse_args()

    data = json.loads(Path(args.json).read_text(encoding="utf-8"))
    answers = None
    if args.answers:
        answers = json.loads(Path(args.answers).read_text(encoding="utf-8"))

    out_path = Path(args.out)
    try:
        relpath = str(out_path.resolve().relative_to(ROOT.resolve()))
    except ValueError:
        relpath = out_path.name

    text = convert(data, args.kind, answers, relpath)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(text, encoding="utf-8")
    print(f"写出 {out_path}  {len(text)} 字符", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
