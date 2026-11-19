#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""patch_manual.py — 对 md2typ_csp.py 生成的试卷 .typ 施加人工补丁（可重放）。

设计要点（沿用 GESP 教材 `apply_manual.py` 的做法）：
  * 每条补丁都断言「原串存在」或「已打过」，找不到就报错，绝不静默跳过；
  * 幂等：已应用过的补丁再跑一次结果不变；
  * 补丁集中在 `PATCHES` 表里，一眼能看出手工改了什么、为什么改。

用法：
  cd 0x0c00_真题整理
  python3 _build/patch_manual.py            # 全部
  python3 _build/patch_manual.py 2025S1     # 只打一份
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ROUND1 = ROOT / "CSP-J_S" / "Round1"


def sub_once(src: str, old: str, new: str, label: str) -> tuple[str, bool]:
    """替换一次；若 new 已在文中则视为已打过，返回 (新文本, 是否改动)。"""
    if new in src and old not in src:
        return src, False
    if old not in src:
        raise AssertionError(f"[{label}] 找不到待替换文本：{old[:60]!r}")
    return src.replace(old, new, 1), True


def replace_numbering(src: str, start: int, count: int, offset: int, label: str) -> tuple[str, bool]:
    """把连续 `N. ` 形式的题号整体加 offset（用于修「同卷重号」）。"""
    changed = False
    for k in range(start + count - 1, start - 1, -1):
        old = f"\n{k}. "
        new = f"\n{k + offset}. "
        if old in src:
            src = src.replace(old, new)
            changed = True
    if not changed:
        raise AssertionError(f"[{label}] 未找到 {start}..{start + count - 1} 号题")
    return src, changed


def add_fig_import(src: str, name: str) -> tuple[str, bool]:
    """在卷首 import 区补一行 `#import "/_typst/figs.typ": …`（幂等）。"""
    if f"figs.typ" in src and name in src.split("#import \"/_typst/figs.typ\":")[-1][:80]:
        return src, False
    if 'from "/_typst/figs.typ"' in src:
        # 已经 import 过别的图，把新名字并进同一行
        pat = re.compile(r'#import "/_typst/figs\.typ": ([^\n]+)')
        m = pat.search(src)
        names = [n.strip() for n in m.group(1).split(",")]
        if name in names:
            return src, False
        names.append(name)
        return src[:m.start()] + '#import "/_typst/figs.typ": ' + ", ".join(names) + \
            src[m.end():], True
    anchor = '#import "/_typst/exam.typ": *'
    if anchor not in src:
        raise AssertionError("[figs] 找不到 exam.typ 的 import 行")
    return src.replace(anchor, anchor + f'\n#import "/_typst/figs.typ": {name}', 1), True


def insert_fig_after_question(src: str, num: int, call: str) -> tuple[str, bool]:
    """在指定题号那一行之后插入插图调用（题号行是单行题干）。

    幂等：该调用已出现在文中就跳过。
    """
    if call in src:
        return src, False
    lines = src.split("\n")
    pat = re.compile(rf"^{num}\. ")
    for i, ln in enumerate(lines):
        if pat.match(ln):
            # 缩进两格：紧跟其后的 `+ 选项` 仍属于同一道题；
            # 顶格插入会把枚举打断，选项变成散落的列表项。
            lines.insert(i + 1, "\n  " + call)
            return "\n".join(lines), True
    raise AssertionError(f"[figs] 找不到第 {num} 题")


def add_figure(src: str, num: int, name: str) -> tuple[str, list[str]]:
    """给某题加插图：补 import + 插入调用。"""
    notes = []
    src, c1 = add_fig_import(src, f"fig-{name}")
    if c1:
        notes.append(f"import {name}")
    src, c2 = insert_fig_after_question(src, num, f"#fig-{name}()")
    if c2:
        notes.append(f"第 {num} 题插入插图")
    return src, notes


# ---------------------------------------------------------------------------
# 逐卷补丁表： (卷标, 说明, 函数)
# ---------------------------------------------------------------------------
def p_2025S1(src: str) -> tuple[str, list[str]]:
    """2025S1：原卷「单选题 33」与「完善程序 33」重号，把后一组 33–42 顺延为 34–43。"""
    notes = []
    marker = "# ===== 33-43 重号修正 ====="
    if marker in src:
        return src, notes
    # 完善程序里的 33–42 依次改成 34–43（从大到小替换，避免连锁）
    body_start = src.find("= 完善程序")
    if body_start < 0:
        raise AssertionError("[2025S1] 找不到「完善程序」章节")
    head, tail = src[:body_start], src[body_start:]
    tail2, changed = replace_numbering(tail, 33, 10, 1, "2025S1 完善程序重号")
    if changed:
        notes.append("完善程序 33–42 → 34–43（原卷与单选段重号）")
    return head + tail2 + f"\n// {marker}\n", notes


def p_2025S1_date(src: str) -> tuple[str, list[str]]:
    """2025S1：官方 PDF 的卷面时间误写为 2024 年，按实际考试日更正。"""
    old = 'date: "2024 年 9 月 20 日 14:30 ~ 16:30",'
    new = 'date: "2025 年 9 月 20 日 14:30 ~ 16:30",'
    if new in src:
        return src, []
    src, changed = sub_once(src, old, new, "2025S1 日期")
    return src, (["卷面日期 2024 → 2025（原卷 PDF 笔误）"] if changed else [])


def p_2021S1_q12_opts(src: str) -> tuple[str, list[str]]:
    """2021S1 第 12 题：Word 卷把上标错映射成 `"`，`O(2ⁿ)` 抽成了 `O(2)`。

    题干后面隔着一段伪代码，四个选项在代码块之后；因此按行定位：从
    `12. ` 那一行往下找到第一处连续四行 `  + `，整体替换（不跨题、不用
    DOTALL，避免把后面整卷吞掉）。
    """
    want = ["  + $O(n)$", "  + $O(n!)$", "  + $O(2^n)$", "  + $O(n log n)$"]
    lines = src.split("\n")
    start = None
    for i, ln in enumerate(lines):
        if ln.startswith("12. "):
            start = i
            break
    if start is None:
        raise AssertionError("[2021S1] 找不到第 12 题")
    j = start + 1
    while j < len(lines) and not lines[j].startswith("  + "):
        if re.match(r"^\d+\. ", lines[j]):
            raise AssertionError("[2021S1] 第 12 题后没有四个选项")
        j += 1
    block = lines[j:j + 4]
    if block == want:
        return src, []
    if len(block) != 4 or not all(b.startswith("  + ") for b in block):
        raise AssertionError("[2021S1] 第 12 题的选项块不完整")
    lines[j:j + 4] = want
    return "\n".join(lines), [
        "第 12 题选项按原卷改为 O(n)/O(n!)/O(2ⁿ)/O(n log n)"]


def p_2021S1_fig(src: str):
    """2021S1 第 15 题：A→J 带权有向图（原卷为矢量图，PDF 抽不出位图）。"""
    return add_figure(src, 15, "csp-2021s1-q15")


def p_2023S1_fig(src: str):
    """2023S1 第 13 题：6 顶点有向图。"""
    return add_figure(src, 13, "csp-2023s1-q13")


def p_2024S1_fig(src: str):
    """2024S1 第 15 题：7 顶点有向图。"""
    return add_figure(src, 15, "csp-2024s1-q15")


def p_2026S1_math(src: str) -> tuple[str, list[str]]:
    """2026S1：原卷的求和号在版面上跨行排（∑ⁿ 一行、ᵢ₌₁ 一行），
    抽取后分开落在两段里。这里改成内联的单行公式。"""
    notes = []
    old1 = ("$∑_n$\n\n"
            "给定每名学生的目标分数$x_i$。现在需要构造一份标准答案，使$i_(=1) |r_i − x_i|$ 尽可能大。")
    new1 = "给定每名学生的目标分数$x_i$。现在需要构造一份标准答案，使$sum_(i=1)^n |r_i − x_i|$ 尽可能大。"
    if new1 not in src:
        src, c = sub_once(src, old1, new1, "2026S1 求和式 1")
        if c:
            notes.append("求和式改为单行")

    old2 = ("$∑_n$\n\n"
            "以下程序从枚举符号的角度处理$i_(=1) |r_i − x_i|$，把它写成更易优化的形式。")
    new2 = "以下程序从枚举符号的角度处理$sum_(i=1)^n |r_i − x_i|$，把它写成更易优化的形式。"
    if new2 not in src:
        src, c = sub_once(src, old2, new2, "2026S1 求和式 2")
        if c:
            notes.append("第二处求和式改为单行")
    return src, notes


def p_2026S1_fa(src: str) -> tuple[str, list[str]]:
    """2026S1：`fa[2] ∼ fa[5] = {1,2,3,4}` 的变量落在数学字体之外，
    抽取后数学段位置错乱。统一写成一段数学。"""
    # 答题空位在转换器里已统一成 `（#h(2.6em)）`，新旧两版都要能匹配
    tail = "（#h(2.6em)）"
    if tail not in src:
        tail = "（）"
    new = f'当$n = 5$，$"fa"[2] ~ "fa"[5] = {{1, 2, 3, 4}}$ 时，程序输出 4。{tail}'
    if new in src or new.replace("~", "～") in src:
        return src, []
    old = f'当$n = 5$，fa$[2] ∼ "fa" [5] = (1,2, 3,4)$ 时，程序输出 4。{tail}'
    src2, c = sub_once(src, old, new, "2026S1 第28题 fa 表达式")
    return src2, (["第 28 题 fa 表达式改为单段数学"] if c else [])


def p_2026S1_plus_minus(src: str) -> tuple[str, list[str]]:
    """2026S1 完善程序 (1)：`n⁺` / `n⁻`（经过的正/负边数）。

    原卷把 +、− 排成 10pt 上标，但它们与 `n` 同在一行、字号差不足以被判成
    上下标，抽取后成了 `n+`、`n−`，还把单独的 `+` / `−` 留在正文里。
    """
    notes = []
    reps = [
        ("记$n+$、$n−$ 分别为经过的+ 边数\n\n和经过的- 边数，则该路线的权值为$|n+ − n−|$。",
         "记$n^+$、$n^-$ 分别为经过的 + 边数\n\n和经过的 - 边数，则该路线的权值为$|n^+ − n^-|$。"),
    ]
    for old, new in reps:
        if new in src:
            continue
        src, c = sub_once(src, old, new, "2026S1 n+/n-")
        if c:
            notes.append("n⁺/n⁻ 改为上标")
    return src, notes


def p_2020J1_fig(src: str) -> tuple[str, list[str]]:
    """2020J1 第 11 题：五个栈状态的示意图（原卷为矢量图）。"""
    return add_figure(src, 11, "csp-2020j1-q11")


def p_2019S1_header(src: str) -> tuple[str, list[str]]:
    """2019S1 源稿是「题目解析」md，没有正式卷头，补齐为官方卷面信息。"""
    notes = []
    reps = [
        ('course: "2019S1 CCF 非专业级别软件能力认证第一轮",',
         'course: "2019 CCF 非专业级别软件能力认证第一轮",'),
        ('title: "CSP-S2019题目解析",',
         'title: "（CSP-S1）提高级 C++ 语言试题",'),
        ('date: "",', 'date: "2019 年 10 月 19 日 14:30 ~ 16:30",'),
    ]
    for old, new in reps:
        if new in src:
            continue
        src, c = sub_once(src, old, new, "2019S1 卷头")
        notes.append("补卷头")
    return src, notes


def p_2019J1_header(src: str) -> tuple[str, list[str]]:
    """2019J1 源稿是 OCR 整理稿，卷头日期按原卷补上。"""
    if 'date: "2019 年 10 月 19 日 14:30 ~ 16:30",' in src:
        return src, []
    src, changed = sub_once(src, 'date: "",',
                            'date: "2019 年 10 月 19 日 14:30 ~ 16:30",', "2019J1 日期")
    return src, (["补卷面时间"] if changed else [])


def p_2019J1_fig(src: str):
    """2019J1 第 8 题：顺序存储的二叉树示意图（扫描件，原为位图）。"""
    return add_figure(src, 8, "csp-2019j1-q8")


def p_2020S1_header(src: str) -> tuple[str, list[str]]:
    """2020S1 源稿是 OCR 整理稿，卷面时间按原卷补上。"""
    if 'date: "2020 年 10 月 11 日 09:30 ~ 11:30",' in src:
        return src, []
    src, changed = sub_once(src, 'date: "",',
                            'date: "2020 年 10 月 11 日 09:30 ~ 11:30",', "2020S1 日期")
    return src, (["补卷面时间"] if changed else [])


def replace_figure_placeholder(src: str, serial: str, call: str):
    """把某卷的 figure-missing 占位换成 cetz 图调用（占位独占一行，缩进两格）。"""
    if call in src:
        return src, []
    pat = re.compile(rf'^(  )#figure-missing\(note: "{serial} 原图见官方 PDF"\)$', re.M)
    src2, n = pat.subn(lambda m: m.group(1) + call, src)
    if n == 0:
        raise AssertionError(f"[figs] 找不到 {serial} 的配图占位")
    return src2, [f"配图占位 → {call}"]


def p_2019S1_fig(src: str):
    """2019S1 第 15 题：数字三角形示意图（原卷扫描图，抽取时留下占位）。"""
    src, c = add_fig_import(src, "fig-csp-2019s1-q15")
    notes = ["import csp-2019s1-q15"] if c else []
    src, n = replace_figure_placeholder(src, "2019S1", "#fig-csp-2019s1-q15()")
    return src, notes + n


def p_2020J1_typos(src: str) -> tuple[str, list[str]]:
    """2020J1 合订本 PDF 的文字层把 `%` 丢了（`scanf("%d")` → `scanf("d")`），
    另外 `10^9` 被压成 `109`。按题面原样补回。"""
    notes = []
    reps = [
        ('scanf("d", &n);', 'scanf("%d", &n);'),
        ('输入保证 2≤n≤109。', '输入保证 $2 ≤ n ≤ 10^9$。'),
    ]
    for old, new in reps:
        if new in src:
            continue
        src, c = sub_once(src, old, new, "2020J1 文字层丢字符")
        if c:
            notes.append(f"{old} → {new}")
    return src, notes


SLOT = re.compile(r"[（(]([ \u3000]+)[）)]")


def p_widen_slots(src: str) -> tuple[str, list[str]]:
    """补丁里手写的 `（    ）` 也要换成显式空白——Typst 会压缩空格。
    代码块与行内代码不动。"""
    lines = src.split("\n")
    incode = False
    n = 0
    for i, ln in enumerate(lines):
        if ln.strip().startswith("```"):
            incode = not incode
            continue
        if incode or ("（" not in ln and "(" not in ln):
            continue
        parts = re.split(r"(`[^`\n]*`)", ln)
        for k in range(0, len(parts), 2):
            new, c = SLOT.subn("（#h(2.6em)）", parts[k])
            if c:
                parts[k] = new
                n += c
        lines[i] = "".join(parts)
    return "\n".join(lines), ([f"{n} 处答题空位加宽"] if n else [])


def p_tilde(src: str) -> tuple[str, list[str]]:
    """Typst 里 `~` 是不换行空格，正文里的区间号（`0~10`、`T~Z`）会变成
    两个数之间的空白。改成全角 `～`；位运算的 `~` 用 `\\~` 保留 ASCII 造型。
    代码块、字符串、行内代码不动。"""
    lines = src.split("\n")
    incode = False
    n = 0
    for i, ln in enumerate(lines):
        if ln.strip().startswith("```"):
            incode = not incode
            continue
        if incode or ("~" not in ln and "～" not in ln):
            continue
        parts = re.split(r'("[^"\n]*"|`[^`\n]*`)', ln)
        for k in range(0, len(parts), 2):
            seg = parts[k]
            if "~" not in seg and "～" not in seg:
                continue
            old = seg
            # 已经转义好的 `\~` 先保护起来，避免下一轮又被展成全角
            seg = seg.replace("\\~", "\x01")
            # 按位取反符号 `~` 要保留 ASCII 造型（已误写成全角/带转义的先归位）
            seg = seg.replace("位非（\\～）", "位非（\x00）")
            seg = seg.replace("位非（～）", "位非（\x00）")
            seg = seg.replace("位非（~）", "位非（\x00）")
            seg = seg.replace("~", "～")
            seg = seg.replace("位非（\x00）", "位非（\\~）")
            seg = seg.replace("\x01", "\\~")
            if seg != old:
                parts[k] = seg
                n += 1
        lines[i] = "".join(parts)
    return "\n".join(lines), ([f"{n} 行 ~ 改成可见符号"] if n else [])


PATCHES: dict[str, list] = {
    "2021S1": [p_2021S1_fig, p_2021S1_q12_opts],
    "2023S1": [p_2023S1_fig],
    "2024S1": [p_2024S1_fig],
    "2025S1": [p_2025S1, p_2025S1_date],
    "2019S1": [p_2019S1_header, p_2019S1_fig],
    "2019J1": [p_2019J1_header, p_2019J1_fig],
    "2020J1": [p_2020J1_fig, p_2020J1_typos],
    "2020S1": [p_2020S1_header],
    "2026S1": [p_2026S1_math, p_2026S1_fa, p_2026S1_plus_minus],
}


def main() -> int:
    only = sys.argv[1] if len(sys.argv) > 1 else ""
    targets = []
    for typ in sorted(ROUND1.glob("*/*.typ")):
        # 答案卷同样重排整份题目，插图/改写补丁也要一起打
        serial = typ.stem.removesuffix("-答案")
        if only and serial != only:
            continue
        targets.append((serial, typ))

    if not targets:
        print("没有找到目标 .typ", file=sys.stderr)
        return 2

    failed = 0
    for serial, typ in targets:
        src = typ.read_text(encoding="utf-8")
        notes: list[str] = []
        try:
            for fn in PATCHES.get(serial, []):
                src, n = fn(src)
                notes.extend(n)
            src, n = p_widen_slots(src)
            notes.extend(n)
            src, n = p_tilde(src)
            notes.extend(n)
            # 统一占位文案：把「配图：原图待补」换成带卷号的提示
            src = src.replace('#figure-missing(note: "原图待补")',
                              f'#figure-missing(note: "{serial} 原图见官方 PDF")')
        except AssertionError as e:
            print(f"  {serial}: {e}", file=sys.stderr)
            failed += 1
            continue
        typ.write_text(src, encoding="utf-8")
        if notes:
            print(f"  {serial}: " + "；".join(notes))
        else:
            print(f"  {serial}: 无需补丁")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
