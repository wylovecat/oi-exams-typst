// ===========================================================================
// GESP 2024-06 C++ 八级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-06/2024-06-L8.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 8,
  month: "2024 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. GESP活动期间，举办方从获胜者ABCDE五个人中选出三个人排成一队升国旗，其中A不能排在队首，请问有多少种排法？
  + 24
  + 48
  + 32
  + 12

2. 7进制数235转换成3进制数是（#slot）。
  + 11121
  + 11122
  + 11211
  + 11112

3. 0,1,2,3,4,5这些数字组成一个三位数，请问没有重复数字的情况下，有多少种组法（#slot）。
  + 180
  + 120
  + 80
  + 100

4. 有V个顶点、E条边的图的深度优先搜索遍历时间复杂度为（#slot）。
  + 24
  + 48
  + 32
  + 12

5. 一对夫妻生男生女的概率相同。已知这对夫妻有两个孩子，其中一个是女孩，另一个是男孩的概率是多少？
  + 544
  + 546
  + 564
  + 602

6. 从1到2024这2024个数中，共有（#slot）个包含数字6的数。
  + 544
  + 546
  + 564
  + 602

7. 二进制数100.001转换成十进制数是（#slot）。
  + 4.25
  + 4.125
  + 4.5
  + 4.75

8. 以下函数声明，哪个是符合C++语法的？（#slot）。

  ```cpp
  void BubbleSort(char a[][], int n);
  void BubbleSort(char a[][20], int n);
  void BubbleSort(char a[10][], int n);
  void BubbleSort(char[,] a, int n);
  ```

9. 下面有关C++重载的说法，错误的是（#slot）。
  + 两个参数个数不同的函数可以重名。
  + 两个参数类型不同的函数可以重名。
  + 两个类的方法可以重名。
  + 所有C++运算符均可以重载。

10. 小于或等于给定正整数n的数中，与n互质的数的个数，我们称为欧拉函数，记作phi (n)。下面说法错误的是（#slot）。
  + 如果n是质数，那么$□B$。
  + 两个质数一定是互质数。
  + 两个相邻的数一定是互质数。
  + 相邻的两个质数不一定是互质数。

11. 已知一棵二叉树有10个节点，则其中至多有（#slot）个节点有2个子节点。
  + 4
  + 5
  + 6
  + 3

12. 二项展开式$(x + y)^n = x^n + n(x)^(n - 1)y + frac(n(n - 1), 2)(x)^(n - 2)y^2 +dots.h +y^n$的系数，正好满足杨辉三角的规律。当时，二项式展开式中xy^9项的系数是（#slot）。
  + 5
  + 9
  + 10
  + 8

13. 下面程序的时间复杂度为（#slot）。

  ```cpp
  bool notPrime[N] = {false};
  void sieve() {
      for (int n = 2; n * n < N; n++)
          if (!notPrime[n])
              for (int i = n * n; i < N; i += n)
                  notPrime[i] = true;
  }
  ```
  + 5
  + 9
  + 10
  + 8

14. 下面程序的最差时间复杂度为（#slot）。

  ```cpp
  int gcd(int m, int n) {
      if (m == 0)
          return n;
      return gcd(n % m, m);
  }
  ```
  + $O(N)$
  + $O(N times log N)$
  + $O(N times log log N)$
  + $O(N^2)$

15. 下面程序的输出为（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int cnt = 0;
      for (int x = 0; x <= 10; x++)
          for (int y = 0; y <= 10; y++)
              for (int z = 0; z <= 10; z++)
                  if (x + y + z <= 15)
                      cnt++;
      cout << cnt << endl;
      return 0;
  }
  ```
  + 90
  + 91
  + 710
  + 711

= 判断题（每题 2 分，共 20 分）

1. ABCDE五个小朋友，排成一队跑步，其中AB两人必须排在一起，一共有48种排法。

2. 已知double类型的变量a和b，则执行语句a = a + b; b = a - b; a = a - b;后，变量a和b的值会互换。

3. 一个袋子中有3个完全相同的红色小球、2个完全相同的蓝色小球。每次从中取出1个，再放回袋子，这样进行3次后，可能的颜色顺序有8种。

4. 已知int类型的变量a和b中分别存储着一个直角三角形的两条直角边的长度，则斜边的长度可以通过表达式sqrt(a \* a + b \* b)求得。

5. 在一个包含v个顶点、e条边的带权连通简单有向图上使用Dijkstra算法求最短路径，时间复杂度为$O(v^2)$，可进一步优化至$O(e + v log (v))$。

6. 在 个元素的二叉排序树中查找一个元素，最差情况的时间复杂度是$O(log N)$。

7. C++语言中，可以为同一个类定义多个析构函数。

8. 使用单链表和使用双向链表，查找元素的时间复杂度相同。

9. 为解决哈希函数冲突，可以使用不同的哈希函数为每个表项各建立一个子哈希表，用来管理该表项的所有冲突元素。这些子哈希表一定不会发生冲突。

10. 要判断无向图的连通性，在深度优先搜索和广度优先搜索中选择，深度优先的平均时间复杂度更低。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：最远点对

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有一棵包含$n$个节点的树，这棵树上的任意一个节点要么是白色，要么是黑色。小杨想知道相距最远的一对不同颜色节点的距离是多少。

=== 输入格式

第一行包含一个正整数$n$，代表树的节点数。第二行包含$n$个非负整数$a_1, a_2, dots.h , a_n$（对于所有的$1 <= i <= n$，均有$a_i$等于 0 或 1），其中如果$a_i = 0$，则节点的颜色为白色；如果$a_i = 1$，则节点$i$的颜色为黑色。之后$n - 1$行，每行包含两个正整数$x_i,y_i$，代表存在一条连接节点$x_i$和$y_i$的边。保证输入的树中存在不同颜色的点。

=== 输出格式

输出一个整数，代表相距最远的一对不同颜色节点的距离。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5
0 1 0 1 0
1 2
1 3
3 4
3 5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
3
```

=== 数据范围

子任务编号 数据点占比#(math-missing)特殊条件1#(math-missing)30%#(math-missing)树的形态为一条链2#(math-missing)30%3#(math-missing)40%对于全部数据，保证有$,$。，

=== 提示

相距最远的不同颜色的一对节点为节点$2$和$5$。

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
const int N = 1e5+10;
vector<int> g[N];
int col[N];
int n;
int dep[N],far[N][2];
int ans;
void dfs(int x,int fa){
    dep[x]=dep[fa]+1;
    far[x][col[x]]=dep[x];
    for(int i:g[x]){
        if(i!=fa){
            dfs(i,x);
            for(int j=0;j<2;j++){
                if(far[x][j]!=-1&&far[i][j^1]!=-1){
                    ans = max(ans,far[x][j]-dep[x]+far[i][j^1]-dep[x]);
                }
            }
            for(int j=0;j<2;j++){
                far[x][j]=max(far[x][j],far[i][j]);
            }
        }
    }
    ans = max(ans,far[x][col[x]^1]-dep[x]);
}
int main(){
    int n;
    cin>>n;
    memset(far,-1,sizeof far);
    for(int i=1;i<=n;i++){
        cin>>col[i];
    }
    for(int i=1;i<n;i++){
        int u,v;
        cin>>u>>v;
        g[u].push_back(v);
        g[v].push_back(u);
    }
    dfs(1,0);
    cout<<ans<<"\n";
}
```

== 编程题 2：空间跳跃

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨在二维空间中有$n$个水平挡板，并且挡板之间彼此不重叠，其中第$i$个挡板处于水平高度$h_i$，左右端点分别位于$l_i$与$r_i$。小杨可以在挡板上左右移动，当小杨移动到右端点时，如果再向右移动会竖直掉落，从而落到下方第一个挡板上，移动到左端点时同理。小杨在挡板上每移动$1$个单位长度会耗费$1$个单位时间，掉落时每掉落$1$个单位高度也会耗费$1$个单位时间。小杨想知道，从第$s$个挡板上的左端点出发到第$t$个挡板需要耗费的最少时间是多少？注意：可能无法从第#(math-missing)个挡板到达到第#(math-missing)个挡板。

=== 输入格式

第一行包含一个正整数$n$，代表挡板数量。第二行包含两个正整数$s,t$，含义如题面所示。之后$n$行，每行包含三个正整数$l_i, r_i, h_i$，代表第$i$个挡板的左右端点位置与高度。

=== 输出格式

输出一个整数代表需要耗费的最少时间，如果无法到达则输出$-1$。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
3 1
5 6 3
3 5 6
1 4 100000
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
100001
```

=== 数据范围

子任务编号 数据点占比#(math-missing)特殊条件1#(math-missing)20%2#(math-missing)40%3#(math-missing)40%对于全部数据，保证有$1 <= n <= 1000, 1 <= l_i <= r_i <= 10^5, 1 <= h_i <= 10^5$。，，

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
const int maxn = 1e4+10;
struct edge {
    int v, w;
    edge(){}
    edge(int vv,int ww){
        v=vv;w=ww;
    }
    };
struct node {
    int dis, u;
    node (){}
    node (int diss,int uu){dis=diss;u=uu;}
    bool operator>(const node& a) const { return dis > a.dis; }
    };
vector<edge> e[maxn];
int dis[maxn], vis[maxn];
priority_queue<node, vector<node>, greater<node> > q;
int cnt;
void dijkstra(int s) {
    for(int i=1;i<=cnt;i++)dis[i]=INT_MAX;
    dis[s] = 0;
    q.push(node(0, s));
    while (!q.empty()) {
        int u = q.top().u;
        q.pop();
        if (vis[u]) continue;
        vis[u] = 1;
        for (auto ed : e[u]) {
            int v = ed.v, w = ed.w;
            if (dis[v] > dis[u] + w) {
                dis[v] = dis[u] + w;
                q.push(node(dis[v], v));
            }
        }
    }
    }
map<pair<int,int>,int> mp;
vector<int> es[2010];
int l[maxn],r[maxn],h[maxn];
int main(){
    int n;
    cin>>n;
    int s,t;
    cin>>s>>t;
    for(int i=1;i<=n;i++){
        cin>>l[i]>>r[i]>>h[i];
        mp[make_pair(l[i],h[i])]=i;
        mp[make_pair(r[i],h[i])]=n+i;
        es[i].push_back(i);
        es[i].push_back(n+i);
        e[i].push_back(edge(n+i,r[i]-l[i]));
        e[n+i].push_back(edge(i,r[i]-l[i]));
    }
    cnt=2*n+1;
    for(int i=1;i<=n;i++){
        int hh = -1,idx = i;
        for(int j=1;j<=n;j++){
            if(i==j)continue;
            if(l[j]<=l[i]&&l[i]<=r[j]&&h[j]<=h[i]){
                if(h[j]>hh){
                    hh=h[j];
                    idx=j;
                }
            }
        }
        if(hh!=-1){
            if(!mp[make_pair(l[i],hh)]){
                mp[make_pair(l[i],hh)]=cnt++;
            }
            int v = mp[make_pair(l[i],hh)];
            e[i].push_back(edge(v,h[i]-hh));
            e[idx].push_back(edge(v,abs(l[i]-l[idx])));
            e[n+idx].push_back(edge(v,abs(l[i]-r[idx])));
            e[v].push_back(edge(idx,abs(l[i]-l[idx])));
            e[v].push_back(edge(n+idx,abs(l[i]-r[idx])));
            es[idx].push_back(v);
        }
        hh = -1,idx = i;
        for(int j=1;j<=n;j++){
            if(i==j)continue;
            if(l[j]<=r[i]&&r[i]<=r[j]&&h[j]<=h[i]){
                if(h[j]>hh){
                    hh=h[j];
                    idx=j;
                }
            }
        }
        if(hh!=-1){
            if(!mp[make_pair(r[i],hh)]){
                mp[make_pair(r[i],hh)]=cnt++;
            }
            int v = mp[make_pair(r[i],hh)];
            e[n+i].push_back(edge(v,h[i]-hh));
            e[idx].push_back(edge(v,abs(r[i]-l[idx])));
            e[n+idx].push_back(edge(v,abs(r[i]-r[idx])));
            e[v].push_back(edge(idx,abs(r[i]-l[idx])));
            e[v].push_back(edge(n+idx,abs(r[i]-r[idx])));
            es[idx].push_back(v);
        }
    }
    dijkstra(s);
    int ans = INT_MAX;
    for(auto i:es[t]){
        ans=min(ans,dis[i]);
    }
    if(ans!=INT_MAX)cout<<ans<<"\n";
    else cout<<"-1\n";
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
