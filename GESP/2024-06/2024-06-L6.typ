// ===========================================================================
// GESP 2024-06 C++ 六级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-06/2024-06-L6.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 6,
  month: "2024 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 面向对象的编程思想主要包括（#slot）原则。
  + 贪心、动态规划、回溯
  + 并发、并行、异步
  + 递归、循环、分治
  + 封装、继承、多态

2. 运行下列代码，屏幕上输出（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  class my_class {
  public:
      static int count;
      my_class() {
          count++;
      }
      ~my_class() {
          count--;
      }
      static void print_count() {
         cout  << count << " ";
      }
  };
  int my_class::count = 0;
  int main() {
      my_class obj1;
      my_class::print_count();
      my_class obj2;
      obj2.print_count();
      my_class obj3;
      obj3.print_count();
      return 0;
  }
  ```
  + 1 1 1
  + 1 2 3
  + 1 1 2
  + 1 2 2

3. 运行下列代码，屏幕上输出（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  class shape {
  protected:
      int width, height;
  public:
      shape(int a = 0, int b = 0) {
          width = a;
          height = b;
      }
      virtual int area() {
          cout << "parent class area: " <<endl;
          return 0;
      }
  };
  class rectangle: public shape {
  public:
      rectangle(int a = 0, int b = 0) : shape(a, b) { }
      int area () {
          cout << "rectangle area: ";
          return (width * height);
      }
  };
  class triangle: public shape {
  public:
      triangle(int a = 0, int b = 0) : shape(a, b) { }
      int area () {
          cout << "triangle area: ";
          return (width * height / 2);
      }
  };
  int main() {
     shape *pshape;
     rectangle rec(10, 7);
     triangle  tri(10, 5);
     pshape = &rec;
     pshape->area();
     pshape = &tri;
     pshape->area();
     return 0;
  }
  ```
  + rectangle area: triangle area:
  + parent class area: parent class area:
  + 运行时报错
  + 编译时报错

4. 向一个栈顶为hs的链式栈中插入一个指针为s的结点时，应执行（#slot）。

  ```cpp
  s->next = hs; hs = s;
  s->next = hs->next; hs->next = s;
  s->next = hs; hs = hs->next;
  ```
  + hs-\>next = s;

5. 在栈数据结构中，元素的添加和删除是按照什么原则进行的？
  + 先进先出
  + 先进后出
  + 最小值先出
  + 随机顺序

6. 要实现将一个输入的十进制正整数转化为二进制表示，下面横线上应填入的代码为（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  stack<int> ten2bin(int n) {
      stack<int> st;
      int r, m;
      r = n % 2;
      m = n / 2;
      st.push(r);
      while (m != 1) {
          r = m % 2;
          st.push(r);
          m = m / 2;
      }
      st.push(m);
      return st;
  }
  int main() {
      int n;
      cin >> n;
      stack<int> bin;
      bin = ten2bin(n);
      while (!bin.empty()) {
          _____________________ // 在此处填入代码
      }
      return 0;
  }
  cout << bin.top();  bin.pop();
  bin.pop(); cout << bin.top();
  cout << bin.back();  bin.pop();
  cout << bin.front();  bin.pop();
  ```

7. 下面定义了一个循环队列的类，请补全判断队列是否满的函数，横向上应填写（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  class circular_queue {
  private:
      int *arr; // 数组用于存储队列元素
      int capacity; // 队列容量
      int front; // 队头指针
      int rear; // 队尾指针
  public:
      circular_queue(int size) {
          capacity = size + 1; // 为了避免队列满时与队列空时指针相等的情况，多预留一个空间
          arr = new int[capacity];
          front = 0;
          rear = 0;
      }
      ~circular_queue() {
          delete[] arr;
      }
      bool is_empty() {
          return front == rear;
      }
      bool is_full() {
          ________________ // 在此处填入代码
      }
      void en_queue(int data) {
          if (is_full()) {
              cout << "队列已满，无法入队！" << endl;
              return -1;
          }
          arr[rear] = data;
          rear = (rear + 1) % capacity;
          return 1;
      }
      int de_queue() {
          if (is_empty()) {
              cout << "队列为空，无法出队！" << endl;
              return -1; // 出队失败，返回一个特殊值
          }
          int data = arr[front];
          front = (front + 1) % capacity;
          return data;
      }
  };
  return (rear + 1) % capacity == front;
  return rear % capacity == front;
  return rear == front;
  return (rear + 1) == front;
  ```

8. 对“classmycls”使用哈夫曼（Huffman）编码，最少需要（#slot）比特。
  + 10
  + 20
  + 25
  + 30

9. 二叉树的（#slot）第一个访问的节点是根节点。
  + 先序遍历
  + 中序遍历
  + 后序遍历
  + 以上都是

10. 一棵5层的满二叉树中节点数为（#slot）。
  + 31
  + 32
  + 33
  + 16

11. 在求解最优化问题时，动态规划常常涉及到两个重要性质，即最优子结构和（#slot）。
  + return (rear + 1) % capacity == front;重叠子问题
  + 分治法
  + 贪心策略
  + 回溯算法

12. 青蛙每次能跳1或2步，下面代码计算青蛙跳到第n步台阶有多少种不同跳法。则下列说法，错误的是（#slot）。

  ```cpp
  int jump_recur(int n) {
      if (n == 1) return 1;
      if (n == 2) return 2;
      return jump_recur(n - 1) + jump_recur(n - 2);
  }
  int jump_dp(int n) {
      vector<int> dp(n + 1); // 创建一个动态规划数组，用于保存已计算的值
      // 初始化前两个数
      dp[1] = 1;
      dp[2] = 2;
      // 从第三个数开始计算斐波那契数列
      for (int i = 3; i <= n; ++i) {
          dp[i] = dp[i - 1] + dp[i - 2];
      }
      return dp[n];
  }
  ```
  + 函数jump\_recur（#slot）采用递归方式。
  + 函数jump\_dp（#slot）采用动态规划方法。
  + 当n较大时，函数jump\_recur（#slot）存在大量重复计算，执行效率低。
  + 函数jump\_recur（#slot）代码量小，执行效率高。

13. 阅读以下二叉树的广度优先搜索代码:使用以上算法，在以下这棵树搜索数值$20$时，可能的输出是（#slot）。

  ```cpp
  #include <iostream>
  #include <queue>
  using namespace std;
  // 二叉树节点的定义
  struct TreeNode {
      int val;
      TreeNode* left;
      TreeNode* right;
      TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
  };
  // 宽度优先搜索（BFS）迭代实现
  TreeNode* bfs(TreeNode* root, int a) {
      if (root == nullptr) return nullptr;
      queue<TreeNode*> q;
      q.push(root);
      while (!q.empty()) {
          TreeNode* node = q.front();
          q.pop();
          if (node->val == a)
              return node;
          cout << node->val << " "; // 先访问当前节点
          if (node->left) q.push(node->left); // 将左子节点入队
          if (node->right) q.push(node->right); // 将右子节点入队
      }
      return nullptr;
  }
  ```
  + 5 2 -4 3 17 9
  + -4 2 3 5 9 17
  + 5 2 17 -4 3 9
  + 以上都不对

14. 同上题中的二叉树，阅读以下二叉树的深度优先搜索代码:使用以上算法，在二叉树搜索数值$20$时，可能的输出是（#slot）。

  ```cpp
  #include <iostream>
  #include <stack>
  using namespace std;
  // 非递归深度优先搜索（DFS
  TreeNode* dfs(TreeNode* root, int a) {
      if (root == nullptr) return nullptr;
      stack<TreeNode*> stk;
      stk.push(root);
      while (!stk.empty()) {
          TreeNode* node = stk.top();
          stk.pop();
          if (node->val == a)
              return node;
          cout << node->val << " "; // 访问当前节点
          if (node->right) stk.push(node->right); // 先压入右子节点
          if (node->left) stk.push(node->left); // 再压入左子节点
      }
      return nullptr;
  }
  ```
  + 5 2 -4 3 17 9
  + -4 2 3 5 9 17
  + 5 2 17 -4 3 9
  + 以上都不对

15. 在上题的树中搜索数值 时，采用深度优先搜索一共比较的节点数为（#slot）。
  + 2
  + 3
  + 4
  + 5

= 判断题（每题 2 分，共 20 分）

1. 哈夫曼编码本质上是一种贪心策略。

2. 创建一个对象时，会自动调用该对象所属类的构造函数。如果没有定义构造函数，编译器会自动生成一个默认的构造函数。

3. 定义一个类时，必须手动定义一个析构函数，用于释放对象所占用的资源。

4. C++中类内部可以嵌套定义类。

5. 000, 001, 011, 010, 110, 111, 101, 100是一组格雷码。

6. n个节点的双向循环链表，在其中查找某个节点的平均时间复杂度是$O(log n)$。

7. 完全二叉树可以用数组存储数据。

8. 在C++中，静态成员函数只能访问静态成员变量。

9. 在深度优先搜索中，通常使用队列来辅助实现。

10. 对0-1背包问题，贪心算法一定能获得最优解。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：计算得分

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨想要计算由$m$个小写字母组成的字符串的得分。小杨设置了一个包含$n$个正整数的计分序列$A = [a_1, a_2, dots.h , a_n]$，如果字符串的一个子串由$k (1 <= k <= n)$（#slot） 个 abc 首尾相接组成，那么能够得到分数$a_k$，并且字符串包含的字符不能够重复计算得分，整个字符串的得分是计分子串的总和。例如，假设$n = 3$，字符串 dabcabcabcabzabc 的所有可能计分方式如下：d+abc+abcabc+abz+abc 或者 d+abcabc+abc+abz+abc，其中 d 和 abz 不计算得分，总得分为d+abc+abc+abc+abz+abc，总得分为d+abcabcabc+abz+abc，总得分为小杨想知道对于给定的字符串，最大总得分是多少。

=== 输入格式

第一行包含一个正整数$n$，代表计分序列$A$的长度。第二行包含$n$个正整数，代表计分序列$A$。第三行包含一个正整数$m$，代表字符串的长度。第四行包含一个由$m$个小写字母组成的字符串。

=== 输出格式

输出一个整数，代表给定字符串的最大总得分。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
3 1 2
13
dabcabcabcabz
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
9
```

=== 数据范围

子任务编号 数据点占比#(math-missing)特殊条件1#(math-missing)20%#(math-missing)对于所有的 （#slot）,存在2#(math-missing)40%3#(math-missing)40%对于全部数据，保证有$1 <= n <= 20, 1 <= m <= 10^5, 1 <= a_i <= 1000$。

=== 提示

最优的计分方式为 d+abc+abc+abc+abz，总得分为，共$9$分。

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
const int N = 1e5+10;
int a[30];
string s;
int dp[N];
int main(){
    int n;
    cin>>n;
    for(int i=1;i<=n;i++){
        cin>>a[i];
    }
    int m;
    cin>>m;
    cin>>s;
    for(int i=1;i<=m;i++){
        dp[i]=dp[i-1];
        for(int j=1;j<=n;j++){
            if(i-3*j+1<=0)break;
            int l = i-3*j+1;
            if(s.substr(l-1,3)=="abc"){
                dp[i]=max(dp[i],dp[l]+a[j]);
            }else break;
        }
    }
    cout<<dp[m]<<"\n";
}
```

== 编程题 2：二叉树

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有一棵包含$n$个节点的二叉树，且根节点的编号为$1$。这棵二叉树任意一个节点要么是白色，要么是黑色。之后小杨会对这棵二叉树进行$q$次操作，每次小杨会选择一个节点，将以这个节点为根的子树内所有节点的颜色反转，即黑色变成白色，白色变成黑色。小杨想知道$q$次操作全部完成之后每个节点的颜色。

=== 输入格式

第一行一个正整数$n$，表示二叉树的节点数量。第二行$n - 1$个正整数，第$i$（#slot）个数表示编号为#(math-missing)的节点的父亲节点编号，数据保证是一棵二叉树。第三行一个长度为#(math-missing)的$01$串，从左到右第#(math-missing)（#slot）位如果为$0$，表示编号为#(math-missing)的节点颜色为白色，否则为黑色。第四行一个正整数$q$，表示操作次数。接下来$q$行每行一个正整数$a_ i$（#slot），表示第#(math-missing)次操作选择的节点编号。

=== 输出格式

输出一行一个长度为#(math-missing)的$01$串，表示#(math-missing)次操作全部完成之后每个节点的颜色。从左到右第#(math-missing)（#slot）#(math-missing)位如果为，表示编号为#(math-missing)的节点颜色为白色，否则为黑色。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
6
3 1 1 3 4
100101
3
1
3
2
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
010000
```

=== 数据范围

子任务编号 数据点占比#(math-missing)特殊条件1#(math-missing)20%#(math-missing)对于所有，节点#(math-missing)的父亲节点编号为2#(math-missing)40%3#(math-missing)40%对于全部数据，保证有。

=== 提示

第一次操作后，节点颜色为：011010第二次操作后，节点颜色为：000000第三次操作后，节点颜色为：010000

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
const int N = 1e5+10;
int n;
int son[N][2];
int f[N],col[N],sum[N];
void dfs(int x,int now){
    now+=sum[x];
    if(now&1)col[x]^=1;
    for(int i=0;i<2;i++){
        if(son[x][i]!=-1)dfs(son[x][i],now);
    }
}
int main(){
    cin>>n;
    memset(son,-1,sizeof son);
    for(int i=2;i<=n;i++){
        cin>>f[i];
        for(int j=0;j<2;j++){
            if(son[f[i]][j]==-1){
                son[f[i]][j]=i;
                break;
            }
        }
    }
    string s;
    cin>>s;
    for(int i=1;i<=n;i++){
        col[i]=s[i-1]-'0';
    }
    int q;
    cin>>q;
    while(q--){
        int x;
        cin>>x;
        sum[x]+=1;
    }
    dfs(1,0);
    for(int i=1;i<=n;i++){
        cout<<col[i];
    }
    cout<<"\n";
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
