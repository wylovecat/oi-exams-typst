// ===========================================================================
// CSP-J/S 第一轮试卷版式库（唯一模板）
//
// 用法（务必带 --root，跨目录 import 才不越界）：
//   cd 0x0c00_真题整理
//   typst compile --root . CSP-J_S/Round1/2023/2023J1.typ out.pdf
//
// 正文写法：
//   #import "/_typst/exam.typ": exam
//   #show: doc => exam(
//     serial: "2023J1",
//     course: "2023 CCF 非专业级别软件能力认证第一轮",
//     title: "(CSP-J1) 入门级 C++ 语言试题",
//     date: "2023 年 9 月 16 日 09:30 ~ 11:30",
//     doc,
//   )
//   = 单项选择题（共 15 题，每题 2 分）
//   1. 题干（ ）
//     + 选项甲
//     + 选项乙
//
// 题号与选项统一由 enum 编号产出：题号 `1.`，选项 `A.`（numbering "1.A."）。
// ===========================================================================

#import "@preview/cuti:0.2.1": show-cn-fakebold

// ------------------------------ 版式常量 -----------------------------------
#let font-latin = (name: "Fira Code", covers: "latin-in-cjk")
#let font-cjk = "Sarasa Mono SC"
#let size-body = 13pt
#let size-title = 15pt
#let size-notice = 12pt

// ------------------------------ 双目标支持 ---------------------------------
// 同一份 .typ 既要出 PDF（--format pdf）也要出网页（--format html --features html）。
// HTML 导出里 align() / grid() / rect() / place() 会连内容一起丢掉，所以凡是
// 用了这些原语的地方都要在网页分支换成 html.elem 之类的 HTML 友好写法。
// 判据取自 target()，它是 contextual 的，只能在 context 块里读。
#let is-web() = context target() == "html"

// HTML 分支的语义包装：PDF 分支保持版面原样
#let web-div(class, body) = html.elem("div", attrs: (class: class), body)
#let web-span(class, body) = html.elem("span", attrs: (class: class), body)

// ------------------------------ 主函数 -------------------------------------
#let exam(
  serial: "CSP-J1",
  course: "CCF 非专业级别软件能力认证第一轮",
  title: "",
  date: "",
  notice: auto,
  doc,
) = {
  // 关闭连字（calt/liga/dlig）：Fira Code / Sarasa Mono 会把 != <= -> 合成 ≠ ≤ →
  show text: set text(features: (calt: 0, liga: 0, dlig: 0))
  // cuti 的假粗体靠给中文叠一层描边实现，网页端没有这个需求（浏览器有真粗体），
  // 且它内部的盒子在 HTML 导出里没有意义。
  show: it => context {
    if target() == "html" { it } else { show-cn-fakebold(it) }
  }

  // 网页端 `#h(2.6em)` 这类答案留白会被 HTML 导出整个丢掉（连墨水都没有），
  // 于是题干里的「（　　　）」变成空的「（）」。统一换成一条可点可读的下划线。
  // 小间距（< 1em，用于字间微调）保持丢弃，不影响语义。
  show h: it => context {
    if target() == "html" and it.amount >= 1em {
      return html.elem(
        "span",
        attrs: (class: "exam-blank", style: "width:" + repr(it.amount)),
        [],
      )
    }
    it
  }

  // 代码块：行号 + 竖线（沿用 2025 两卷的观感）
  // 三列：行号 | 竖线 | 代码。中间的 gutter 给竖线留出左右余量，
  // 直接用两列会把行号贴到代码第一个字符上。
  // ```text 用来排输入数据之类的纯文本，不加行号。
  // 网页端 grid 会整块丢失，所以直接放行成原生 <pre><code>，行号交给 CSS counter。
  show raw.where(block: true): code => context {
    if target() == "html" { return code }
    if code.lang == "text" {
      return block(
        code,
        inset: (x: 0.6em, y: 0.4em),
        stroke: 0.5pt + luma(80%),
        radius: 2pt,
        width: 100%,
      )
    }
    grid(
      columns: (auto, auto, auto),
      column-gutter: 0.55em,
      row-gutter: par.leading,
      align: (right, left, raw.align),
      grid.vline(stroke: 0.5pt, x: 1),
      ..for ln in code.lines {
        (text(fill: luma(45%))[#ln.number], [], ln.body)
      },
    )
  }

  set page(
    paper: "a4",
    margin: 2cm,
    header: line(length: 100%, stroke: 1pt),
    footer: context {
      set align(center)
      set text(size-body)
      counter(page).display("第1页，共 1 页", both: true)
    },
  )

  set text(font: (font-latin, font-cjk), size: size-body, lang: "zh")
  set text(ligatures: false)  // liga 兜底；calt 已由函数开头的 show text 关闭
  // 代码块里的中文注释显式落到 font-cjk：默认会由系统字体兜底（Windows 上是隶书），
  // 换机器就变字形、甚至影响分页；固定后 PDF 可跨构建机复现。
  show raw: set text(font: (font-latin, font-cjk))

  // Fira Code 的 `&` 和 `δ` 太像，C++ 里的 `x &= x - 1` 会被误读成 δ；
  // 单独把这个字符落到等宽中文字体上（Sarasa 的 `&` 是常规造型）。
  show "&": it => text(font: font-cjk, it)

  // 卷头。网页端没有版面概念，align 会整段吃掉，改用带 class 的 div 交给 CSS 居中。
  context if target() == "html" {
    web-div("exam-head", [
      #web-div("exam-head-line exam-head-course", course)
      #web-div("exam-head-line exam-head-title", title)
      #if date != "" { web-div("exam-head-line exam-head-date", [时间：#date]) }
    ])
  } else {
    align(center, text(size-title, weight: "bold")[#course])
    align(center, text(size-title)[#title])
    if date != "" {
      align(center, text(size-title)[时间：#date])
    }
  }

  // 考生注意事项
  // 网页端不印页数（网页没有分页），也不说「答题纸」——改成一句等价的说明。
  let notice-body = if notice == auto {
    context if target() == "html" {
      [
        *注意事项（请仔细阅读）*
        + 本卷满分 100 分。
        + 不得使用任何电子设备（如计算器、手机、电子词典等）或查阅任何书籍资料。
      ]
    } else {
      [
        *注意事项（请仔细阅读）*
        + 试题纸共有 #context counter(page).final().first() 页，答题纸共有 1 页，满分 100 分。请在答题纸上作答，写在试题纸上的一律无效。
        + 不得使用任何电子设备（如计算器、手机、电子词典等）或查阅任何书籍资料。
      ]
    }
  } else {
    notice
  }
  context if target() == "html" {
    web-div("exam-notice", notice-body)
  } else {
    align(left, text(size-notice)[#notice-body])
    v(0.4em)
  }

  // 标题
  show heading.where(level: 1): it => text(size: 13pt, weight: "bold", it)
  show heading.where(level: 2): it => text(size: 13pt, weight: "bold", it)
  set heading(numbering: (..n) => {
    let v = n.pos()
    if v.len() == 1 { [#numbering("一、", v.at(0))] }
    else if v.len() == 2 { [#numbering("（1）", v.at(1))] }
    else { [#numbering("（1）", v.at(2))] }
  })
  show heading: it => block(above: 1.2em, below: 0.5em, it)

  // 题目：题号 1. / 选项 A.
  // 题号贴住版心左缘；选项由 enum 的 numbering 自动降级为 A. 并在题内缩进。
  set enum(numbering: "1.A.", indent: 0em, body-indent: 0.9em)
  set par(justify: true, leading: 1.05em, spacing: 0.85em)

  doc
}

// ------------------------------ 语义块 -------------------------------------
// 题干：首行缩进 2em，续行与首行对齐（避免长题换行后顶到版心左缘）
#let stem(body) = block(width: 100%, inset: (left: 0em), above: 0.35em, below: 0.3em)[
  #set par(first-line-indent: 0em)
  #body
]

// 判断题 / 单选题提示条（阅读程序、完善程序内部的分组）
#let grouplabel(body) = context {
  if target() == "html" { return web-div("exam-grouplabel", body) }
  block(above: 0.6em, below: 0.3em)[
    #text(weight: "bold")[#body]
  ]
}

// 原卷配图占位（矢量图无法从 PDF 抽出，须人工裁图替换）
#let figure-missing(note: "原图待补") = context {
  if target() == "html" { return web-div("exam-figure-missing", [【配图：#note】]) }
  block(
    width: 100%,
    inset: 8pt,
    above: 0.5em,
    below: 0.5em,
    fill: rgb("#F5F5F5"),
    stroke: (paint: luma(60%), thickness: 0.5pt, dash: "dashed"),
    radius: 2pt,
  )[
    #set align(center)
    #text(size: 10pt, fill: luma(35%))[【配图：#note】]
  ]
}

// 居中插图
#let fig(path, width: 78%) = context {
  if target() == "html" {
    return web-div("exam-fig", html.image(path, alt: "", width: width))
  }
  block(width: 100%, above: 0.6em, below: 0.6em)[
    #set align(center)
    #image(path, width: width)
  ]
}

// 填空横线。`#underline[#h(3em)]` 只给空白加下划线是画不出来的——
// 没有字形就没有墨水范围，必须用带底边的空盒。
#let blank(w) = context {
  if target() == "html" {
    return html.elem("span", attrs: (class: "exam-blank", style: "width:" + repr(w) + ""), [])
  }
  box(width: w, stroke: (bottom: 0.6pt))
}
