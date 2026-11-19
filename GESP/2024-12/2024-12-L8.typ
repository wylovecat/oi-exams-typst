// ===========================================================================
// GESP 2024-12 C++ 八级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-12/2024-12-L8.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 8,
  month: "2024 年 12 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 小杨家响应国家“以旧换新”政策，将自家的汽油车置换为新能源汽车，正在准备自编车牌。自编车牌包括5位数字或英文字母，要求第5位必须是数字，前4位中可以有最多1位英文字母。英文字母必须是大写，而且不能是O或I（因为容易与数字0或1混淆）。请问自编车牌共有多少种可能性？（#slot）。
  + 100,000
  + 1,060,000
  + 1,360,000
  + 1,460,000

2. 新年到，四家人在一起聚会。其中两家有三口人，另外两家有两口人。现在要安排大家在一张十人圆桌坐下，要求一家人必须相邻就座。由于有“主座”的习俗，每个座位都被认为是不同的。请问共有多少种就座方案？（#slot）。
  + 8640
  + 6912
  + 144
  + 60

3. 下面关于C++类继承的说法，错误的是（#slot）。
  + 一个类可以继承多个类。
  + 一个类可以被多个类继承。
  + 一个类可以继承另一个类的子类。
  + 抽象类必须被至少一个类继承，否则会编译错误。

4. 使用邻接表表达一个简单有向图，图中包含v个顶点、e条边，则该出边表中边节点的个数为（#slot）。
  + 100,000
  + 1,060,000
  + 1,360,000
  + e

5. 以下将二维数组作为参数的函数声明，哪个是符合语法的？（#slot）。

  ```cpp
  void Bubble(int a[10][], int m);
  void Bubble(int a[][], int n, int m);
  void Bubble(int (*a)[20], int n);
  void Bubble(int * a[20], int n);
  ```

6. 已知两个点A、B在平面直角坐标系下的坐标分别为(xa, ya)和(xb, yb)，并分别定义变量double xa, ya, xb, yb;存储坐标。假设直线AB的斜率存在，下列哪个表达式可以用来表达它？（#slot）。

  ```cpp
  (xa - xb) / (ya - yb)
  (xa - xb) / (yb - ya)
  (ya - yb) / (xa - xb)
  (ya - yb) / (xb - xa)
  ```

7. 二项式$(x + y)^6$的展开式中$x^3y^3$项的系数是（#slot）。
  + 6
  + 15
  + 20
  + 120

8. 以下关于动态规划的说法中，错误的是（#slot）。
  + 动态规划方法有递推和递归两种实现形式。
  + 递归实现动态规划方法的时间复杂度总是不低于递推实现。
  + 动态规划方法将原问题分解为一个或多个相似的子问题。
  + 动态规划方法通常能够列出递推公式。

9. 在下面的程序中，使用整数表示一种组合。整数二进制表示的某一位为1，表示该位对应的数被选中，反之为0表示未选中。例如，从0 - 5这6个数中选出3个，则0b111000代表选中3, 4, 5三个数，0b011001代表选中0, 3, 4三个数。zuhe\_next函数按组合对应的整数由大到小的顺序，求出组合c的下一个组合。横线处可以填入的是（#slot）。

  ```cpp
  int intlow2(int c) {
      return ________;  // 在此处填入选项
  }
  int zuhe_next_incur(int c, int n, int l) {
      if (n == 1) return c;
      if ((c & (1 << l)) == 0) {
          int d = intlow2(c);
          c = (c & ~d);
          c = (c | (d >> 1));
      } else {
          c = (c & ~(1 << l));
          c = zuhe_next_incur(c, n - 1, l + 1);
          int d = intlow2(c);
          c = (c | (d >> 1));
      }
      return c;
  }
  // 从n个数中选m个，当前组合为c
  int zuhe_next(int c, int n, int m) {
      return zuhe_next_incur(c, n, 0);
  }
  (((c - 1) ^ c) + 1)
  (((c - 1) ^ c) >> 1)
  ((((c - 1) ^ c) + 1) >> 1)
  ```
  + ((c - 1) ^ c)

10. 下面程序的输出为（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int N = 15, cnt = 0;
      for (int x = 0; x + x + x <= N; x++)
          for (int y = x; x + y + y <= N; y++)
              for (int z = y; x + y + z <= N; z++)
                  cnt++;
      cout << cnt << endl;
      return 0;
  }
  ```
  + 174
  + 447
  + 816
  + 4096

11. 下面最长公共子序列程序中，横线处应该填入的是（#slot）。

  ```cpp
  #define MAX(A, B) (((A) > (B)) ? (A) : (B))
  #define MIN(A, B) (((A) < (B)) ? (A) : (B))
  int dp[MAX_L + 1][MAX_L + 1];
  int LCS(char str1[], char str2[]) {
      int len1 = strlen(str1);
      int len2 = strlen(str2);
      for (int i = 0; i < len1; i++)
          for(int j = 0; j < len2; j++)
              if (str1[i] == str2[j])
                  dp[i + 1][j + 1] = dp[i][j] + 1;
              else
                  ________;  // 在此处填入选项
      return dp[len1][len2];
  }
  dp[i + 1][j + 1] = dp[i][j + 1] + dp[i + 1][j]
  dp[i + 1][j + 1] = MIN(dp[i][j + 1], dp[i + 1][j])
  dp[i + 1][j + 1] = MAX(dp[i][j + 1], dp[i + 1][j])
  dp[i + 1][j + 1] = MAX(dp[i][j + 1], dp[i + 1][j]) + 1
  ```

12. 下列Dijkstra算法中，横线处应该填入的是（#slot）。

  ```cpp
  typedef struct Edge {
      int in, out;    // 从下标in顶点到下标out顶点的边
      int len;        // 边长度
      struct Edge * next;
  } Edge;
  // v：顶点个数，graph：出边邻接表，start：起点下标，dis：输出每个顶点的最短距离
  void dijkstra(int v, Edge * graph[], int start, int * dis) {
      const int MAX_DIS = 0x7fffff;
      for (int i = 0; i < v; i++)
          dis[i] = MAX_DIS;
      dis[start] = 0;
      int * visited = new int[v];
      for (int i = 0; i < v; i++)
          visited[i] = 0;
      visited[start] = 1;
      for (int t = 0; ; t++) {
          int min = MAX_DIS, minv = -1;
          for (int i = 0; i < v; i++) {
              if (visited[i] == 0 && min > dis[i]) {
                  min = dis[i];
                  minv = i;
              }
          }
          if (minv < 0)
              break;
          visited[minv] = 1;
          for (Edge * e = graph[minv]; e != NULL; e = e->next) {
              ________;  // 在此处填入选项
          }
      }
      delete[] visited;
  }
  if (dis[e->in] > min + e->len)
      dis[e->in] = min + e->len;
  ```
  + ```cpp
    if (dis[e->out] > e->len)
        dis[e->out] = e->len;
    ```
  + ```cpp
    if (dis[e->out] > min + e->len)
        dis[e->out] = min + e->len;
    ```
  + ```cpp
    if (dis[e->in] > e->len)
        dis[e->in] = e->len;
    ```
  + 第 13 题 假设图 graph 中顶点数 v、边数 e，上题程序的时间复杂度为（#slot）。

13. 假设图graph中顶点数v、边数e，上题程序的时间复杂度为（#slot）。
  + $O(e)$
  + $O(v^2)$
  + $O(v log v + e)$
  + $O((v + e) log v)$

14. 下面的快速排序程序中，两处横线处分别应填入的是（#slot）。

  ```cpp
  void quick_sort(int a[], int n) {
      if (n <= 1)
          return;
      int pivot = 0, l = 0, r = n - 1;
      while (________) {  // 在此处填入选项
          while (r > pivot && a[r] >= a[pivot])
              r--;
          if (r > pivot) {
              int temp = a[pivot];
              a[pivot] = a[r];
              a[r] = temp;
              pivot = r;
          }
          while (l < pivot && a[l] <= a[pivot])
              l++;
          if (l < pivot) {
              int temp = a[pivot];
              a[pivot] = a[l];
              a[l] = temp;
              pivot = l;
          }
      }
      quick_sort(a, pivot);
      quick_sort(________);  // 在此处填入选项
  }
  l <= r
  a + pivot + 1, n - pivot - 1
  l <= r
  a + pivot + 1, n - pivot
  ```
  + ```cpp
    l < r
    a + pivot + 1, n - pivot - 1
    ```
  + ```cpp
    l < r
    a + pivot + 1, n - pivot
    ```
  + $O(2^n)$
  + $O(n log n)$

15. 上题程序的时间复杂度为（#slot）。
  + $O(n)$
  + $O(n^2)$
  + 
  + 

= 判断题（每题 2 分，共 20 分）

1. 表达式'3' + '5'的结果为'8'，类型为char。

2. 在C++语言中，可以在函数内定义结构体，但该结构体类型只能在该函数内使用。

3. 对 个元素的数组进行排序，快速排序和归并排序的平均时间复杂度都为$O(n log n)$。但快速排序存在退化情况，使得时间复杂度升高至$O(n^2)$；归并排序需要额外的空间开销。

4. 二维数组的最后一维在内存中一定是连续的，但第一维在内存中可能不连续。

5. 使用math.h或cmath头文件中的函数，表达式log(1000)的结果类型为double、值约为3。

6. 你有三种硬币，分别面值2元、5元和7元，每种硬币都有足够多。买一本书需要27元，则有8种硬币组合（组合与顺序无关，“1个2元+1个5元+1个2元”与“1个5元+2个2元”认为是同样的组合）可以正好付清，且不需要对方找钱。

7. 使用哈希函数f(x) = x % p建立键值为int类型的哈希表，只要p取小于等于哈希表大小的素数，可保证不发生碰撞。

8. 杨辉三角中的第 行、第 项，即为将二项式$(a + b)^n$展开后$a^(n - m)b^m$项的系数。

9. 判断图是否连通，可以通过广度优先搜索实现。

10. 要求解一元二次方程x^2 + ax + b = 0，需要先判断表达式a ^ 2 - b \* 4 \>= 0是否为真。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：树上移动

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有一棵包含$n$个节点的树，其中节点的编号从$1$到$n$，每个节点的颜色要么是白色要么是黑色。小杨可以任意选择节点$s$和节点$t$并从节点$s$出发移动到节点$t$，移动过程中小杨不能够经过重复节点。小杨希望自己在至多经过$k$个黑色节点的前提下，经过的总节点数尽可能多，请你帮小杨选择经过最多的节点数是多少。

=== 输入格式

第一行包含两个正整数$n,k$，代表节点数量和至多经过的黑色节点数。第二行包含$n$个正整数$a_1, a_2, dots.h , a_n$，代表节点颜色，如果$a_i = 0$，代表节点颜色为白色，如果$a_i = 1$，代表节点颜色为黑色。之后$n - 1$行，每行包含两个正整数$u_i, v_i$，代表存在一条连接节点$u_i$和$v_i$的边。

=== 输出格式

输出一个正整数，代表最多经过的节点数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5 1
0 0 1 1 1
1 2
2 3
2 5
1 4
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
3
```

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
#define ll long long
const int N = 1010;
vector<int> g[N];
int a[N];
int n,k;
int ans;
void dfs(int x,int fa,int tot,int le){
    tot+=a[x];
    if(tot>k){
        ans = max(ans,le);
        return;
    }
    le++;
    ans = max(ans,le);
    for(int i:g[x]){
        if(i!=fa){
            dfs(i,x,tot,le);
        }
    }
}
int main(){
    cin>>n>>k;
    for(int i=1;i<=n;i++){
        cin>>a[i];
    }
    for(int i=1;i<n;i++){
        int u,v;
        cin>>u>>v;
        g[u].push_back(v);
        g[v].push_back(u);
    }
    for(int i=1;i<=n;i++){
        dfs(i,0,0,0);
    }
    cout<<ans<<"\n";
}
```

== 编程题 2：排队

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨所在班级共有$n$位同学，依次以$1,2,dots.h ,n$标号。这$n$位同学想排成一行队伍，其中有些同学之间关系非常好，在队伍里需要排在相邻的位置。具体来说，有$m$对这样的关系（$m$是一个非负整数）。当$m >= 1$时，第$i$对关系（#slot）给出，表示排队时编号为#(math-missing)的同学需要排在编号为#(math-missing)的同学前面，并且两人在队伍中相邻。现在小杨想知道总共有多少种排队方式。由于答案可能很大，你只需要求出答案对#(math-missing)取模的结果。

=== 输入格式

第一行，两个整数$n,m$，分别表示同学们的数量与关系数量。接下来$m$行，每行两个整数，表示一对关系。

=== 输出格式

一行，一个整数，表示答案对$10^9 + 7$取模的结果。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4 2
1 3
2 4
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
2
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
3 0
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
6
```

#text(size: 12pt, weight: "bold")[输入样例 3]

```text
3 2
1 2
2 1
```

#text(size: 12pt, weight: "bold")[输出样例 3]

```text
0
```

=== 数据范围

对于 20% 的测试数据点，保证，$0 <= m <= 1$。对于另外 20% 的测试数据点，保证$1 <= n <= 10^3$，$0 <= m <= 1$。对于所有测试数据点，保证$1 <= n <= 2 times 10^5$，$0 <= m <= 2 times 10^5$。

=== 参考程序

```cpp
#include <cstdio>
using namespace std;
const int N = 2e5 + 5;
const int mod = 1e9 + 7;
int n, m;
int pre[N], suf[N];
int vis[N];
int cnt;
int ans;
int main() {
    scanf("%d%d", &n, &m);
    ans = 1;
    for (int i = 1; i <= m; i++) {
        int a, b;
        scanf("%d%d", &a, &b);
        if (pre[b] == a && suf[a] == b)
            continue;
        if (pre[b] || suf[a])
            ans = 0;
        pre[b] = a;
        suf[a] = b;
    }
    for (int i = 1; i <= n; i++) {
        if (vis[i])
            continue;
        int j = i;
        while (j) {
            if (vis[j] == i)
                ans = 0;
            if (vis[j])
                break;
            vis[j] = i;
            j = suf[j];
        }
    }
    for (int i = 1; i <= n; i++)
        cnt += !pre[i];
    for (int i = 1; i <= cnt; i++)
        ans = 1ll * ans * i % mod;
    printf("%d\n", ans);
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
