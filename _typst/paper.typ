// ===========================================================================
// 论文 / 报告版式库（题目知识构成分析报告一类）
//
// 用法：
//   cd 0x0c00_真题整理
//   typst compile --root . papers/csp-2025-senior/web.typ out.pdf
//
// 正文写法（web.typ 已封好，一般不用直接调）：
//   #import "/_typst/paper.typ": *
//   #show: doc => paper(title: "CSP-S2025 第二轮提高级题目知识构成分析报告", doc)
//   #include "index.typ"
//
// 与 exam.typ / gesp.typ 的区别：这是长文档（10 万字级别），版式目标是「好读」而不是
// 「还原原卷」——窄行距、章节间距、表格铺满版心、图片等比缩放。
// ===========================================================================

#import "@preview/cuti:0.2.1": show-cn-fakebold

#let font-latin = (name: "Times New Roman", covers: "latin-in-cjk")
#let font-cjk = "FZShuSong-Z01"
#let font-hei = "FZHei-B01"
#let size-body = 11pt
#let size-title = 17pt

// ------------------------------ 双目标支持 ---------------------------------
// HTML 导出会把 align() / grid() / rect() / place() 连同内容一起丢掉；
// 表格在 pandoc 产物里正是被 align(center) 包着的，必须分叉。
#let web-div(class, body) = html.elem("div", attrs: (class: class), body)
#let is-web() = context target() == "html"

// ------------------------------ 主函数 -------------------------------------
#let paper(
  title: "题目知识构成分析报告",
  subtitle: none,
  doc,
) = {
  // 伪粗体只对 PDF 有意义（方正宋体没有真 Bold）
  show: it => context {
    if target() == "html" { it } else { show-cn-fakebold(it) }
  }

  // 代码块：论文里几乎没有代码，但 pandoc 会把行内代码转成 raw，
  // 万一有围栏也不要在 HTML 里被 grid 吃掉。
  show raw.where(block: true): code => context {
    if target() == "html" { return code }
    block(
      fill: rgb("#F7F7F5"),
      stroke: 0.5pt + luma(75%),
      inset: 8pt,
      radius: 2pt,
      width: 100%,
    )[#code]
  }
  show raw.where(block: false): it => context {
    if target() == "html" { return it }
    text(font: "Sarasa Mono SC", fill: rgb("#1F4E9C"), size: 0.94em, it)
  }

  set page(
    paper: "a4",
    margin: (x: 2.4cm, y: 2.2cm),
    header: none,
    footer: context {
      set align(center)
      set text(size: 9pt, fill: luma(45%))
      counter(page).display("1 / 1", both: true)
    },
  )
  set text(font: (font-latin, font-cjk), size: size-body, lang: "zh")
  set text(ligatures: false)
  set par(justify: true, leading: 1.15em, spacing: 1.0em, first-line-indent: 2em)

  // 标题：一级居中当章节大标题，其余左对齐带编号
  show heading: it => block(above: 1.5em, below: 0.6em, it)
  show heading.where(level: 1): it => context {
    if target() == "html" { return it }
    block(above: 2em, below: 0.9em, align(center, text(size-title, weight: "bold", it)))
  }
  show heading.where(level: 2): it => context {
    if target() == "html" { return it }
    block(above: 1.6em, below: 0.6em, text(size: 13.5pt, weight: "bold", it))
  }
  show heading.where(level: 3): it => context {
    if target() == "html" { return it }
    block(above: 1.2em, below: 0.5em, text(size: 12pt, weight: "bold", it))
  }
  show heading.where(level: 4): it => context {
    if target() == "html" { return it }
    block(above: 1em, below: 0.4em, text(size: 11pt, weight: "bold", it))
  }

  // 表格：铺满版心。pandoc 产出的 columns: N 用 auto 会让窄列挤成一团。
  show table: set text(size: 9pt)
  show table: set par(justify: false, first-line-indent: (amount: 0em, all: true))
  show table: set table(inset: (x: 5pt, y: 4pt), stroke: 0.4pt + luma(70%))
  show table.cell.where(y: 0): set text(weight: "bold")

  // 图：等比缩放，居中，图注在下方。
  // 图注要用 html.elem 包成 <figcaption>：用 block() 会退化成 <div>，语义就没了。
  show figure: set block(above: 0.9em, below: 1em, breakable: false)
  show figure: set align(center)
  set figure(numbering: none)
  show figure.caption: it => context {
    if target() == "html" {
      html.elem("figcaption", text(size: 9.5pt, fill: luma(40%), it.body))
    } else {
      block(above: 0.4em)[#text(size: 9.5pt, fill: luma(40%))[#it.body]]
    }
  }

  // 卷头。论文没有封面，标题与副标题直接放正文顶部。
  context if target() == "html" {
    web-div("paper-head", [
      #web-div("paper-head-title", title)
      #if subtitle != none { web-div("paper-head-sub", subtitle) }
    ])
  } else {
    align(center, text(size: size-title + 2pt, weight: "bold")[#title])
    if subtitle != none {
      align(center, text(size: size-title - 5pt, fill: luma(35%))[#subtitle])
    }
    v(0.6em)
  }

  doc
}
