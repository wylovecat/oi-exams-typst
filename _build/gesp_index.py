#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""gesp_index.py — 生成 GESP/INDEX.md（卷数、题量、答案与公式回填情况）。"""
from __future__ import annotations

import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
JS = ROOT / "_build" / "gesp_json"
OUT = ROOT / "GESP"
CN = "一二三四五六七八"


def pages_of(pdf: Path) -> int:
    out = subprocess.run(["pdfinfo", str(pdf)], capture_output=True, text=True).stdout
    m = re.search(r"^Pages:\s+(\d+)", out, re.M)
    return int(m.group(1)) if m else 0


def main() -> int:
    rows = []
    tot_pages = tot_q = tot_missing = 0
    for f in sorted(JS.glob("*.json")):
        d = json.loads(f.read_text())
        ym, lv = d["month"], d["level"]
        pdf = ROOT / "GESP" / "raw" / ym / f"L{lv}.pdf"
        typ = OUT / ym / f"{ym}-L{lv}.typ"
        ans = OUT / ym / f"{ym}-L{lv}-答案.typ"
        if not typ.exists():
            continue
        npg = pages_of(pdf)
        nq = len(d["choice"]["questions"]) + len(d["judge"]) + len(d["programs"])
        text = typ.read_text(encoding="utf-8")
        miss = text.count("math-missing")
        tot_pages += npg
        tot_q += nq
        tot_missing += miss
        rows.append((ym, lv, npg, len(d["choice"]["questions"]),
                     len(d["judge"]), len(d["programs"]), miss, typ, ans,
                     len(d["choice"]["answers"]),
                     len(d.get("judge_answers") or [])))

    lines = [
        "# GESP C++ 历年真题（Typst）",
        "",
        "来源：CCF GESP 官网「真题及解析」栏目 <https://gesp.ccf.org.cn/101/1010/index.html>。",
        "仅收录 C++ 1~8 级；图形化 / Python 未收。每卷含题卷与 `-答案.typ`（单选题答案）。",
        "",
        f"共 **{len(rows)}** 卷 / {tot_pages} 页 / {tot_q} 题（每卷 15 单选 + 10 判断 + 2 编程）。",
        "",
        "编译：`typst compile --root . GESP/<年月>/<年月>-L<级别>.typ`；重放：`bash _build/rebuild_gesp.sh`。",
        "",
        "> 公式说明：GESP 卷的公式在 PDF 里是矢量字形，文字层只剩空格。本库用 MinerU 按版面回填，"
        f"共有 {tot_missing} 处未能回填，在卷内以红色「〔公式待补〕」标出，请以官方 PDF 为准。",
        "",
        "> 答案说明：单选题与判断题答案均取自官方 PDF 的答案表（判断题的 √ × 是 Type3 字形，"
        "文字层抽不出，由 MinerU 识别）；编程题以卷末「参考程序」为准。",
        "",
        "| 年月 | 级别 | 页 | 单选 | 判断 | 编程 | 答案 | 公式待补 | 题卷 |",
        "|---|---|---:|---:|---:|---:|---|---:|---|",
    ]
    for ym, lv, npg, nc, nj, np_, miss, typ, ans, na, nja in rows:
        rel = typ.relative_to(OUT)
        cov = f"{na}/{nc} + {nja}/{nj}"
        cov = "齐" if (na == nc and nja == nj) else cov
        lines.append(
            f"| {ym} | {CN[lv-1]}级 | {npg} | {nc} | {nj} | {np_} | {cov} | {miss} | "
            f"[{rel.name}]({rel.as_posix()}) |")
    lines.append("")

    (OUT / "INDEX.md").write_text("\n".join(lines), encoding="utf-8")
    print(f"写出 {OUT/'INDEX.md'}：{len(rows)} 卷，待补公式 {tot_missing} 处", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
