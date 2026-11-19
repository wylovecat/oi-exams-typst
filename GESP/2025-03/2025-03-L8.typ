// ===========================================================================
// GESP 2025-03 C++ 八级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-03/2025-03-L8.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 8,
  month: "2025 年 03 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 国家“以旧换新”政策仍在继续，小杨家决定在家里旧的冰箱、电视、洗衣机、微波炉中选两种换新。其中，冰箱有4种型号可选，电视有6种型号可选，洗衣机有3种型号可选，微波炉有5种型号可选。请问小杨家共有多少种换新的方案？（#slot）。
  + 18
  + 119
  + 238
  + 360

2. 小杨和3位朋友约好一起去看电影“哪吒2”。打开购票软件，他们发现，已经没有同一排连续的四个座位了（图中每个方框代表一个座位，红色方框代表已经售出）。朋友们商量了一下，决定分为两组，每组两人在同一排的相邻两个座位，且两组之间至少有一对座位是前后相邻的。请问共有多少种购票方案？（#slot）。
  + 495
  + 96
  + 7
  + 4

3. 下面关于C++类构造和析构函数的说法，错误的是（#slot）。
  + 构造函数不能声明为虚函数。
  + 析构函数必须声明为虚函数。
  + 类的默认构造函数可以被声明为private。
  + 类的析构函数可以被声明为private。

4. 下列关于树和图的说法，错误的是（#slot）。
  + 树是一种有向无环图，有向无环图都是一棵树。
  + 如果把树看做有向图，每个节点指向其子节点，则该图是弱连通图。
  + 个顶点且连通的无向图，其最小生成树一定包含#(math-missing)个条边。
  + 个顶点、$N$条边的有向图，一定不是强连通的。

5. 从1到2025这2025个数中，包含数字5的个数（#slot）。
  + 600
  + 601
  + 602
  + 603

6. 已定义double类型的变量r和theta，分别表示图中圆半径和圆心角。下列表达式中可以求出弦长s的是（#slot）。

  ```cpp
  r * cos(theta / 2) * 2
  r * sin(theta / 2) * 2
  ```
  + r \* cos(theta)
  + r \* sin(theta)

7. 个节点的平衡二叉树的高为（#slot）。
  + 树是一种有向无环图，有向无环图都是一棵树。
  + 如果把树看做有向图，每个节点指向其子节点，则该图是弱连通图。
  + N个顶点且连通的无向图，其最小生成树一定包含 $N - 1$ 个条边。
  + 无法确定。

8. 下列关于算法的说法，错误的是（#slot）。
  + 如果有足够的时间和空间，枚举法能解决一切有限的问题。
  + 分治算法将原问题分为多个子问题进行求解，且分解出的子问题必须相互独立。
  + 如果能找到合理的贪心原则，贪心算法往往能够比其他方法更快求解。
  + 倍增法在搜索未知长度的有序数组时，通过动态倍增或减半步长，快速定位目标范围。

9. 是个神奇的数字，因为它是由两个数#(math-missing)和$25$拼接而成，而且$2025 = (20 + 25)^2$。小杨决定写个程序找找小于$N$的正整数中共有多少这样神奇的数字。下面程序横线处应填入的是（#slot）。

  ```cpp
  #include <string>
  int count_miracle(int N) {
      int cnt = 0;
      for (int n = 1; n * n < N; n++) {
          int n2 = n * n;
          std::string s = std::to_string(n2);
          for (int i = 1; i < s.length(); i++)
              if (s[i] != '0') {
                  std::string sl = s.substr(0, i);
                  std::string sr = s.substr(i);
                  int nl = std::stoi(sl);
                  int nr = std::stoi(sr);
                  if (_________) // 在此处填入选项
                      cnt++;
              }
      }
      return cnt;
  }
  (nl + nr) * (nl + nr) == n
  ```
  + ```cpp
    nl + nr == n
    ```
  + ```cpp
    nl + nr == n2
    ```
  + 第10题2025是个神奇的数字，因为它是由两个数20和25拼接而成，而且 $2025 = (20 + 25)^2$
  + ```cpp
    (nl + nr) ^ 2 == n2
    ```

10. 是个神奇的数字，因为它是由两个数#(math-missing)和$25$拼接而成，而且$2025 = (20 + 25)^2$。小杨决定写个程序找找小于$N$的正整数中共有多少这样神奇的数字。该函数的时间复杂度为（#slot）。

  ```cpp
  #include <string>
  int count_miracle(int N) {
      int cnt = 0;
      for (int n = 1; n * n < N; n++) {
          int n2 = n * n;
          std::string s = std::to_string(n2);
          for (int i = 1; i < s.length(); i++)
              if (s[i] != '0') {
                  std::string sl = s.substr(0, i);
                  std::string sr = s.substr(i);
                  int nl = std::stoi(sl);
                  int nr = std::stoi(sr);
                  if (_________) // 在此处填入选项
                      cnt++;
              }
      }
      return cnt;
  }
  ```
  + $O(N log N)$
  + $O(N^(1/2))$
  + $O(N^(1/2) log N)$
  + $O(N^(1/2)(log N)^2)$

11. 下面的欧氏筛法程序中，两个横线处应填入的分别是（#slot）。

  ```cpp
  int primes[MAXP], num = 0;
  bool isPrime[MAXN + 1] = {false};
  void sieve() {
      for (int n = 2; n <= MAXN; n++) {
          if (!isPrime[n])
              primes[num++] = n;
          for (int i = 0; i < num && ________; i++) { // 在此处填入选项
              isPrime[n * primes[i]] = true;
              if (________) // 在此处填入选项
                  break;
          }
      }
  }
  ```
  + ```cpp
    n * primes[i] < MAXN
    n % primes[i] == 0
    ```
  + ```cpp
    n * primes[i] < MAXN
    primes[i] > n
    ```
  + ```cpp
    n * primes[i] <= MAXN
    n % primes[i] == 0
    ```
  + ```cpp
    n * primes[i] <= MAXN
    primes[i] > n
    ```

12. 下面Floyd算法中，横线处应该填入的是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  #define N 21
  #define INF 99999999
  int map[N][N];
  int main() {
      int n, m, t1, t2, t3;
      cin >> n >> m;
      for (int i = 1; i <= n; i++) {
          for (int j = 1; j <= n; j++) {
              if (i == j)
                  map[i][j] = 0;
              else
                  map[i][j] = INF;
          }
      }
      for (int i = 1; i <= m; i++) {
          cin >> t1 >> t2 >> t3;
          map[t1][t2] = t3;
      }
      for (int k = 1; k <= n; k++)
          for (int i = 1; i <= n; i++)
              for (int j = 1; j <= n; j++)
                  if (map[i][j] > map[i][k] + map[k][j])
                      ________; // 在此处填入选项
      for (int i = 1; i <= n; i++) {
          for (int j = 1; j <= n; j++) {
              cout.width(4);
              cout << map[i][j];
          }
          cout << endl;
      }
  }
  ```
  + ```cpp
    map[i][j] = map[i][k] + map[k][j]
    ```
  + ```cpp
    map[i][k] = map[i][j] - map[k][j]
    ```
  + ```cpp
    map[i][j] = map[i][k] - map[k][j]
    ```
  + ```cpp
    map[k][j] = map[i][j] - map[i][k]
    ```

13. 下面Floyd算法程序的时间复杂度为（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  #define N 21
  #define INF 99999999
  int map[N][N];
  int main() {
      int n, m, t1, t2, t3;
      cin >> n >> m;
      for (int i = 1; i <= n; i++) {
          for (int j = 1; j <= n; j++) {
              if (i == j)
                  map[i][j] = 0;
              else
                  map[i][j] = INF;
          }
      }
      for (int i = 1; i <= m; i++) {
          cin >> t1 >> t2 >> t3;
          map[t1][t2] = t3;
      }
      for (int k = 1; k <= n; k++)
          for (int i = 1; i <= n; i++)
              for (int j = 1; j <= n; j++)
                  if (map[i][j] > map[i][k] + map[k][j])
                      ________; // 在此处填入选项
      for (int i = 1; i <= n; i++) {
          for (int j = 1; j <= n; j++) {
              cout.width(4);
              cout << map[i][j];
          }
          cout << endl;
      }
  }
  ```
  + $O(N)$
  + $O(N^2)$
  + $O(N^3)$
  + $O(N^2 log N)$

14. 下列程序实现了输出杨辉三角形，代码中横线部分应该填入的是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  #define N 35
  int a[N];
  int main() {
      int n;
      cin >> n;
      for (int i = 0; i < n; i++) {
          a[i] = 1;
          for (int j = i - 1; j > 0; j--)
              ________; // 在此处填入选项
          for (int j = 0; j <= i; j++)
              cout << a[j] << " ";
          cout << endl;
      }
      return 0;
  }
  a[j] += a[j - 1]
  a[j - 1] += a[j]
  a[j + 1] += a[j]
  ```
  + ```cpp
    a[j] += a[j + 1]
    ```
  + $O(n log n)$
  + $O(n^2)$
  + $O(n^3)$

15. 下列程序实现了输出杨辉三角形，其时间复杂度为（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  #define N 35
  int a[N];
  int main() {
      int n;
      cin >> n;
      for (int i = 0; i < n; i++) {
          a[i] = 1;
          for (int j = i - 1; j > 0; j--)
              ________; // 在此处填入选项
          for (int j = 0; j <= i; j++)
              cout << a[j] << " ";
          cout << endl;
      }
      return 0;
  }
  ```
  + $O(n)$
  + 
  + 
  + 

= 判断题（每题 2 分，共 20 分）

1. 表达式'5' - 3.0的结果为2.0，类型为double。

2. 在C++语言中，如果想要在一个函数内调用一个类的私有方法，可以在该类中将该函数声明为友元函数。

3. 插入排序一般是稳定的。

4. 5个相同的红球和4个相同的蓝球排成一排，要求蓝球不能相邻，则一共有15种排列方案。

5. 使用math.h或cmath头文件中的函数，表达式pow(2, 5)的结果类型为int、值为32。

6. C++是一种面向对象编程语言，C则不是。多态是面向对象三大特性之一，虚函数是动态多态的代表特性。因此，使用C语言无法实现虚函数。

7. 在 个节点的平衡二叉树中查找指定元素的最差时间复杂度为。

8. 定义int类型的变量a和b，求二次函数y = x^2 + ax + b取最小值时x的值，可以通过表达式-a / 2.0求得。

9. 判断无向图中是否有环，可以通过广度优先搜索实现。

10. 从32名学生中选出4人分别担任班长、副班长、学习委员和组织委员，共有$C(32,4)$种不同的选法。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：上学

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

C 城可以视为由$n$个结点与$m$条边组成的无向图。这些结点依次以$1,2,dots.h ,n$标号，边依次以$1,2,dots.h ,m$标号。第条边（#slot）连接编号为$u_i$与$v_i$的结点，长度为$l_i$米。小 A 的学校坐落在 C 城中编号为$s$的结点。小 A 的同学们共有$q$位，他们想在保证不迟到的前提下，每天尽可能晚地出门上学。但同学们并不会计算从家需要多久才能到学校，于是找到了聪明的小 A。第$i$位同学（#slot）告诉小 A，他的家位于编号为$h_i$的结点，并且他每秒能行走 1 米。请你帮小 A 计算，每位同学从家出发需要多少秒才能到达学校呢？

=== 输入格式

第一行，四个正整数$n,m,s,q$，分别表示 C 城的结点数与边数，学校所在的结点编号，以及小 A 同学们的数量。接下来$m$行，每行三个正整数$u_i, v_i, l_i$，表示 C 城中的一条无向边。接下来$q$行，每行一个正整数$h_i$，表示一位同学的情况。

=== 输出格式

共$q$行，对于每位同学，输出一个整数，表示从家出发到学校的最短时间。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5 5 3 3
1 2 3
2 3 2
3 4 1
4 5 3
1 4 2
5
1
4
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
4
3
1
```

=== 数据范围

对于$20$% 的测试点，保证$q=1$。对于另外$20$% 的测试点，保证，$1 <= l_i <= 10^6$。对于所有测试点，保证$1 <= n <= 2 times 10^5$，$1 <= m <= 2 times 10^5$，$1 <= q <= 2 times 10^5$，$1 <= u_i, v_i, s, h_i <= n$，$1 <= l_i <= 10^6$。保证给定的图联通。

=== 参考程序

```cpp
#include <cstdio>
#include <queue>
#include <iostream>
using namespace std;
const int N = 2e5 + 5;
const int E = N << 1;
const long long oo = 1e18;
int n, m, s, q;
int h[N], to[E], nx[E], wt[E], et;
int vis[N];
long long d[N];
priority_queue <pair<long long, int>> pq;
void ae(int u, int v, int w) {
    et++;
    to[et] = v;
    nx[et] = h[u];
    wt[et] = w;
    h[u] = et;
}
int main() {
    scanf("%d%d%d%d", &n, &m, &s, &q);
    for (int i = 1; i <= m; i++) {
        int u, v, l;
        scanf("%d%d%d", &u, &v, &l);
        ae(u, v, l);
        ae(v, u, l);
    }
    for (int i = 1; i <= n; i++)
        d[i] = oo;
    d[s] = 0;
    pq.push({0, s});
    while (!pq.empty()) {
        auto p = pq.top();
        pq.pop();
        int u = p.second;
        if (vis[u])
            continue;
        vis[u] = 1;
        for (int i = h[u]; i; i = nx[i])
            if (d[u] + wt[i] < d[to[i]]) {
                d[to[i]] = d[u] + wt[i];
                pq.push({-d[to[i]], to[i]});
            }
    }
    while (q--) {
        int p;
        scanf("%d", &p);
        printf("%lld\n", d[p]);
    }
    return 0;
}
```

== 编程题 2：割裂

#limits(time: "4.0 s", memory: "512.0 MB")

=== 题目描述

小杨有一棵包含$n$个节点的树，其中节点的编号从$1$到$n$。小杨设置了$a$个好点对$( < u_1, v_1 >, < u_2, v_2 >, dots.h , < u_a, v_a >)$和$1$个坏点对$< b_u, b_v >$。一个节点能够被删除，当且仅当：删除该节点后对于所有的$i(1 <= i <= a)$（#slot），好点对$u_i$和$v_i$仍然连通；删除该节点后坏点对$b_u$和$b_v$不连通。如果点对中的任意一个节点被删除，其视为不连通。小杨想知道，有多少个节点能够被删除。

=== 输入格式

第一行包含两个正整数$n,a$，含义如题面所示。之后$n - 1$行，每行包含两个正整数$x_i,y_i$，代表存在一条连接节点$x_i$和$y_i$的边。之后$n - 1$行，每行包含两个正整数$u_i, v_i$，代表一个好点对$<u_i, v_i>$。最后一行包含两个正整数$b_u, b_v$，代表坏点对$<b_u, b_v>$。

=== 输出格式

输出一个正整数，代表能够删除的节点个数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
6 2
1 3
1 5
3 6
3 2
5 4
5 4
5 3
2 6
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
2
```

=== 数据范围

子任务编号 分值1#(math-missing)20%2#(math-missing)20%3#(math-missing)60%对于全部数据，保证有$1 <= n <= 10^6, 0 <= a <= 10^5, u_i != v_i, b_u != b_v$。

=== 参考程序

```cpp
#include <bits/stdc++.h>
using namespace std;
const int N = 1e6+10;
int n, k;
vector<int> e[N];
int f[N][25], dep[N], g[N], h[N];
void dfs(int u, int fa){
    dep[u] = dep[fa] + 1;
    f[u][0] = fa;
    for(int i = 1; i <= 20; i++){
        f[u][i] = f[f[u][i - 1]][i - 1];
    }
    for(auto v: e[u]){
        if(v == fa) continue;
        dfs(v, u);
    }
}
int lca(int u, int v){
    if(dep[u] < dep[v]) swap(u, v);
    int t = dep[u] - dep[v];
    for(int i = 0; i <= 20; i++){
        if(t & (1 << i)) u = f[u][i];
    }
    for(int i = 20; i >= 0; i--){
        if(f[u][i] != f[v][i])
            u = f[u][i], v = f[v][i];
    }
    if(u == v) return u;
    return f[u][0];
}
int ans;
void dfs2(int u, int fa){
    for(auto v: e[u]){
        if(v == fa) continue;
        dfs2(v, u);
        g[u] += g[v];
        h[u] += h[v];
    }
    if(!g[u] && h[u]) {
        ans++;
    }
}
void solve(){
    cin >> n >> k;
    for(int i = 1; i < n; i++){
        int u, v;
        cin >> u >> v;
        e[u].push_back(v);
        e[v].push_back(u);
    }
    dfs(1, 0);
    for(int i = 1; i <= k; i++){
        int u, v;
        cin >> u >> v;
        int lc = lca(u, v);
        g[u]++, g[v]++, g[lc]--, g[f[lc][0]]--;
    }
    int u, v;
    cin >> u >> v;
    int lc = lca(u, v);
    h[u]++, h[v]++, h[lc]--, h[f[lc][0]]--;
    dfs2(1, 0);
    cout << ans << '\n';
}
int main(){
    solve();
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
