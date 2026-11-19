// ===========================================================================
// figs.typ — CSP 第一轮真题里缺失插图的 Typst（cetz）重绘
//
// 原卷的这些图是矢量图形，PDF 抽不出位图，`#figure-missing` 占位后在此重画。
// 每张图都按原卷的节点位置/边方向/权值逐条核对过，改坐标请同时核对答案。
//
// 用法（在试卷 .typ 里）：
//   #import "/_typst/figs.typ": fig-csp-2021s1-q15
//   ...
//   #fig-csp-2021s1-q15()
// ===========================================================================

#import "@preview/cetz:0.3.4"

#let node-radius = 0.36
#let node-size = 10.5pt
#let edge-size = 9.5pt
#let stroke-w = 0.9pt

// 网页目标下的画布包装。
// cetz 直接放在 HTML 导出里会静默消失（既不出 SVG 也不报错），
// 必须用 html.frame() 把它转成内联 SVG；box 负责给出确定宽度，
// 否则 frame 会按 0 宽布局，图被压成一条线。
#let cetz-figure(width, body) = context {
  if target() == "html" {
    html.elem("figure", html.frame(box(width: width, body)))
  } else {
    block(width: width, body)
  }
}

// 一张图的公共画布：给定节点表与边表，自动留出箭头间隙、画白底标签。
//
// nodes: ((name, (x, y)), ...)
// edges: ((from, to, label, frac, offset), ...)
//        frac   —— 标签在边上的位置（0=起点, 1=终点），默认 0.5
//        offset —— 标签相对该点的额外位移（cetz 单位），用于避开交叉
#let graph(
  nodes: (),
  edges: (),
  width: 12cm,
  radius: node-radius,
) = cetz-figure(width, cetz.canvas({
  import cetz.draw: *

  let pos = (:)
  for (name, p) in nodes { pos.insert(name, p) }

  // ---- 先画边（在节点下层）----
  for (a, b, lab, frac, off) in edges {
    let pa = pos.at(a)
    let pb = pos.at(b)
    let d = (pb.at(0) - pa.at(0), pb.at(1) - pa.at(1))
    let len = calc.sqrt(d.at(0) * d.at(0) + d.at(1) * d.at(1))
    let u = (d.at(0) / len, d.at(1) / len)
    // 两端各让出一个节点半径 + 箭头长度，避免箭头扎进圆里
    let start = (pa.at(0) + u.at(0) * radius, pa.at(1) + u.at(1) * radius)
    let end = (pb.at(0) - u.at(0) * (radius + 0.06), pb.at(1) - u.at(1) * (radius + 0.06))
    line(start, end, stroke: stroke-w, mark: (end: "straight", fill: black, scale: .5))

    if lab != none {
      // frac 给数字 → 按比例取边上的点；给 (x, y) → 直接当绝对坐标用
      // （交叉密集的图用绝对坐标摆标签更稳，也贴近原卷的排布）
      let lp = if type(frac) == array {
        frac
      } else {
        let f = if frac == auto { 0.5 } else { frac }
        let o = if off == auto { (0, 0) } else { off }
        (pa.at(0) + d.at(0) * f + o.at(0), pa.at(1) + d.at(1) * f + o.at(1))
      }
      // 白底小块垫在标签下，边线穿过来时不干扰读数。
      // 不用 content(fill:…) —— cetz 0.3.4 里那样会把字也刷白。
      let half-w = 0.055 + 0.052 * lab.len()
      rect(
        (lp.at(0) - half-w, lp.at(1) - 0.085),
        (lp.at(0) + half-w, lp.at(1) + 0.085),
        fill: white, stroke: none,
      )
      content(lp, text(size: edge-size)[#lab])
    }
  }

  // ---- 再画节点 ----
  for (name, p) in nodes {
    circle(p, radius: radius, stroke: stroke-w, fill: white)
    content(p, text(size: node-size)[#name])
  }
}))

// ---------------------------------------------------------------------------
// 2021 CSP-S 第一轮 第 15 题：A→J 带权有向图，求 A 到 J 的最短路径
// 20 条边，权值逐条比对原卷；最短路径 A→C→E→H→J = 5+6+3+5 = 19（选项 B）
// ---------------------------------------------------------------------------
#let fig-csp-2021s1-q15(width: 15.2cm) = graph(
  nodes: (
    ("A", (0.00, 2.10)),
    ("B", (2.15, 3.95)),
    ("C", (2.15, 2.10)),
    ("D", (2.15, 0.25)),
    ("E", (5.15, 4.00)),
    ("F", (5.15, 2.10)),
    ("G", (5.15, 0.30)),
    ("H", (7.90, 3.15)),
    ("I", (7.90, 1.10)),
    ("J", (10.30, 2.10)),
  ),
  edges: (
    ("A", "B", "2", (1.02, 3.16), auto),
    ("A", "C", "5", (1.30, 2.28), auto),
    ("A", "D", "1", (1.02, 1.02), auto),
    ("B", "E", "12", (3.62, 4.14), auto),
    ("B", "F", "10", (2.92, 3.52), auto),
    ("B", "G", "14", (3.12, 3.08), auto),
    ("C", "E", "6", (3.52, 3.44), auto),
    ("C", "F", "10", (3.78, 2.28), auto),
    ("C", "G", "4", (2.92, 1.66), auto),
    ("D", "E", "13", (2.76, 0.96), auto),
    ("D", "F", "12", (3.82, 1.10), auto),
    ("D", "G", "11", (3.72, 0.16), auto),
    ("E", "H", "3", (6.52, 3.72), auto),
    ("E", "I", "9", (6.26, 2.86), auto),
    ("F", "H", "6", (6.60, 2.62), auto),
    ("F", "I", "5", (6.74, 1.72), auto),
    ("G", "H", "8", (6.20, 1.28), auto),
    ("G", "I", "10", (6.92, 0.72), auto),
    ("H", "J", "5", (9.16, 2.76), auto),
    ("I", "J", "2", (9.16, 1.48), auto),
  ),
  width: width,
)

// ---------------------------------------------------------------------------
// 2023 CSP-S 第一轮 第 13 题：6 顶点有向图（无拓扑序）
// 边：2→5、3→5、2→6、5→6、3→4、1→5、1→3、1→6、4→1（9 条）
// 唯一环是 1→3→4→1，故删 1→3 / 3→4 / 4→1 任一条都可拓扑排序 → 3 条（选项 C）
// ---------------------------------------------------------------------------
#let fig-csp-2023s1-q13(width: 10.4cm) = graph(
  nodes: (
    ("2", (0.65, 2.62)),
    ("5", (3.05, 2.78)),
    ("3", (5.45, 2.62)),
    ("6", (1.35, 0.92)),
    ("1", (3.15, 1.05)),
    ("4", (5.35, 0.95)),
  ),
  edges: (
    ("2", "5", none, auto, auto),
    ("3", "5", none, auto, auto),
    ("2", "6", none, auto, auto),
    ("5", "6", none, auto, auto),
    ("3", "4", none, auto, auto),
    ("1", "5", none, auto, auto),
    ("1", "3", none, auto, auto),
    ("1", "6", none, auto, auto),
    ("4", "1", none, auto, auto),
  ),
  width: width,
)

// ---------------------------------------------------------------------------
// 2024 CSP-S 第一轮 第 15 题：7 顶点有向图（删最少边使 1 到 7 不可达）
// 边：1→2、1→4、1→3、2→5、2→4、3→4、4→6、6→5、6→7、5→7（10 条）
// ---------------------------------------------------------------------------
#let fig-csp-2024s1-q15(width: 11.2cm) = graph(
  nodes: (
    ("1", (0.60, 2.05)),
    ("2", (2.55, 3.12)),
    ("3", (2.05, 0.78)),
    ("4", (3.55, 2.05)),
    ("5", (5.95, 3.02)),
    ("6", (5.95, 1.05)),
    ("7", (7.95, 2.05)),
  ),
  edges: (
    ("1", "2", none, auto, auto),
    ("1", "4", none, auto, auto),
    ("1", "3", none, auto, auto),
    ("2", "5", none, auto, auto),
    ("2", "4", none, auto, auto),
    ("3", "4", none, auto, auto),
    ("4", "6", none, auto, auto),
    ("6", "5", none, auto, auto),
    ("6", "7", none, auto, auto),
    ("5", "7", none, auto, auto),
  ),
  width: width,
)


// ---------------------------------------------------------------------------
// 2020 CSP-J 第一轮 第 11 题：五个栈状态图（压入 A / 压入 B / 弹出 B / 压入 C）
// 答案：栈（A）
// ---------------------------------------------------------------------------
#let fig-csp-2020j1-q11(width: 15.4cm) = cetz-figure(width, cetz.canvas({
  import cetz.draw: *

  let bw = 0.78
  let bh = 1.42
  let dy = 0.0
  let xs = (0.0, 2.72, 5.44, 8.16, 10.88)
  // 每格的内容（自下而上）：空 → A → A,B → A → A,C
  let stacks = (
    (),
    ("A",),
    ("A", "B"),
    ("A",),
    ("A", "C"),
  )
  let labels = ("压入 A", "压入 B", "弹出 B", "压入 C")

  for (k, x) in xs.enumerate() {
    rect((x - bw / 2, dy), (x + bw / 2, dy + bh), stroke: .9pt, fill: white)
    // 三条横向分隔线（四格）
    for c in (0.25, 0.5, 0.75) {
      line((x - bw / 2, dy + bh * c), (x + bw / 2, dy + bh * c), stroke: .7pt)
    }
    let items = stacks.at(k)
    for (i, ch) in items.enumerate() {
      content((x, dy + 0.18 + i * (bh / 4)), text(size: 10pt)[#ch])
    }
  }

  for (k, lab) in labels.enumerate() {
    let x0 = xs.at(k) + bw / 2
    let x1 = xs.at(k + 1) - bw / 2
    line((x0 + 0.08, dy + 0.42), (x1 - 0.06, dy + 0.42),
      stroke: 2.2pt, mark: (end: "straight", fill: black, scale: .45))
    // 标签在箭头正上方，避免与箭头重叠
    content(((x0 + x1) / 2, dy + 0.66), text(size: 9pt)[#lab])
  }
}))

// ---------------------------------------------------------------------------
// 2019 CSP-J 第一轮 第 8 题：顺序存储的二叉树（问数组最大下标）
// 6 个结点，无标注；根 1，左孩子 2，右孩子 3；3 的左孩子 6、右孩子 7；
// 7 的右孩子 15 —— 最大下标 15（选项 C）。
#let fig-csp-2019j1-q8(width: 6.2cm) = cetz-figure(width, cetz.canvas({
  import cetz.draw: *

  let r = 0.24
  let p1 = (0, 0)
  let p2 = (-1.45, -1.0)
  let p3 = (1.05, -1.0)
  let p6 = (0.42, -2.0)
  let p7 = (1.72, -2.0)
  let p15 = (2.4, -3.0)

  for (a, b) in ((p1, p2), (p1, p3), (p3, p6), (p3, p7), (p7, p15)) {
    let d = (b.at(0) - a.at(0), b.at(1) - a.at(1))
    let len = calc.sqrt(d.at(0) * d.at(0) + d.at(1) * d.at(1))
    let u = (d.at(0) / len, d.at(1) / len)
    line((a.at(0) + u.at(0) * r, a.at(1) + u.at(1) * r),
         (b.at(0) - u.at(0) * r, b.at(1) - u.at(1) * r), stroke: stroke-w)
  }
  for p in (p1, p2, p3, p6, p7, p15) {
    circle(p, radius: r, stroke: stroke-w, fill: white)
  }
}))

// ---------------------------------------------------------------------------
// 2019 CSP-S 第一轮 第 15 题：数字三角形（原卷为扫描图的符号示意图）
// 只画前三行与末行的位置关系，中间用省略号；每行结点各有左下、右下两条边。
#let fig-csp-2019s1-q15(width: 8.6cm) = cetz-figure(width, cetz.canvas({
  import cetz.draw: *

  let p11 = (0, 0)
  let p21 = (-0.78, -0.8)
  let p22 = (0.78, -0.8)
  let p31 = (-1.42, -1.6)
  let p32 = (0, -1.6)
  let p33 = (1.42, -1.6)

  for (a, b) in ((p11, p21), (p11, p22),
                 (p21, p31), (p21, p32), (p22, p32), (p22, p33)) {
    line(a, b, stroke: stroke-w)
  }
  // 三级往下引入省略号，再落到末行
  line((p31.at(0), p31.at(1) - 0.12), (p31.at(0) - 0.18, -2.05), stroke: stroke-w)
  line((p33.at(0), p33.at(1) - 0.12), (p33.at(0) + 0.18, -2.05), stroke: stroke-w)

  let ts = 9.5pt
  // 标签压在顶点上，先用白底小块遮住边线，避免斜线穿过文字
  let lab(p, body) = {
    rect((p.at(0) - 0.34, p.at(1) - 0.10), (p.at(0) + 0.34, p.at(1) + 0.13),
         fill: white, stroke: none)
    content(p, text(size: ts)[#body])
  }
  lab(p11, [$a_(1,1)$])
  lab(p21, [$a_(2,1)$])
  lab(p22, [$a_(2,2)$])
  lab(p31, [$a_(3,1)$])
  lab(p32, [$a_(3,2)$])
  lab(p33, [$a_(3,3)$])

  content((0, -2.25), text(size: ts)[$dots.v dots.v dots.v$])
  content((-1.6, -2.95), text(size: ts)[$a_(n,1)$])
  content((-0.72, -2.95), text(size: ts)[$a_(n,2)$])
  content((0, -2.95), text(size: ts)[$dots.h dots.h dots.h$])
  content((1.6, -2.95), text(size: ts)[$a_(n,n)$])
}))
