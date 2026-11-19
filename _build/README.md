# _build — CSP 第一轮真题转换管线

把 `CSP-J_S/Round1/` 下的真题 PDF 转成 Typst 源文件（题卷 + 答案解析），
以及生成 `INDEX.md`。

## 一键重放

```bash
cd "/home/wyao/Nutstore Files/aisichuang/0x0c00_真题整理" || exit 1
bash _build/rebuild.sh            # 抽答案 → 抽正文 → 转 typ → 打补丁 → 编译
bash _build/rebuild.sh 2023J1     # 只重做一份
python3 _build/make_index.py      # 刷新 INDEX.md
```

产物：

- `CSP-J_S/Round1/<年>/<卷标>.typ` —— 题卷（学生版，不含答案）
- `CSP-J_S/Round1/<年>/<卷标>-答案.typ` —— 答案解析（有来源的卷才有）
- `_build/out/*.pdf` —— 编译产物，**不进坚果云**，可随时删
- `_build/raw/*.json` —— 中间结构化数据，可删可重建

## 脚本

| 脚本 | 作用 | 用法 |
|---|---|---|
| `fetch_text.py` | PDF → 结构化 JSON | `python3 _build/fetch_text.py 卷.pdf --out _build/raw/2023J1.json` |
| `fetch_answers.sh` | 从 docx/pdf/md 抽答案 | `bash _build/fetch_answers.sh` |
| `prep_exam_text.py` | 拆「试题+解析」合订本 → 题面 txt + 答案 JSON | `python3 _build/prep_exam_text.py 合订本.pdf --out-text x.txt --out-answers x.answers.json` |
| `extract_answers.py` | 单个答案源 → JSON | `python3 _build/extract_answers.py docx 解析.docx --out x.json` |
| `md2typ_csp.py` | JSON → `.typ` | `python3 _build/md2typ_csp.py in.json --out 2023J1.typ --kind paper` |
| `mineru_ocr.py` | PDF → Markdown（MinerU，带缓存） | `python3 _build/mineru_ocr.py 卷.pdf --out _build/raw/x.ocr.md` |
| `patch_manual.py` | 可重放人工补丁（含插图插入） | `python3 _build/patch_manual.py [卷标]` |
| `../_typst/figs.typ` | 缺失插图的 cetz 重绘源码 | 被 `patch_manual.py` 自动 import |
| `make_index.py` | 生成 `INDEX.md` | `python3 _build/make_index.py` |
| `rebuild.sh` | 全流程 | `bash _build/rebuild.sh [卷标]` |

## fetch_text.py 的两种后端

**文字层（默认）**　`pdftohtml -xml` 逐 span 取 `top/left/height/font`，按基线
聚类成行。判据：

- 代码块 → 「行号列 x 对齐」（2023+ 的 Typst 卷）或「单 span 自带 `01 ` 前缀 +
  等宽字体」（2021/2022 的 Word 卷）；
- 行内代码 → 与中文**几乎不同行**的等宽字体（同行的等宽字体是正文西文）；
- 上下标 → 字号 < 正文 78% **且** 基线偏移 > 22% 字高（双条件，避免把 Word 卷
  小 1pt 的西文误判）；
- 水印 → 字号超过正文中位数 3 倍的 span 直接丢弃（2021S1 有 150pt「福建」大字）。

**OCR（`--ocr local-vision`）**　逐页 `pdftoppm -r 150` 渲染后交给本地视觉模型
（默认 `qwen3.8-flash`，走 `http://127.0.0.1:3425/v1/chat/completions`）。
用于纯扫描件。

**OCR（`--ocr mineru`）**　走 MinerU v4 精准解析（公式/表格都开），需要 token：

```bash
set -a && source ~/_secret/mineru.env && set +a    # MINERU_TOKEN=...
python3 _build/fetch_text.py 卷.pdf --out x.json --ocr mineru
```

token 放在同步盘之外（`~/_secret/mineru.env`，600 权限）。未设置时脚本**直接报错退出**，
不会静默降级到本地模型。

MinerU 免登录的 Agent 轻量接口（`/api/v1/agent/parse/*`）每份限 20 页且**关闭公式识别**，
试卷全是行内公式，因此不适用，本项目不用它。

## 2021S1 的解析来自 MinerU OCR

`CSP-J_S/Round1/2021/2021 CSP-S 初赛解析.pdf` 是一份博客截图打印稿，没有文字层。
`fetch_answers.sh` 会用 `mineru_ocr.py` 把它 OCR 成 `_build/raw/2021S1.ocr.md`
（有缓存，跑过一次就不再调 API），再从中抽答案。

原博客只收录了部分题目，因此答案覆盖 **13 题**（不是全部 43 题）。

## NOIP 第一轮（2004–2018）

老 NOIP 卷的题型是「单选 + 不定项 + 问题求解 + 阅读程序写结果 + 完善程序」，
每节题号都从 1 重新开始，完善程序是填空（答案是一段 C++ 代码）。因此单独一条
管线：

```bash
bash _build/rebuild_noip.sh          # 全量（2004–2018 共 28 卷）
bash _build/rebuild_noip.sh 2016TG   # 单卷
```

`fetch_text.py --noip` 做的事：

- 题号按出现顺序统一重排成 1..N（原来每节都从 1 开始，`指导` 会撞号）；
- 页脚按「卷名/科目字样 + 版面位置」找页脚带（切线以下整段删）——老卷页脚常与
  代码同一基线，只按文字删会留下「初赛提高组 C++语言试题」；纯数字 span 只在
  页面最底部那条基线才当页码删，否则正文里的下标（`A₀` 的 `0`）会被吃掉；
- `3. #include<iostream>` 这种「题号与首行代码同行」拆成两行；
- 小数不当作题号（`1.80 米的同学…`），但 `3.   1MB 等于…` 仍是题；
  编号正好接上一题的例外（`18．1956 年…` 是以年份开头的题，不是小数）；
- 圆圈编号占位 `① ;` 算代码行，否则会把完善程序切成好几块；
- 双栏选项 `A. 1000 字节   B. 1024 字节` 按宽空白拆成两条；
- 「1.（交朋友）」这类完善程序标题保留为题，不降级成列表。

老卷文字层里的 `n#super[2]` 上下标标记在 `md2typ_csp.py` 里先转成 `$n^{2}$`；
填空的连续下划线渲染成 `#blank(…)`（可见横线），避免 Typst 把 `__` 当强调报错；
正文里的 `（    ）` 答题空位统一换成 `#h(2.6em)`——Typst 会把连续空格压成一个。

答案卷按官方参考答案直录：阅读程序给输出、完善程序给 `（1）…（5）…` 的 C++
写法，等价写法用「或」列出。28 卷答案已全部录入。

2015 普及组原卷是扫描件：先用本地视觉模型 OCR 成 `_build/raw/2015PJ.ocr.md`，
人工整理成 `_build/raw/2015PJ.md`（去掉重复页、把 `**一、…**` 改成 `##`、
阅读程序题改成「N. 阅读下面的程序，写出运行结果。」+ 代码块），此后以 md 为源。

`patch_noip.py` 是可重放的人工补丁（幂等），负责：

- **配图**：28 卷共 22 张图（含 2011PJ 第 19 题的强连通图、2012TG 第 12 题的
  四张有向图 A–D、2013TG 第 18 题的 DFS 无向图与第 22 题的荷叶图）
  （`_typst/assets/noip/`），从原卷内嵌位图或页面渲染里裁出，按「卷标-q题号.png」
  命名，插在题干之后；
- **2012/2013 四卷**（2026-11 接入）：
  - 2012 普及组整页没有等宽字体（代码也用 Helvetica），字体判据全失效，改按内容
    认代码行；卷头「竞赛时间」拼进标题、`1~n` 被当成不换行空格；
  - 2012 普及组第 10 题 / 2012 提高组第 4 题的四个选项是四张分层表、
    2012 提高组第 17 题的真值表、第 12 题的四张有向图，全部按原卷重排；
  - 2012 普及组第 12 题、2012 提高组第 13 题是栈示意图，改成小表；
  - 2013 普及组第 19 题、2013 提高组第 16 题是「选项为代码」，还原成 2×2 代码表；
  - 2013 普及组第 22 题、2013 提高组第 21 题的 5 行问答表被拍平成表头 + 一段代码；
  - 2013 普及组第 28 题整行中文注释把代码切成两块，`left_child` 被拆成
    `lef$t_c$hild`，两处都在抽取器里修掉；
- **2011 普及组**：原卷整页用 Courier 排，粗体词（ASCII、队列、SD…）被抽成行内代码，
  留下大量反引号；卷头把 `●●` 和注意事项并进了 title。清理反引号、整理卷头，
  第 28 题补回 `10^100`；
- **2016 提高组第 15 题 / 2016 普及组第 14 题**：原卷把题号误编成 `1.`，代码块散架，
  按原卷重排并顺延后续题号；
- **2016 提高组第 14 题**：`2T(n/4)+√n` 两行分式连成乱码，恢复成数学块；
- **2016 提高组第 24 题**：多行输入的每行被包成行内代码，改用 `text` 块；
- **2016 提高组第 27 题**：代码跨页 + PDF 伪粗体（`(2)` 被画两遍成 `((22))`），
  代码块被切成 5 段，整题按原卷重排；
- **2016 提高组第 22 题**：考试表被拍成 `$$` 连写，还原成 `#table`；
- **2017 提高组第 6 / 10–15 题**：两行递推式粘连、分数选项被拆成 5 个、算法题排成
  散段、`1/20` 丢失，按原卷重排；
- **2017 普及组第 27 / 28 题**：上标全丢（`xp`=`x^p`、`x2`=`x^2`、`108`=`10^8`），
  输入/输出挤在题干里，代码行被并成 `; while` / `; else`；
- **2015 提高组第 13 题**：四个选项各两行代码，抽取时被拆成 8 段，并回两行；
- **2015 普及组第 23 / 25 题**：分页把代码切成两个块，合并；`输入/输出` 同行拆开；
- **2014 提高组第 25 题**：输入数据被当成代码块且串成一行，改成保留换行的 `text` 块；
- 通用规则：`#(sym.gt)` 之类的符号名还原成 `>`/`\<`、多行输入数据改 `text` 块、
  输入/输出换行、`#underline[#h()]` 换成可见的 `#blank()`、页脚残渣、
  选项末尾落单反引号、空题干的阅读程序题、2014 提高组的 `E.` 选项。

抽取器（`fetch_text.py`）里为老 NOIP 卷调过的启发式：`#define` / `int main()` /
`else` / `while (...)` / `do` 等独立成行的代码不再被误判成正文（否则会把代码块
切断），带中文注释的代码行（`int len[100];  // 记录…`）代码占比低到 0.43 仍按
代码处理；整行注释（`//（3 分，3 分，3 分）`）落在代码中间时并回代码块。

`md2typ_csp.py` 的代码重排按花括号定层级，并对没有花括号的控制语句
（`if (...)` / `for (...)` / `while (...)` / `else`）给下一行多缩一级，
`{` 单独成行时不额外缩进；填空位 `①②③` 两侧的长空白压成固定留白，
否则整行超出版心会把 Typst 网格撑破。

## 修改约定

**改内容请改脚本，不要只改 .typ。** 重放会覆盖 .typ。单点修正写进
`patch_manual.py` 的 `PATCHES` 表：

```python
def p_2025S1_date(src):
    old = 'date: "2024 年 9 月 20 日 14:30 ~ 16:30",'
    new = 'date: "2025 年 9 月 20 日 14:30 ~ 16:30",'
    ...
```

`sub_once()` 会断言「原文存在」或「补丁已打」，找不到就报错——避免重放时静默失效。

## 已知限制

1. **配图**：原卷的矢量图（拓扑图）抽不出位图，已改用 cetz 重绘，源码在
   `_typst/figs.typ`（2021S1-15、2023S1-13、2024S1-15 三张）。
   `patch_manual.py` 在重放时补 import 并把调用插到题干之后。
   改动请改 `figs.typ`，不要改 .typ。
2. **数学兜底**：PDF 抽取会丢公式结构，转换器做了这些修复——
   `√x`→`sqrt(x)`、孤立 `^`/`_` 去掉、`#` 转义、多字母标识符拆空格。
   个别公式仍需人工校对。Typst 的 `~` 是「不换行空格」，正文里的区间号
   （`0~10`、`T~Z`）会显示成空白，`patch_manual.py` 统一改成全角 `～`；
   填空横线也不要用 `#underline[#h()]`（空白没有墨水范围，画不出线），
   用 `_typst/exam.typ` 的 `#blank(3.2em)`。
3. **扫描件（2019/2020）**：2019J1、2020S1 原卷是纯扫描件。先用 MinerU /
   本地视觉 OCR 出初稿，再人工整理成 `_build/raw/<卷标>.md`（逐题核对题干、
   选项与代码），此后以 md 为源重放。2020J1 的「试题+解析」合订本由
   `prep_exam_text.py` 拆成 `2020J1.txt`；2019S1 的源稿是
   `CSP-J_S/Round1/2019/CSP-S2019初赛解析.md`。重放命令见 `rebuild.sh` 的
   `PAPERS` 表，删掉 md 不会重爬到可用结果，请注意保留。
4. **LaTeX 卷（2026）**：选项常并排一行，靠 `split_inline_options` 切开；
   公式里的变量偶尔落在数学字体之外（`$1 ≤$ fa$[i] < i$`），按「数学段之间
   的裸标识符」处理；`∑` 跨行的极端排版与 `n⁺/n⁻` 走 `patch_manual.py`。
5. **答案覆盖**：8 份有答案（2019J1 43、2019S1 43、2020J1 42、2020S1 43、
   2021J1 39、2021S1 13、2022J1 30、2023S1 43）。2020S1 第 24 题官方判定
   四个选项均无严格正确项，答案文件里记作「都对」并附说明。其余在 INDEX 标「待补」。

---

# GESP 真题管线（2023-03 ~ 2026-09，C++ 1~8 级）

产物在 `GESP/<年月>/<年月>-L<级别>.typ` 与 `-答案.typ`，索引 `GESP/INDEX.md`，
原始 PDF 在 `GESP/raw/<年月>/L<级别>.pdf`。

```bash
bash _build/rebuild_gesp.sh              # 抓取 → MinerU → 抽取 → 生成 → 编译检查
bash _build/rebuild_gesp.sh 2025-03      # 只重做某个月份
python3 _build/gesp_index.py             # 刷新 GESP/INDEX.md
```

| 脚本 | 作用 |
|---|---|
| `gesp_fetch.py` | 抓官网「真题及解析」两页列表 → 各月详情页 → 只下 C++ 1~8 级 PDF |
| `gesp_mineru.py` | 批量送 MinerU（vlm），缓存 `content_list_v2.json` + 插图 |
| `gesp_extract.py` | PDF 文字层（span）→ 结构化 JSON；MinerU 只用来回填公式 |
| `gesp_typ.py` | JSON → Typst（LaTeX→Typst math、转义、版式拼装） |
| `gesp_index.py` | 生成 `GESP/INDEX.md` |

## 为什么是「文字层为主 + MinerU 补公式」

GESP 卷由 Typora 打印，**公式是矢量字形，文字层里只剩空格**（部分 2023-06 卷
干脆是 U+FFFD）。所以：

1. 题干、选项、代码、样例、行号全部取自 `pdftohtml -xml` 的 span——行号列
   （Lucida/Consolas/JetBrainsMono）用来切代码，代码缩进按字符宽还原；
2. 公式空洞有三种来源：空白 span、span 之间的宽间距、`（ ）` 之外的孤立空格；
   连续空洞会合并；
3. MinerU 的 `content_list_v2` 按页给出段落与公式，这里把公式整体抽走，
   只留纯文字做锚点：用「左锚点之后最靠后的右锚点」定位空洞，再取空洞里的
   文字或对应位置的公式。锚点不一致就留红色「〔公式待补〕」。

## 已知限制

- 判断题答案官方 PDF 是有的，但 √ × 打成 Symbol Type3 字形，`pdftotext` 抽不到，
  改由 MinerU 的 table/code 块识别（`mineru_judge_answers()`），106 卷全部拿到。
  编程题以卷末参考程序为准。
- 少数公式（尤其 数据范围/子任务表、题干首字符）在文字层里连空格都没留，
  MinerU 也没识别，会以「〔公式待补〕」标出；全库约 400 处。
- 个别题干首字符（如「第 2 题 6 个人…」的 6）会丢，见上条。
