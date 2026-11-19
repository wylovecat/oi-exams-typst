#!/usr/bin/env node
/**
 * 论文（题目知识构成分析报告）→ Typst
 *
 * 源材料是 CCF 官方发布的 Markdown（GFM 表格 + 哈希命名图片），不是 Typst。
 * 这里转成 Typst 源码，与真题/教材走同一套构建管线。
 *
 * pandoc 3.5 的 typst writer 有三处不合用，转换后要修：
 *   1. 每个标题后面会跟一行 `<标题>` 自动标签 —— 论文用不上，删掉
 *   2. 表格被包成 `#figure(align(center)[#table(...)])` —— align 在 HTML 导出里
 *      会连表格一起丢，改成裸 table
 *   3. 图注是 `#box(image("x.jpg")) 图1 说明` 的并列形式 —— 合成 figure(caption:)
 *
 * 用法：
 *   node scripts/typst/md2typ-papers.mjs            # 全部
 *   node scripts/typst/md2typ-papers.mjs --dry      # 只打印统计
 */
import { execFileSync } from "node:child_process";
import {
  existsSync,
  mkdirSync,
  readFileSync,
  readdirSync,
  statSync,
  writeFileSync,
} from "node:fs";
import { dirname, join, relative, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const HERE = dirname(fileURLToPath(import.meta.url));
const BLOG_ROOT = resolve(HERE, "../..");
const argv = process.argv.slice(2);
const DRY = argv.includes("--dry");

// 论文源目录（Knowledge 库的归档层，只读）
const SRC_ROOT = resolve(
  process.env.PAPERS_ROOT || "D:/Knowledge/04Archive/papers"
);
// Typst 产物写到真题工程下的 papers/，与 CSP/GESP 并列
const OUT_ROOT = resolve(
  process.env.PAPERS_OUT || "D:/aisichuang/0x0C00_真题整理/papers"
);
// 图片也要跟着搬进 Typst 工程，才满足 `--root` 不能越界
const IMG_SUBDIR = "images";

if (!existsSync(SRC_ROOT)) {
  console.error(`✗ 找不到论文源目录 ${SRC_ROOT}（可用 PAPERS_ROOT 覆盖）`);
  process.exit(1);
}

const log = (...a) => console.log(...a);

/** 找一个目录下的主 .md（排除 README） */
function mainMd(dir) {
  const mds = readdirSync(dir)
    .filter(f => f.endsWith(".md"))
    .sort((a, b) => statSync(join(dir, b)).size - statSync(join(dir, a)).size);
  return mds[0] || null;
}

/**
 * pandoc 的 GFM 读取器不认原始 HTML `<table>`，会整张丢弃。
 * 论文的表都是这种写法，所以先把 HTML 表换成「占位符 + Typst 表源码」，
 * 让 pandoc 只处理其余 Markdown，最后再把占位符替换回来。
 *
 * rowspan 的处理：Typst 没有单元格合并，把被合并的格子内容按行重复填入，
 * 视觉上等价（原表这一列本来就是同一个值）。
 */
function htmlTablesToTypst(md) {
  const tables = [];

  const expanded = md.replace(/<table>([\s\S]*?)<\/table>/g, (whole, inner) => {
    const rows = [];
    let carry = []; // 上一行 rowspan 下来、本行要补进前面的空位

    for (const tr of inner.match(/<tr>([\s\S]*?)<\/tr>/g) || []) {
      const cells = [];
      // 记录每个 cell 的 rowspan，供后续行补位
      const raw = [...tr.matchAll(/<(td|th)([^>]*)>([\s\S]*?)<\/\1>/g)];
      // 先处理本行从上继承下来的占位
      const pending = carry.slice();
      let col = 0;
      const out = [];
      for (const [, tag, attrs, body] of raw) {
        // 若有继承占位正压在这个位置，先把它铺出来
        while (pending.length && pending[0].col === col) {
          const p = pending.shift();
          out.push(p.text);
          col += 1;
        }
        const text = body.replace(/<[^>]+>/g, "").trim();
        const spanMatch = attrs.match(/rowspan="(\d+)"/);
        const span = spanMatch ? Number(spanMatch[1]) : 1;
        if (span > 1) {
          for (let k = 1; k < span; k += 1) carry.push({ col, text, left: k });
        }
        out.push(text);
        cells.push(text);
        col += 1;
      }
      while (pending.length) out.push(pending.shift().text);
      rows.push(out);
      // 本行的 carry 已经用掉一层，剩下的留给后续行
      carry = carry
        .map(c => ({ ...c, left: c.left - 1 }))
        .filter(c => c.left > 0);
    }

    if (!rows.length) return whole;

    const ncol = Math.max(...rows.map(r => r.length));
    const cells = rows
      .flatMap(r => {
        const padded = [...r];
        while (padded.length < ncol) padded.push("");
        return padded;
      })
      .map(t => `[${t.replace(/[[\]]/g, m => (m === "[" ? "\\[" : "\\]"))}]`)
      .join(", ");

    const cols = Array.from({ length: ncol }, () => "1fr").join(", ");
    const aligns = Array.from({ length: ncol }, () => "left + top").join(", ");
    const typst =
      `#figure(\n  table(\n    columns: (${cols}),\n` +
      `    inset: 4pt,\n    align: (${aligns}),\n` +
      `    stroke: 0.4pt + luma(70%),\n    ${cells}\n  ),\n  kind: table,\n)`;

    const key = `TYPSTTABLEPLACEHOLDER${tables.length}END`;
    tables.push(typst);
    return key;
  });

  return { md: expanded, tables };
}

/**
 * 把 `#box(image("x"))` 换成 figure，图注按路径从原始 Markdown 里取。
 * pandoc 的 typst writer 会丢弃 alt 文本，事后接不回来，所以只能另存一份映射。
 */
function mergeFigureCaptions(src, captions) {
  return src.replace(/#box\(image\("([^"]+)"\)\)/g, (whole, path) => {
    const cap = captions.get(path);
    return cap
      ? `#figure(image("${path}"), caption: [${cap}])`
      : `#figure(image("${path}"))`;
  });
}

/**
 * pandoc GFM → Typst，再做若干修正。
 * 注意 typst 里 `;` 是语句终止符，pandoc 给 `#strong[x]` 后面补的 `;` 会被吞掉，无害。
 */
function convert(mdText) {
  // 1. 图注：pandoc 的 typst writer 会丢弃 alt 文本（只写 `#box(image(...))`），
  //    所以图注必须从原始 Markdown 里另取一份，事后按图片顺序配对。
  //    源格式是「![](images/x.jpg)␣␣\n图1 说明」——图注在下一行。
  //    取完要把那行从 Markdown 里删掉，否则它还会作为正文段落再出现一遍。
  const captions = new Map();
  let mdSrc = mdText;
  for (const m of mdText.matchAll(
    /!\[\]\((images\/[^)]+)\)[ \t]*\n[ \t]*\n?(图[^\n]*?)[ \t]*(?:\n|$)/g
  )) {
    captions.set(m[1], m[2].trim());
    // 整段（图片行 + 图注行）替换成只有图片行
    mdSrc = mdSrc.replace(m[0], `![](${m[1]})\n\n`);
  }

  let { md, tables } = htmlTablesToTypst(mdSrc);

  const raw = execFileSync(
    "pandoc",
    ["-f", "gfm", "-t", "typst"],
    { input: md, encoding: "utf8", maxBuffer: 32 * 1024 * 1024 }
  );

  let s = raw;

  // 1. 删掉 pandoc 生成的自动标签行（`<报告标题>`、`<1-社团招新club>` 这种单独一行）
  s = s.replace(/^<[^<>\n]*>$/gm, "");

  // 2. pandoc 用 `\` 表示硬换行（Markdown 的两个空格 + 换行）。单独成行或行尾的
  //    `\` 在 Typst 里会产生真实换行，语义上只是原稿的排版换行，去掉。
  s = s.replace(/\\[ \t]*$/gm, "");
  s = s.replace(/^[ \t]*\\[ \t]*$/gm, "");

  // 3. 图片 + 紧跟其后的图注文字 → figure(caption: ...)
  //    pandoc 的 typst writer 不写 alt，只输出 `#box(image("..."))`，
  //    图注是它后面最近的、以「图」开头的非空行（中间常隔一个空行）。
  //    按行扫而不是正则，空行/多空行的差异都不用管。
  s = mergeFigureCaptions(s, captions);

  // 4. 表格占位符换回真表
  s = s.replace(/TYPSTTABLEPLACEHOLDER(\d+)END/g, (whole, i) => tables[Number(i)] || "");

  // 5. 连续空行压成一行
  s = s.replace(/\n{3,}/g, "\n\n");
  return s.trimStart();
}

// ----------------------------- 遍历 ----------------------------------------
const papers = readdirSync(SRC_ROOT, { withFileTypes: true })
  .filter(d => d.isDirectory())
  .map(d => d.name)
  .sort();

const results = [];
const problems = [];

for (const name of papers) {
  const dir = join(SRC_ROOT, name);
  const mdName = mainMd(dir);
  if (!mdName) continue;

  const mdText = readFileSync(join(dir, mdName), "utf8");
  const typst = convert(mdText);
  const imgDir = join(dir, IMG_SUBDIR);
  const imgCount = existsSync(imgDir) ? readdirSync(imgDir).length : 0;

  // 产物目录名：<系列>-<年份>-<组别>，如 csp-s-2025-senior / noip-2023
  // 源目录名形如 CSP-JS2025第二轮提高级-…、NOIP2023-…
  const m = name.match(/^(CSP|NOIP)(?:-JS|-J|-S|)-?(\d{4})/);
  const year = m ? m[2] : "";
  const series = !m ? "paper" : m[1] === "NOIP" ? "noip" : "csp";
  const grade = /入门级/.test(name)
    ? "junior"
    : /提高级/.test(name)
      ? "senior"
      : "";
  const slug = [series, year, grade].filter(Boolean).join("-").toLowerCase();

  // 引用到的图是否都在
  const used = [...typst.matchAll(/image\("images\/([^"]+)"\)/g)].map(t => t[1]);
  const missing = used.filter(f => !existsSync(join(imgDir, f)));
  if (missing.length) problems.push(`${name}: 缺图 ${missing.slice(0, 3).join(",")}`);

  results.push({
    name,
    slug: slug || `paper-${results.length + 1}`,
    mdName,
    typst,
    imgCount,
    images: used,
    usedImgs: used.length,
    chars: mdText.length,
    srcFile: join(dir, mdName),
  });
}

log(`源目录 : ${SRC_ROOT}`);
log(`产物   : ${OUT_ROOT}`);
log(`论文数 : ${results.length}\n`);

for (const r of results) {
  log(
    `  ${r.slug.padEnd(22)} ${(r.chars / 1000).toFixed(1)}k 字 / ` +
      `引用图 ${r.usedImgs}（目录内 ${r.imgCount}）`
  );
}

if (problems.length) {
  log(`\n⚠ ${problems.length} 处图片缺失：`);
  for (const p of problems) log(`  - ${p}`);
}

if (DRY) process.exit(problems.length ? 1 : 0);

// ----------------------------- 落盘 ----------------------------------------
mkdirSync(OUT_ROOT, { recursive: true });

for (const r of results) {
  const outDir = join(OUT_ROOT, r.slug);
  mkdirSync(outDir, { recursive: true });

  // 图片：只复制正文真正引用的。源目录里的其余图片是入库时留下的冗余
  // （2024-senior 目录 10 张、正文只引用 2 张），不往仓库里搬。
  const srcImg = join(SRC_ROOT, r.name, IMG_SUBDIR);
  if (existsSync(srcImg)) {
    const dstImg = join(outDir, IMG_SUBDIR);
    mkdirSync(dstImg, { recursive: true });
    for (const f of r.images) {
      const from = join(srcImg, f);
      if (existsSync(from)) writeFileSync(join(dstImg, f), readFileSync(from));
    }
  }

  // 正文首行加一行注释，标明出处（4Archive 是只读事实来源）
  const header =
    `// 由 scripts/typst/md2typ-papers.mjs 从 pandoc 生成；勿手改，改 Markdown 源后重跑。\n` +
    `// 源：${relative(SRC_ROOT, r.srcFile).replace(/\\/g, "/")}\n\n`;
  writeFileSync(join(outDir, "index.typ"), header + r.typst);

  // 单篇的编译外壳：与教材/真题共用题库模板
  writeFileSync(
    join(outDir, "web.typ"),
    `#import "/_typst/paper.typ": *\n\n#show: doc => paper(\n  title: ${JSON.stringify(
      r.name.replace(/-题目知识构成分析报告$/, "")
    )},\n  doc,\n)\n\n#include "index.typ"\n`
  );
}

writeFileSync(
  join(OUT_ROOT, "manifest.json"),
  JSON.stringify(
    results.map(r => ({
      slug: r.slug,
      name: r.name,
      chars: r.chars,
      images: r.usedImgs,
      src: relative("D:/Knowledge", r.srcFile).replace(/\\/g, "/"),
    })),
    null,
    2
  )
);

log(`\n✓ ${results.length} 篇已转换到 ${OUT_ROOT}`);
if (problems.length) process.exit(1);
