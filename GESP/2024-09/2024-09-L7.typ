// ===========================================================================
// GESP 2024-09 C++ 七级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-09/2024-09-L7.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 7,
  month: "2024 年 09 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 已知小写字母b的ASCII码为98，下列C++代码的输出结果是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      char a = 'b';
      a++;
      cout << a;
      return 0;
  }
  ```
  + b
  + c
  + 98
  + 99

2. 已知a为int类型变量，下列表达式不符合语法的是（#slot）。
  + &a + 3
  + +a & 3
  + a - - 4
  + a++3

3. 下列关于C++语言中指针的叙述，不正确的是（#slot）。
  + 指针变量中存储的是内存地址。
  + 指针变量指向的内存地址不一定能够合法访问。
  + 结构类型中的指针成员不能指向该结构类型。
  + 定义指针变量时必须指定其指向的类型。

4. 下列关于C++类的说法，错误的是（#slot）。
  + 将C++类对象通过值传递给函数参数时，会自动调用复制构造函数。
  + 将一个类的对象赋值给该类的另一个对象时，不会自动调用构造函数。
  + 定义C++类对象时，一定会调用默认构造函数。
  + 构造派生类的对象时，一定会调用基类的构造函数。

5. 某二叉树T的先序遍历序列为：{A B D C E G H F}，中序遍历序列为：{D B A H G E C F}，则下列说法中正确的是（#slot）。
  + T的高为5
  + T有4个叶节点
  + T是平衡树
  + 以上说法都不对

6. 一棵完全二叉树有431个结点，则叶结点有多少个？（#slot）
  + 176
  + 215
  + 216
  + 255

7. 下列关于树的说法，错误的是（#slot）。
  + 二叉树的中序遍历与其深度优先遍历总是相同的。
  + 所有树都可以构造一颗二叉树与之一一对应。
  + 如果树的一个叶结点有两个不同的祖先结点，那么其中一个一定是另一个的祖先结点。
  + 树的结点不能有两个父结点。

8. 一个简单无向图有10个结点、30条边。再增加多少条边可以成为完全图。（#slot）
  + 10
  + 15
  + 51
  + 60

9. 以下哪个方案可以合理解决或缓解哈希表冲突（#slot）。
  + 丢弃发生冲突的新元素。
  + 用新元素覆盖发生冲突的元素。
  + 用新元素覆盖在冲突位置的下一个位置。
  + 将新元素放置在冲突位置之后的第一个空位。

10. 一个迷宫，已知从起点不经过重复结点到达终点的路径有且仅有一条，则下面说法错误的是（#slot）。
  + 可以使用深度优先搜索找到这条路径。
  + 可以使用广度优先搜索找到这条路径。
  + 该迷宫内与起点连通的结点，一定也与终点连通。
  + 该迷宫内与起点连通的结点及它们之间的路径可以抽象为无向无环图。

11. 下面程序的输出为（#slot）。

  ```cpp
  #include <iostream>
  #include <cmath>
  using namespace std;
  int main() {
      cout << (int)log(8) << endl;
      return 0;
  }
  ```
  + 2
  + 3
  + 8
  + 无法通过编译。

12. 下面程序的输出为（#slot）。

  ```cpp
  #include <iostream>
  #define N 10
  using namespace std;
  int path[N][N];
  int main() {
      for (int i = 1; i < N; i++)
          path[i][0] = i;
      for (int j = 1; j < N; j++)
          path[0][j] = j;
      for (int i = 1; i < N; i++)
          for (int j = 1; j < N; j++)
              path[i][j] = path[i - 1][j] + path[i][j - 1];
      cout << path[8][4] << endl;
      return 0;
  }
  ```
  + 84
  + 495
  + 1012
  + 结果是随机的。

13. 上题中程序的时间复杂度为（#slot）。
  + 可以使用深度优先搜索找到这条路径。
  + 可以使用广度优先搜索找到这条路径。
  + $O(N log N)$
  + $O(N^2)$

14. 下面fib函数的时间复杂度为（#slot）。

  ```cpp
  int fib_rcd[MAX_N];
  int fib(int n) {
      if (n <= 1)
          return 1;
      if (fib_rcd[n] > 0)
          return fib_rcd[n];
      return fib(n - 1) + fib(n - 2);
  }
  ```
  + $O(n)$
  + ,
  + $O(2^n)$
  + 无法正常结束。

15. 下列选项中，哪个可能是下图的广度优先遍历序列（#slot）。
  + 1, 3, 5, 7, 4, 2, 6, 8, 9
  + 9, 4, 2, 1, 3, 7, 5, 6, 8
  + 1, 3, 5, 7, 6, 8, 9, 4, 2
  + 9, 4, 7, 2, 1, 3, 5, 6, 8

= 判断题（每题 2 分，共 20 分）

1. 表达式'a' \<\< 1的结果为'a '。

2. 在C++语言中，函数可以定义在另一个函数定义之内。

3. 选择排序一般是不稳定的。

4. 埃氏筛法和欧拉筛法都是使用筛法思想生成素数表的算法，欧拉筛法的时间复杂度更低。

5. 使用math.h或cmath头文件中的正弦函数，表达式sin(30)的结果类型为double、值约为0.5。

6. 一颗 层的完全二叉树，一定有#(math-missing)个结点。

7. 一个图，不管是否连通，都可以使用深度优先搜索算法进行遍历。

8. 某个哈希表键值x为整数，H(x) = x % p是常用的哈希函数之一，要求p选择素数是因为这样不会产生冲突。（#slot）

9. 使用单链表实现队列时，链表头结点作为队首比链表头结点作为队尾更便于操作。

10. 一个图中，每个结点表达一个人，连接两个结点的边表达两个结点对应的人相互认识，则这个图可以用来表达社交网络。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：小杨寻宝

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有一棵包含$n$个节点的树，树上的一些节点放置有宝物。小杨可以任意选择一个节点作为起点并在树上移动，但是小杨只能经过每条边至多一次，当小杨经过一条边后，这条边就会消失。小杨每经过一个放置有宝物的节点就会取得该宝物。小杨想请你帮他判断自己能否成功取得所有宝物。

=== 输入格式

第一行包含一个正整数$t$，代表测试用例组数。接下来是$t$组测试用例。对于每组测试用例，一共$n + 1$行。第一行包含一个正整数$n$，代表树的节点数。第二行包含$n$个非负整数$a_1, a_2, dots.h , a_n$，其中如果$a_i = 1$，则节点$i$放置有宝物，若$a_i = 0$，则节点$i$没有宝物。之后$n - 1$行，每行包含两个正整数$x_i,y_i$，代表存在一条连接节点$x_i$和$y_i$的边。

=== 输出格式

对于每组测试数据，如果小杨能成功取得所有宝物，输出 Yes，否则输出 No。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
2
5
0 1 0 1 0
1 2
1 3
3 4
3 5
5
1 1 1 1 1
1 2
1 3
3 4
3 5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
Yes
No
```

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
const int N = 1e5+10;
vector<int> g[N];
int col[N],dep[N],has[N];
void dfs(int x,int fa){
    dep[x]=dep[fa]+1;
    for(auto i:g[x]){
        if(i!=fa){
            dfs(i,x);
        }
    }
}
bool dfs2(int x,int fa){
    for(auto i:g[x]){
        if(i!=fa){
            auto res = dfs2(i,x);
            if(res==false)return false;
            if(has[i]||col[i])has[x]++;
        }
    }
    if(has[x]>1)return false;
    return true;
}
int main(){
    int t;
    cin>>t;
    while(t--){
        int n;
        cin>>n;
        for(int i=1;i<=n;i++){
            dep[i]=0;g[i].clear();
            cin>>col[i];
        }
        for(int i=1;i<n;i++){
            int u,v;
            cin>>u>>v;
            g[u].push_back(v);
            g[v].push_back(u);
        }
        dfs(1,0);
        int mx=0,pos=0;
        for(int i=1;i<=n;i++){
            has[i]=0;
            if(col[i]){
                if(dep[i]>mx){
                    mx=dep[i];
                    pos=i;
                }
            }
        }
        bool res= dfs2(pos,0);
        if(res)cout<<"Yes\n";
        else cout<<"No\n";
    }
}
```

== 编程题 2：矩阵移动

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有一个有一个$n times m$的矩阵，仅包含 01? 三种字符。矩阵的行从上到下编号依次为$1,2,dots.h ,n$，列从左到右编号依次为#(math-missing)编号。小杨开始在矩阵的左上角（#slot），小杨只能向下或者向右移动，最终到达右下角（#slot）时停止，在移动的过程中每经过一个字符 1 得分会增加一分（包括起点和终点），经过其它字符则分数不变。小杨的初始分数为$0$分。小杨可以将矩阵中不超过$x$个字符 ? 变为字符 1。小杨在修改矩阵后，会以最优的策略从左上角移动到右下角。他想知道自己最多能获得多少分。

=== 输入格式

第一行包含一个正整数$t$，代表测试用例组数。接下来是$t$组测试用例。对于每组测试用例，一共$n + 1$行。第一行包含三个正整数$n,m,x$，含义如题面所示。之后$n$行，每行包含一个长度为$m$且仅包含 01? 三种字符的字符串。

=== 输出格式

对于每组测试用例，输出一行一个整数，代表最优策略下小杨的得分最多是多少。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
2
3 3 1
000
111
01?
3 3 1
000
?0?
01?
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
4
2
```

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
const int N = 505;
int dp[N][1005];
char a[N][N];
int n, m, x;
int main(){
    int t;
    scanf("%d", &t);
    while(t--){
        scanf("%d%d%d", &n, &m, &x);
        for(int i = 1; i <= m; i++) for(int j = 0; j <= x; j++) dp[i][j] = 0;
        for(int i = 1; i <= n; i++) scanf("%s", a[i] + 1);
        for(int i = 1; i <= n; i++){
            for(int j = 1; j <= m; j++){
                for(int k = x; k>=0; k--){
                    if(a[i][j] == '1')
                        dp[j][k] = max(dp[j][k], dp[j - 1][k]) + 1;
                    if(a[i][j] == '0')
                        dp[j][k] = max(dp[j][k], dp[j - 1][k]);
                    if(a[i][j] == '?') {
                        if(!k) dp[j][k] = max(dp[j][k], dp[j - 1][k]);
                        else dp[j][k] = max(max(dp[j][k], dp[j - 1][k]), max(dp[j][k
- 1], dp[j - 1][k - 1]) + 1);
                    }
                }
            }
        }
        int ans = 0;
        for(int k = 0; k <= x; k++) ans = max(ans, dp[m][k]);
        printf("%d\n", ans);
    }
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
