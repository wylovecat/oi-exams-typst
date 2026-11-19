// ===========================================================================
// GESP 2024-03 C++ 八级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-03/2024-03-L8.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 8,
  month: "2024 年 03 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 为丰富食堂菜谱，炒菜部进行头脑风暴。肉类有鸡肉、牛肉、羊肉、猪肉4种，切法有肉排、肉块、肉末3种，配菜有圆白菜、油菜、豆腐3种，辣度有麻辣、微辣、不辣3种。不考虑口感的情况下，选1种肉、1种切法、1种配菜、1种辣度产生一道菜（例如：麻辣牛肉片炒豆腐），这样能产生多少道菜？（#slot）。
  + 13
  + 42
  + 63
  + 108

2. 已知袋中有2个相同的红球、3个相同的绿球、5个相同的黄球。每次取出一个不放回，全部取出。可能产生多少种序列？（#slot）。
  + 6
  + 1440
  + 2520
  + 3628800

3. 以下二维数组的初始化，哪个是符合语法的？（#slot）。

  ```cpp
  int a[][] = {{1, 2}, {3, 4}};
  int a[2][2] = {{1, 2, 3}, {4, 5, 6}};
  int a[2][] = {{1, 2, 3}, {4, 5, 6}};
  ```
  + int a[][2] = {};

4. 下面有关C++拷贝构造函数的说法，错误的是（#slot）。
  + 必须实现拷贝构造函数，否则一定会出现编译错误。
  + 对象作为函数参数、以值传递方式传入函数时，会自动调用拷贝构造函数。
  + 对象作为函数返回值、以值传递方式从函数返回时，会自动调用拷贝构造函数。
  + 使用一个对象初始化另一个对象时，会自动调用拷贝构造函数。

5. 使用邻接表表达一个无向简单图，图中包含v个顶点、e条边，则该表中边节点的个数为（#slot）。
  + $v times (v - 1)$
  + $v times v$
  + $2 times e$
  + e

6. 关于生成树的说法，错误的是（#slot）。
  + 一个无向连通图可以有多个生成树。
  + 一个无向图，只要连通，就一定有生成树。
  + n个顶点的无向完全图，有$n^(n - 2)$棵生成树。
  + n个顶点的无向图，生成树包含n-1条边。

7. 已知三个double类型的变量a、b和theta分别表示一个三角形的两条边长及二者的夹角（弧度），则下列哪个表达式可以计算这个三角形的周长？（#slot）。

  ```cpp
  a * b * sin(theta) / 2
  a + b + (a + b) * sin(theta) / 2
  a * b * cos(theta) / 2
  a + b + sqrt(a * a + b * b - 2 * a * b * cos(theta))
  ```

8. 在有n个元素的二叉排序树中进行查找，其最好、最差时间复杂度分别为（#slot）。
  + 、
  + 、
  + 、
  + 、

9. 如下图所示，半径为r、圆心角为t（弧度）的扇形，下面哪个表达式能够求出顶部阴影部分的面积？（#slot）。

  ```cpp
  r * r * (t - sin(t))
  r * r * (t - sin(t)) / 2
  ```
  + r \* r \* sin(t) / 2
  + r \* r \* t / 2

10. 下面程序的时间复杂度为（#slot）。

  ```cpp
  int fib(int n) {
      if (n <= 1)
          return 1;
      return fib(n - 1) + fib(n - 2);
  }
  ```
  + $O(2^n)$
  + ，其中
  + $O(n)$
  + $O(1)$

11. 下面程序的时间复杂度为（#slot）。

  ```cpp
  int choose(int n, int m) {
      if (m == 0 || m == n)
          return 1;
      return choose(n - 1, m - 1) + choose(n - 1, m);
  }
  ```
  + $O(2^n)$
  + O(phi^n) ，其中 phi = frac√(5) + 12
  + $O(C(n, m))$
  + $O(m times (n - m))$

12. 下面程序的时间复杂度为（#slot）。

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

13. 下面程序的输出为（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int a[10][10];
  int main() {
      int m = 5, n = 4;
      for (int x = 0; x <= m; x++)
          a[x][0] = 1;
      for (int y = 1; y <= n; y++)
          a[0][y] = 1;
      for (int x = 1; x <= m; x++)
          for (int y = 1; y <= n; y++)
              a[x][y] = a[x - 1][y] + a[x][y - 1];
      cout << a[m][n] << endl;
      return 0;
  }
  ```
  + 4
  + 5
  + 126
  + 3024

14. 下面程序的输出为（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int cnt = 0;
      for (int x = 0; x <= 10; x++)
          for (int y = 0; y <= 10; y++)
              for (int z = 0; z <= 10; z++)
                  if (x + y + z == 15)
                      cnt++;
      cout << cnt << endl;
      return 0;
  }
  ```
  + 90
  + 91
  + 96
  + 100

15. 下面的程序使用邻接矩阵表达的带权无向图，则从顶点0到顶点3的最短距离为（#slot）。

  ```cpp
  int weight[4][4] = {
      {  0,   1,   7, 100},
      {  1,   0,   5,  15},
      {  7,   5,   0,   6},
      {100,  15,   6,   0}};
  ```
  + 100
  + 16
  + 12
  + 13

= 判断题（每题 2 分，共 20 分）

1. 已知int类型的变量a和b，则执行语句a, b = b, a;后，变量a和b的值会互换。

2. 一个袋子中有3个完全相同的红色小球、2个完全相同的蓝色小球。每次从中取出1个，再放回袋子，这样进行3次后，可能的颜色顺序有7种。

3. 孙子定理是求解一次同余方程组的方法，最早见于中国南北朝时期（公元5世纪）的数学著作《孙子算经》。又称中国余数定理，是中国数学史上的一项伟大成就。

4. 个顶点的无向完全图有#(math-missing)条边。

5. 为解决哈希函数冲突，在哈希表项内设置链表存储该项内的所有冲突元素，则该哈希表内查找元素的最差时间复杂度为$O(1)$。

6. 求一个包含v个顶点、e条边的带权连通无向图的最小生成树，Prim算法的时间复杂度为。

7. 已知int类型的变量a、b和c中分别存储着一个三角形的三条边长，则这个三角形的面积可以通过表达式sqrt((a + b + c) \* (b + c - a) \* (a + c - b) \* (a + b - c)) / 4求得。

8. 可以使用深度优先搜索算法判断图的连通性。

9. 在 个元素的二叉排序树中查找一个元素，平均情况的时间复杂度是$O(log N)$。

10. 给定double类型的变量x，且其值大于等于 ，我们可以通过二分法求出$log x$的近似值。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：公倍数问题

=== 题目描述

小 A 写了一个$N times M$的矩阵$A$，我们看不到这个矩阵，但我们可以知道，其中第$i$行第$j$列的元素$A_(i,j)$是$i$和$j$的公倍数（，）。现在有#(math-missing)个小朋友，其中第$k$个小朋友想知道，矩阵$A$中最多有多少个元素可以是$k (k = 1, 2, dots.h , K)$（#slot）。请你帮助这些小朋友求解。注意：每位小朋友的答案互不相关，例如，有些位置既可能是$x$，又可能是$y$，则它同可以时满足$x, y$两名小朋友的要求。方便起见，你只需要输出sum\_k=1^K k × mathsfans\_k即可，其中mathsfans\_k表示第$k$名小朋友感兴趣的答案。

=== 输入格式

第一行三个正整数$N,M,K$。

=== 输出格式

输出一行，即sum\_k=1^K k × ans\_k。请注意，这个数可能很大，使用 C++ 语言的选手请酌情使用long long等数据类型存储答案。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
2 5 2
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
9
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
100 100 100
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
185233
```

=== 数据范围

对于$30$的测试点，保证$N,M,$；对于$30$的测试点，保证$N,M,$；对于$30$的测试点，保证，保证。

=== 提示

在常规程序中，输入、输出时提供提示是好习惯。但在本场考试中，由于系统限定，请不要在输入、输出中附带任何提示信息。只有$A_(1,1)$可以是$1$，其余都不行。都可以是$2$，而其余不行。因此答案是$1 times 1 + 2 times 4 = 9$。

=== 参考程序

```cpp
#include <iostream>
#include <vector>
using namespace std;
vector<int> count_divisors(int limit, int num) {
    vector<int> s(num + 1, 0);
    for (int i = 1; i <= limit; ++i) {
        for (int j = i; j <= num; j += i) {
            s[j] += 1;
        }
    }
    return s;
}
int main() {
    int N, M, K;
    cin >> N >> M >> K;
    vector<int> s_N = count_divisors(N, 1000000);
    vector<int> s_M = count_divisors(M, 1000000);
    long long result = 0;
    for (int k = 1; k <= K; ++k) {
        result += (long long)k * s_N[k] * s_M[k];
    }
    cout << result << endl;
    return 0;
}
```

== 编程题 2：接竹竿

=== 题目描述

小杨同学想用卡牌玩一种叫做“接竹竿”的游戏。游戏规则是：每张牌上有一个点数$v$，将给定的牌依次放入一列牌的末端。若放入之前这列牌中已有与这张牌点数相同的牌，则小杨同学会将这张牌和点数相同的牌之间的所有牌全部取出队列（包括这两张牌本身）。小杨同学现在有一个长度为$n$的卡牌序列$A$，其中每张牌的点数为$A_i$（#slot）。小杨同学有#(math-missing)次询问。第#(math-missing)次（#slot）询问时，小杨同学会给出，小杨同学想知道如果用下标在#(math-missing)的所有卡牌按照下标顺序玩“接竹竿”的游戏，最后队列中剩余的牌数。

=== 输入格式

第一行包含一个正整数$T$，表示测试数据组数。对于每组测试数据，第一行包含一个正整数$n$，表示卡牌序列$A$的长度。第二行包含$n$个正整数，表示卡牌的点数$A$。第三行包含一个正整数$q$，表示询问次数。接下来$q$行，每行两个正整数$l_i, r_i$，表示一组询问。

=== 输出格式

对于每组数据，输出$q$行。第$i$行（#slot）输出一个非负整数，表示第#(math-missing)次询问的答案。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
1
6
1 2 2 3 1 3
4
1 3
1 6
1 5
5 6
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
1
1
0
2
```

=== 数据范围

子任务编号 数据点占比#(math-missing)特殊条件12#(math-missing)所有询问的右端点等于3对于全部数据，保证有，，$1 <= n <= 1.5 times 10^4$。，

=== 提示

对于第一次询问，小杨同学会按照$1,2,2$的顺序放置卡牌，在放置最后一张卡牌时，两张点数为$2$的卡牌会被收走，因此最后队列中只剩余一张点数为$1$的卡牌。对于第二次询问，队列变化情况为：。因此最后队列中只剩余一张点数为$3$的卡牌。

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
#define ll long long
const int N = 1e5+10;
int a[N];
int nxt[N][30],pos[20];
int main(){
    int t;
    cin>>t;
    while(t--){
    int n;
    cin>>n;
    memset(pos,0,sizeof pos);
    for(int i=1;i<=n;i++){
        cin>>a[i];
        for(int j=0;j<=20;j++)nxt[i][j]=n+1;
    }
    for(int i=n;i>=1;i--){
        if(!pos[a[i]]){
            nxt[a[i]][0]=n+1;
            pos[a[i]]=i;
        }else{
            nxt[i][0]=pos[a[i]];
            pos[a[i]]=i;
        }
    }
    for(int i=n;i>=1;i--){
        for(int j=1;j<=20;j++){
            if(nxt[i][j-1]+1<=n)
            nxt[i][j]=nxt[nxt[i][j-1]+1][j-1];
        }
    }
    int q;
    cin>>q;
    while(q--){
        int l,r;
        cin>>l>>r;
        int ii=l;
        int ans=0;
        while(ii<=r){
            while(ii<=r&&nxt[ii][0]>r){
                ii++;
                ans++;
            }
            if(ii>r)break;
            for(int j=20;j>=0;j--){
                if(nxt[ii][j]<=r){
                    ii=nxt[ii][j];
                    break;
                }
            }
            ii++;
        }
        cout<<ans<<"\n";
    }
    }
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
