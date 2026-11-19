// ===========================================================================
// GESP 2026-06 C++ 八级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2026-06/2026-06-L8.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 8,
  month: "2026 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 从$7$本不同的算法书和$5$本不同的数学书中选出$4$本，要求两类书都至少选$1$本，共有（#slot）种不同选法。
  + 420
  + 455
  + 465
  + 495

2. 个人排成一排照相，其中甲、乙两人不能相邻，共有（#slot）种不同排法。
  + 240
  + 480
  + 600
  + 720

3. 展开式$(x^2 - frac(1, x))^6$中，常数项的系数为（#slot）。
  + 6
  + 12
  + 15
  + 20

4. 下面代码用于预处理组合数，横线处应填入的是（#slot）。

  ```cpp
  for (int i = 0; i <= n; i++) {
      c[i][0] = c[i][i] = 1;
      for (int j = 1; j < i; j++)
          c[i][j] = __________;
  }
  c[i - 1][j - 1] + c[i - 1][j]
  c[i][j - 1] + c[i - 1][j - 1]
  c[i - 1][j] + c[i][j + 1]
  c[i][j - 1] * c[i - 1][j]
  ```

5. 下列程序输出的值为（#slot）。1 / 8

  ```cpp
  #include <iostream>
  using namespace std;
  long long qpow(long long a, long long b, long long mod) {
      long long ans = 1 % mod;
      while (b) {
          if (b & 1)
              ans = ans * a % mod;
          a = a * a % mod;
          b >>= 1;
      }
      return ans;
  }
  int main() {
      cout << qpow(3, 20, 17) << endl;
      return 0;
  }
  ```
  + 1
  + 4
  + 13
  + 16

6. 归并排序每次把长度为$n$的序列分成两个规模约为$n / 2$的子序列，递归排序后再用线性时间合并。该算法的时间复杂度通常为（#slot）。
  + $O(n)$
  + $O(n^2)$
  + $O(log n)$
  + $O(n log n)$

7. 在平面直角坐标系中，三角形三个顶点为$A(1,1)$、$B(5,2)$、$C(3,6)$，该三角形面积为（#slot）。
  + 9
  + 10
  + 12
  + 18

8. 某程序需要判断点$P(x,y)$是否在以原点为圆心、半径为$5$的圆内或圆上。下列判断条件正确的是（#slot）。

  ```cpp
  x * x + y * y <= 25
  abs(x) + abs(y) <= 5
  x * x - y * y <= 25
  ```
  + x + y \<= 5

9. 某无向带权图有边$(1,2,4)$、$(1,3,2)$、$(2,3,1)$、$(2,4,5)$、$(3,4,8)$、$(3,5,10)$、$(4,5,2)$。该图最小生成树的总权值为（#slot）。
  + 7
  + 8
  + 9
  + 102 / 8

10. 有向非负权图边为$1arrow.r 2(3)$、$2arrow.r 4(4)$、$1arrow.r 3(10)$、$3arrow.r 4(1)$、$2arrow.r 3(2)$。使用 Dijkstra 算法从1号顶点出发到4号顶点的最短距离为（#slot）。
  + 6
  + 7
  + 8
  + 11

11. 下列代码片段的时间复杂度为（#slot）。

  ```cpp
  long long s = 0;
  for (int i = 1; i <= n; i++) {
      for (int j = 1; j * j <= n; j++) {
          s += i + j;
      }
  }
  ```
  + O(nM)
  + $O(n log M)$
  + $O(M log n)$
  + $O(n + M)$

12. 某优化问题的答案是$[1, M]$内的整数，存在单调判定函数check(x)，且每次判定的时间复杂度为$O(n)$。使用二分答案求最小可行值，整体时间复杂度通常为（#slot）。
  + 保证递归深度不超过 $O(log n)$。
  + 保证每个合数只被它的最小质因子筛去一次。
  + 保证每个素数都被标记为合数。
  + 把筛法时间复杂度提高到 $O(n log n)$。

13. 下列线性筛的代码片段中，当枚举到质数p且i % p == 0时，使用break;语句停止继续枚举。这样做的主要目的是（#slot）。

  ```cpp
  for (int i = 2; i <= n; ++i) {
      if (!is_composite[i])
          primes.push_back(i);
      for (int p : primes) {
          if (i * p > n)
              break;
          is_composite[i * p] = true;
          if (i % p == 0)
              break;        // 这条语句的目的是？
      }
  }
  ```
  + 保证递归深度不超过$O(log n)$。
  + 保证每个合数只被它的最小质因子筛去一次。
  + 保证每个素数都被标记为合数。
  + 把筛法时间复杂度提高到$O(n log n)$。

14. 在 C++ 中，关于类的继承和构造、析构顺序，下列说法正确的是（#slot）。3 / 8
  + 派生类可以直接访问基类的private成员。
  + 基类的protected成员在私有继承后会变成派生类的public成员。
  + 创建派生类对象时，会先调用基类构造函数，再调用派生类构造函数。
  + 销毁派生类对象时，会先调用基类析构函数，再调用派生类析构函数。

15. 将$4$个元素按$1,2,3,4$的顺序入栈，在该过程中可随时插入出栈操作。下列序列中不可能作为出栈序列的是（#slot）。
  + 派生类可以直接访问基类的private成员。
  + 基类的protected成员在私有继承后会变成派生类的public成员。
  + 创建派生类对象时，会先调用基类构造函数，再调用派生类构造函数。
  + 销毁派生类对象时，会先调用基类析构函数，再调用派生类析构函数。

= 判断题（每题 2 分，共 20 分）

1. 若一项任务可从两种互斥的方案中选择一种完成，其中，方案 A 有$m$种做法，方案 B 有$n$种做法，则总做法数为$m + n$。

2. 将$n$个不同元素围成一圈，若只把旋转视为同一种排法、翻转仍视为不同排法，则方案数为$(n - 1)!$。

3. 从$n$个不同元素中可重复地选取$k$个且不考虑顺序，方案数为$C(n + k, k)$。

4. 杨辉三角中的组合数满足$C(n,k)=C(n-1,k)+C(n-2,k)$。

5. 快速幂通过二进制拆分指数，可以在$O(log b)$时间内计算$a^b mod m$。

6. 只要图中不存在负权环，Dijkstra 算法就一定能正确处理带负权边的图。

7. 若一张连通无向图所有边权两两不同，则它的最小生成树一定唯一。

8. 判断点$(x,y)$是否在以原点为圆心、半径为$r$的圆内或圆上时，可以比较$x^2 + y^2$与$r^2$，不必先开平方。

9. 若能写出判定函数check(x)，表示“答案为x时是否可行”，即使check(x)不满足单调性，也一定可以使用二分答案求最优解。

10. 归并排序是一种稳定排序算法，常见实现的时间复杂度为$O(n log n)$。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：线网建设

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

A 市有$n$座基站需要通过线网互相连接。第$i$座基站位于二维平面上坐标$(x_i, y_i)$处。第$i$座基站与第$j$座基站之间的距离定义为$sqrt((x_i - x_j)^2 + (y_i - y_j)^2)$。如果两座基站之间的距离不超过给定的整数$l$，那么可以修建连接这两座基站的线路，线路长度为基站间的距离。如果从一座基站出发，经过一系列线网中的线路可以到达另一座基站，则称这两座基站是互相连接的。请问使得$n$座基站两两之间都互相连接，需要修建的线路总长度最小是多少？如果不能修建满足条件的线网，则输出Impossible。3.1.2 输 格式入第一行，两个正整数$n,l$，分别表示基站数量与线路长度上限。接下来$n$行，每行两个整数$x_i, y_i$，表示基站的坐标。

=== 输出格式

输出一行。如果能修建满足条件的线网，则输出需要修建的最小线路总长度，保留两位小数。否则输出

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4 2
1 0
-1 -1
0 0
1 1
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
3.41
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
4 1
1 0
-1 -1
0 0
1 1
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
Impossible
```

=== 数据范围

对于$40%$的测试点，保证$1 <= n <= 100$。对于所有测试点，保证，，。5 / 8

=== 参考程序

```cpp
#include <iostream>
#include <cstdio>
#include <algorithm>
#include <cmath>
using namespace std;
const int N = 510;
const int E = N * N;
int n, l;
int x[N], y[N];
int p[E], u[E], v[E], cnt;
int f[N], t = 0;
double d[E], ans = 0;
int getf(int u) {
    return f[u] ? f[u] = getf(f[u]) : u;
}
bool cmp(int a, int b) {
    return d[a] < d[b];
}
int main() {
    cin >> n >> l;
    for (int i = 1; i <= n; i++)
        cin >> x[i] >> y[i];
    for (int i = 1; i <= n; i++)
        for (int j = i + 1; j <= n; j++) {
            int dx = x[i] - x[j], dy = y[i] - y[j];
            if (dx * dx + dy * dy > l * l)
                continue;
            cnt++;
            p[cnt] = cnt;
            u[cnt] = i;
            v[cnt] = j;
            d[cnt] = sqrt(dx * dx + dy * dy);
        }
    sort(p + 1, p + cnt + 1, cmp);
    for (int i = 1; i <= cnt; i++) {
        int pu = u[p[i]], pv = v[p[i]];
        if (getf(pu) == getf(pv))
            continue;
        t++;
        ans += d[p[i]];
        f[getf(pu)] = pv;
    }
    if (t == n - 1)
        printf("%.2lf\n", ans);
    else
        printf("Impossible\n");
    return 0;
}
```

== 编程题 2：堆石子

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

有$m$堆石子，编号为$1,2,dots.h ,m$，其石子数量分别记为$a_1,a_2,dots.h ,a_m$。现在要求第$1$堆石子恰有$n$个（即$a_1 = n$），并且此后每堆石子的数量严格小于前一堆，即#(math-missing)（#slot）。此外，每堆至少需要有一个石子，即#(math-missing)（#slot）。在总石子数量不设限制的情况下，给定，有多少个满足要求的石子堆放方案？两个方案不同，当且仅当，两个方案中至少有一堆石子数量不同。如果不存在满足要求的方案，输出$0$。由于方案数可能很大，请输出方案数对#(math-missing)取模后的结果。3.2.2 输 格式入输入一行两个正整数$m$和$n$。

=== 输出格式

输出一个整数，表示总方案数对#(math-missing)取模后的结果。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3 5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
6
```

=== 数据范围

数 据 点 编 号#(math-missing)数 据 范 围#(math-missing)特 殊 性 质1,2,3,4,5, #(math-missing)无6,7,8,9,10, #(math-missing)无7 / 8

=== 提示

有，，，，#(math-missing)和$(5,4,2)$共计$6$种方案。

=== 参考程序

```cpp
#include <iostream>
using namespace std;
const int MOD = (int)1e9 + 7;
int qpow(int base, int exp) {
    if (!exp) return 1;
    if (exp & 1) return (long long)base * qpow((long long)base * base % MOD, exp >> 1) %
MOD;
    return qpow((long long)base * base % MOD, exp >> 1);
}
int comb(int n, int m) {
    if (m > n) return 0;
    int ans = 1;
    for (int i = 0; i < m; ++i) {
        ans = (long long)ans * (n - i) % MOD;
        ans = (long long)ans * qpow(i + 1, MOD - 2) % MOD;
    }
    return ans;
}
int main() {
    int m, n;
    cin >> m >> n;
    cout << comb(n - 1, m - 1) << endl;
    return 0;
}8 / 8
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
