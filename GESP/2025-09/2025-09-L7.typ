// ===========================================================================
// GESP 2025-09 C++ 七级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-09/2025-09-L7.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 7,
  month: "2025 年 09 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 已知小写字母b的ASCII码为98，下列C++代码的输出结果是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      char a = 'b' + 1;
      cout << a;
      return 0;
  }
  ```
  + b
  + c
  + 98
  + 99

2. 已知a为int类型变量，p为int \*类型变量，下列表达式不符合语法的是（#slot）。
  + a \* a
  + p \* p
  + a && a
  + p && p

3. 下列关于C++类的说法，错误的是（#slot）。
  + 如果一个类包含纯虚函数，则它不能包含成员变量。
  + 如果一个类包含纯虚函数，则不能用它定义对象。
  + 派生类对象占用的内存总是不小于基类对象。
  + 派生类可以不实现基类的虚函数。

4. 已知数组a的定义int a[10] = {-1};，下列说法不正确的是（#slot）。
  + 数组a至少占用10个int大小的内存，一般为40个字节。
  + 数组a的所有元素均被初始化为-1。
  + 语句a[-1] = 0;不会产生编译错误，但会导致难以预测的运行结果。
  + 语句a[13] = 0;不会产生编译错误，但会导致难以预测的运行结果。

5. 一棵完全二叉树有165个结点，则叶结点有多少个？（#slot）
  + 38
  + 82
  + 83
  + 84

6. 下列关于二叉树的说法，错误的是（#slot）。
  + 二叉排序树的中序遍历顺序与元素排序的顺序是相同的。
  + 自平衡二叉查找树（AVL树）是一种二叉排序树。
  + 个元素的二叉排序树，其高一定为$floor.l log _2n floor.r$。
  + 任意的森林，都可以映射为一颗二叉树进行表达和存储。

7. 下列关于树和图的说法，错误的是（#slot）。
  + 保留树的所有节点，并把树的每个节点指向其父节点，则可以将树转换为一个有向弱连通图。
  + 保留树的所有节点，并把树的每个节点指向其子节点，则可以将树转换为一个有向无环图。
  + 每个连通图都存在生成树。
  + 每个存在生成树的有向图，都一定是强连通的。

8. 对一个包含 个顶点、 条边的图，执行广度优先搜索，其最优时间复杂度是（#slot）。
  + 38
  + 82
  + 83
  + 84

9. 以下哪个方案不能合理解决或缓解哈希表冲突（#slot）。
  + 用新元素覆盖发生冲突的哈希表项。
  + 在每个哈希表项处，使用单链表管理该表项的冲突元素。
  + 建立额外的单链表，用来管理所有发生冲突的元素。
  + 使用不同的哈希函数再建立一个哈希表，用来管理所有发生冲突的元素。

10. 以下关于贪心法和动态规划的说法中，错误的是（#slot）。
  + 对特定的问题，贪心法不一定适用。
  + 当特定的问题适用贪心法时，通常比动态规划的时间复杂度更低。
  + 对很多问题，递推实现和递归实现动态规划方法的时间复杂度相当。
  + 采用动态规划的算法一定具有多项式时间复杂度。

11. 下面程序的输出为（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int fib(int n) {
      if (n == 0)
          return 1;
      return fib(n - 1) + fib(n - 2);
  }
  int main() {
      cout << fib(6) << endl;
      return 0;
  }
  ```
  + 8
  + 13
  + 21
  + 无法正常结束。

12. 下面程序的时间复杂度为（#slot）。

  ```cpp
  int rec_fib[MAX_N];
  int fib(int n) {
      if (n <= 1)
          return n;
      if (rec_fib[n] != 0)
          return rec_fib[n];
      return fib(n - 1) + fib(n - 2);
  }
  ```
  + O(phi^n), phi = frac√(5) + 12
  + $O(2^n)$
  + $O(n^2)$
  + $O(n)$

13. 下面init\_sieve函数的时间复杂度为（#slot）。

  ```cpp
  int sieve[MAX_N];
  void init_sieve(int n) {
      for (int i = 1; i <= n; i++)
          sieve[i] = i;
      for (int i = 2; i <= n; i++)
          for (int j = i; j <= n; j += i)
              sieve[j]--;
  }
  ```
  + $O(n)$
  + $O(n log log n)$
  + $O(n log n)$
  + $O(n^2)$

14. 下面count\_triple函数的时间复杂度为（#slot）。

  ```cpp
  int gcd(int m, int n) {
      if (m == 0) return n;
      return gcd(n % m, m);
  }
  int count_triple(int n) {
      int cnt = 0;
      for (int v = 1; v * v * 4 <= n; v++)
          for (int u = v + 1; u * (u + v) * 2 <= n; u += 2)
              if (gcd(u, v) == 1) {
                  int a = u * u - v * v;
                  int b = u * v * 2;
                  int c = u * u + v * v;
                  cnt += n / (a + b + c);
              }
      return cnt;
  }
  ```
  + $O(n^2)$
  + $O(n^2 log n)$
  + $O(n log n)$
  + $O(n)$

15. 下列选项中，哪个不可能是下图的深度优先遍历序列（#slot）。
  + 2, 3, 5, 7, 8, 9, 6, 4, 1
  + 5, 7, 8, 9, 1, 2, 4, 3, 6
  + 6, 8, 9, 5, 7, 1, 2, 3, 4
  + 8, 5, 7, 9, 1, 2, 3, 6, 4

= 判断题（每题 2 分，共 20 分）

1. C++语言中，表达式9 && 12的结果类型为int、值为8。

2. C++语言中，在有int a[10];定义的范围内，通过表达式a[-1]进行访问将导致编译错误。

3. 选择排序一般是不稳定的。

4. C++语言中，float和int类型一般都是4字节，因此float类型能够表达不同的浮点数值的数量，与int类型能够表达不同的整数值的数量是相同的。

5. 使用math.h或cmath头文件中的对数函数，表达式log(256)的结果类型为double、值约为8.0。

6. 一棵有 个节点的完全二叉树，则树的深度为$floor.l log _2(N) floor.r + 1$。（#slot）

7. 邻接表和邻接矩阵都是图的存储形式。通常，使用邻接表比使用邻接矩阵的时间复杂度更低。

8. C++语言中，类的构造函数可以声明为私有（private）。

9. 泛洪算法的递归实现容易造成溢出，因此大的二维地图算法中，一般使用广度优先搜索实现。

10. 很多游戏中为玩家设置多种可供学习的技能，要学习特定技能又往往需要先学习1个或以上的前置技能。尽管这样的技能间依赖关系常被玩家称为“技能树”，但它并不一定是树，更可能是有向无环图。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：连通图

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

给定一张包含$n$个结点与$m$条边的无向图，结点依次以$1,2,dots.h ,n$编号，第$i$条边（#slot）连接结点$u_i$与结点$v_i$。如果从一个结点经过若干条边可以到达另一个结点，则称这两个结点是连通的。你需要向图中加入若干条边，使得图中任意两个结点都是连通的。请你求出最少需要加入的边的条数。注意给出的图中可能包含重边与自环。

=== 输入格式

第一行，两个正整数$n,m$，表示图的点数与边数。接下来$m$行，每行两个正整数$u_i, v_i$，表示图中一条连接结点$u_i$与结点$v_i$的边。

=== 输出格式

输出一行，一个整数，表示使得图中任意两个结点连通所需加入的边的最少数量。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4 4
1 2
2 3
3 1
1 4
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
0
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
6 4
1 2
2 3
3 1
6 5
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
2
```

=== 数据范围

对于$40$% 的测试点，保证，$1 <= m <= 10^5$。对于所有测试点，保证$1 <= n <= 10^5$，$1 <= m <= 10^5$。

=== 参考程序

```cpp
#include <algorithm>
#include <cstdio>
using namespace std;
const int N = 1e5 + 5;
int n, m;
int f[N];
int ans;
int getf(int u) { return f[u] ? f[u] = getf(f[u]) : u; }
int main() {
    scanf("%d%d", &n, &m);
    for (int i = 1; i <= m; i++) {
        int u, v;
        scanf("%d%d", &u, &v);
        if (getf(u) != getf(v)) f[getf(u)] = v;
    }
    for (int i = 1; i <= n; i++) ans += getf(i) == i;
    printf("%d\n", ans - 1);
    return 0;
}
```

== 编程题 2：金币收集

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 正在游玩收集金币的游戏。具体来说，在数轴上将会出现$n$枚金币，其中第$i$枚（#slot）金币将会在时刻出现在数轴上坐标为#(math-missing)的位置。小 A 必须在时刻#(math-missing)恰好位于坐标，才可以获得第#(math-missing)枚金币。游戏开始时为时刻$0$，此时小 A 的坐标为$0$。正常来说，小 A 可以按游戏机的按键在数轴上左右移动，但不幸的是游戏机的左方向键失灵了。小 A 每个时刻只能选择保持不动，或是向右移动一个单位。换言之，如果小 A 在时刻的坐标为，那么他在时刻#(math-missing)的坐标只能是#(math-missing)或是$x$二者之一，分别对应保持不动和向右移动。小 A 想知道他最多能收集多少枚金币。你能帮他收集最多的金币吗？

=== 输入格式

第一行，一个正整数$n$，表示金币的数量。接下来#(math-missing)行，每行两个正整数，分别表示金币出现的坐标与时刻。

=== 输出格式

输出一行，一个整数，表示小 A 最多能收集的金币数量。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
1 6
3 7
2 4
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
2
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
4
1 1
2 2
1 3
2 4
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
3
```

=== 数据范围

对于$40$% 的测试点，保证$1 <= n <= 8$。对于另外 % 的测试点，保证，$1 <= x_i <= 100$，$1 <= t_i <= 100$。对于所有测试点，保证$1 <= n <= 10^5$，$1 <= x_i <= 10^9$，$1 <= t_i <= 10^9$。

=== 参考程序

```cpp
#include <algorithm>
#include <cstdio>
using namespace std;
const int oo = 2e9;
const int N = 1e5 + 5;
int n;
int x[N], t[N];
int p[N], f[N];
int mx;
bool cmp(int a, int b) {
    if (x[a] != x[b]) return x[a] < x[b];
    return t[a] < t[b];
}
int main() {
    scanf("%d", &n);
    for (int i = 1; i <= n; i++) {
        scanf("%d%d", &x[i], &t[i]);
        t[i] -= x[i];
        p[i] = i;
        f[i] = oo;
    }
    sort(p + 1, p + n + 1, cmp);
    mx = 0;
    f[0] = 0;
    for (int i = 1; i <= n; i++) {
        int l = 0, r = mx;
        int v = t[p[i]];
        if (v < 0) continue;
        while (l < r) {
            int mid = (l + r) / 2 + 1;
            if (v < f[mid])
                r = mid - 1;
            else
                l = mid;
        }
        mx = max(mx, r + 1);
        f[r + 1] = v;
    }
    printf("%d\n", mx);
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
