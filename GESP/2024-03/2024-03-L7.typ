// ===========================================================================
// GESP 2024-03 C++ 七级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-03/2024-03-L7.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 7,
  month: "2024 年 03 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 下列关于排序的说法，正确的是（#slot）。
  + 冒泡排序是最快的排序算法之一。
  + 快速排序通常是不稳定的。
  + 最差情况，$N$个元素做归并排序的时间复杂度为$O(N)$。
  + 以上均不正确。

2. 下面的程序属于哪种算法（#slot）。

  ```cpp
  int pos[8];
  void queen(int n) {
      for (int i = 0; i < 8; i++) {
          pos[n] = i;
          bool attacked = false;
          for (int j = 0; j < n; j++)
              if (pos[n] == pos[j] || pos[n] + n == pos[j] + j || pos[n] - n == pos[j]
  - j) {
                  attacked = true;
                  break;
              }
          if (attacked)
              continue;
          if (n == 7) {
              return;
          } else {
              queen(n + 1);
          }
      }
  }
  ```
  + 贪心算法
  + 动态规划
  + 深度优先搜索
  + 广度优先搜索

3. 下面有关C++类的说法，错误的是（#slot）。
  + C++类对象销毁时，会执行析构函数。
  + C++类可以通过定义构造函数实现自动类型转换。
  + C++类可以通过重载[]运算符实现通过给定下标访问数组成员的元素。
  + C++类可以包含任意类型的成员变量。

4. 一个连通的简单无向图，共有28条边，则该图至少有（#slot）个顶点。
  + 6
  + 7
  + 8
  + 9

5. 以下哪个方案不能合理解决或缓解哈希表冲突（#slot）。
  + 在每个哈希表项处，使用单链表管理该表项的冲突元素。
  + 建立额外的单链表，用来管理所有发生冲突的元素。
  + 使用不同的哈希函数再建立一个哈希表，用来管理所有发生冲突的元素。
  + 用新元素覆盖发生冲突的哈希表项。

6. 已知一颗二叉树的中序遍历序列为：{C F B A E D G}，后序遍历序列为：{F C B E G D A}，则下列说法中正确的是（#slot）。
  + 该树是平衡二叉树。
  + 该树的高为4。
  + 该树有4个叶节点。
  + 以上说法都不对。

7. 以下关于二叉排序树的说法，正确的是（#slot）。
  + 二叉排序树的中序遍历序列一定是有序的。
  + 在含n个节点的二叉排序树中查找元素，最差情况的时间复杂度为。
  + 二叉排序树一定是二叉平衡树。
  + 以上说法都不对。

8. 已知x为double类型的变量，且值大于0，则下列表达式的值一定大于0的是（#slot）。
  + sin(x) / x
  + exp(x) - x
  + log(x) - x
  + x \* x - x

9. 一个简单有向图有10个结点、30条边。再增加多少条边可以成为完全图。（#slot）
  + 60
  + 70
  + 15
  + 20

10. 下列选项中，哪个可能是下图的深度优先遍历序列（#slot）。
  + 8, 6, 1, 5, 3, 4, 2, 10, 7, 12, 11, 9
  + 7, 8, 6, 4, 2, 1, 5, 3, 12, 9, 11, 10。
  + 8, 10, 12, 9, 11, 4, 5, 3, 2, 1, 6, 7
  + 7, 8, 10, 9, 11, 12, 4, 5, 1, 2, 3, 6。

11. 下面schedule函数的时间复杂度为（#slot）。

  ```cpp
  #include <algorithm>
  using namespace std;
  struct activity {
      int id, start, end;
  };
  bool compare(activity a, activity b) {
      return a.end < b.end;
  }
  int schedule(int n, activity * p) {
      sort(p, p + n, compare);
      int cnt = 0, end = 0;
      for (int i = 0; i < n; i++) {
          if (p[i].start >= end) {
              end = p[i].end;
              cnt++;
          }
      }
      return cnt;
  }
  ```
  + $O(n)$
  + $O(log (n))$
  + $O(n log (n))$
  + $O(n^2)$

12. 下面search函数的平均时间复杂度为（#slot）。

  ```cpp
  int search(int n, int * p, int target) {
      int low = 0, high = n;
      while (low <= high) {
          int middle = (low + high) / 2;
          if (target == p[middle]) {
              return middle;
          } else if (target > p[middle]) {
              low = middle + 1;
          } else {
              high = middle - 1;
          }
      }
      return -1;
  }
  ```
  + $O(n)$
  + $O(log (n))$
  + $O(1)$
  + 可能无法返回

13. 下面count\_triple函数的时间复杂度为（#slot）。

  ```cpp
  int count_triple(int n) {
      int cnt = 0;
      for (int a = 1; a <= n; a++)
          for (int b = a; a + b <= n; b++)
              for (int c = b; a + b + c <= n; c++)
                  if (a * a + b * b == c * c)
                      cnt++;
      return cnt;
  }
  ```
  + $O(N)$
  + $O(N^2)$
  + $O(N^3)$
  + 可能无法返回

14. 下面程序的输出为（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int down(int n) {
      if (n <= 1)
          return n;
      return down(n - 1) + down(n - 2) + down(n - 3);
  }
  int main() {
      cout << down(6) << endl;
      return 0;
  }
  ```
  + 6
  + 13
  + 20
  + 无法正常结束。

15. 下面的程序使用邻接矩阵表达的带权无向图，则从顶点0到顶点3的最短距离为（#slot）。

  ```cpp
  int weight[4][4] = {
      {0, 2, 5, 8},
      {2, 0, 1, 7},
      {5, 1, 0, 4},
      {8, 7, 4, 0}};
  ```
  + 6
  + 7
  + 8
  + 9

= 判断题（每题 2 分，共 20 分）

1. 祖冲之是南北朝时期杰出的数学家、天文学家，其主要贡献在数学、天文历法和机械制造三方面。他首次将“圆周率”精算到小数第七位，即在3.1415926和3.1415927之间。

2. C++语言中，表达式2 ^ 3的结果类型为int、值为8。（#slot）

3. 一棵有 个节点的完全二叉树，则树的深度为$floor.l log _2(N) floor.r + 1$。（#slot）

4. 能用动态规划解决的问题，一般也可以用贪心法解决，但动态规划的效率更高。（#slot）

5. 使用math.h或cmath头文件中的正弦函数，表达式sin(30)的结果类型为double、值约为0.5。（#slot）

6. 要求出简单有向图中从顶点A到顶点B的最短路径，在深度优先搜索和广度优先搜索中选择，广度优先更适合。（#slot）

7. 某N个表项的哈希表，在发生哈希函数冲突时采用向后寻找空位的方法解决冲突。其查找操作的平均时间复杂度为$O(1)$，即使当该哈希表的每个表项都有元素时，查找操作的平均时间复杂度仍为$O(1)$。（#slot）

8. 动态规划有递推实现和递归实现，有时两种实现的时间复杂度不同。（#slot）

9. 围棋游戏中，判断落下一枚棋子后是否会提掉对方的子，可以使用泛洪算法来实现。（#slot）

10. 类B继承了抽象类A，但未实现类A中的纯虚函数f，则类B不能直接实例化。（#slot）

= 编程题（每题 25 分，共 50 分）

== 编程题 1：交流问题

=== 题目描述

来自 2 所学校 A 校、B 校的$N$名同学相聚在一起相互交流，方便起见，我们把这些同学从$1$至$N$编号。他们共进行了$M$次交流，第$i$次交流中，编号为$u_i, v_i$的同学相互探讨了他们感兴趣的话题，并结交成为了新的朋友。由于这次交流会的目的是促进两校友谊，因此只有不同学校的同学之间会交流，同校同学并不会相互交流。作为 A 校顾问，你对 B 校的规模非常感兴趣，你希望求出 B 校至少有几名同学、至多有几名同学。

=== 输入格式

第一行两个正整数$N,M$，表示同学的人数，交流的次数。接下来$M$行，每行两个正整数$u_i, v_i$，表示一次交流。题目保证输入合法，即交流一定是跨校开展的。

=== 输出格式

输出一行两个整数，用单个空格隔开，分别表示 B 校至少有几名同学、至多有几名同学。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4 3
1 2
2 3
4 2
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
1 3
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
7 5
1 2
2 3
4 2
5 6
6 7
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
2 5
```

=== 数据范围

对于$30$的测试点，保证，；对于$30$的测试点，保证，；对于$30$的测试点，保证，$M <= 2 times 10^5$。

=== 提示

在常规程序中，输入、输出时提供提示是好习惯。但在本场考试中，由于系统限定，请不要在输入、输出中附带任何提示信息。

=== 参考程序

```cpp
#include <iostream>
#include <vector>
#include <unordered_map>
using namespace std;
void dfs(vector<vector<int>>& graph, int node, vector<int>& colors, int* color_cnt,
int curr_color) {
    colors[node] = curr_color;
    color_cnt[curr_color]++;
    for (int neighbor : graph[node]) {
        if (colors[neighbor] == -1) {
            dfs(graph, neighbor, colors, color_cnt, curr_color ^ 1);
        }
    }
}
pair<int, int> find_b_school_students(int N, vector<pair<int, int>>& connections) {
    vector<vector<int>> graph(N + 1);
    for (const auto& connection : connections) {
        graph[connection.first].push_back(connection.second);
        graph[connection.second].push_back(connection.first);
    }
    vector<int> colors(N + 1, -1);
    int min_ans = 0;
    for (int i = 1; i <= N; ++i) {
        if (colors[i] == -1) {
            int color_cnt[2] = {0, 0};
            dfs(graph, i, colors, color_cnt, 0);
            min_ans += min(color_cnt[0], color_cnt[1]);
        }
    }
    return make_pair(min_ans, N - min_ans);
}
int main() {
    int N, M;
    cin >> N >> M;
    vector<pair<int, int>> connections(M);
    for (int i = 0; i < M; ++i) {
        cin >> connections[i].first >> connections[i].second;
    }
    pair<int, int> b_students = find_b_school_students(N, connections);
    cout << b_students.first << " " << b_students.second << endl;
    return 0;
}
```

== 编程题 2：俄罗斯方块

=== 题目描述

小杨同学用不同种类的俄罗斯方块填满了一个大小为$n times m$的网格图。网格图由$n times m$个带颜色方块构成。小杨同学现在将这个网格图交给了你，请你计算出网格图中俄罗斯方块的种类数。如果两个同色方块是四连通（即上下左右四个相邻的位置）的，则称两个同色方块直接连通；若两个同色方块同时与另一个同色方块直接或间接连通，则称两个同色方块间接连通。一个俄罗斯方块由一个方块和所有与其直接或间接连通的同色方块组成。定义两个俄罗斯方块的种类相同当且仅当通过平移其中一个俄罗斯方块可以和另一个俄罗斯方块重合；如果两个俄罗斯方块颜色不同，仍然视为同一种俄罗斯方块。例如，在如下情况中，方块$1$和方块$2$是同一种俄罗斯方块，而方块$1$和方块$3$不是同一种俄罗斯方块。

=== 输入格式

第一行包含两个正整数$n,m$，表示网格图的大小。对于之后$n$行，第$i$行包含$m$个正整数a\_i1, a\_i2, …, a\_im，表示该行$m$个方块的颜色。

=== 输出格式

输出一个非负整数，表示俄罗斯方块的种类数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5 6
1 2 3 4 4 5
1 2 3 3 4 5
1 2 2 3 4 5
1 6 6 7 7 8
6 6 7 7 8 8
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
7
```

=== 数据范围

子任务编#(math-missing)数据点占特殊条件号#(math-missing)比所有的俄罗斯方块大小不超过，即均可以放置于#(math-missing)的网格1图中所有的俄罗斯方块的形状均为#(math-missing)或#(math-missing)类型，其中#(math-missing)为任意2正整数3对于全部数据，保证有，。

=== 提示

种类型的俄罗斯方块如下：

=== 参考程序

```cpp
#include <cstdio>
#include <algorithm>
#include <map>
using namespace std;
const int N = 505;
int n, m;
int val[N][N];
int vis[N][N];
int xmin, xmax, ymin, ymax;
int posx[N * N], posy[N * N], cnt;
int idx[N * N];
bool isend[3 * N * N];
map <int, int> ch[3 * N * N];
int root, ncnt;
int ans;
void dfs(int x, int y, int c)
{
    if (x < 1 || x > n || y < 1 || y > m)
        return;
    if (vis[x][y])
        return;
    if (val[x][y] != c)
        return;
    vis[x][y] = 1;
    xmin = min(xmin, x), xmax = max(xmax, x);
    ymin = min(ymin, y), ymax = max(ymax, y);
    posx[++cnt] = x;
    posy[cnt] = y;
    dfs(x - 1, y, c);
    dfs(x + 1, y, c);
    dfs(x, y - 1, c);
    dfs(x, y + 1, c);
}
void go(int &n, int v)
{
    if (!ch[n].count(v))
        ch[n][v] = ++ncnt;
    n = ch[n][v];
    return;
}
void work(int x, int y)
{
    cnt = 0;
    xmin = n, xmax = 1;
    ymin = m, ymax = 1;
    dfs(x, y, val[x][y]);
    for (int i = 1; i <= cnt; i++)
        idx[i] = (posx[i] - xmin) * (ymax - ymin + 1) + (posy[i] - ymin);
    sort(idx + 1, idx + cnt + 1);
    int cur = root;
    int lascnt = ncnt;
    go(cur, xmax - xmin + 1);
    go(cur, ymax - ymin + 1);
    for (int i = 1; i <= cnt; i++)
        go(cur, idx[i]);
    ans += (! isend[cur]);
    isend[cur] = 1;
}
int main()
{
    root = ++ncnt;
    scanf("%d%d", &n, &m);
    for (int i = 1; i <= n; i++)
        for (int j = 1; j <= m; j++)
            scanf("%d", &val[i][j]);
    for (int i = 1; i <= n; i++)
        for (int j = 1; j <= m; j++)
            if (!vis[i][j])
                work(i, j);
    printf("%d\n", ans);
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
