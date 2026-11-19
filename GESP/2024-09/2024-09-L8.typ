// ===========================================================================
// GESP 2024-09 C++ 八级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-09/2024-09-L8.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 8,
  month: "2024 年 09 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 下面关于C++类和对象的说法，错误的是（#slot）。
  + 类的析构函数可以为虚函数。
  + 类的构造函数不可以为虚函数。
  + class中成员的默认访问权限为private。
  + struct中成员的默认访问权限为private。

2. 对于一个具有 个顶点的无向图，若采用邻接矩阵表示，则该矩阵的大小为（#slot）。
  + 类的析构函数可以为虚函数。
  + 类的构造函数不可以为虚函数。
  + class中成员的默认访问权限为private。
  + struct中成员的默认访问权限为private。

3. 设有编号为A、B、C、D、E的5个球和编号为A、B、C、D、E的5个盒子。现将这5个球投入5个盒子，要求每个盒子放一个球，并且恰好有两个球的编号与盒子编号相同，问有多少种不同的方法？（#slot）。
  + 5
  + 120
  + 20
  + 60

4. 从甲地到乙地，可以乘高铁，也可以乘汽车，还可以乘轮船。一天中，高铁有10班，汽车有5班，轮船有2班。那么一天中乘坐这些交通工具从甲地到乙地共有多少种不同的走法？（#slot）。
  + 100
  + 60
  + 30
  + 17

5. 个结点的二叉树，执行释放全部结点操作的时间复杂度是（#slot）。
  + $O(n)$
  + $O(n log n)$
  + $O(log n)$
  + $O(2^n)$

6. 在一个单位圆上，随机分布 个点，求这 个点能被一个单位半圆周全部覆盖的概率（#slot）。
  + $frac(n, 2^(n - 1))$
  + $frac(1, n^2)$
  + $frac(1, n)$
  + $frac(1, 2^n)$

7. 下面pailie函数是一个实现排列的程序，横线处可以填入的是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int sum = 0;
  void swap(int & a, int & b) {
      int temp = a;
      a = b;
      b = temp;
  }
  void pailie(int begin, int end, int a[]) {
      if (begin == end) {
          for (int i = 0; i < end; i++)
              cout << a[i];
          cout << endl;
      }
      for (int i = begin; i < end; i++) {
          __________ // 在此处填入选项
      }
  }
  ```
  + ```cpp
    swap(a[begin + 1], a[i]);
    pailie(begin + 1, end, a);
    swap(a[i], a[begin]);
    ```
  + ```cpp
    swap(a[begin], a[i]);
    pailie(begin, end, a);
    swap(a[i], a[begin]);
    ```
  + ```cpp
    swap(a[begin], a[i]);
    pailie(begin + 1, end, a);
    swap(a[i], a[begin]);
    ```
  + ```cpp
    swap(a[begin] + 1, a[i]);
    pailie(begin + 1, end, a);
    swap(a[i], a[begin + 1]);
    ```

8. 上一题中，如果主函数为如下的程序，则最后的排列数是多少个？（#slot）。

  ```cpp
  int main() {
      int a[5] = {1, 2, 3, 4, 5};
      pailie(0, 5, a);
      return 0;
  }
  ```
  + 120
  + 60
  + 240
  + 180

9. 下列程序实现了输出杨辉三角形，代码中横线部分应该填入的是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  #define N 35
  int a[N][N];
  int main() {
      int n;
      cin >> n;
      for (int i = 1; i <= n; i++)
          for (int j = 1; j <= i; j++) {
              if (j == 1 || j == i)
                  a[i][j] = 1;
              else
                  __________ // 在此处填入选项
          }
      for (int i = 1; i <= n; i++) {
          for (int j = 1; j <= i; j++)
              cout << a[i][j];
          cout<<endl;
      }
      return 0;
  }
  a[i][j] = a[i - 1][j - 1] + a[i - 1][j];
  a[i][j] = a[i][j - 1] + a[i - 1][j];
  a[i][j] = a[i - 1][j] + a[i - 1][j];
  a[i][j] = a[i - 1][j - 1] + a[i][j];
  ```

10. 下面最小生成树的Kruskal算法程序中，横线处应该填入的是（#slot）。

  ```cpp
  #include <iostream>
  #include <vector>
  #include <algorithm>
  using namespace std;
  struct Edge {
      int u, v, weight;
      bool operator <(const Edge & other) const {
          return weight < other.weight;
      }
  };
  int findParent(int vertex, vector<int> & parent) {
      if (parent[vertex] == -1)
          return vertex;
      return parent[vertex] = findParent(parent[vertex], parent);
  }
  int main() {
      int n, m;
      cin >> n >> m; // n: 顶点数, m: 边数
      vector<Edge> edges(m);
      vector<int> parent(n, -1);
      int totalWeight = 0;
      for (int i = 0; i < m; i++)
          cin >> edges[i].u >> edges[i].v >> edges[i].weight;
      sort(edges.begin(), edges.end());
      for (const auto & edge : edges) {
          int uParent = findParent(edge.u, parent);
          int vParent = findParent(edge.v, parent);
          if (__________) { // 在此处填入选项
              parent[uParent] = vParent;
              totalWeight += edge.weight;
          }
      }
  }
  ```
  + uParent == vParent
  + uParent \>= vParent
  + uParent != vParent
  + uParent \<= vParent

11. 下面Prim算法程序中，横线处应该填入的是（#slot）。

  ```cpp
  #include <iostream>
  #include <vector>
  #include <algorithm>
  using namespace std;
  int prim(vector<vector<int>> & graph, int n) {
      vector<int> key(n, INT_MAX);
      vector<int> parent(n, -1);
      key[0] = 0;
      for (int i = 0; i < n; i++) {
          int u = min_element(key.begin(), key.end()) - key.begin();
          if (key[u] == INT_MAX)
              break;
          for (int v = 0; v < n; v++) {
              if (__________) { // 在此处填入选项
                  key[v] = graph[u][v];
                  parent[v] = u;
              }
          }
      }
      int sum = 0;
      for (int i = 0; i < n; i++) {
          if (parent[i] != -1) {
              cout << "Edge: " << parent[i] << " - " << i << " Weight: " << key[i] <<
  endl;
              sum += key[i];
          }
      }
      return sum;
  }
  int main() {
      int n, m;
      cin >> n >> m;
      vector<vector<int>> graph(n, vector<int>(n, 0));
      for (int i = 0; i < m; i++) {
          int u, v, w;
          cin >> u >> v >> w;
          graph[u][v] = w;
          graph[v][u] = w;
      }
      int result = prim(graph, n);
      cout << "Total weight of the minimum spanning tree: " << result << endl;
      return 0;
  }
  graph[u][v] >= 0 && key[v] > graph[u][v]
  graph[u][v] <= 0 && key[v] > graph[u][v]
  graph[u][v] == 0 && key[v] > graph[u][v]
  graph[u][v] != 0 && key[v] > graph[u][v]
  ```

12. 下列Dijkstra算法中，横线处应该填入的是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  #define N 100
  int n, e, s;
  const int inf = 0x7fffff;
  int dis[N + 1];
  int cheak[N + 1];
  int graph[N + 1][N + 1];
  int main() {
      for (int i = 1; i <= N; i++)
          dis[i] = inf;
      cin >> n >> e;
      for (int i = 1; i <= e; i++) {
          int a, b, c;
          cin >> a >> b >> c;
          graph[a][b] = c;
      }
      cin >> s;
      dis[s] = 0;
      for (int i = 1; i <= n; i++) {
          int minn = inf, minx;
          for (int j = 1; j <= n; j++) {
              if (__________) { // 在此处填入选项
                  minn = dis[j];
                  minx = j;
              }
          }
          cheak[minx] = 1;
          for (int j = 1; j <= n; j++) {
              if (graph[minx][j] > 0) {
                  if (minn + graph[minx][j] < dis[j]) {
                      dis[j] = minn + graph[minx][j];
                  }
              }
          }
      }
  }
  dis[j] > minn && cheak[j] == 0
  dis[j] < minn && cheak[j] == 0
  dis[j] >= minn && cheak[j] == 0
  dis[j] < minn && cheak[j] != 0
  ```

13. 下面Floyd算法中，横线处应该填入的是（#slot）。

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
                  if (__________) // 在此处填入选项
                      map[i][j] = map[i][k] + map[k][j];
      for (int i = 1; i <= n; i++) {
          for (int j = 1; j <= n; j++) {
              cout.width(4);
              cout << map[i][j];
          }
          cout << endl;
      }
  }
  map[i][j] < map[i][k] + map[k][j]
  map[i][j] > map[i][k] + map[k][j]
  map[i][j] > map[i][k] - map[k][j]
  map[i][j] < map[i][k] - map[k][j]
  ```

14. 下面程序的Merge\_Sort函数时间复杂度为（#slot）。

  ```cpp
  void Merge(int a[], int left, int mid, int right) {
      int temp[right - left + 1];
      int i = left;
      int j = mid + 1;
      int k = 0;
      while (i <= mid && j <= right) {
          if (a[i] < a[j])
              temp[k++] = a[i++];
          else
              temp[k++] = a[j++];
      }
      while (i <= mid)
          temp[k++] = a[i++];
      while (j <= right)
          temp[k++] = a[j++];
      for (int m = left, n = 0; m <= right; m++, n++)
          a[m] = temp[n];
  }
  void Merge_Sort(int a[], int left, int right) {
      if (left == right)
          return;
      int mid = (left + right) / 2;
      Merge_Sort(a, left, mid);
      Merge_Sort(a, mid + 1, right);
      Merge(a, left, mid, right);
  }
  ```
  + $O(n log n)$
  + $O(n^2)$
  + $O(2^n)$
  + $O(log n)$

15. 下面fibonacci函数的时间复杂度为（#slot）。

  ```cpp
  int fibonacci(int n) {
      if (n <= 1)
          return n;
      else
          return fibonacci(n - 1) + fibonacci(n - 2);
  }
  ```
  + $O(1)$
  + ,
  + $O(n)$
  + $O(n log n)$

= 判断题（每题 2 分，共 20 分）

1. 表达式'3' & 1的结果为'1'。

2. 在C++语言中，变量定义必须在某一个函数定义之内。

3. 冒泡排序一般是不稳定的。

4. 二叉排序树的查找操作的平均时间复杂度，正比于树的高度。

5. 使用math.h或cmath头文件中的余弦函数，表达式cos(60)的结果类型为double、值约为0.5。

6. 你有三种硬币，分别面值2元、5元和7元，每种硬币都有足够多。买一本书需要27元，则最少可以用5个硬币组合起来正好付清，且不需要对方找钱。

7. 现有 个完全相同的元素，要将其分为 组，允许每组可以有 个元素，则一共有#(math-missing)种分组方案。

8. 已知int类型的变量a和b中分别存储着一个直角三角形的两条直角边的长度，则该三角形的面积可以通过表达式a / 2.0 \* b求得。

9. 已知等差数列的通项公式$a_n = a_1 + (n - 1)dot d$，则前$n$项和的求和公式为$S_n = n dot (a_1 + a_n) / 2$。使用这一公式计算$S_n$的时间复杂度是$O(1)$。

10. 诚实国公民只说实话，说谎国公民只说谎话。你来到一处分岔口，一条通往诚实国，一条通往说谎国，但不知是哪一条通往哪里。正在为难之际，走来两位路人，他们都自称是诚实国公民，都说对方是说谎国公民。你想去说谎国，可以这样问其中一位路人：“我要去说谎国，如果我去问另一个路人，他会指向哪一条路？”。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：手套配对

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有$n$对不同的手套，每对手套由左右各一只组成。小杨想知道从中取出$m$只手套，$m$只手套恰好包含$k$对手套的情况有多少种。小杨认为两种取出的情况不同，当且仅当两种情况取出的手套中存在不同的手套（同一对手套的左右手也视为不同的手套）。

=== 输入格式

第一行包含一个正整数$t$，代表测试用例组数。接下来是$t$组测试用例。对于每组测试用例，一共一行。第一行包含三个正整数$n,m,k$，代表手套数量，取出的手套数和目标对数。

=== 输出格式

对于每组测试数据，输出一个整数，代表可能的情况数量对$10^9 + 7$取模的结果。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
2
5 6 2
5 1 5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
120
0
```

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
const int N = 2e3+10;
const int p = 1e9+7;
#define ll long long
ll c[N][N];
ll pw[N];
int n,m,k;
void init(){
    pw[0]=1;
    for(int i=0;i<N;i++){
        if(i)pw[i]=pw[i-1]*2%p;
        for(int j=0;j<=i;j++){
            if(j==0)c[i][j]=1;
            else c[i][j]=(c[i-1][j]+c[i-1][j-1])%p;
        }
    }
}
int main(){
    init();
    int t;
    cin>>t;
    while(t--){
        cin>>n>>m>>k;
        if(m<2*k||m-2*k>n-k){
            cout<<"0\n";
            continue;
        }
        ll ans=c[n][k]*c[n-k][m-2*k]%p;
        ans=ans*pw[m-2*k]%p;
        cout<<ans<<"\n";
    }
}
```

== 编程题 2：美丽路径

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有一棵包含$n$个节点的树，节点从$1$到$n$编号，并且每个节点要么是白色，要么是黑色。对于树上的一条简单路径（不经过重复节点的路径），小杨认为它是美丽的当且仅当路径上相邻节点的颜色均不相同。例如下图，其中节点$1$和节点$4$是黑色，其余节点是白色，路径$2-1-3-4$是美丽路径，而#(math-missing)路径不是美丽路径（相邻节点$3$和$5$颜色相同）。对于树上的一条简单路径，小杨认为它的长度是路径包含节点的数量。小杨想知道最长的美丽路径的长度是多少。

=== 输入格式

第一行包含一个正整数$n$，代表节点数量。第二行包含$n$个整数$c_1, c_2, dots.h , c_n$，代表每个节点的颜色，如果$c_i = 0$，代表节点$i$为白色，如果$c_i = 1$，代表节点为黑色。之后$n - 1$行，每行包含两个正整数$u_i, v_i$，代表存在一条连接节点$u_i$和节点$v_i$的边。

=== 输出格式

输出一个整数，代表最长美丽路径的长度。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5
0 0 0 0 0
1 2
2 3
3 4
4 5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
1
```

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
const int N = 1e5+10;
vector<int> g[N];
int dep[N],vis[N],c[N];
int n,ans;
int dfs(int x,int fa){
    vis[x]=1;
    dep[x]=dep[fa]+1;
    int mx = dep[x];
    vector<int> tmp;
    tmp.push_back(mx);
    for(auto i:g[x]){
        if(i==fa||c[i]==c[x])continue;
        int d = dfs(i,x);
        tmp.push_back(d);
        mx = max(d,mx);
    }
    sort(tmp.begin(),tmp.end());
    int m = tmp.size(),res=1;
    if(m>1){
        res = tmp[m - 1] + tmp[m - 2] - 2 * dep[x] + 1;
    }
    ans=max(ans,res);
    return mx;
}
int main(){
    cin>>n;
    for(int i=1;i<=n;i++){
        cin>>c[i];
    }
    for(int i=1;i<n;i++){
        int u,v;
        cin>>u>>v;
        g[u].push_back(v);
        g[v].push_back(u);
    }
    for(int i=1;i<=n;i++){
        if(!vis[i]){
            dfs(i,0);
        }
    }
    cout<<ans<<"\n";
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
