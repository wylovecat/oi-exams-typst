// ===========================================================================
// GESP 2025-03 C++ 七级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-03/2025-03-L7.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 7,
  month: "2025 年 03 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 下列哪个选项是C++中的关键字？
  + function
  + class
  + method
  + object

2. 下面代码输出的是（#slot）

  ```cpp
  int main() {
      int a = 5, b = 2;
      cout << (a >> b) << endl;
  }
  ```
  + 1
  + 2
  + 5
  + 10

3. 以下代码的输出是什么？

  ```cpp
  int main() {
      int a = 10;
      int *p = &a;
      int *&q = p;
      *q = 20;
      cout << a << endl;
      return 0;
  }
  ```
  + 10
  + 20
  + 地址值
  + 编译错误

4. 下面代码输出的是（#slot）

  ```cpp
  int main() {
      int arr[5] = {1, 2, 3, 4, 5};
      int *p = arr + 2;
      cout << *p << endl;
      return 0;
  }
  ```
  + 1
  + 2
  + 3
  + 4

5. 下列关于排序的说法，正确的是（#slot）。
  + 选择排序是最快的排序算法之一。
  + 归并排序通常是稳定的。
  + 最差情况，$N$个元素做快速排序的时间复杂度为$O(N)$。
  + 最好情况，$N$个元素做插入排序的时间复杂度为$O(N^2)$。

6. 下面关于C++类构造和析构函数的说法，错误的是（#slot）。
  + 构造函数不能声明为虚函数。
  + 析构函数必须声明为虚函数。
  + 类的默认构造函数可以被声明为private。
  + 类的析构函数可以被声明为private。

7. 下列关于树和图的说法，错误的是（#slot）。
  + 树是一种有向无环图，但有向无环图不都是一棵树。
  + 如果把树看做有向图，每个节点指向其子节点，则该图是强连通图。
  + 个顶点且连通的无向图，其最小生成树一定包含#(math-missing)个条边。
  + 个顶点、$N$条边的有向图，一定不是强连通的。

8. 是个神奇的数字，因为它是由两个数#(math-missing)和$25$拼接而成，而且$2025 = (20 + 25)^2$。小杨决定写个程序找找小于$N$的正整数中共有多少这样神奇的数字。下面程序横线处应填入的是（#slot）。

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
  + ```cpp
    nl + nr == n
    ```
  + ```cpp
    nl + nr == n2
    ```
  + ```cpp
    (nl + nr) * (nl + nr) == n
    ```
  + ```cpp
    (nl + nr) ^ 2 == n2
    ```

9. 给定一个无向图，图的节点编号从 0 到 n-1，图的边以邻接表的形式给出。下面的程序使用深度优先搜索（DFS）遍历该图，并输出遍历的节点顺序。横线处应该填入的是（#slot）

  ```cpp
  #include <iostream>
  #include <vector>
  #include <stack>
  using namespace std;
  void DFS(int start, vector<vector<int>>& graph, vector<bool>& visited) {
      stack<int> s;
      s.push(start);
      visited[start] = true;
      while (!s.empty()) {
          int node = s.top();
          s.pop();
          cout << node << " "; // 输出当前节点
          // 遍历邻接节点
          for (int neighbor : graph[node]) {
              if (!visited[neighbor]) {
                  __________________
                  __________________
              }
          }
      }
  }
  int main() {
      int n, m;
      cin >> n >> m;
      vector<vector<int>> graph(n);
      for (int i = 0; i < m; i++) {
          int u, v;
          cin >> u >> v;
          graph[u].push_back(v);
          graph[v].push_back(u);
      }
      vector<bool> visited(n, false);
      // 从节点 0 开始DFS遍历
      DFS(0, graph, visited);
      return 0;
  }
  ```
  + ```cpp
    visited[neighbor] = true;
    s.push(neighbor-1);
    ```
  + ```cpp
    visited[neighbor] = true;
    s.push(neighbor+1);
    ```
  + ```cpp
    visited[neighbor] = false;
    s.push(neighbor);
    ```
  + ```cpp
    visited[neighbor] = true;
    s.push(neighbor);
    ```

10. 给定一个整数数组 nums，找到其中最长的严格上升子序列的长度。子序列是指从原数组中删除一些元素（或不删除）后，剩余元素保持原有顺序的序列。下面的程序横线处应该填入的是（#slot）

  ```cpp
  #include <iostream>
  #include <vector>
  #include <algorithm>
  using namespace std;
  int lengthOfLIS(vector<int>& nums) {
      int n = nums.size();
      if (n == 0) return 0;
      vector<int> dp(n, 1);
      for (int i = 1; i < n; i++) {
          for (int j = 0; j < i; j++) {
              if (nums[i] > nums[j]) {
                  _________________________
              }
          }
      }
      return *max_element(dp.begin(), dp.end());
  }
  int main() {
      int n;
      cin >> n;
      vector<int> nums(n);
      for (int i = 0; i < n; i++) {
          cin >> nums[i];
      }
      int result = lengthOfLIS(nums);
      cout << result << endl;
      return 0;
  }
  dp[i] = max(dp[i], dp[j]);
  dp[i] = max(dp[i+1], dp[j] + 1);
  dp[i] = max(dp[i], dp[j] - 1);
  dp[i] = max(dp[i], dp[j] + 1);
  ```

11. 给定一个整数数组 nums，找到其中最长的严格上升子序列的长度。子序列是指从原数组中删除一些元素（或不删除）后，剩余元素保持原有顺序的序列。该程序的时间复杂度为（#slot）

  ```cpp
  #include <iostream>
  #include <vector>
  #include <algorithm>
  using namespace std;
  int lengthOfLIS(vector<int>& nums) {
      int n = nums.size();
      if (n == 0) return 0;
      vector<int> dp(n, 1);
      for (int i = 1; i < n; i++) {
          for (int j = 0; j < i; j++) {
              if (nums[i] > nums[j]) {
                  _________________________
              }
          }
      }
      return *max_element(dp.begin(), dp.end());
  }
  int main() {
      int n;
      cin >> n;
      vector<int> nums(n);
      for (int i = 0; i < n; i++) {
          cin >> nums[i];
      }
      int result = lengthOfLIS(nums);
      cout << result << endl;
      return 0;
  }
  ```
  + $O(n^2)$
  + $O(n)$
  + $O(log (n))$
  + $O(n log (n))$

12. 给定两个无向图G1和 G2 ，判断它们是否同构。图的同构是指两个图的节点可以通过某种重新编号的方式完全匹配，且边的连接关系一致。为了简化问题，假设图的节点编号从 0 到 n-1，并且图的边以邻接表的形式给出。下面程序中横线处应该给出的是（#slot）

  ```cpp
  #include <iostream>
  #include <vector>
  #include <map>
  #include <algorithm>
  using namespace std;
  string graphHash(vector<vector<int>>& graph) {
      vector<string> nodeHashes(graph.size());
      for (int i = 0; i < graph.size(); i++) {
          vector<int> neighbors = graph[i];
          sort(neighbors.begin(), neighbors.end());
          string hash;
          for (int neighbor : neighbors) {
              ——————————————————————————
          }
          nodeHashes[i] = hash;
      }
      sort(nodeHashes.begin(), nodeHashes.end());
      string finalHash;
      for (string h : nodeHashes) {
          finalHash += h + ";";
      }
      return finalHash;
  }
  int main() {
      int n;
      cin >> n;
      vector<vector<int>> G1(n);
      for (int i = 0; i < n; i++) {
          int k;
          while (cin >> k) {
              G1[i].push_back(k);
              if (cin.get() == '\n') break;
          }
      }
      vector<vector<int>> G2(n);
      for (int i = 0; i < n; i++) {
          int k;
          while (cin >> k) {
              G2[i].push_back(k);
              if (cin.get() == '\n') break;
          }
      }
      string hash1 = graphHash(G1);
      string hash2 = graphHash(G2);
      if (hash1 == hash2) {
          cout << "YES" << endl;
      } else {
          cout << "NO" << endl;
      }
      return 0;
  }
  hash += to_string(neighbor);
  hash += to_string(neighbors);
  hash += to_string(neighbor) + ",";
  hash -= to_string(neighbors);
  ```

13. 给定一个 m×n的二维网格 grid，每个格子中有一个非负整数。请找出一条从左上角 (0, 0) 到右下角 (m-1, n- 1) 的路径，使得路径上的数字总和最小。每次只能向右或向下移动。横线处应该填入的是（#slot）

  ```cpp
  #include <iostream>
  #include <vector>
  #include <algorithm>
  using namespace std;
  int minPathSum(vector<vector<int>>& grid) {
      int m = grid.size();
      int n = grid[0].size();
      vector<vector<int>> dp(m, vector<int>(n, 0));
      dp[0][0] = grid[0][0];
      for (int j = 1; j < n; j++) {
          dp[0][j] = dp[0][j - 1] + grid[0][j];
      }
      for (int i = 1; i < m; i++) {
          dp[i][0] = dp[i - 1][0] + grid[i][0];
      }
      for (int i = 1; i < m; i++) {
          for (int j = 1; j < n; j++) {
              ————————————————————————————————
          }
      }
      return dp[m - 1][n - 1];
  }
  int main() {
      int m, n;
      cin >> m >> n;
      vector<vector<int>> grid(m, vector<int>(n));
      for (int i = 0; i < m; i++) {
          for (int j = 0; j < n; j++) {
              cin >> grid[i][j];
          }
      }
      int result = minPathSum(grid);
      cout << result << endl;
      return 0;
  }
  dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + grid[i][1];
  dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + grid[i][j];
  dp[i][j] = min(dp[i - 1][j], dp[i][j]) + grid[i][j];
  dp[i][j] = min(dp[i][j], dp[i][j - 1]) + grid[i][j];
  ```

14. 给定一个整数数组 nums，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。下面横线处应该填入的是（#slot）

  ```cpp
  #include <iostream>
  #include <vector>
  #include <algorithm>
  using namespace std;
  int maxSubArray(vector<int>& nums) {
      int n = nums.size();
      if (n == 0) return 0;
      vector<int> dp(n, 0);
      dp[0] = nums[0];
      int maxSum = dp[0];
      for (int i = 1; i < n; i++) {
          _____________________________________
          maxSum = max(maxSum, dp[i]);
      }
      return maxSum;
  }
  int main() {
      int n;
      cin >> n;
      vector<int> nums(n);
      for (int i = 0; i < n; i++) {
          cin >> nums[i];
      }
      int result = maxSubArray(nums);
      cout << result << endl;
      return 0;
  }
  dp[i] = max(nums[i+1], dp[i - 1] + nums[i]);
  dp[i] = max(nums[i], dp[i - 1] + nums[i]);
  dp[i] = max(nums[i], dp[i + 1] + nums[i]);
  dp[i] = max(nums[i], dp[i - 1] + nums[i+1]);
  ```

15. 在哈希表的实现中，冲突解决是一个重要的问题。以下哪种方法#(math-missing)不是#(math-missing)常见的哈希表冲突解决策略？
  + 链地址法（Chaining）
  + 开放地址法（Open Addressing）
  + 二次哈希法（Double Hashing）
  + 二分查找法（Binary Search）

= 判断题（每题 2 分，共 20 分）

1. 在C++语法中，表达式1e6、1000000和10^6的值是相同的。

2. 在C++语言中，函数调用前必须有函数声明或定义。

3. 快速排序一般是不稳定的。

4. long long类型能表达的数都能使用double类型精确表达。

5. 使用math.h或cmath头文件中的函数，表达式cos(60)的结果类型为double、值约为0.5。

6. 一颗 层的满二叉树，一定有$2^N - 1$个结点。

7. 邻接表和邻接矩阵都是图的存储形式。为了操作时间复杂度考虑，同一个图可以同时维护两种存储形式。

8. 子类对象包含父类的所有成员（包括私有成员）。从父类继承的私有成员也是子类的成员，因此子类可以直接访问。

9. 动态规划算法通常有递归实现和递推实现。但由于递归调用在运行时会由于层数过多导致程序崩溃，有些动态规划算法只能用递推实现。

10. 按照下面的规则生成一棵二叉树：以一个人为根节点，其父亲为左子节点，母亲为右子节点。对其父亲、母亲分别用同样规则生成左子树和右子树。以此类推，记录30代的直系家谱，则这是一棵满二叉树。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：图上移动

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 有一张包含$n$个结点与$m$条边的无向图，结点以$1,2,dots.h ,n$标号。小 A 会从图上选择一个结点作为起点，每一步移动到某个与当前小 A 所在结点相邻的结点。对于每个结点$i$（#slot），小 A 想知道从结点#(math-missing)出发恰好移动步之后，小 A 可能位于哪些结点。由于满足条件的结点可能有很多，你只需要求出这些结点的数量。

=== 输入格式

第一行，三个正整数，分别表示无向图的结点数与边数，最多移动的步数。接下来#(math-missing)行，每行两个正整数，表示图中的一条连接结点#(math-missing)与#(math-missing)的无向边。

=== 输出格式

共#(math-missing)行，第#(math-missing)行（#slot）包含#(math-missing)个整数，第#(math-missing)个整数（#slot）表示从结点$1 <= j <= k$出发恰好移动$i$步之后可能位于的结点数量。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4 4 3
1 2
1 3
2 3
3 4
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
2 4 4
2 4 4
3 3 4
1 3 3
```

=== 数据范围

对于$20$% 的测试点，保证$k=1$。对于另外$20$% 的测试点，保证$1 <= n <= 50$，$1 <= m <= 50$。对于所有测试点，保证，，保证，$1 <= m <= 50$。

=== 参考程序

```cpp
#include <cstdio>
using namespace std;
const int K = 25;
const int N = 505;
const int E = N << 1;
int n, m, k;
int h[N], to[E], nx[E], et;
int f[K][N][N];
void ae(int u, int v) {
    et++;
    to[et] = v;
    nx[et] = h[u];
    h[u] = et;
}
int main() {
    scanf("%d%d%d", &n, &m, &k);
    for (int i = 1; i <= m; i++) {
        int u, v;
        scanf("%d%d", &u, &v);
        ae(u, v);
        ae(v, u);
    }
    for (int i = 1; i <= n; i++)
        f[0][i][i] = 1;
    for (int t = 1; t <= k; t++)
        for (int x = 1; x <= n; x++)
            for (int y = 1; y <= n; y++)
                if (f[t - 1][x][y])
                    for (int i = h[y]; i; i = nx[i])
                        f[t][x][to[i]] = 1;
    for (int i = 1; i <= n; i++) {
        for (int t = 1; t <= k; t++) {
            int ans = 0;
            for (int j = 1; j <= n; j++)
                ans += f[t][i][j];
            printf("%d%c", ans, " \n"[t == k]);
        }
    }
    return 0;
}
```

== 编程题 2：等价消除

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 有一个仅包含小写英文字母的字符串$S$。对于一个字符串，如果能通过每次删去其中两个相同字符的方式，将这个字符串变为空串，那么称这个字符串是可以被等价消除的。小 A 想知道$S$有多少子串是可以被等价消除的。一个字符串#(math-missing)是$S$的子串，当且仅当删去$S$的某个可以为空的前缀和某个可以为空的后缀之后，可以得到$S'$。

=== 输入格式

第一行，一个正整数$|S|$，表示字符串$S$的长度。第二行，一个仅包含小写英文字母的字符串$S$。

=== 输出格式

一行，一个整数，表示答案。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
7
aaaaabb
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
9
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
9
babacabab
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
2
```

=== 数据范围

对于$20$% 的测试点，保证$S$中仅包含a和b两种字符。对于另外 % 的测试点，保证。对于所有测试点，保证$1 <= |S| <= 2 times 10^5$。

=== 参考程序

```cpp
#include <cstdio>
#include <map>
using namespace std;
const int N = 2e5 + 5;
int n;
char s[N];
map <int, int> m;
long long ans;
int main() {
    scanf("%d", &n);
    scanf("%s", s + 1);
    int v = 0;
    m[v]++;
    for (int i = 1; i <= n; i++) {
        v ^= 1 << (s[i] - 'a');
        ans += m[v];
        m[v]++;
    }
    printf("%lld\n", ans);
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
