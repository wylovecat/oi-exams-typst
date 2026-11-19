// ===========================================================================
// GESP 2025-06 C++ 七级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-06/2025-06-L7.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 7,
  month: "2025 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 已知小写字母b的ASCII码为98，下列C++代码的输出结果是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      char a = 'b' ^ 4;
      cout << a;
      return 0;
  }
  ```
  + b
  + bbbb
  + f
  + 102

2. 已知a为int类型变量，p为int \*类型变量，下列赋值语句不符合语法的是（#slot）。
  + \*(p + a) = \*p;
  + \*(p - a) = a;
  + p + a = p;
  + p = p + a;

3. 下列关于C++类的说法，错误的是（#slot）。
  + 如需要使用基类的指针释放派生类对象，基类的析构函数应声明为虚析构函数。
  + 构造派生类对象时，只调用派生类的构造函数，不会调用基类的构造函数。
  + 基类和派生类分别实现了同一个虚函数，派生类对象仍能够调用基类的该方法。
  + 如果函数形参为基类指针，调用时可以传入派生类指针作为实参。

4. 下列C++代码的输出是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int arr[5] = {2, 4, 6, 8, 10};
      int * p = arr + 2;
      cout << p[3] << endl;
      return 0;
  }
  ```
  + 6
  + 8
  + 编译出错，无法运行。
  + 不确定，可能发生运行时异常。

5. 假定只有一个根节点的树的深度为 ，则一棵有 个节点的完全二叉树，则树的深度为（#slot）。
  + 6
  + 8
  + 。
  + 不能确定。

6. 对于如下图的二叉树，说法正确的是（#slot）。
  + 先序遍历是ABDEC。
  + 中序遍历是BDACE。
  + 后序遍历是DBCEA。
  + 广度优先遍历是ABCDE。

7. 图的存储和遍历算法，下面说法错误的是（#slot）。
  + 图的深度优先遍历须要借助队列来完成。
  + 图的深度优先遍历和广度优先遍历对有向图和无向图都适用。
  + 使用邻接矩阵存储一个包含$v$个顶点的有向图，统计其边数的时间复杂度为$O(v^2)$。
  + 同一个图分别使用出边邻接表和入边邻接表存储，其边结点个数相同。

8. 一个连通的简单有向图，共有28条边，则该图至少有（#slot）个顶点。
  + 5
  + 6
  + 7
  + 8

9. 以下哪个方案不能合理解决或缓解哈希表冲突（#slot）。
  + 在每个哈希表项处，使用不同的哈希函数再建立一个哈希表，管理该表项的冲突元素。
  + 在每个哈希表项处，建立二叉排序树，管理该表项的冲突元素。
  + 使用不同的哈希函数建立额外的哈希表，用来管理所有发生冲突的元素。
  + 覆盖发生冲突的旧元素。

10. 以下关于动态规划的说法中，错误的是（#slot）。
  + 动态规划方法通常能够列出递推公式。
  + 动态规划方法的时间复杂度通常为状态的个数。
  + 动态规划方法有递推和递归两种实现形式。
  + 对很多问题，递推实现和递归实现动态规划方法的时间复杂度相当。

11. 下面程序的输出为（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int rec_fib[100];
  int fib(int n) {
      if (n <= 1)
          return n;
      if (rec_fib[n] == 0)
          rec_fib[n] = fib(n - 1) + fib(n - 2);
      return rec_fib[n];
  }
  int main() {
      cout << fib(6) << endl;
      return 0;
  }
  ```
  + 8
  + 13
  + 64
  + 结果是随机的。

12. 下面程序的时间复杂度为（#slot）。

  ```cpp
  int rec_fib[MAX_N];
  int fib(int n) {
      if (n <= 1)
          return n;
      if (rec_fib[n] == 0)
          rec_fib[n] = fib(n - 1) + fib(n - 2);
      return rec_fib[n];
  }
  ```
  + $O(2^n)$
  + O(phi^n), phi = frac√(5)-12
  + $O(n^2)$
  + $O(n)$

13. 下面search函数的平均时间复杂度为（#slot）。

  ```cpp
  int search(int n, int * p, int target) {
      int low = 0, high = n;
      while (low < high) {
          int middle = (low + high) / 2;
          if (target == p[middle]) {
              return middle;
          } else if (target > p[middle]) {
              low = middle + 1;
          } else {
              high = middle;
          }
      }
      return -1;
  }
  ```
  + $O(n log (n))$
  + $O(n)$
  + $O(log (n))$
  + $O(1)$

14. 下面程序的时间复杂度为（#slot）。

  ```cpp
  int primes[MAXP], num = 0;
  bool isPrime[MAXN] = {false};
  void sieve() {
      for (int n = 2; n <= MAXN; n++) {
          if (!isPrime[n])
              primes[num++] = n;
          for (int i = 0; i < num && n * primes[i] <= MAXN; i++) {
              isPrime[n * primes[i]] = true;
              if (n % primes[i] == 0)
                  break;
          }
      }
  }
  ```
  + $O(n)$
  + $O(n times log n)$
  + $O(n times log log n)$
  + $O(n^2)$

15. 下列选项中，哪个不可能是下图的广度优先遍历序列（#slot）。
  + 1, 2, 4, 5, 3, 7, 6, 8, 9
  + 1, 2, 5, 4, 3, 7, 8, 6, 9
  + 1, 4, 5, 2, 7, 3, 8, 6, 9
  + 1, 5, 4, 2, 7, 3, 8, 6, 9

= 判断题（每题 2 分，共 20 分）

1. C++语言中，表达式9 & 12的结果类型为int、值为8。

2. C++语言中，指针变量指向的内存地址不一定都能够合法访问。

3. 对 个元素的数组进行快速排序，最差情况的时间复杂度为$O(n log n)$。

4. 一般情况下，long long类型占用的字节数比float类型多。

5. 使用math.h或cmath头文件中的函数，表达式pow(10, 3)的结果的值为1000、类型为int。

6. 二叉排序树的中序遍历序列一定是有序的。

7. 无论哈希表采用何种方式解决冲突，只要管理的元素足够多，都无法避免冲突。

8. 在C++语言中，类的构造函数和析构函数均可以声明为虚函数。

9. 动态规划方法将原问题分解为一个或多个相似的子问题，因此必须使用递归实现。

10. 如果将城市视作顶点，公路视作边，将城际公路网络抽象为简单图，可以满足城市间的车道级导航需求。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：线图

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

给定由$n$个结点与$m$条边构成的简单无向图$G$，结点依次以$1,2,dots.h ,n$编号。简单无向图意味着$G$中不包含重边与自环。$G$的线图$L(G)$通过以下方式构建：初始时线图$L(G)$为空。对于无向图$G$中的一条边，在线图$L(G)$中加入与之对应的一个结点。对于无向图$G$中两条不同的边$(u_1, v_1), (u_2, v_2)$，若存在$G$中的结点同时连接这两条边（即$u_1, v_1$之一与之一相同），则在线图$L(G)$中加入一条无向边，连接$(u_1, v_1), (u_2, v_2)$在线图中对应的结点。请你求出线图$L(G)$中所包含的无向边的数量。

=== 输入格式

第一行，两个正整数$n, m$，分别表示无向图$G$中的结点数与边数。接下来$m$行，每行两个正整数$u_i, v_i$，表示$G$中连接$u_i, v_i$的一条无向边。

=== 输出格式

输出共一行，一个整数，表示线图$L(G)$中所包含的无向边的数量。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5 4
1 2
2 3
3 1
4 5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
3
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
5 10
1 2
1 3
1 4
1 5
2 3
2 4
2 5
3 4
3 5
4 5
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
30
```

=== 数据范围

对于$60$% 的测试点，保证，$1 <= m <= 10^5$。对于所有测试点，保证$1 <= n <= 10^5$，$1 <= m <= 10^5$。

=== 参考程序

```cpp
#include <cstdio>
using namespace std;
const int N = 1e5 + 5;
int n, m, deg[N];
long long ans;
int main() {
    scanf("%d%d", &n, &m);
    while (m--) {
        int u, v;
        scanf("%d%d", &u, &v);
        deg[u]++;
        deg[v]++;
    }
    for (int i = 1; i <= n; i++)
        ans += 1ll * deg[i] * (deg[i] - 1) / 2;
    printf("%lld\n", ans);
    return 0;
}
```

== 编程题 2：调味平衡

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 准备了$n$种食材用来制作料理，这些食材依次以$1,2,dots.h ,n$编号，第$i$种食材的酸度为$a_i$，甜度为$b_i$。对于每种食材，小 A 可以选择将其放入料理，或者不放入料理。料理的酸度$A$为放入食材的酸度之和，甜度$B$为放入食材的甜度之和。如果料理的酸度与甜度相等，那么料理的调味是平衡的。过于清淡的料理并不好吃，因此小 A 想在满足料理调味平衡的前提下，合理选择食材，最大化料理的酸度与甜度之和。你能帮他求出在调味平衡的前提下，料理酸度与甜度之和的最大值吗？

=== 输入格式

第一行，一个正整数$n$，表示食材种类数量。接下来$n$行，每行两个正整数$a_i, b_i$，表示食材的酸度与甜度。

=== 输出格式

输出共一行，一个整数，表示在调味平衡的前提下，料理酸度与甜度之和的最大值。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
1 2
2 4
3 2
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
8
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
5
1 1
2 3
6 1
8 2
5 7
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
2
```

=== 数据范围

对于 % 的测试点，保证，保证。对于另外$20$% 的测试点，保证，保证。对于所有测试点，保证，保证。

=== 参考程序

```cpp
#include <cstdio>
#include <algorithm>
using namespace std;
const int N = 105;
const int C = 505;
const int D = N * C * 2;
int n;
int f[D];
int main() {
    scanf("%d", &n);
    for (int i = 0; i < D; i++)
        f[i] = -1e9;
    f[N * C] = 0;
    while (n--) {
        int a, b;
        scanf("%d%d", &a, &b);
        int x = a + b, y = a - b;
        if (y <= 0) {
            for (int i = -y; i < D; i++)
                f[i + y] = max(f[i + y], f[i] + x);
        } else {
            for (int i = D - y - 1; i; i--)
                f[i + y] = max(f[i + y], f[i] + x);
        }
    }
    printf("%d\n", f[N * C]);
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
