#import "@preview/numbly:0.1.0":numbly
#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold
#let conf(
  course: "默认课程",
  title: "默认标题",
  date: "默认日期",
  doc,
)={
  //设置代码块行号
  show raw.where(block: true): code => {
    grid(
      columns: (auto, auto,auto),
      column-gutter: 1em,
      grid.vline(stroke: 0.5pt, x: 1),
      
      row-gutter: par.leading,
      align: (left, raw.align),
      ..for line in code.lines {
        (
          text(fill: gray)[#line.number],[],line.body,
        )
      },
    )
    
  }
  // 设置页面基本样式
  set page(
    paper: "a4",
    margin: 2cm,
    // numbering: "1",
    header: [
      #line(
        length: 100%,
        stroke: 1pt,
      )

    ],
    footer: context [
      #set align(center)
      #set text(13pt)
      #counter(page).display(
        "第1页,共 1 页",
        both: true,
      )
    ]
    // footer:  align(center)[第 #page-number 页 共 #page-count 页]
    
  )
  set text(
    font: (
      (name: "fira code", covers: "latin-in-cjk"), // 西文字体
      "LXGW WenKai" // 中文字体
    ), 
    size: 14pt,
    lang: "zh"
  )


  align(
    center,
    text(19pt)[
    *#course*
    ]
  )
  align(
    center,
    text(18pt)[
    #title 
    ]
  )
  align(
    center,
    text(14pt)[
    时间：#date 
    ]
  )
  align(
    left,
    text(14pt)[
    *注意事项（请仔细阅读）*

    1. 试题纸共有#context counter(page).final().first()页，答题纸共有1页，满分100分。请在答题纸上作答，写在试题纸上的一律无效。
    2. 不得使用任何电子设备（如计算器、手机、电子词典等）或查阅任何书籍资料。
    ]
  )

  set heading(numbering: numbly(
    "{1:一}、",
    "({2:1})"
  ))
  columns(1,doc)
}