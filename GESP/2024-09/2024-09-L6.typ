// ===========================================================================
// GESP 2024-09 C++ 六级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-09/2024-09-L6.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 6,
  month: "2024 年 09 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 以下（#slot）没有涉及 C++ 语言的面向对象特性支持。
  + C++ 中构造一个class或struct
  + C++ 中调用printf函数
  + C++ 中调用用户定义的类成员函数
  + C++ 中构造来源于同一基类的多个派生类

2. 关于以下C++代码，（#slot）行代码会引起编译错误。

  ```cpp
  #include <iostream>
  using namespace std;
  class Base {
  private:
      int a;
  protected:
      int b;
  public:
      int c;
      Base() : a(1), b(2), c(3) {}
  };
  class Derived : public Base {
  public:
      void show() {
          cout << a << endl;   // Line 1
          cout << b << endl;   // Line 2
          cout << c << endl;   // Line 3
      }
  };
  ```
  + Line 1
  + Line 2
  + Line 3
  + 没有编译错误

3. 有6个元素，按照 6,5,4,3,2,1 的顺序进入栈S，下列（#slot）的出栈序列是不能出现的（#slot）。
  + 5,4,3,6,1,2
  + 4,5,3,1,2,6
  + 3,4,6,5,2,1
  + 2,3,4,1,5,6

4. 采用如下代码实现检查输入的字符串括号是否匹配，横线上应填入的代码为（#slot）。

  ```cpp
  #include <iostream>
  #include <stack>
  #include <string>
  using namespace std;
  bool is_valid(string s) {
      stack<char> st;
      char top;
      for (char& ch : s) {
          if (ch == '(' || ch == '{' || ch == '[') {
              st.push(ch);    // 左括号入栈
          }
          else
          {
              if (st.empty())
                  return false;
              ———————————————————————— // 在此处填入代码
              if ((ch == ')' && top != '(') ||
                  (ch == '}' && top != '{') ||
                  (ch == ']' && top != '[')) {
                  return false;
              }
          }
      }
      return st.empty();      // 栈为空则说明所有括号匹配成功
  }
  top = st.top(); st.pop();
  st.pop(); top = st.top();
  st.pop(); top = st.front();
  top = st.front();  st.pop();
  ```

5. 下面代码判断队列的第一个元素是否等于 ，并删除该元素，横向上应填写（#slot）。

  ```cpp
  #include <iostream>
  #include <queue>
  using namespace std;
  bool is_front_equal(std::queue<int>& q, int a) {
      bool is_equal = false;
      if (!q.empty()) {
          ———————————————————————— // 在此处填入代码
      }
      return is_equal;
  }
  is_equal = (q.front() == a);
  is_equal = (q.front() == a); q.pop();
  q.pop(); is_equal = (q.front() == a);
  q.pop(); is_equal = (q.top() == a);
  ```

6. 假设字母表{a,b,c,d,e}在字符串出现的频率分别为 10%，15%，30%，16%，29%。若使用哈夫曼编码方式对字母进行二进制编码，则字符abcdef分别对应的一组哈夫曼编码的长度分别为（#slot）。
  + 4, 4, 1, 3, 2
  + 3, 3, 2, 2, 2
  + 3, 3, 1, 2, 1
  + 4, 4, 1, 2, 2

7. 以下C++代码实现$n$位的格雷码，则横线上应填写（#slot）。

  ```cpp
  #include <iostream>
  #include <vector>
  #include <string>
  using namespace std;
  // 生成 n 位的格雷码
  vector<string> generate_graycode(int n) {
      vector<string> graycode_list;
      if (n <= 0) {
          return graycode_list;
      }
      // 初始1位格雷码
      graycode_list.push_back("0");
      graycode_list.push_back("1");
      // 迭代生成 n 位的格雷码
      for (int i = 2; i <= n; i++) {
          int current_size = graycode_list.size();
          for (int j = current_size - 1; j >= 0; j--) {
              graycode_list.push_back("1" + graycode_list[j]);
          }
          for (int j = 0; j < current_size; j++) {
              ———————————————————————— // 在此处填入代码
          }
      }
      return graycode_list;
  }
  graycode_list.push_back("0" + graycode_list[j]);
  graycode_list[j] = "0" + graycode_list[j];
  graycode_list.push_back("1" + graycode_list[j]);
  graycode_list[j] = "1" + graycode_list[j];
  ```

8. 给定一棵二叉树，其前序遍历结果为：ABDECFG,中序遍历结果为：DEBACFG，则这棵树的正确后序遍历结果是（#slot）。
  + EDBGFCA
  + EDGBFCA
  + DEBGFCA
  + DBEGFCA

9. 一棵有 个结点的完全二叉树用数组进行存储与表示，已知根结点存储在数组的第 个位置。若存储在数组第个位置的结点存在兄弟结点和两个子结点，则它的兄弟结点和右子结点的位置分别是（#slot）。
  + 8, 18
  + 10, 18
  + 8, 19
  + 10, 19

10. 二叉树的深度定义为从根结点到叶结点的最长路径上的结点数，则以下基于二叉树的深度优先搜索实现的深度计算函数中横线上应填写（#slot）。

  ```cpp
  // 定义二叉树的结点结构
  struct tree_node {
      int val;
      tree_node* left;
      tree_node* right;
      tree_node(int x) : val(x), left(nullptr), right(nullptr) {}
  };
  // 计算二叉树的深度
  int max_depth(tree_node* root) {
      if (root == nullptr) {
          return 0;  // 如果根结点为空，则深度为 0
      }
      int left_depth = max_depth(root->left);
      int right_depth = max_depth(root->right);
      ———————————————————————— // 在此处填入代码
  }
  return left_depth + right_depth;
  return max(left_depth, right_depth);
  return max(left_depth, right_depth) + 1;
  return left_depth + right_depth + 1;
  ```

11. 上一题的二叉树深度计算还可以采用二叉树的广度优先搜索来实现。以下基于二叉树的广度优先搜索实现的深度计算函数中横线上应填写（#slot）。

  ```cpp
  #include <queue>
  int max_depth_bfs(tree_node* root) {
      if (root == nullptr) {
          return 0; // 如果树为空，深度为 0
      }
      queue <tree_node*> q;
      q.push(root);
      int depth = 0;
      // 使用队列进行层序遍历
      while (!q.empty()) {
          ———————————————————————— // 在此处填入代码
          for (int i = 0; i < level_size; ++i) {
              tree_node* node = q.front();
              q.pop();
              if (node->left) {
                  q.push(node->left);
              }
              if (node->right) {
                  q.push(node->right);
              }
          }
      }
      return depth;
  }
  int level_size = q.size(); depth++;
  int level_size = 2; depth++;
  int level_size = q.size(); depth += level_size;
  int level_size = 2; depth += level_size;
  ```

12. 二叉搜索树中的每个结点，其左子树的所有结点值都小于该结点值，右子树的所有结点值都大于该结点值。以下代码对给定的整数数组(假设数组中没有数值相等的元素)，构造一个对应的二叉搜索树，横线上应填写（#slot）:

  ```cpp
  // 定义二叉树的结点结构
  struct tree_node {
      int val;
      tree_node* left;
      tree_node* right;
      tree_node(int x) : val(x), left(nullptr), right(nullptr) {}
  };
  // 插入结点到二叉搜索树中
  tree_node* insert(tree_node* root, int val) {
      if (root == nullptr) {
          return new tree_node(val);
      }
      ———————————————————————— // 在此处填入代码
      return root;
  }
  // 根据给定数组构造二叉搜索树
  tree_node* constructBST(const int arr[], int size) {
      tree_node* root = nullptr;
      for (int i = 0; i < size; ++i) {
          root = insert(root, arr[i]);
      }
      return root;
  }
  ```
  + ```cpp
    if (val < root->val)
      root->left = insert(root->left, val);
    else
      root->right = insert(root->right, val);
    ```
  + ```cpp
    if (val > root->val)
      root->left = insert(root->left, val);
    else
      root->right = insert(root->right, val);
    ```
  + ```cpp
    if (val < root->val)
      root->left = insert(root, val);
    else
      root->right = insert(root, val);
    ```
  + ```cpp
    if (val > root->val)
      root->left = insert(root, val);
    else
      root->right = insert(root, val);
    ```

13. 对上题中的二叉搜素树，当输入数组为#(math-missing)时，构建二叉搜索树，并采用如下代码实现的遍历方式，得到的输出是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  // 遍历二叉搜索树，输出结点值
  void traversal(tree_node* root) {
      if (root == nullptr) {
          return;
      }
      traversal(root->left);
      cout << root->val << " ";
      traversal(root->right);
  }
  ```
  + 无法分解的问题
  + 可以分解成相互依赖的子问题的问题
  + 可以通过贪心算法解决的问题
  + 只能通过递归解决的问题

14. 动态规划通常用于解决（#slot）。
  + 无法分解的问题
  + 可以分解成相互依赖的子问题的问题
  + 可以通过贪心算法解决的问题
  + 只能通过递归解决的问题

15. 阅读以下用动态规划解决的0-1背包问题的函数，假设背包的容量#(math-missing)是10kg，假设输入4个物品的重量分别为#(math-missing)（单位为kg），每个物品对应的价值#(math-missing)分别为$20,30,50,60$，则函数的输出为（#slot）。

  ```cpp
  #include <iostream>
  #include <vector>
  using namespace std;
  // 0/1背包问题
  int knapsack(int W, const vector<int>& weights, const vector<int>& values, int n) {
      vector<vector<int>> dp(n + 1, vector<int>(W + 1, 0));
      for (int i = 1; i <= n; ++i) {
          for (int w = 0; w <= W; ++w) {
              if (weights[i - 1] <= w) {
                  dp[i][w] = max(dp[i - 1][w], dp[i - 1][w - weights[i - 1]] +
  values[i - 1]);
              }
              else
              {
                  dp[i][w] = dp[i - 1][w];
              }
          }
      }
      return dp[n][W];
  }
  ```
  + 90
  + 100
  + 110
  + 140

= 判断题（每题 2 分，共 20 分）

1. C++、Python和JAVA等都是面向对象的编程语言。

2. 在C++中，类的静态成员变量只能被该类对象的成员函数访问。

3. 栈是一种线性结构，可通过数组或链表来实现。二者相比，数组实现占用的内存较少，链表实现的入队和出队操作的时间复杂度较低。

4. 运行以下C++代码，屏幕将输出“derived class”。

  ```cpp
  #include <iostream>
  using namespace std;
  class base {
  public:
      virtual void show() {
          cout << "base class" << endl;
      }
  };
  class derived : public base {
  public:
      void show() override {
          cout << "derived class" << endl;
      }
  };
  int main() {
      base* b;
      derived d;
      b = &d;
      b->show();
      return 0;
  }
  ```

5. 如下列代码所示的基类（base）及其派生类（derived），则生成一个派生类的对象时，只调用派生类的构造函数。

  ```cpp
  #include <iostream>
  using namespace std;
  class base {
  public:
      base() {
          cout << "base constructor" << endl;
      }
      ~base() {
          cout << "base destructor" << endl;
      }
  };
  class derived : public base {
   public:
      derived() {
          cout << "derived constructor" << endl;
      }
      ~derived() {
          cout << "derived destructor" << endl;
      }
  };
  ```

6. 哈夫曼编码本质上是一种贪心策略。

7. 如果根结点的深度记为 ，则一棵恰有#(math-missing)个叶结点的二叉树的深度最少是$12$。

8. 在非递归实现的树的广度优先搜索中，通常使用栈来辅助实现。

9. 状态转移方程是动态规划的核心，可以通过递推方式表示问题状态的变化。

10. 应用动态规划算法时，识别并存储重叠子问题的解是必须的。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：小杨和整数拆分

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有一个正整数$n$，小杨想将它拆分成若干完全平方数的和，同时小杨希望拆分的数量越少越好。小杨请你编写程序计算出总和为$n$的完全平方数的最少数量。

=== 输入格式

第一行包含一个正整数$n$，含义如题面所示。

=== 输出格式

输出一个整数，代表总和为$n$的完全平方数的最少数量。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
18
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
2
```

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
const int N = 1e5+10;
int n;
int dp[N];
int main(){
    cin>>n;
    for(int i=1;i<=n;i++){
        dp[i]=i;
        for(int j=1;j<=sqrt(i);j++){
            dp[i] =min(dp[i-j*j]+1,dp[i]);
        }
    }
     cout<<dp[n]<<"\n";
}
```

== 编程题 2：算法学习

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨计划学习$m$种算法，为此他找了$n$道题目来帮助自己学习，每道题目至多学习一次。小杨对于$m$种算法的初始掌握程度均为$0$。第$i$道题目有对应的知识点$a_i$，即学习第$i$道题目可以令小杨对第$a_i$种算法的掌握程度提高$b_i$。小杨的学习目标是对$m$种算法的掌握程度均至少为$k$。小杨认为连续学习两道相同知识点的题目是不好的，小杨想请你编写程序帮他计算出他最少需要学习多少道题目才能使得他在完成学习目标的同时避免连续学习两道相同知识点的题目。

=== 输入格式

第一行三个正整数$m,n,k$，代表算法种类数，题目数和目标掌握程度。第二行$n$个正整数$a_1, a_2, a_3, dots.h , a_n$，代表每道题目的知识点。第二行$n$个正整数$b_1, b_2, b_3, dots.h , b_n$，代表每道题目提升的掌握程度。

=== 输出格式

输出一个整数，代表小杨最少需要学习题目的数量，如果不存在满足条件的方案，输出 -1。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
2 4 10
1 1 1 2
1 2 7 10
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
-1
```

=== 参考程序

```cpp
#include <bits/stdc++.h>
using namespace std;
const int N = 1e5 + 5;
const int inf = 0x3f3f3f3f;
int f[N];
vector<int> score[N + 2], a, b;
bool cmp(int i, int j) {
    return i > j;
}
int main() {
    int n, m, k;
    cin >> m >> n >> k;
    a.resize(n), b.resize(n);
    for (int i = 0; i < n; i ++)
        cin >> a[i];
    for (int i = 0; i < n; i ++) {
        cin >> b[i];
        score[a[i]].emplace_back(b[i]);
    }
    vector<int> need(m + 2);
    int ans = 0, mx_meed = 0, mx_need_i = -1;
    for (int i = 1; i <= m; i ++) {
        sort(score[i].begin(), score[i].end(), cmp);
        int sum = 0;
        for (int j = 0; j < (int) score[i].size(); j ++) {
            sum += score[i][j];
            if (sum >= k) {
                need[i] = j + 1; break ;
            }
        }
        if (sum < k) {
            puts("-1"); return 0;
        }
        ans += need[i];
        if (need[i] > mx_meed)
            mx_meed = need[i], mx_need_i = i;
    }
    if (mx_meed - 1 <= ans - mx_meed) {
        cout << ans << endl;
        return 0;
    }
    int last = 0;
    for (int i = 1; i <= m; i ++)
        if (i != mx_need_i)
            last += score[i].size() - need[i];
    cout << (mx_meed - 1 <= ans - mx_meed + last ? 2 * mx_meed - 1 : -1) << endl;
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
