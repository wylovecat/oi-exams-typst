// ===========================================================================
// GESP 认证真题版式库
//
// 用法：
//   cd 0x0c00_真题整理
//   typst compile --root . GESP/2025-03/2025-03-L1.typ out.pdf
//
//   #import "/_typst/gesp.typ": *
//   #show: doc => gesp(level: 1, month: "2025 年 03 月", doc)
// ===========================================================================

#import "@preview/cuti:0.2.1": show-cn-fakebold

#let font-latin = (name: "Fira Code", covers: "latin-in-cjk")
#let font-cjk = "Sarasa Mono SC"
#let size-body = 12.5pt
#let size-title = 15pt

#let cn-num = ("一", "二", "三", "四", "五", "六", "七", "八")

// ------------------------------ 双目标支持 ---------------------------------
// 同一份 .typ 既出 PDF 也出网页（--format html --features html）。
// HTML 导出里 align() / grid() / rect() / place() 会连内容一起丢掉，
// 且 block() 包住的 heading 会丢掉标题层级，所以这两处都要分叉。
#let web-div(class, body) = html.elem("div", attrs: (class: class), body)

#let gesp(
  level: 1,
  month: "",
  doc,
) = {
  // cuti 的假粗体在网页端没有意义（浏览器有真粗体），其内部盒子在 HTML 导出里也无意义
  show: it => context {
    if target() == "html" { it } else { show-cn-fakebold(it) }
  }

  // 代码块：行号 | 竖线 | 代码（与 CSP 卷一致）
  // 网页端 grid 会整块丢失，直接放行成原生 <pre><code>
  show raw.where(block: true): code => context {
    if target() == "html" { return code }
    if code.lang == "text" {
      return block(
        code,
        inset: (x: 0.6em, y: 0.45em),
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
    margin: (x: 2cm, y: 1.9cm),
    header: line(length: 100%, stroke: 1pt),
    footer: context {
      set align(center)
      set text(size-body)
      counter(page).display("第1页，共 1 页", both: true)
    },
  )

  set text(font: (font-latin, font-cjk), size: size-body, lang: "zh")
  set text(ligatures: false)
  show "&": it => text(font: font-cjk, it)

  // 卷头。网页端 align 会整段吃掉，改用带 class 的 div 交给 CSS 居中
  context if target() == "html" {
    web-div("exam-head", [
      #web-div("exam-head-line exam-head-course", [CCF 编程能力等级认证])
      #web-div("exam-head-line exam-head-title", [C++ #cn-num.at(level - 1) 级])
      #if month != "" { web-div("exam-head-line exam-head-date", month) }
    ])
  } else {
    align(center, text(size-title, weight: "bold")[CCF 编程能力等级认证])
    align(center, text(size-title + 3pt, weight: "bold")[C++ #cn-num.at(level - 1) 级])
    if month != "" {
      align(center, text(size-title)[#month])
    }
    v(0.8em)
  }

  set par(justify: true, leading: 1.05em, spacing: 0.9em)
  set enum(numbering: "1.A.", indent: 0em, body-indent: 0.9em)

  // 网页端 block() 包 heading 会把 <h2> 退化成 <div>，丢掉整个标题层级（进而丢掉
  // 右侧目录与锚点），所以网页分支原样放行、间距交给 CSS。
  // 注意：show 规则不能写在 `context if ... {}` 分支里——那样只有该块自身生效，
  // 后面的正文拿不到规则，PDF 版式会变。必须在单条规则内部判 target()。
  show heading: it => context {
    if target() == "html" { return it }
    let body = it.body
    if it.level == 1 {
      block(above: 1.6em, below: 0.6em, text(size: 13.5pt, weight: "bold", body))
    } else if it.level == 2 {
      block(above: 1.4em, below: 0.5em, text(size: 13pt, weight: "bold", body))
    } else if it.level == 3 {
      block(above: 1.0em, below: 0.4em, text(weight: "bold", body))
    } else {
      block(above: 0.8em, below: 0.3em, text(size: 11.5pt, body))
    }
  }
  set heading(numbering: none)

  doc
}

// 题目：手写题号，避免 Typst 把「1. 」当自动列表（会被 enum 编号改成 A.）
// 用悬挂缩进让折行与题干首字对齐。
#let q(n, body) = block(above: 0.75em, below: 0.25em, width: 100%)[
  #set par(hanging-indent: 1.9em, first-line-indent: 0em)
  #text[#n.]
  #h(0.5em)
  #body
]

// 选项：手写 A./B. 标号 + 任意内容（文字或代码块）
#let opt(label, body) = block(above: 0.08em, below: 0.08em, width: 100%)[
  #set par(hanging-indent: 1.75em, first-line-indent: 0em)
  #text[#label.]
  #h(0.55em)
  #body
]

// 题组小标题：时间/内存限制
// 两个参数缺省时 PDF 仍留一块空白（原卷那行是空的），但网页端没有任何文字，
// 留一个空 <div> 毫无意义，直接不输出。
#let limits(time: none, memory: none) = context {
  if target() == "html" and time == none and memory == none { return }
  block(above: 0.5em, below: 0.4em)[
    #text(size: 11.5pt, fill: luma(35%))[
      #if time != none [时间限制：#time]
      #if time != none and memory != none [　　]
      #if memory != none [内存限制：#memory]
    ]
  ]
}

// 公式回填失败时的标记
#let math-missing = text(fill: rgb("#C0392B"), size: 10pt)[〔公式待补〕]

// 答案空位。网页端 #h() 没有墨水会被丢弃，改用带下划线的 span。
#let slot = context {
  if target() == "html" {
    return html.elem("span", attrs: (class: "exam-blank", style: "width:2.2em"), [])
  }
  h(2.2em)
}

// 卷末说明
#let source-note(body) = block(above: 1.5em, below: 0.5em)[
  #text(size: 10pt, fill: luma(40%))[#body]
]
