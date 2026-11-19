// ===========================================================================
// 2019J1 —— 2019 CCF 非专业级别软件能力认证第一轮
// 由 _build/md2typ_csp.py 从 /home/wyao/Nutstore Files/aisichuang/0x0c00_真题整理/_build/raw/2019J1.md 生成，人工补丁见 _build/patch_manual.py
// 编译：typst compile --root . CSP-J_S/Round1/2019/2019J1.typ
// ===========================================================================
#import "/_typst/exam.typ": *
#import "/_typst/figs.typ": fig-csp-2019j1-q8

#show: doc => exam(
  serial: "2019J1",
  course: "2019 CCF 非专业级别软件能力认证第一轮",
  title: "（CSP-J1）入门级 C++ 语言试题 A 卷",
  date: "2019 年 10 月 19 日 14:30 ~ 16:30",
  doc,
)

= 单项选择题

1. 中国的国家顶级域名是（#h(2.6em)）
  + .cn
  + .ch
  + .chn
  + .china
2. 二进制数 11 1011 1001 0111 和 01 0110 1110 1011 进行逻辑与运算的结果是（#h(2.6em)）。
  + 01 0010 1000 1011
  + 01 0010 1001 0011
  + 01 0010 1000 0001
  + 01 0010 1000 0011
3. 一个 32 位整型变量占用（#h(2.6em)）个字节。
  + 32
  + 128
  + 4
  + 8
4. 若有如下程序段，其中 $s$、$a$、$b$、$c$ 均已定义为整型变量，且 $a$、$c$ 均已赋值（$c$ 大于 0）

  ```cpp
  s = a;
  for (b = 1; b <= c; b++) s = s - 1;
  ```

  则与上述程序段功能等价的赋值语句是（#h(2.6em)）
  + s = a - c;
  + s = a - b;
  + s = s - c;
  + s = b - c;
5. 设有 100 个已排好序的数据元素，采用折半查找时，最大比较次数为（#h(2.6em)）
  + 7
  + 10
  + 6
  + 8
6. 链表不具有的特点是（#h(2.6em)）
  + 插入删除不需要移动元素
  + 不必事先估计存储空间
  + 所需空间与线性表长度成正比
  + 可随机访问任一元素
7. 把 8 个同样的球放在 5 个同样的袋子里，允许有的袋子空着不放，问共有多少种不同的分法？（#h(2.6em)）提示：如果 8 个球都放在一个袋子里，无论是哪个袋子，都只算同一种分法。
  + 22
  + 24
  + 18
  + 20
8. 一棵二叉树如右图所示，若采用顺序存储结构，即用一维数组元素存储该二叉树中的结点（根结点的下标为 1，若某结点的下标为 $i$，则其左孩子位于下标 $2 i$ 处、右孩子位于下标 $2 i+1$ 处），则该数组的最大下标至少为（#h(2.6em)）。

  #fig-csp-2019j1-q8()
  + 6
  + 10
  + 15
  + 12
9. 100 以内最大的素数是（#h(2.6em)）。
  + 89
  + 97
  + 91
  + 93
10. 319 和 377 的最大公约数是（#h(2.6em)）。
  + 27
  + 33
  + 29
  + 31
11. 新学期开学了，小胖想减肥，健身教练给小胖制定了两个训练方案。方案一：每次连续跑 3 公里可以消耗 300 千卡（耗时半小时）；方案二：每次连续跑 5 公里可以消耗 600 千卡（耗时 1 小时）。小胖每周周一到周四能抽出半小时跑步，周五到周日能抽出一小时跑步。另外，教练建议小胖每周最多跑 21 公里，否则会损伤膝盖。请问如果小胖想严格执行教练的训练方案，并且不想损伤膝盖，每周最多通过跑步消耗多少千卡？（#h(2.6em)）
  + 3000
  + 2500
  + 2400
  + 2520
12. 一副纸牌除掉大小王有 52 张牌，四种花色，每种花色 13 张。假设从这 52 张牌中随机抽取 13 张纸牌，则至少（#h(2.6em)）张牌的花色一致。
  + 4
  + 2
  + 3
  + 5
13. 一些数字可以颠倒过来看，例如 0、1、8 颠倒过来还是本身，6 颠倒过来是 9，9 颠倒过来看还是 6，其他数字颠倒过来都不构成数字。类似的，一些多位数也可以颠倒过来看，比如 106 颠倒过来是 901。假设某个城市的车牌只由 5 位数字组成，每一位都可以取 0 到 9。请问这个城市最多有多少个车牌倒过来恰好还是原来的车牌？（#h(2.6em)）
  + 60
  + 125
  + 75
  + 100
14. 假设一棵二叉树的后序遍历序列为 DGJHEBIFCA，中序遍历序列为 DBGEHJACIF，则其前序遍历序列为（#h(2.6em)）。
  + ABCDEFGHIJ
  + ABDEGHJCFI
  + ABDEGJHCFI
  + ABDEGHJFIC
15. 以下哪个奖项是计算机科学领域的最高奖？（#h(2.6em)）
  + 图灵奖
  + 鲁班奖
  + 诺贝尔奖
  + 普利策奖
= 阅读程序

（程序输入不超过数组或字符串定义的范围；判断题正确填 √，错误填 ×；除特殊说明外，判断题 1.5 分，选择题 3 分，共计 40 分）

#heading(level: 2)[]


```cpp
#include <cstdio>
#include <cstring>
using namespace std;
char st[100];
int main() {
    scanf("%s", st);
    int n = strlen(st);
    for (int i = 1; i <= n; ++i) {
        if (n % i == 0) {
            char c = st[i - 1];
            if (c >= 'a')
                st[i - 1] = c - 'a' + 'A';
        }
    }
    printf("%s", st);
    return 0;
}
```

#grouplabel[判断题]

16. 输入的字符串只能由小写字母或大写字母组成。（#h(2.6em)）
17. 若将第 8 行的“i = 1”改为“i = 0”，程序运行时会发生错误。（#h(2.6em)）
18. 若将第 8 行的“i #(sym.lt)= n”改为“i #"*"  i #(sym.lt)= n”，程序运行结果不会改变。（#h(2.6em)）
19. 若输入的字符串全部由大写字母组成，那么输出的字符串就跟输入的字符串一样。（#h(2.6em)）
#grouplabel[选择题]

20. 若输入的字符串长度为 18，那么输入的字符串跟输出的字符串相比，至多有（#h(2.6em)）个字符不同。
  + 18
  + 6
  + 10
  + 1
21. 若输入的字符串长度为（#h(2.6em)），那么输入的字符串跟输出的字符串相比，至多有 36 个字符不同。
  + 36
  + 100000
  + 1
  + 128
#heading(level: 2)[]


```cpp
#include <cstdio>
using namespace std;
int n, m;
int a[100], b[100];

int main() {
    scanf("%d%d", &n, &m);
    for (int i = 1; i <= n; ++i)
        a[i] = b[i] = 0;
    for (int i = 1; i <= m; ++i) {
        int x, y;
        scanf("%d%d", &x, &y);
        if (a[x] < y && b[y] < x) {
            if (a[x] > 0)
                b[a[x]] = 0;
            if (b[y] > 0)
                a[b[y]] = 0;
            a[x] = y;
            b[y] = x;
        }
    }
    int ans = 0;
    for (int i = 1; i <= n; ++i) {
        if (a[i] == 0)
            ++ans;
        if (b[i] == 0)
            ++ans;
    }
    printf("%d\n", ans);
    return 0;
}
```

假设输入的 $n$ 和 $m$ 都是正整数，$x$ 和 $y$ 都是在 $[1, n]$ 的范围内的整数，完成下面的判断题和单选题：

#grouplabel[判断题]

22. 当 $m gt 0$ 时，输出的值一定小于 $2 n$。（#h(2.6em)）
23. 执行完第 27 行的“++ans”时，$a n s$ 一定是偶数。（#h(2.6em)）
24. $a[i]$ 和 $b[i]$ 不可能同时大于 0。（#h(2.6em)）
25. 若程序执行到第 13 行时，$x$ 总是小于 $y$，那么第 15 行不会被执行。（#h(2.6em)）
#grouplabel[选择题]

26. 若 $m$ 个 $x$ 两两不同，且 $m$ 个 $y$ 两两不同，则输出的值为（#h(2.6em)）
  + $2 n-2 m$
  + $2 n+2$
  + $2 n-2$
  + $2 n$
27. 若 $m$ 个 $x$ 两两不同，且 $m$ 个 $y$ 都相等，则输出的值为（#h(2.6em)）
  + $2 n-2$
  + $2 n$
  + $2 m$
  + $2 n-2 m$
#heading(level: 2)[]


```cpp
#include <iostream>
using namespace std;
const int maxn = 10000;
int n;
int a[maxn];
int b[maxn];
int f(int l, int r, int depth) {
    if (l > r)
        return 0;
    int min = maxn, mink;
    for (int i = l; i <= r; ++i) {
        if (min > a[i]) {
            min = a[i];
            mink = i;
        }
    }
    int lres = f(l, mink - 1, depth + 1);
    int rres = f(mink + 1, r, depth + 1);
    return lres + rres + depth * b[mink];
}
int main() {
    cin >> n;
    for (int i = 0; i < n; ++i)
        cin >> a[i];
    for (int i = 0; i < n; ++i)
        cin >> b[i];
    cout << f(0, n - 1, 1) << endl;
    return 0;
}
```

#grouplabel[判断题]

28. 如果 $a$ 数组有重复的数字，则程序运行时会发生错误。（#h(2.6em)）
29. 如果 $b$ 数组全为 0，则输出为 0。（#h(2.6em)）
#grouplabel[选择题]

30. 当 $n=100$ 时，最坏情况下，与第 12 行的比较运算执行的次数最接近的是：（#h(2.6em)）。
  + 5000
  + 600
  + 6
  + 100
31. 当 $n=100$ 时，最好情况下，与第 12 行的比较运算执行的次数最接近的是：（#h(2.6em)）。
  + 100
  + 6
  + 5000
  + 600
32. 当 $n=10$ 时，若 $b$ 数组满足，对任意 $0 ≤ i lt n$，都有 $b[i] = i + 1$，那么输出最大为（#h(2.6em)）。
  + 386
  + 383
  + 384
  + 385
33. （4 分）当 $n=100$ 时，若 $b$ 数组满足，对任意 $0 ≤ i lt n$，都有 $b[i] = 1$，那么输出最小为（#h(2.6em)）。
  + 582
  + 580
  + 579
  + 581
= 完善程序

（单选题，每小题 3 分，共计 30 分）

#heading(level: 2)[]

（矩阵变幻）有一个奇幻的矩阵，在不停的变幻，其变幻方式为：数字 0 变成矩阵 $mat(0, 0; 0, 1)$，数字 1 变成矩阵 $mat(1, 1; 1, 0)$。最初该矩阵只有一个元素 0，变幻 $n$ 次后，矩阵会变成什么样？

例如，矩阵最初为：$[0]$；矩阵变幻 1 次后：$mat(0, 0; 0, 1)$；矩阵变幻 2 次后：

$mat(0, 0, 0, 0; 0, 1, 0, 1; 0, 0, 1, 1; 0, 1, 1, 0)$

输入一行一个不超过 10 的正整数 $n$。输出变幻 $n$ 次后的矩阵。

试补全程序。

提示：

“#(sym.lt)#(sym.lt)”表示二进制左移运算符，例如 $(11)_2$ #(sym.lt)#(sym.lt) $2 = (1100)_2$；

而“^”表示二进制异或运算符，它将两个参与运算的数中的每个对应的二进制位一一进行比较，若两个二进制位相同，则运算结果的对应二进制位为 0，反之为 1。


```cpp
#include <cstdio>
using namespace std;
int n;
const int max_size = 1 << 10;

int res[max_size][max_size];

void recursive(int x, int y, int n, int t) {
    if (n == 0) {
        res[x][y] = ①;
        return;
    }
    int step = 1 << (n - 1);
    recursive(②, n - 1, t);
    recursive(x, y + step, n - 1, t);
    recursive(x + step, y, n - 1, t);
    recursive(③, n - 1, !t);
}

int main() {
    scanf("%d", &n);
    recursive(0, 0, ④);
    int size = ⑤;
    for (int i = 0; i < size; ++i) {
        for (int j = 0; j < size; ++j)
            printf("%d", res[i][j]);
        puts("");
    }
    return 0;
}
```

34. ①处应填（#h(2.6em)）
  + n % 2
  + 0
  + t
  + 1
35. ②处应填（#h(2.6em)）
  + x - step, y - step
  + x, y - step
  + x - step, y
  + x, y
36. ③处应填（#h(2.6em)）
  + x - step, y - step
  + x + step, y + step
  + x - step, y
  + x, y - step
37. ④处应填（#h(2.6em)）
  + n - 1, n % 2
  + n, 0
  + n, n % 2
  + n - 1, 0
38. ⑤处应填（#h(2.6em)）
  + 1 #(sym.lt)#(sym.lt) (n + 1)
  + 1 #(sym.lt)#(sym.lt) n
  + n + 1
  + 1 #(sym.lt)#(sym.lt) (n - 1)
#heading(level: 2)[]

（计数排序）计数排序是一个广泛使用的排序方法。下面的程序使用双关键字计数排序，将 $n$ 对 10000 以内的整数，从小到大排序。

例如有三对整数 $(3,4)$、$(2,4)$、$(3,3)$，那么排序之后应该是 $(2,4)$、$(3,3)$、$(3,4)$。

输入第一行为 $n$，接下来 $n$ 行，第 $i$ 行有两个数 $a[i]$ 和 $b[i]$，分别表示第 $i$ 对整数的第一关键字和第二关键字。

从小到大排序后输出。

数据范围 $1 ≤ n ≤ 10^7$，$1 ≤ a[i], b[i] ≤ 10^4$。

提示：应先对第二关键字排序，再对第一关键字排序。数组 $o r d[]$ 存储第二关键字排序的结果，数组 $r e s[]$ 存储双关键字排序的结果。

试补全程序。


```cpp
#include <cstdio>
#include <cstring>
using namespace std;
const int maxn = 10000000;
const int maxs = 10000;

int n;
unsigned a[maxn], b[maxn], res[maxn], ord[maxn];
unsigned cnt[maxs + 1];

int main() {
    scanf("%d", &n);
    for (int i = 0; i < n; ++i)
        scanf("%d%d", &a[i], &b[i]);
    memset(cnt, 0, sizeof(cnt));
    for (int i = 0; i < n; ++i)
        ①;   // 利用 cnt 数组统计数量
    for (int i = 0; i < maxs; ++i)
        cnt[i + 1] += cnt[i];
    for (int i = 0; i < n; ++i)
        ②;   // 记录初步排序结果
    memset(cnt, 0, sizeof(cnt));
    for (int i = 0; i < n; ++i)
        ③;   // 利用 cnt 数组统计数量
    for (int i = 0; i < maxs; ++i)
        cnt[i + 1] += cnt[i];
    for (int i = n - 1; i >= 0; --i)
        ④;   // 记录最终排序结果
    for (int i = 0; i < n; ++i)
        printf("%d %d\n", ⑤);
    return 0;
}
```

39. ①处应填（#h(2.6em)）
  + `++cnt[i]`
  + `++cnt[b[i]]`
  + `++cnt[a[i] * maxs + b[i]]`
  + `++cnt[a[i]]`
40. ②处应填（#h(2.6em)）
  + `ord[--cnt[a[i]]] = i`
  + `ord[--cnt[b[i]]] = a[i]`
  + `ord[--cnt[a[i]]] = b[i]`
  + `ord[--cnt[b[i]]] = i`
41. ③处应填（#h(2.6em)）
  + `++cnt[b[i]]`
  + `++cnt[a[i] * maxs + b[i]]`
  + `++cnt[a[i]]`
  + `++cnt[i]`
42. ④处应填（#h(2.6em)）
  + `res[--cnt[a[ord[i]]]] = ord[i]`
  + `res[--cnt[b[ord[i]]]] = ord[i]`
  + `res[--cnt[b[i]]] = ord[i]`
  + `res[--cnt[a[i]]] = ord[i]`
43. ⑤处应填（#h(2.6em)）
  + `a[i], b[i]`
  + `a[res[i]], b[res[i]]`
  + `a[ord[res[i]]], b[ord[res[i]]]`
  + `a[res[ord[i]]], b[res[ord[i]]]`
