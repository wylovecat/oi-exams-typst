#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""make_index.py — 生成 0x0c00_真题整理/INDEX.md（CSP 第一轮真题索引）。

扫描 CSP-J_S/Round1/*/[0-9]*.typ，读 _build/raw/*.json 的题量、答案覆盖与
待补图，输出一张可 grep 的总表。

考点列暂留空（第二轮从 CSP历年知识点整理.xlsx 批量灌入）。

用法：
  cd 0x00_真题整理 && python3 _build/make_index.py
"""
from __future__ import annotations

import json
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ROUND1 = ROOT / "CSP-J_S" / "Round1"
RAW = ROOT / "_build" / "raw"
OUT = ROOT / "INDEX.md"

ORIGINAL = {
    "2019J1": "CSP-J_S/Round1/2019/2019/2019-CCF-CSP-J1（C++）.pdf",
    "2019S1": "CSP-J_S/Round1/2019/2019-CCF-CSP-S1（C++）.pdf",
    "2020J1": "CSP-J_S/Round1/2020/2020初赛普及组C++试题解析.pdf",
    "2020S1": "CSP-J_S/Round1/2020/CSP-S2020初赛卷.pdf",
    "2021J1": "CSP-J_S/Round1/2021/2021初赛普及组C++试题.pdf",
    "2021S1": "CSP-J_S/Round1/2021/2021 CSP-S 初赛试题.pdf",
    "2022J1": "CSP-J_S/Round1/2022/CSP-J/CSPJ2022初赛.pdf",
    "2022S1": "CSP-J_S/Round1/2022/CSP-S/CSP-S2022.pdf",
    "2023J1": "CSP-J_S/Round1/2023/2023J1.pdf",
    "2023S1": "CSP-J_S/Round1/2023/2023S1.pdf",
    "2024J1": "CSP-J_S/Round1/2024/CSP-J2024_Round1.pdf",
    "2024S1": "CSP-J_S/Round1/2024/2024S1.pdf",
    "2025J1": "CSP-J_S/Round1/2025/2025J1/2025J1 抄录.pdf",
    "2025S1": "CSP-J_S/Round1/2025/2025S1/2025S1.pdf",
    "2026J1": "CSP-J_S/Round1/2026/CSP-J1-2026.pdf",
    "2026S1": "CSP-J_S/Round1/2026/CSP-S1-2026.pdf",
}

ANSWER_SOURCE = {
    "2019J1": "`2019-CCF-CSP-J1（C++）Ans.jpg`（官方答案页，扫描）",
    "2019S1": "`2019-CCF-CSP-S1（C++）Ans.pdf`（官方答案页）",
    "2020J1": "`2020初赛普及组C++试题解析.pdf`（试题+解析合订本，prep_exam_text 拆分）",
    "2020S1": "官方答案 + Rainy7《CSP-S 2020 初赛解析》（第 24 题官方判定四个选项均计分）",
    "2021J1": "`2021初赛普及组C++试题【解析】（更新：22.05.27）.docx`（插队老师修订版）",
    "2021S1": "博客体解析，MinerU OCR 自 `2021 CSP-S 初赛解析.pdf`",
    "2022J1": "`0x0A00_LaTeX/CSPJ1/2022/CSP_J1_2022解析.pdf`（LaTeX 解析卷）",
    "2023S1": "`0x0400_CSP初赛/2024/CSP-S 2023 Round1.md`（人工整理）",
}


def pdf_pages(path: Path) -> str:
    if not path.exists():
        return "?"
    out = subprocess.run(["pdfinfo", str(path)], capture_output=True, text=True).stdout
    m = re.search(r"^Pages:\s+(\d+)", out, re.M)
    return m.group(1) if m else "?"


def main() -> int:
    rows = []
    for typ in sorted(ROUND1.glob("*/*.typ")):
        if typ.name.endswith("-答案.typ"):
            continue
        serial = typ.stem
        src = typ.read_text(encoding="utf-8")
        opts = len(re.findall(r"^  \+ ", src, re.M))
        # 题量与重号以 _build/raw/<卷标>.json 的 q 项为准：
        # demote_list_items 已把「1. 2. 3. 汉诺塔规则」这类列表降级成段落，
        # 所以 JSON 里的 q 就是真题；.typ 里再数 `N. ` 会把列表项一起算进去。
        raw_json = RAW / f"{serial}.json"
        q_nums: list[int] = []
        if raw_json.exists():
            try:
                data = json.loads(raw_json.read_text(encoding="utf-8"))
                q_nums = [it["num"] for it in data["items"] if it["t"] == "q"]
            except Exception:
                q_nums = []
        if not q_nums:
            q_nums = [int(x) for x in re.findall(r"^(\d+)\. ", src, re.M)]
        dups = sorted({n for n in q_nums if q_nums.count(n) > 1})
        gaps = [n for n in range(1, (max(q_nums) if q_nums else 0) + 1)
                if n not in q_nums]

        fm = sorted(set(re.findall(r'figure-missing\(note: "([^"]*)"', src)))

        ans_typ = typ.parent / f"{serial}-答案.typ"
        ans_json = RAW / f"{serial}.answers.json"
        ans_n = "-"
        if ans_json.exists():
            try:
                aj = json.loads(ans_json.read_text(encoding="utf-8"))
                # 占位项（`（待补）`/`?`）不算已覆盖
                have = sum(1 for v in aj.values()
                           if str(v.get("answer", "")).strip()
                           not in ("（待补）", "?", ""))
                ans_n = str(have)
            except Exception:
                ans_n = "?"

        rows.append(dict(
            serial=serial,
            year=serial[:4],
            grp="入门级" if serial[4:] == "J1" else "提高级",
            typ=typ.relative_to(ROOT),
            ans=ans_typ.relative_to(ROOT) if ans_typ.exists() else None,
            pages=pdf_pages(ROOT / "_build" / "out" / f"{serial}.pdf"),
            qs=len(q_nums),
            opts=opts,
            ans_n=ans_n,
            gaps=gaps,
            dups=dups,
            fm=fm,
        ))

    lines = [
        "# CSP-J/S 第一轮真题（Typst 版）索引",
        "",
        "`0x0c00_真题整理` 下的 CSP-J/S 第一轮真题已转成 Typst 源文件，按年份就地存放，"
        "与原始 PDF 并列。题卷与学生版答案分文件（`X.typ` / `X-答案.typ`）。",
        "",
        "GESP 认证真题（2023–2026，C++ 1~8 级，共 106 卷）见 "
        "[GESP/INDEX.md](GESP/INDEX.md)。",
        "",
        "## 快速检索",
        "",
        "```bash",
        '# 按关键词找题（例如哈夫曼）',
        "rg -l '哈夫曼' --glob '*.typ' CSP-J_S/Round1",
        "",
        "# 找某年的卷子",
        "rg -n '2023J1' INDEX.md",
        "",
        "# 编译（必须带 --root，模板在 _typst/）",
        "typst compile --root . CSP-J_S/Round1/2023/2023J1.typ out.pdf",
        "```",
        "",
        "## 总表",
        "",
        "| 卷标 | 年份 | 组别 | 页数 | 题量 | 选项数 | 答案覆盖 | 题卷 | 答案 |",
        "|---|---|---|---:|---:|---:|---|---|---|",
    ]
    for r in rows:
        ans_cell = f"{r['ans_n']} 题" if r["ans"] else "待补"
        ans_link = f"[{Path(r['ans']).name}]({r['ans']})" if r["ans"] else "—"
        lines.append(
            f"| **{r['serial']}** | {r['year']} | {r['grp']} | {r['pages']} | "
            f"{r['qs']} | {r['opts']} | {ans_cell} | "
            f"[{Path(r['typ']).name}]({r['typ']}) | {ans_link} |"
        )

    lines += ["", "## 逐卷说明", ""]
    for r in rows:
        lines.append(f"### {r['serial']}")
        lines.append("")
        lines.append(f"- 原卷：`{ORIGINAL.get(r['serial'], '（见同目录 PDF）')}`")
        lines.append(f"- Typst：`{r['typ']}`" + (f"　答案：`{r['ans']}`" if r["ans"] else ""))
        if r["ans"]:
            lines.append(f"- 答案来源：{ANSWER_SOURCE.get(r['serial'], '—')}")
        else:
            lines.append("- 答案：**待补**（现有 PDF/docx 解析不可用或未收录）")
        if r["gaps"]:
            lines.append(f"- 缺题号：{', '.join(map(str, r['gaps']))}")
        if r["dups"]:
            lines.append(f"- 重号：{', '.join(map(str, r['dups']))}（原卷如此，补丁脚本已顺延）")
        if r["fm"]:
            lines.append(f"- 待补配图：{', '.join(r['fm'])}")
        lines.append("")

    lines += [
        "## 管线与约定",
        "",
        "| 文件 | 作用 |",
        "|---|---|",
        "| `_typst/exam.typ` | 唯一试卷版式库（参数化 course/title/date） |",
        "| `_build/rebuild.sh` | 一键重放：抽答案 → 抽正文 → 转 typ → 打补丁 → 编译 |",
        "| `_build/fetch_text.py` | PDF → 结构化 JSON（文字层 / OCR 双后端） |",
        "| `_build/fetch_answers.sh` | 从 docx/pdf/md 抽答案 → `_build/raw/*.answers.json` |",
        "| `_build/md2typ_csp.py` | JSON → `.typ`（`--kind paper` / `--kind answers`） |",
        "| `_build/patch_manual.py` | 可重放的人工补丁（幂等，找不到原文即报错） |",
        "| `_build/make_index.py` | 生成本文件 |",
        "",
        "重放全部：",
        "",
        "```bash",
        'cd "/home/wyao/Nutstore Files/aisichuang/0x0c00_真题整理" || exit 1',
        "bash _build/rebuild.sh              # 全部 12 份",
        "bash _build/rebuild.sh 2023J1       # 只重做一份",
        "python3 _build/make_index.py        # 刷新索引",
        "```",
        "",
        "**改内容请改脚本，不要只改 .typ**：下一次重放会覆盖手改部分。"
        "临时性的单点修正写进 `_build/patch_manual.py` 的 `PATCHES` 表。",
        "",
        "## 已知限制",
        "",
        "- **配图**：原卷的矢量图（拓扑图等）已用 cetz 重绘，源码在 `_typst/figs.typ`，"
        "由 `_build/patch_manual.py` 在重放时插入：2021S1-15（A→J 带权有向图）、"
        "2023S1-13（6 顶点有向图）、2024S1-15（7 顶点有向图）。"
        "改图形请改 `figs.typ` 并重新编译。",
        "- **数学**：`√` 一律写成 `sqrt(...)`；缺底数的上下标会被去掉标记；"
        "这些都是 PDF 抽取的兜底处理，个别公式需人工校对。",
        "- **扫描件**：2019/2020 的 J1/S1 是纯扫描且无可用解析，本批未纳入。"
        "需要时用 `python3 _build/fetch_text.py 卷.pdf --out … --ocr mineru`"
        "（需 `MINERU_TOKEN`，见 `_build/README.md`）。",
        "- **NOIP 覆盖**：2004–2018 全部 28 卷已接入。2004 两卷与 2008/2009/2010 "
        "提高组原卷只有 `.doc`，已用 LibreOffice 转成 PDF 存进对应年份目录"
        "（`NOIP2004PreliminaryJunior(C).pdf` 等），抽取以 PDF 为源。",
        "- **CSP 答案缺口**：2024S1、2025S1 两卷尚无答案；2021S1 缺第 28–43 题"
        "（卷面 43 题，已录 1–27）。2023J1 的答案是知识库推算稿、2026 两卷是"
        "机构估分版，均非 CCF 官方标准答案，使用前需核对。",
        "",
    ]

    lines += noip_section()
    OUT.write_text("\n".join(lines), encoding="utf-8")
    print(f"写出 {OUT}")
    return 0



def noip_rows():
    root = ROOT / "NOIP" / "Round1"
    rows = []
    for typ in sorted(root.glob("*/*.typ")):
        if typ.name.endswith("-答案.typ"):
            continue
        serial = typ.stem
        raw = RAW / f"{serial}.json"
        # 题数按 .typ 里顶格的 `N. ` 行数（补丁补回的题也在内）；
        # 编号段落都被 md2typ 加了 `#h(0pt)` 前缀，不会误计。
        tsrc = typ.read_text(encoding="utf-8")
        # 题号行只出现在正文层（0 或 2 空格缩进）；代码块里的 `1. k ← ⌊n/2⌋`
        # 之类的编号不能算题。先按 ``` 切出代码块外的行再数。
        qs = 0
        incode = False
        for l in tsrc.split("\n"):
            if l.lstrip().startswith("```"):
                incode = not incode
                continue
            if not incode and re.match(r"^\s{0,2}\d{1,2}\. ", l):
                qs += 1
        opts = sum(1 for l in tsrc.split("\n") if l.startswith("  + "))
        ans = typ.parent / f"{serial}-答案.typ"
        ans_n = "-"
        aj = RAW / f"{serial}.answers.json"
        if aj.exists():
            try:
                ans_n = str(len(json.loads(aj.read_text(encoding="utf-8"))))
            except Exception:
                ans_n = "?"
        # 输出 PDF 由 rebuild_noip.sh 编译到 _build/out/noip/
        pdf = ROOT / "_build" / "out" / "noip" / f"{serial}.pdf"
        rows.append(dict(serial=serial, year=serial[:4],
                         grp="普及组" if serial.endswith("PJ") else "提高组",
                         pages=pdf_pages(pdf), qs=qs, opts=opts, ans_n=ans_n,
                         typ=typ.relative_to(ROOT),
                         ans=ans.relative_to(ROOT) if ans.exists() else None))
    return rows


def noip_section():
    rows = noip_rows()
    if not rows:
        return []
    out = ["", "## NOIP 第一轮（2004–2018）", "",
           "| 卷标 | 年份 | 组别 | 页数 | 题量 | 选项数 | 答案 | 题卷 |",
           "|---|---|---|---:|---:|---:|---|---|"]
    for r in rows:
        ans_cell = f"[{Path(r['ans']).name}]({r['ans']})" if r["ans"] else "待补"
        out.append(f"| **{r['serial']}** | {r['year']} | {r['grp']} | {r['pages']} | "
                   f"{r['qs']} | {r['opts']} | {ans_cell} | "
                   f"[{Path(r['typ']).name}]({r['typ']}) |")
    out += ["", "重放：`bash _build/rebuild_noip.sh`；扫描件与旧版式说明见 `_build/README.md`。", ""]
    return out

if __name__ == "__main__":
    raise SystemExit(main())
