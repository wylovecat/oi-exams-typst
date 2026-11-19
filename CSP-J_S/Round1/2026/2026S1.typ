// ===========================================================================
// 2026S1 —— 2026 CCF 非专业级别软件能力认证第一轮
// 由 _build/md2typ_csp.py 从 /home/wyao/Nutstore Files/aisichuang/0x0c00_真题整理/CSP-J_S/Round1/2026/CSP-S1-2026.pdf 生成，人工补丁见 _build/patch_manual.py
// 编译：typst compile --root . CSP-J_S/Round1/2026/2026S1.typ
// ===========================================================================
#import "/_typst/exam.typ": *

#show: doc => exam(
  serial: "2026S1",
  course: "2026 CCF 非专业级别软件能力认证第一轮",
  title: "（CSP-S1）提高级 C++ 语言试题",
  date: "2026 年 9 月 19 日 14:30~16:30",
  doc,
)

= 单项选择题（共 15 题，每题 2 分，共计 30 分；每题有且仅有一个正确选项）

1. 执行下列代码后，`cnt` 的值是（#h(2.6em)）

  ```cpp
  int x = 2026, cnt = 0;
  while (x) {
      x &= x - 1;
      cnt++;
  }
  ```

  + 6
  + 7
  + 11
  + 8
2. 用权值 {1, 2, 3, 4, 5, 6, 7, 8} 构造哈夫曼树，其带权路径长度是（#h(2.6em)）
  + 108
  + 96
  + 99
  + 102
3. 把 1 到 1000 的所有整数按十进制写出，数字“1”总共出现了多少次（#h(2.6em)）
  + 300
  + 271
  + 301
  + 320
4. 将 5 封信随机装入 5 个写好地址的信封（每封一个），恰好有 2 封装对的方案数是（#h(2.6em)）
  + 44
  + 24
  + 10
  + 20
5. $3^(2026) mod 100$ 的值是（#h(2.6em)）
  + 29
  + 9
  + 43
  + 81
6. 有 5 堆石子排成一行，重量依次为 4, 1, 3, 2, 5。每次只能把相邻的两堆合并成一堆，代价为这两堆重量之和。将所有石子合并成一堆的最小总代价是（#h(2.6em)）
  + 36
  + 35
  + 34
  + 33
7. 树状数组维护长度$n = 16$ 的序列。查询前缀和` sum(11)` 与单点修改` add(3, x)` 分别需要访问树状数组中多少个下标（#h(2.6em)）
  + 3 和 4
  + 4 和 4
  + 3 和 5
  + 4 和 3
8. 有向无环图$G$ 顶点集为 {1, 2, 3, 4}，边集为 {(1, 2), (1, 3)}，顶点 4 与任何顶点均不相邻。该图不同的拓扑序共有多少种（#h(2.6em)）
  + 12
  + 8
  + 4
  + 6
9. 某分治算法满足$T(n) = T(n/3) + T(2 n/3) + Θ(n)$，$T(1) = O(1)$，则$T(n)$ 是（#h(2.6em)）
  + $Θ(n log n)$
  + $Θ(n^(2))$
  + $Θ(n^(1).^(5))$
  + $Θ(n)$
10. 无根树含 9 个结点（编号为 1—9），边集为 {(1, 2), (1, 3), (2, 4), (2, 5), (3, 6), (6, 7), (7, 8), (5, 9)}。该树的直径（以边数计）与重心分别是（#h(2.6em)）
  + 直径 6，重心为结点 3
  + 直径 7，重心为结点 2
  + 直径 8，重心为结点 1
  + 直径 7，重心为结点 1
11. 一张有向图缩点后得到的有向无环图含 6 个顶点，其中入度为 0 的顶点有 3 个、出度为 0 的顶点有4 个。为使原图变成强连通图，至少需要添加多少条有向边（#h(2.6em)）
  + 7
  + 6
  + 4
  + 3
12. 含 6 个结点的不同形态的二叉树共有多少棵（结点不带标号，区分左右子树）（#h(2.6em)）
  + 42
  + 429
  + 132
  + 720
13. 字符串` S = "ababaabab"`，其所有既是真前缀又是真后缀的子串（非空）的长度之和是（#h(2.6em)）
  + 4
  + 6
  + 7
  + 5
14. 用归并排序统计逆序对，合并部分的核心代码为

  ```cpp
  //  归并 a[l..mid]  与 a[mid+1..r]，同时累加逆序对
  if (a[i] <= a[j]) {
      tmp[k++] = a[i++]; //  取左半段元素
  }
  else {
      tmp[k++] = a[j++]; //  取右半段元素
      ans += mid - i + 1;
  }
  ```

  若把判断条件中的` a[i] <= a[j]` 改成` a[i] < a[j]`，则` ans` 统计出的结果是（#h(2.6em)）
  + 完全不变
  + 变为原来的两倍
  + 变为满足` i < j` 且` a[i] >= a[j]` 的数对个数
  + 变为原来的一半
15. 执行` power(2, 100, 1000)` 调用下列函数，返回值是（#h(2.6em)）

  ```cpp
  long long power(long long a, long long b, long long p) {
      long long r = 1 % p;
      while (b) {
          if (b & 1)
              r = r * a % p;
          a = a * a % p;
          b >>= 1;
      }
      return r;
  }
  ```

  + 576
  + 376
  + 976
  + 176
= 阅读程序（程序输入不超过数组或字符串定义的范围；判断题正确填 √，错误填 ×；除特殊说明外，判断题 1.5 分，选择题 3 分，共计 40 分）

#heading(level: 2)[]


```cpp
#include <iostream>
#include <string>
using namespace std;
int a[100];
string s;
int gen[13] = {1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1};
int main() {
    cin >> s;
    for (int i = 0; i < 32; ++i) {
        a[i] = s[i] - '0';
    }
    for (int i = 32; i < 44; ++i) {
        a[i] = 0;
    }
    for (int i = 0; i < 32; ++i) {
        if (a[i] == 0) continue;
        for (int j = 0; j < 13; ++j) {
            a[i + j] ^= gen[j];
        }
    }
    for (int i = 32; i < 44; ++i) {
        cout << a[i];
    }
    cout << endl;
    return 0;
}
```

（说明：输入保证为一个长度恰为 32 的` '0'/'1'` 字符串。）

#grouplabel[判断题]

16. （1 分）当输入为 32 个` '0'` 时，程序输出 12 个 0。（#h(2.6em)）
17. 程序运行结束后，数组` a` 中下标从 0 到 31 的元素一定全部为 0。（#h(2.6em)）
18. 若将第 12～14 行（为` a[32]` 到` a[43]` 补 0 的循环）删除，会改变程序输出结果。（#h(2.6em)）
#grouplabel[单选题]

19. 关于第 6 行定义的数组` gen`，下列说法正确的是（#h(2.6em)）。
  + gen\` 共有 12 个元素，表示一个 12 位的除数
  + gen\` 共有 13 个元素，表示一个 13 位的被除数
  + gen\` 共有 13 个元素，其中\` gen[0]\` 是除数的最高位
  + gen\` 共有 13 个元素，其中\` gen[12]\` 是除数的最高位
20. 该程序实现的功能，最准确的说法是（#h(2.6em)）。
  + 将输入的 32 位串看成二进制数$M$，输出$M$ 与 13 位二进制数1100000001111 按位异或的结果
  + 将输入串视为 32 位二进制数$M$，在其后补 12 个 0（即计算$M × 2^(12)$），再对它用1100000001111作模 2 除法求余数，并输出 12 位余数
  + 对输入的 32 位串逐位取反并输出结果
  + 统计输入串中 1 的个数，并把该个数用 12 位二进制表示后输出
21. 若将第 16 行` if (a[i] == 0) continue;` 删除，说法正确的是（#h(2.6em)）。
  + 程序输出的结果不会改变
  + 可能造成程序运行错误
  + 程序能够正常输出一个 12 位` '0'/'1'` 串，但是输出结果与输入的` s` 无关
  + 程序运行结束后，`a[0]` 的值一定为 0
#heading(level: 2)[]


```cpp
#include <iostream>
using namespace std;
int n, m, a[100007], L, R, lg[100007], i, j, t, dp[100007][25], pw[25];
int gcd(int x, int y) {
    if (y == 0) return x;
    return gcd(y, x % y);
}
int main() {
    cin >> n >> m;
    for (i = 1; i <= n; i++) cin >> a[i];
    t = 0;
    pw[0] = 1;

    for (i = 1; i <= 24; i++) pw[i] = pw[i - 1] * 2;
    for (i = 1; i <= 100000; i++)
        if (pw[t + 1] > i) lg[i] = t;
    else t++, lg[i] = t;
    for (i = 1; i <= n; i++)
        dp[i][0] = a[i];
    for (j = 1; j <= lg[n]; j++)
        for (i = 1; i + pw[j] - 1 <= n; i++) {
        dp[i][j] = gcd(dp[i][j - 1], dp[i + pw[j - 1]][j - 1]);
    }
    for (i = 1; i <= m; i++) {
        cin >> L >> R;
        cout << gcd(dp[L][lg[R-L+1]],dp[R-pw[lg[R-L+1]]+1][lg[R-L+1]]) << endl;
    }
    return 0;
}
```

（说明：保证$1 ≤ n ≤ 100000$，每次查询满足$1 ≤ L ≤ R ≤ n$，且数组` a` 的元素均为正整数。）

#grouplabel[判断题]

22. 当$n = 5$，$a = (4, 2,6, 3,9)$，且仅有一次查询$L = 2$、$R = 5$ 时，输出为 1。（#h(2.6em)）
23. 当某次查询的区间长度为 1（即$L = R$）时，这次查询的输出一定等于` a[L]`。（#h(2.6em)）
24. 任意一次查询的输出结果一定不小于该查询区间内的最小值。（#h(2.6em)）
#grouplabel[单选题]

25. 对于$j ≥ 1$，数组` dp[i][j]` 保存的是（#h(2.6em)）。
  + 从` a[i]` 开始连续$j$ 个数的最大公约数
  + 从` a[i]` 开始连续$2^j$ 个数的最大公约数
  + a[i]\` 与\` a[j]\` 的最大公约数
  + 从` a[1]` 到` a[i]` 的最大公约数
26. 若把一次求最大公约数的运算视为$O(1)$，则第 17～22 行建表过程的时间复杂度为（#h(2.6em)）。
  + $Θ(n)$
  + $Θ(n log n)$
  + $Θ(n^(2))$
  + $Θ(m n)$
27. 设$x$ 为一次查询的区间长度（即$x = R − L + 1$），则使得` lg[x]=5` 的$x$ 的取值范围是（#h(2.6em)）。
  + $[16, 31]$
  + $[17, 32]$
  + $[32, 63]$
  + $[33, 64]$
#heading(level: 2)[]


```cpp
#include <iostream>

using namespace std;
int n,fa[100007],f[100007],ans;
int main() {
    cin >> n;
    for (int i = 2; i <= n; ++i) {
        cin >> fa[i];
    }
    for (int i = n; i >= 2; --i) {
        if (f[fa[i]] + f[i] + 1 > ans) {
            ans = f[fa[i]] + f[i] + 1;
        }
        if (f[i] + 1 > f[fa[i]]) {
            f[fa[i]] = f[i] + 1;
        }
    }
    cout << ans << endl;
    return 0;
}
```

（说明：输入第一行为结点个数$n$，第二行为$n − 1$ 个整数，依次表示结点$2 ∼ n$ 的父结点编号，满足

$2 ≤ n ≤ 100000$ 且$1 ≤ "fa" [i] lt i$，根结点为 1。）

#grouplabel[判断题]

28. 当$n = 5$，$"fa"[2] ～ "fa"[5] = {1, 2, 3, 4}$ 时，程序输出 4。（#h(2.6em)）
29. 程序输出前，`f[1]` 的值一定等于` ans` 的值。（#h(2.6em)）
30. 将第 10～12 行与第 13～15 行两个` if` 语句的顺序交换后，程序的输出结果不受影响。（#h(2.6em)）
#grouplabel[单选题]

31. 程序输出的` ans` 表示的是（#h(2.6em)）。
  + 树中距离最远的两个结点之间路径所经过的边数
  + 根结点 1 到最远叶子结点之间路径所经过的边数
  + 树中叶子结点的个数
  + 所有结点的父结点编号之和
32. 当$n = 7$，fa$[2] ∼ "fa" [7] = (1,1, 2,2, 3,3)$ 时，输出为（#h(2.6em)）。
  + 2
  + 3
  + 4
  + 5
33. 当$n = 10$，满足输出为 9 的合法输入种类数为（#h(2.6em)）。
  + 0
  + 9
  + 256
  + 512
= 完善程序（单选题，每小题 3 分，共计 30 分）

#heading(level: 2)[]

（平衡路线）给定一张有$n$ 个顶点、$m$ 条边的无向图，每条边带有符号+ 或-。对于一条从顶点$s$

到顶点$t$ 的路线，允许重复经过顶点和边，定义一条路线的权值如下：记$n^+$、$n^-$ 分别为经过的 + 边数

和经过的 - 边数，则该路线的权值为$|n^+ − n^-|$。

请计算从$s$ 到$t$ 的路线的最小权值。若不存在从$s$ 到$t$ 的路线，则输出$−1$。

输入第一行为四个整数$n, m, s, t$。接下来$m$ 行，每行给出两个整数$a, b$ 和一个字符+ 或-，描述一条连

接$a$ 与$b$ 的无向边及其符号。

数据满足$2 ≤ n ≤ 2 × 10^(5)$，$1 ≤ m ≤ 4 × 10^(5)$，$1 ≤ s, t ≤ n$ 且$s ≠ t$，$1 ≤ a, b ≤ n$，可能出现重边。

以下程序通过 BFS 求出最小权值。请补全程序。


```cpp
#include <iostream>

constexpr int N = 200005;
constexpr int M = 400005;

int n, m, s, t;
int h[N], e[M << 1], ne[M << 1], w[M << 1], idx;
int q[N], d[N], c[N];

void add(int a, int b, int z) {
    e[idx] = b;
    w[idx] = z;
    ne[idx] = h[a];
    h[a] = idx++;
}

int main() {
    std::cin >> n >> m >> s >> t;
    for (int i = 1; i <= n; i++)
        h[i] = d[i] = c[i] = -1;
    for (int i = 0; i < m; i++) {
        int a, b;
        char op[2];
        std::cin >> a >> b >> op;
        int z = ① ;
        add(a, b, z);
        add(b, a, z);
    }
    int hh = 0, tt = 0;
    int p = 0, ng = 0, ok = 1;
    q[tt++] = s;
    d[s] = c[s] = 0;

    while ( ② ) {
        int x = q[hh++];
        for (int i = h[x]; i != -1; i = ne[i]) {
            int y = e[i];
            if (w[i] > 0) p = 1;
            if (w[i] < 0) ng = 1;
            if (d[y] == -1) {
                d[y] = ③ ;
                c[y] = c[x] ^ 1;
                q[tt++] = y;
            } else if ( ④ )
            ok = 0;
        }
    }
    if (d[t] == -1) {
        std::cout << -1;
        return 0;
    }
    if (!p || !ng) {
        std::cout << d[t];
        return 0;
    }
    if ( ⑤ ) std::cout << 0;
    else std::cout << 1;
    return 0;
}
```

34. ①处应填（#h(2.6em)）
  + `op[0] == '+' ? 0 : 1`
  + `op[0] == '+'`
  + `op[0] == '+' ? 1 : -1`
  + `op[0] == '-' ? 1 : 0`
35. ②处应填（#h(2.6em)）
  + `hh < n`
  + `tt < n`
  + `hh <= tt`
  + `hh < tt`
36. ③处应填（#h(2.6em)）
  + `d[y] + 1`
  + `d[x] + 1`
  + `d[x]`
  + `d[x] - 1`
37. ④处应填（#h(2.6em)）
  + `c[y] == c[x]`
  + `w[i] == 1`
  + `c[y] != c[x]`
  + `d[y] + 1 != d[x]`
38. ⑤处应填（#h(2.6em)）
  + `ok && c[s] == c[t]`
  + `ok && c[s] != c[t]`
  + `!ok || c[s] == c[t]`
  + `!ok && c[s] != c[t]`
#heading(level: 2)[]

（标准答案）有$n$ 名学生参加一次考试，考试共有$m$ 道选择题，每道题只有 A、B 两个选项。

第$i$ 名学生的作答用一个长度为$m$ 的字符串$a i$ 表示。若最终公布的标准答案与该学生在某道题上的作

答相同，则该学生得 1 分，否则不得分。记第$i$ 名学生最终得到的总分为$r i$。

给定每名学生的目标分数$x_i$。现在需要构造一份标准答案，使$sum_(i=1)^n |r_i − x_i|$ 尽可能大。

数据满足$1 ≤ n ≤ 20$，$1 ≤ m ≤ 300$，$0 ≤ x_i ≤ m$。

以下程序从枚举符号的角度处理$sum_(i=1)^n |r_i − x_i|$，把它写成更易优化的形式。

对于非零整数$x$，`__builtin_ctzll(x)` 返回$x$ 的二进制表示末尾连续 0 的个数。

`__builtin_popcountll(x)` 返回$x$ 的二进制表示中 1 的个数。

程序输出一组满足要求的标准答案。请补全程序。


```cpp
#include <cstdlib>
#include <iostream>
#include <string>
#include <vector>

using namespace std;

typedef long long ll;
typedef unsigned long long ull;

int main() {
    int n, m;
    cin >> n >> m;
    vector<ll> x(n), c(n);
    for (int i = 0; i < n; i++) {
        cin >> x[i];
        c[i] = ① ;
    }
    vector<string> a(n);
    for (int i = 0; i < n; i++)
        cin >> a[i];

    vector<int> s(n, -1);
    vector<ll> q(m, 0);
    ll C = 0, S = 0;
    for (int i = 0; i < n; i++) {
        C -= c[i];
        for (int j = 0; j < m; j++) {
            if (a[i][j] == 'A') q[j]--;
            else q[j]++;
        }
    }
    for (int j = 0; j < m; j++) S += abs(q[j]);

    ll ans = C + S;
    ull best = 0, lst = 0;

    for (ull mask = 1; mask < (1ULL << n); mask++) {
        ull g = ② ;
        ull d = g ^ lst;
        int k = ③ ;
        C -= ④ ;
        for (int j = 0; j < m; j++) {
            ll old = q[j];
            int v = (a[k][j] == 'A' ? 1 : -1);
            q[j] -= 2ll * s[k] * v;
            S += abs(q[j]) - abs(old);
        }
        s[k] = -s[k];
        if (C + S > ans) {
            ans = C + S;
            best = g;
        }
        lst = g;
    }

    for (int i = 0; i < n; i++) {
        if (best >> i & 1) s[i] = 1;
        else s[i] = -1;
    }

    string res(m, 'A');
    for (int j = 0; j < m; j++) {
        ll v = 0;
        for (int i = 0; i < n; i++) {
            if (a[i][j] == 'A') v += s[i];
            else v -= s[i];
        }
        if ( ⑤ ) res[j] = 'A';
        else res[j] = 'B';
    }
    cout << res << endl;
    return 0;
}
```

39. ①处应填（#h(2.6em)）
  + `2 * x[i] - m`
  + `-m + 2 * x[i] + 1`
  + `m - 2 * x[i]`
  + `m + 2 * x[i]`
40. ②处应填（#h(2.6em)）
  + `mask | (mask >> 1)`
  + `mask ^ (mask >> 1)`
  + `mask & (mask >> 1)`
  + `mask ^ ((mask >> 1) + 1)`
41. ③处应填（#h(2.6em)）
  + `__builtin_ctzll(d) + 1`
  + `__builtin_popcountll(d)`
  + `__builtin_ctzll(g)`
  + `__builtin_ctzll(d)`
42. ④处应填（#h(2.6em)）
  + `2ll * s[k] * c[k]`
  + `s[k] * c[k]`
  + `2ll * (s[k] - c[k])`
  + `2ll * c[k]`
43. ⑤处应填（#h(2.6em)）
  + `v >= (n & 1)`
  + `v > (n & 1)`
  + `v + (n & 1) >= 0`
  + `v * (n & 1) >= 0`
