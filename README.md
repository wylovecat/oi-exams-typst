# OI 真题 Typst 源码

CSP-J/S、GESP、NOIP 等算法竞赛真题的 Typst 版本整理稿，另附 CCF 官方发布的
《题目知识构成分析报告》。原始 PDF 大多是扫描件或图片、题目分散在压缩包里，
既不能全文检索也不能参与编辑。这里把它们重排成可读、可搜索、可提 PR 的 `.typ` 源码。

## 为什么是 Typst

- 纯文本：git diff 能读懂改了哪个字，也能被 `rg` 全文搜索
- 结构化：题干、选项、阅读程序代码块、配图各自是语义元素，可以二次加工成网页或题库
- 一份源两种产物：PDF 保留原卷版式，HTML 供在线检索（另有站点发布）

## 目录

```
CSP-J_S/Round1/<年份>/<卷标>.typ         题卷（学生版，不含答案）
CSP-J_S/Round1/<年份>/<卷标>-答案.typ    答案与解析
GESP/<年月>/<年月>-L<级别>.typ           GESP 题卷
GESP/<年月>/<年月>-L<级别>-答案.typ      GESP 参考答案（表格）
GESP/INDEX.md                            GESP 总表（卷数/页数/待补公式数）
papers/<系列>-<年份>-<组别>/index.typ    题目知识构成分析报告正文
papers/<系列>-<年份>-<组别>/images/      报告的图（正文用相对路径引用）
_typst/exam.typ                          CSP 第一轮试卷版式库
_typst/gesp.typ                          GESP 认证版式库
_typst/paper.typ                         报告版式库
_typst/figs.typ                          缺失插图的 cetz 重绘（矢量，可改坐标）
_build/                                   PDF → Typst 转换管线
```

卷标命名：

- CSP：`<年份><组别><轮次>`，如 `2024J1` = 2024 年入门级第一轮
- GESP：`<年>-<月>-L<级别>`，如 `2024-06-L6` = 2024 年 6 月 C++ 六级
- 论文：`<系列>-<年份>-<组别>`，如 `csp-2025-senior` = CSP-S 2025 提高级

现收录 CSP-J/S 第一轮 16 卷、GESP C++ 1–8 级 106 卷、题目知识构成分析报告 7 篇。

## 编译

Typst 的 `#import` 不允许越出项目根，模板在 `_typst/`、试卷在
`CSP-J_S/Round1/` 与 `GESP/`，所以**必须把根指到仓库根目录**：

```bash
typst compile --root . CSP-J_S/Round1/2024/2024J1.typ out.pdf
typst compile --root . GESP/2024-06/2024-06-L6.typ out.pdf
typst compile --root . papers/csp-2025-senior/web.typ out.pdf
```

出网页（Typst 0.15+，HTML 导出仍是实验特性）：

```bash
typst compile --root . --format html --features html \
  CSP-J_S/Round1/2024/2024J1.typ out.html
```

两个模板在两种目标下走不同分支（`context target()` 判断）：PDF 走
`align`/`grid` 排版，HTML 走 `html.elem`，因为 HTML 导出会**连同内容一起丢弃**
`align`/`grid`/`rect`/`place`。另外 `block()` 包 heading 会把 `<h2>` 退化成
`<div>`，所以标题的 show 规则也要分叉。

## 字体

PDF 版式依赖：

- `Sarasa Mono SC`（正文等宽中文，与 2023 起的官方卷面一致）
- `Fira Code`（西文与代码）
- 方正书宋 / 方正黑体（教材模板用）

缺字体时会回退到系统字体，版面会走样但不报错。网页端不依赖这些字体。

## 校对状态

每题的正确性以原卷为准。已知需要人工复核的地方写在卷内注释里，主要为：

- 扫描件 OCR 得到的选项序号与上下标
- 2021S1 的解析原为博客截图，只覆盖 13 题
- GESP 卷的公式在 PDF 里是矢量字形，部分未能回填，卷内标了「〔公式待补〕」

## 提交纠错

发现错字、错答案、错版式，欢迎直接在对应 `.typ` 上开 issue 或 PR。
请尽量附上原卷 PDF 的页码或截图，方便核对。

## 来源与版权

题目原文版权归中国计算机学会（CCF）及各命题方所有。`papers/` 中的
《题目知识构成分析报告》为 CCF 官方发布、由各执笔人署名撰写，本仓库仅做格式转换
以便检索与批注，**未改动内容**，著作权仍归原作者。

本仓库的整理工作仅用于个人学习与教学交流，**不得用于商业用途**。
若权利人认为不妥，请联系删除。

排版模板与转换脚本以 MIT 许可发布；题面整理稿以 CC BY-NC-SA 4.0 发布。

---

## 关于 papers/

`papers/` 里是 CCF 官方《题目知识构成分析报告》的 Typst 版本，由
`_build/md2typ_papers.mjs` 从官方 Markdown 自动转换（表格、图注、项目符号均保留；
需要 pandoc 3.5+）。正文里没有改动原意；发现转换导致的排版问题请在 issue 里指出，
不要直接改 `index.typ`——重跑转换脚本会覆盖。
