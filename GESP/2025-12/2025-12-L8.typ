// ===========================================================================
// GESP 2025-12 C++ 八级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-12/2025-12-L8.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 8,
  month: "2025 年 12 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 某平台生成“取件码”由6个字符组成：前4位为数字（0–9），后2位为大写字母（A–Z），其中字母不能为I、O。假设数字和字母均可重复使用，要求整个取件码中恰好有2个数字为奇数。共有多少种不同取件码？（#slot）
  + 1,440,000
  + 2,160,000
  + 2,535,000
  + 8,640,000

2. 下列代码实现了归并排序（Merge Sort）的分治部分。为了正确地将数组a的[left, right]区间进行排序，横线处应该填入的是（#slot）。

  ```cpp
  void merge_sort(int a[], int left, int right) {
      if (left >= right) return;
      int mid = (left + right) / 2;
      merge_sort(a, left, mid);
      ________; // 在此处填入选项
      merge(a, left, mid, right); // 合并操作
  }
  merge_sort(a, mid, right)
  merge_sort(a, mid + 1, right)
  merge_sort(a, left, mid + 1)
  merge_sort(a, mid - 1, right)
  ```

3. 某社团有男生8人、女生7人。现需选出1名队长（性别不限）、1名副队长（性别不限）、2名宣传委员（两人无角色区别，且必须至少1名女生）。假如一人不能兼任多职，共有多少种不同选法？（#slot）
  + 12012
  + 11844
  + 12474
  + 11025

4. 二项式$(2x - y)^8$的展开式中$x^5y^3$项的系数为（#slot）。
  + -7168第 1 页 / 共 9 页
  + 7168
  + -1792
  + 1792

5. 下面是使用邻接矩阵实现的Dijkstra算法的核心片段，用于求单源最短路径。在找到当前距离起点最近的顶点u后，需要更新其邻接点j的距离。横线处应填入的代码是（#slot）。

  ```cpp
  for (int j = 1; j <= n; j++) {
      if (!visited[j] && graph[u][j] < INF) {
          if (________) { // 在此处填入选项
              dis[j] = dis[u] + graph[u][j];
          }
      }
  }
  dis[j] < dis[u] + graph[u][j]
  dis[j] > dis[u] + graph[u][j]
  graph[u][j] > dis[u] + dis[j]
  dis[j] > graph[u][j]
  ```

6. 下面程序使用动态规划求两个字符串的最长公共子序列（LCS）长度，横线处应填入的是（#slot）。

  ```cpp
  #include <algorithm>
  #include <string>
  #include <vector>
  using namespace std;
  int lcs_len(const string &a, const string &b) {
      int n = (int)a.size(), m = (int)b.size();
      vector<vector<int>> dp(n + 1, vector<int>(m + 1, 0));
      for (int i = 1; i <= n; i++)
          for (int j = 1; j <= m; j++)
              if (a[i - 1] == b[j - 1])
                  dp[i][j] = dp[i - 1][j - 1] + 1;
              else
                  ________; // 在此处填入选项
      return dp[n][m];
  }
  dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
  dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]);
  dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
  dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]) + 1;
  ```

7. 已知两个点$A(x_1, y_1)$和$B(x_2, y_2)$在平面直角坐标系中的坐标。下列C++表达式中，能正确计算这两点之间直线距离的是（#slot）。

  ```cpp
  sqrt((x1 - x2) ^ 2 + (y1 - y2) ^ 2)
  sqrt(pow(x1 - x2, 2) + pow(y1 - y2, 2))
  pow(x1 - x2, 2) + pow(y1 - y2, 2)
  abs(x1 - x2) + abs(y1 - y2)
  ```

8. 已知int a = 10;，执行int &b = a; b = 20;后，变量a的值是（#slot）。第 2 页 / 共 9 页
  + 10
  + 20
  + 30
  + 编译错误

9. 下列代码的时间复杂度（以$n$为自变量，忽略常数与低阶项）是（#slot）。

  ```cpp
  long long s = 0;
  for (int i = 1; i <= n; i++) {
      for (int j = 1; j * j <= i; j++) {
          s += j;
      }
  }
  ```
  + $O(n)$
  + $O(n log n)$
  + O(n√(n))
  + $O(n^2)$

10. 下列程序实现了线性筛法（欧拉筛），用于在$O(n)$时间内求出$1 tilde.op n$之间的所有质数。为了保证每个合数只被其最小质因子筛掉，横线处应填入的语句是（#slot）。

  ```cpp
  for (int i = 2; i <= n; i++) {
      if (!not_prime[i]) primes[++cnt] = i;
      for (int j = 1; j <= cnt && i * primes[j] <= n; j++) {
          not_prime[i * primes[j]] = true;
          if (________) break; // 在此处填入选项
      }
  }
  ```
  + i + primes[j] == n
  + primes[j] \> i
  + i % primes[j] == 0
  + i % primes[j] != 0

11. 在C++语言中，关于类的继承和访问权限，下列说法正确的是（#slot）。
  + 派生类可以访问基类的private成员。
  + 基类的protected成员在私有继承（private inheritance）后，在派生类中变为public。
  + 派生类对象在创建时，会先调用基类的构造函数，再调用派生类自己的构造函数。
  + 派生类对象在销毁时，会先调用基类的析构函数，再调用派生类自己的析构函数。

12. 当输入6时，下列程序的输出结果为（#slot）。第 3 页 / 共 9 页

  ```cpp
  #include <iostream>
  using namespace std;
  int f(int n) {
      if (n <= 3) return n;
      return f(n - 1) + f(n - 2) + 2 * f(n - 3);
  }
  int main() {
      int n;
      cin >> n;
      cout << f(n) << endl;
      return 0;
  }
  ```
  + 14
  + 27
  + 28
  + 15

13. 从1到999这999个正整数中，十进制表示中数字5恰好出现一次的数有多少个？（#slot）
  + 243
  + 271
  + 300
  + 333

14. 当输入2023时，下列程序的输出结果为（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int x, ans = 0;
      cin >> x;
      while (x != 0) {
          x -= x & -x;
          ans++;
      }
      cout << ans << endl;
      return 0;
  }
  ```
  + 7
  + 8
  + 9
  + 11

15. 对连通无向图执行Kruskal算法。已按边权从小到大依次扫描到某条边$e = (u,v)$。此时在已经构建的部分MST结构中，$(u,v)$已在同一连通块内。关于边$e$的处理，下列说法正确的是（#slot）。
  + 必须选入MST，否则可能不连通。
  + 一定不能选入MST（在此扫描顺序下）。
  + 若后续出现更大的边权，可以回溯改选$e$。
  + 只有当$e$是当前最小边时才能舍弃。第 4 页 / 共 9 页

= 判断题（每题 2 分，共 20 分）

1. 若一项任务可用两种互斥方案完成：方案A有$m$种做法，方案B有$n$种做法，则总做法数为$m + n$。

2. 在C++语言中，引用一旦被初始化，就不能再改为引用另一个变量。

3. 快速排序和归并排序的平均时间复杂度都是$O(n log n)$，但快速排序是不稳定的排序算法，归并排序是稳定的排序算法。

4. 使用math.h或cmath头文件中的函数，表达式sqrt(4)的结果类型为double。

5. 在杨辉三角形中，第$n$行（从0开始计数，即第$n$行有$n + 1$个数）的所有数字之和等于$2^n$。

6. 使用二叉堆优化的Dijkstra最短路算法，在某些特殊情况下时间复杂度不如朴素实现的$O(V^2)$。

7. 个不同元素依次入栈的出栈序列数与将$n$个不同元素划分成若干非空子集的方案数相等。

8. 快速排序在最坏情况下的时间复杂度为$O(n log n)$，可以通过随机化选择基准值（pivot）的方法完全避免退化。

9. 在C++语言中，一个类可以拥有多个构造函数，也可以拥有多个析构函数。

10. 求两个序列的最长公共子序列（LCS）时，使用滚动数组优化空间后，仍然可以还原出具体的LCS序列。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：猫和老鼠

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

猫和老鼠所在的庄园可以视为一张由$n$个点和$m$条带权无向边构成的连通图。结点依次以$1,2,dots.h ,n$编号，结点（#slot）有价值为#(math-missing)的奶酪。在#(math-missing)条带权无向边中，第#(math-missing)（#slot）条无向边连接结点#(math-missing)与结点，边权表示猫和老鼠通过这条边所需的时间。猫窝位于结点$a$，老鼠洞位于结点$b$。对于老鼠而言，结点$u$是安全的当且仅当：老鼠能规划一条从结点#(math-missing)出发逃往老鼠洞的路径，使得对于路径上任意结点#(math-missing)（包括结点#(math-missing)与老鼠洞）都有：猫从猫窝出发到结点#(math-missing)的最短时间严格大于老鼠从结点#(math-missing)沿这条路径前往结点#(math-missing)所需的时间。老鼠在拿取安全结点的奶酪时不存在被猫抓住的可能，但在拿取不是安全结点的奶酪时则不一定。为了确保万无一失，老鼠决定只拿取安全结点放置的奶酪。请你计算老鼠所能拿到的奶酪价值之和。第 5 页 / 共 9 页

=== 输入格式

第一行，两个正整数$n, m$，分别表示图的结点数与边数。第二行，两个正整数$a,b$，分别表示猫窝的结点编号，以及老鼠洞的结点编号。第三行，$n$个正整数$c_1, c_2, dots.h , c_n$，表示各个结点的奶酪价值。接下来$m$行中的第$i$行（#slot）包含三个正整数，表示图中连接结点#(math-missing)与结点#(math-missing)的边，边权为。

=== 输出格式

输出一行，一个整数，表示老鼠所能拿到的奶酪价值之和。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5 5
1 2
1 2 4 8 16
1 2 4
2 3 3
3 4 1
2 5 2
3 1 8
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
22
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
6 10
3 4
1 1 1 1 1 1
1 2 6
2 3 3
3 1 4
3 4 5
4 5 8
5 6 2
6 4 1
3 2 4
5 4 4
3 3 6
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
3
```

=== 数据范围

对于$40$的测试点，保证，$a != b$。对于所有测试点，保证，，$1 <= n <= 10^5$且$1 <= m <= 10^5$，$1 <= a, b <= n$，$a != b$。第 6 页 / 共 9 页

=== 参考程序

```cpp
#include <cstdio>
#include <algorithm>
#include <vector>
#include <queue>
using namespace std;
const int N = 1e5 + 5;
const long long oo = 1e18;
int n, m;
int a, b;
int c[N];
vector<pair<int, int>> e[N];
long long dis[N];
priority_queue<pair<long long, int>> q;
long long ans;
int main() {
    scanf("%d%d", &n, &m);
    scanf("%d%d", &a, &b);
    for (int i = 1; i <= n; i++)
        scanf("%d", &c[i]);
    for (int i = 1; i <= m; i++) {
        int u, v, w;
        scanf("%d%d%d", &u, &v, &w);
        e[u].emplace_back(make_pair(v, w));
        e[v].emplace_back(make_pair(u, w));
    }
    for (int i = 1; i <= n; i++)
        dis[i] = oo;
    dis[b] = 0;
    q.push(make_pair(-dis[b], b));
    while (!q.empty()) {
        auto p = q.top();
        q.pop();
        if (dis[p.second] != -p.first)
            continue;
        int u = p.second;
        for (auto r : e[u]) {
            int v = r.first, w = r.second;
            if (dis[v] > dis[u] + w) {
                dis[v] = dis[u] + w;
                q.push(make_pair(-dis[v], v));
            }
        }
    }
    for (int i = 1; i <= n; i++)
        if (dis[i] < dis[a])
            ans += c[i];
    printf("%lld\n", ans);
    return 0;
}
```

== 编程题 2：宝石项链

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 有一串包含$n$枚宝石的宝石项链，这些宝石按照在项链中的顺序依次以$1,2,dots.h ,n$编号，第$n$枚宝石与第$1$枚宝石相邻。项链由$m$种宝石组成，其中第$i$枚宝石种类为$t_i$。小 A 想将宝石项链分给他的好朋友们。具体而言，小 A 会将项链划分为若干连续段，并且需要保证每段都包含全部种宝石。请帮小 A 计算在满足条件的前提下，宝石项链最多可以划分为多少段。3.2.2 输 格式入第一行，两个正整数$n,m$，分别表示宝石项链中的宝石的数量与种类数。第二行，$n$个正整数$t_1, t_2, dots.h , t_n$，表示每枚宝石的种类。

=== 输出格式

输出一行，一个整数，表示宝石项链最多可以划分的段数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
6 2
1 2 1 2 1 2
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
3
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
7 3
3 1 3 1 2 1 2
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
2
```

=== 数据范围

对于$40$的测试点，保证$2 <= n <= 1000$。对于所有测试点，保证$2 <= n <= 10^5$，$2 <= m <= n$，$1 <= t_i <= m$，保证$1,2,dots.h ,m$均在$t_1, t_2, dots.h , t_n$中出现。第 8 页 / 共 9 页

=== 参考程序

```cpp
#include <cstdio>
#include <algorithm>
using namespace std;
const int L = 20;
const int N = 2e5 + 5;
const int oo = 1e9;
int n, m;
int t[N], jump[L][N];
int cnt[N], tot;
int ans;
int go(int u) {
    int cnt = 0, ans = 0;
    for (int i = L - 1; i >= 0; i--)
        if (cnt + jump[i][u] <= n) {
            cnt += jump[i][u];
            ans += 1 << i;
            u = (u + jump[i][u] - 1) % n + 1;
        }
    return ans;
}
int main() {
    scanf("%d%d", &n, &m);
    for (int i = 1; i <= n; i++) {
        scanf("%d", &t[i]);
        t[i + n] = t[i];
    }
    for (int i = 1, r = 0; i <= n; i++) {
        while (tot < m) {
            r++;
            if (!cnt[t[r]]++)
                tot++;
        }
        jump[0][i] = r - i + 1;
        if (!--cnt[t[i]])
            tot--;
    }
    for (int i = 1; i < L; i++)
        for (int j = 1; j <= n; j++) {
            int tar = (j + jump[i - 1][j] - 1) % n + 1;
            jump[i][j] = min(jump[i - 1][j] + jump[i - 1][tar], oo);
        }
    for (int i = 1; i <= n; i++)
        ans = max(ans, go(i));
    printf("%d\n", ans);
    return 0;
}第 9 页 / 共 9 页
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
