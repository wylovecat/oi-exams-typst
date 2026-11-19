#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""gesp_typ.py — 把 gesp_extract.py 产出的 JSON 变成 Typst 卷子。

  * 题卷：GESP/<YYYY-MM>/<YYYY-MM>-L<n>.typ
  * 答案：同目录 <YYYY-MM>-L<n>-答案.typ（单选题答案表；判断题官方卷未印答案）

坐标里的公式在 JSON 里已经是 `$latex$`（MinerU 回填），这里负责：
  1. LaTeX → Typst math 的语法换算；
  2. 正文转义（# $ < > _ * 等）；
  3. 行内反引号代码转 raw；
  4. 版式拼装。
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
JS = ROOT / "_build" / "gesp_json"
OUT = ROOT / "GESP"

CN = "一二三四五六七八"

# LaTeX 命令 → Typst math。值后面统一补空格，Typst 数学里空格会被吃掉，安全。
MATH_CMD = {
    "leq": "<=", "le": "<=", "geq": ">=", "ge": ">=", "neq": "!=", "ne": "!=",
    "approx": "approx", "equiv": "equiv", "sim": "tilde.op", "propto": "prop",
    "times": "times", "cdot": "dot", "div": "/", "pm": "plus.minus", "mp": "minus.plus",
    "ldots": "dots.h", "cdots": "dots.h", "dots": "dots.h", "vdots": "dots.v",
    "infty": "infty", "partial": "diff", "nabla": "nabla",
    "pi": "pi", "theta": "theta", "alpha": "alpha", "beta": "beta", "gamma": "gamma",
    "delta": "delta", "epsilon": "epsilon", "lambda": "lambda", "mu": "mu", "nu": "nu",
    "rho": "rho", "sigma": "sigma", "tau": "tau", "phi": "phi", "omega": "omega",
    "Delta": "Delta", "Omega": "Omega", "Sigma": "Sigma", "Phi": "Phi",
    "lfloor": "floor.l", "rfloor": "floor.r", "lceil": "ceil.l", "rceil": "ceil.r",
    "langle": "angle.l", "rangle": "angle.r",
    "in": "in", "notin": "in.not", "subset": "subset", "subseteq": "subset.eq",
    "supset": "supset", "cup": "union", "cap": "sect", "emptyset": "emptyset",
    "varnothing": "emptyset", "forall": "forall", "exists": "exists",
    "rightarrow": "arrow.r", "to": "arrow.r", "leftarrow": "arrow.l",
    "Rightarrow": "arrow.r.double", "Leftarrow": "arrow.l.double",
    "Leftrightarrow": "arrow.l.r.double", "mapsto": "arrow.r.bar",
    "sum": "sum", "prod": "prod", "int": "integral", "iint": "integral.double",
    "log": "log", "ln": "ln", "lg": "lg", "exp": "exp",
    "sin": "sin", "cos": "cos", "tan": "tan", "cot": "cot", "sec": "sec", "csc": "csc",
    "arcsin": "arcsin", "arccos": "arccos", "arctan": "arctan",
    "max": "max", "min": "min", "lim": "lim", "gcd": "gcd", "lcm": "lcm",
    "bmod": "mod", "mod": "mod", "quad": "quad", "qquad": "wide",
    "circ": "circle.stroked.small", "ast": "ast.op", "star": "star",
    "angle": "angle", "perp": "perp", "parallel": "parallel",
}


def _braced(s: str, i: int) -> tuple[str, int]:
    """从 s[i]=='{' 开始取配平内容，返回 (内容, 右括号后位置)。"""
    assert s[i] == "{"
    depth = 0
    for j in range(i, len(s)):
        if s[j] == "{":
            depth += 1
        elif s[j] == "}":
            depth -= 1
            if depth == 0:
                return s[i + 1:j], j + 1
    return s[i + 1:], len(s)


def latex_to_typst(src: str) -> str:
    s = src.strip()
    # 只删独立的 \left / \right，别把 \rightarrow 削成 arrow
    s = re.sub(r"\\left(?![A-Za-z])|\\right(?![A-Za-z])", "", s)
    s = s.replace("\\!", "").replace("\\,", " ").replace("\\;", " ")
    s = s.replace("#", " ")      # Typst 数学里 # 是插值符
    s = s.replace("\\ ", " ")

    # \frac \sqrt \mathrm \text \mathbb
    out = []
    i = 0
    while i < len(s):
        if s.startswith("\\frac", i):
            j = i + 5
            while j < len(s) and s[j] == " ":
                j += 1
            if j < len(s) and s[j] == "{":
                a, j = _braced(s, j)
                while j < len(s) and s[j] == " ":
                    j += 1
                if j < len(s) and s[j] == "{":
                    b, j = _braced(s, j)
                    out.append(f"frac({latex_to_typst(a)}, {latex_to_typst(b)})")
                    i = j
                    continue
        if s.startswith("\\sqrt", i):
            j = i + 5
            while j < len(s) and s[j] == " ":
                j += 1
            if j < len(s) and s[j] == "{":
                a, j = _braced(s, j)
                out.append(f"sqrt({latex_to_typst(a)})")
                i = j
                continue
        if s.startswith("\\mathrm", i) or s.startswith("\\text", i) or s.startswith("\\mathbb", i):
            m = re.match(r"\\(mathrm|text|mathbb)\s*\{", s[i:])
            if m:
                a, j = _braced(s, i + m.end() - 1)
                if m.group(1) == "mathbb":
                    out.append("bb(" + latex_to_typst(a) + ")")
                else:
                    out.append('upright("' + a + '")')
                i = j
                continue
        if s[i] == "\\":
            m = re.match(r"\\([A-Za-z]+)", s[i:])
            if m:
                cmd = m.group(1)
                i += len(m.group(0))
                if cmd in MATH_CMD:
                    out.append(MATH_CMD[cmd] + " ")
                continue
            # \{ \} \% \& \# \_ 等
            if i + 1 < len(s):
                ch = s[i + 1]
                if ch in "{}%&#_$":
                    out.append(ch + " ")
                    i += 2
                    continue
            i += 1
            continue
        out.append(s[i])
        i += 1
    s = "".join(out)

    # 上下标：x^{2} → x^2；a_{ij} → a_(i j)
    s = re.sub(r"([A-Za-z0-9\)\]])\^\{([^{}]*)\}",
               lambda m: m.group(1) + "^" + ("(" + m.group(2) + ")" if len(m.group(2)) > 1 else m.group(2)), s)
    s = re.sub(r"([A-Za-z0-9\)\]])_\{([^{}]*)\}",
               lambda m: m.group(1) + "_" + ("(" + m.group(2) + ")" if len(m.group(2)) > 1 else m.group(2)), s)
    # 剩下的花括号：Typst 里是分组，保留内容
    s = s.replace("{", "(").replace("}", ")")
    # 数字/字母与命令粘贴时补空格（norm_anchor 把空格全删了）
    s = re.sub(r"(?<=[A-Za-z0-9])(?=(?:<=|>=|!=|times|dot|dots\.h|floor|ceil|in\b|log|ln|max|min|sum|prod))",
               " ", s)
    s = re.sub(r"[ \t]{2,}", " ", s)
    s = s.strip()
    while s[:1] in ("_", "^"):        # 没有底数的上下标，Typst 会报错
        s = s[1:]
    return s


KNOWN_WORDS = {
    "log", "ln", "lg", "sin", "cos", "tan", "cot", "sec", "csc", "exp",
    "arcsin", "arccos", "arctan", "max", "min", "gcd", "lcm", "lim",
    "sqrt", "frac", "upright", "bb", "sum", "prod", "integral", "diff",
    "nabla", "infinity", "infty", "emptyset", "forall", "exists", "approx",
    "equiv", "prop", "tilde", "circle", "ast", "star", "angle", "perp",
    "parallel", "plus", "minus", "times", "div", "mod", "quad", "wide",
    "floor", "ceil", "arrow", "subset", "union", "sect", "dots", "dot",
    "in", "not", "abs", "op", "bar", "double", "small", "stroked", "eq",
}

UNI = {
    "leq": "≤", "le": "≤", "geq": "≥", "ge": "≥", "neq": "≠", "ne": "≠",
    "times": "×", "cdot": "·", "div": "÷", "pm": "±", "mp": "∓",
    "rightarrow": "→", "to": "→", "leftarrow": "←", "Rightarrow": "⇒",
    "ldots": "…", "cdots": "…", "infty": "∞", "pi": "π", "theta": "θ",
    "alpha": "α", "beta": "β", "gamma": "γ", "delta": "δ", "lambda": "λ",
    "mu": "μ", "rho": "ρ", "sigma": "σ", "omega": "ω", "in": "∈",
    "notin": "∉", "cup": "∪", "cap": "∩", "emptyset": "∅", "forall": "∀",
    "exists": "∃", "lfloor": "⌊", "rfloor": "⌋", "lceil": "⌈", "rceil": "⌉",
    "quad": " ", "qquad": "  ", "sin": "sin", "cos": "cos", "log": "log",
}


def latex_to_text(src: str) -> str:
    s = src
    s = re.sub(r"\\mathrm\s*\{([^{}]*)\}", r"\1", s)
    s = re.sub(r"\\text\s*\{([^{}]*)\}", r"\1", s)
    s = re.sub(r"\\frac\s*\{([^{}]*)\}\s*\{([^{}]*)\}", r"\1/\2", s)
    s = re.sub(r"\\sqrt\s*\{([^{}]*)\}", r"√(\1)", s)
    for k in sorted(UNI, key=len, reverse=True):
        s = re.sub(r"\\" + k + r"(?![A-Za-z])", UNI[k], s)
    s = s.replace("\\,", " ").replace("\\;", " ").replace("\\!", "")
    s = s.replace("\\{", "{").replace("\\}", "}").replace("\\%", "%")
    s = s.replace("{", "").replace("}", "")
    s = re.sub(r"\\([A-Za-z]+)", r"\1", s)
    s = re.sub(r"\s+", " ", s).strip()
    return s


def math_safe(t: str) -> bool:
    if re.search(r"[\u3400-\u9fff]", t):
        return False
    for w in re.findall(r"[A-Za-z][A-Za-z0-9]*", t):
        if len(w) >= 2 and w not in KNOWN_WORDS:
            return False
    return True


def render_math(src: str) -> str:
    t = latex_to_typst(src)
    if math_safe(t):
        return "$" + t + "$"
    return esc_plain(latex_to_text(src))


def split_math(s: str):
    """把 $...$ 与普通文字分开。"""
    return re.split(r"(\$[^$]*\$)", s)


def esc_plain(s: str) -> str:
    out = []
    for i, seg in enumerate(s.split("`")):
        if i % 2 == 1:
            out.append("`" + seg + "`")
            continue
        seg = seg.replace("\x04", "\ue000")
        seg = seg.replace("\\", "\\\\")
        for ch in "#$<>@*_":
            seg = seg.replace(ch, "\\" + ch)
        seg = seg.replace("~", "～")
        seg = seg.replace("\ue000", "#(math-missing)")
        out.append(seg)
    return "".join(out)


def conv(s: str) -> str:
    res = []
    for part in split_math(s):
        if len(part) > 2 and part.startswith("$") and part.endswith("$"):
            res.append(render_math(part[1:-1]))
        else:
            res.append(esc_plain(part))
    text = "".join(res)
    # 答题空位
    text = re.sub(r"[（(]\s*[）)]", "（#slot）", text)
    text = re.sub(r"[ \t]+", " ", text)
    return text.strip()


def raw_block(code: str, lang: str = "cpp") -> list[str]:
    fence = "```"
    while fence in code:
        fence += "`"
    return [fence + lang, *code.split("\n"), fence]


def build_paper(d: dict) -> str:
    lv = d["level"]
    lines = [
        "// ===========================================================================",
        f"// GESP {d['month']} C++ {CN[lv-1]}级",
        "// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。",
        f"// 编译：typst compile --root . GESP/{d['month']}/{d['month']}-L{lv}.typ",
        "// ===========================================================================",
        '#import "/_typst/gesp.typ": *',
        "",
        "#show: doc => gesp(",
        f"  level: {lv},",
        f'  month: "{d["date"]}",',
        "  doc,",
        ")",
        "",
    ]

    ch = d["choice"]["questions"]
    if ch:
        lines += [f"= 单选题（每题 2 分，共 {2*len(ch)} 分）", ""]
        for i, q in enumerate(ch):
            lines.append(f"{i+1}. {conv(q['stem'])}")
            if q.get("code"):
                lines.append("")
                lines += ["  " + x for x in raw_block("\n".join(q["code"]))]
            for o in q["options"]:
                if o.get("code"):
                    rb = raw_block("\n".join(o["code"]))
                    lines.append("  + " + rb[0])
                    lines += ["    " + x for x in rb[1:-1]]
                    lines.append("    " + rb[-1])
                else:
                    lines.append("  + " + conv(o["text"]))
            lines.append("")

    jd = d["judge"]
    if jd:
        lines += [f"= 判断题（每题 2 分，共 {2*len(jd)} 分）", ""]
        for i, q in enumerate(jd):
            lines.append(f"{i+1}. {conv(q['stem'])}")
            if q.get("code"):
                lines.append("")
                lines += ["  " + x for x in raw_block("\n".join(q["code"]))]
            lines.append("")

    pg = d["programs"]
    if pg:
        lines += [f"= 编程题（每题 25 分，共 {25*len(pg)} 分）", ""]
        for i, p in enumerate(pg):
            title = p["title"] or f"编程题 {i+1}"
            lines += [f"== 编程题 {i+1}：{conv(title)}", ""]
            lim = p.get("limits") or {}
            if lim:
                parts = []
                if "时间限制" in lim:
                    parts.append(f"时间限制：{lim['时间限制']}")
                if "内存限制" in lim:
                    parts.append(f"内存限制：{lim['内存限制']}")
                lines += ["#limits(" + ", ".join(
                    f'{k}: "{v}"' for k, v in (("time", lim.get("时间限制")),
                                               ("memory", lim.get("内存限制"))) if v) + ")", ""]
            if p["desc"]:
                lines += ["=== 题目描述", "", conv(p["desc"]), ""]
            if p["input"]:
                lines += ["=== 输入格式", "", conv(p["input"]), ""]
            if p["output"]:
                lines += ["=== 输出格式", "", conv(p["output"]), ""]
            if p["samples"]:
                lines += ["=== 样例", ""]
                for si, sm in enumerate(p["samples"]):
                    lines += [f"#text(size: 12pt, weight: \"bold\")[输入样例 {si+1}]", ""]
                    lines += raw_block(sm["in"], "text")
                    lines.append("")
                    lines += [f"#text(size: 12pt, weight: \"bold\")[输出样例 {si+1}]", ""]
                    lines += raw_block(sm["out"], "text")
                    lines.append("")
            if p["range"]:
                lines += ["=== 数据范围", "", conv(p["range"]), ""]
            if p["explain"]:
                lines += ["=== 提示", "", conv(p["explain"]), ""]
            if p["code"]:
                lines += ["=== 参考程序", ""]
                lines += raw_block(p["code"])
                lines.append("")

    lines += ["#source-note[来源：CCF GESP 官网「真题及解析」栏目。"
              "公式由版面识别回填，个别处若有出入以官方 PDF 为准。]", ""]
    return "\n".join(lines)


def build_answer(d: dict) -> str:
    lv = d["level"]
    ans = d["choice"]["answers"]
    jans = d.get("judge_answers") or []
    lines = [
        f"// GESP {d['month']} C++ {CN[lv-1]}级 参考答案",
        '#import "/_typst/gesp.typ": *',
        "",
        "#show: doc => gesp(",
        f"  level: {lv},",
        f'  month: "{d["date"]}",',
        "  doc,",
        ")",
        "",
        "= 参考答案",
        "",
        "== 单选题（每题 2 分）",
        "",
    ]
    if ans:
        cols = len(ans)
        lines += [
            "#table(",
            f"  columns: {cols},",
            "  align: center,",
            "  stroke: 0.5pt,",
            "  " + ", ".join(f"[*{i+1}*]" for i in range(cols)) + ",",
            "  " + ", ".join(f"[{a}]" for a in ans) + ",",
            ")",
            "",
        ]
    else:
        lines += ["（官方 PDF 未印答案）", ""]

    lines += ["== 判断题（每题 2 分）", ""]
    if jans:
        cols = len(jans)
        lines += [
            "#table(",
            f"  columns: {cols},",
            "  align: center,",
            "  stroke: 0.5pt,",
            "  " + ", ".join(f"[*{i+1}*]" for i in range(cols)) + ",",
            "  " + ", ".join(f"[{a}]" for a in jans) + ",",
            ")",
            "",
        ]
    else:
        lines += ["（该卷 PDF 的判断题答案栏为空白）", ""]

    lines += [
        "== 编程题",
        "",
        "官方卷附「参考程序」，见题卷各题末尾。",
        "",
    ]
    return "\n".join(lines)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--only", help="只处理某个月份，如 2025-03")
    ap.add_argument("--level", type=int)
    args = ap.parse_args()

    files = sorted(JS.glob("*.json"))
    if args.only:
        files = [f for f in files if f.name.startswith(args.only)]
    if args.level:
        files = [f for f in files if f.stem.endswith(f"-L{args.level}")]
    if not files:
        print("没有 JSON", file=sys.stderr)
        return 2

    for f in files:
        d = json.loads(f.read_text())
        lv = d["level"]
        outdir = OUT / d["month"]
        outdir.mkdir(parents=True, exist_ok=True)
        stem = f"{d['month']}-L{lv}"
        (outdir / f"{stem}.typ").write_text(build_paper(d), encoding="utf-8")
        (outdir / f"{stem}-答案.typ").write_text(build_answer(d), encoding="utf-8")
        print(f"{stem}.typ  ← 选择题{len(d['choice']['questions'])} "
              f"判断题{len(d['judge'])} 编程题{len(d['programs'])}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
