// ===========================================================================
// GESP 2025-09 C++ 六级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-09/2025-09-L6.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 6,
  month: "2025 年 09 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 下列关于类的说法，错误的是（#slot）。
  + 构造函数不能声明为虚函数，但析构函数可以。
  + 函数参数如声明为类的引用类型，调用时不会调用该类的复制构造函数。
  + 静态方法属于类而不是某个具体对象，因此推荐用#(math-missing)类名::方法(...)调用。
  + 不管基类的析构函数是否是虚函数，都可以通过基类指针/引用正确删除派生类对象。

2. 假设变量veh是类Car的一个实例，我们可以调用veh.move（#slot），是因为面向对象编程有（#slot）性质。

  ```cpp
  class Vehicle {
  private:
      string brand;
  public:
      Vehicle(string b) : brand(b) {}
      void setBrand(const string& b) { brand = b; }
      string getBrand() const { return brand; }
      void move() const {
          cout << brand << " is moving..." << endl;
      }
  };
  class Car : public Vehicle {
  private:
      int seatCount;
  public:
      Car(string b, int seats) : Vehicle(b), seatCount(seats) {}
      void showInfo() const {
          cout << "This car is a " << getBrand()
               << " with " << seatCount << " seats." << endl;
      }
  };
  ```
  + 继承 (Inheritance)
  + 封装 (Encapsulation)
  + 多态 (Polymorphism)
  + 链接 (Linking)

3. 下面代码中v1和v2调用了相同接口move（#slot），但输出结果不同，这体现了面向对象编程的（#slot）特性。

  ```cpp
  class Vehicle {
  private:
      string brand;
  public:
      Vehicle(string b) : brand(b) {}
      void setBrand(const string& b) { brand = b; }
      string getBrand() const { return brand; }
      virtual void move() const {
          cout << brand << " is moving..." << endl;
      }
  };
  class Car : public Vehicle {
  private:
      int seatCount;
  public:
      Car(string b, int seats) : Vehicle(b), seatCount(seats) {}
      void showInfo() const {
          cout << "This car is a " << getBrand()
               << " with " << seatCount << " seats." << endl;
      }
      void move() const override {
          cout << getBrand() << " car is driving on the road!" << endl;
      }
  };
  class Bike : public Vehicle {
  public:
      Bike(string b) : Vehicle(b) {}
      void move() const override {
          cout << getBrand() << " bike is cycling on the path!" << endl;
      }
  };
  int main() {
      Vehicle* v1 = new Car("Toyota", 5);
      Vehicle* v2 = new Bike("Giant");
      v1->move();
      v2->move();
      delete v1;
      delete v2;
      return 0;
  }
  ```
  + 继承 (Inheritance)
  + 封装 (Encapsulation)
  + 多态 (Polymorphism)
  + 链接 (Linking)

4. 栈的操作特点是（#slot）。
  + 先进先出
  + 先进后出
  + 随机访问
  + 双端进出

5. 循环队列常用于实现数据缓冲。假设一个循环队列容量为5（即最多存放4个元素，留一个位置区分空与满），依次进行操作：入队数据1，2，3，出队1个数据，再入队数据4和5，此时队首到队尾的元素顺序是（#slot）。
  + [2, 3, 4, 5]
  + [1, 2, 3, 4]
  + [3, 4, 5, 2]
  + [2, 3, 5, 4]

6. 以下函数createTree（#slot）构造的树是什么类型？

  ```cpp
  struct TreeNode {
      int val;
      TreeNode* left;
      TreeNode* right;
      TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
  };
  TreeNode* createTree() {
      TreeNode* root = new TreeNode(1);
      root->left = new TreeNode(2);
      root->right = new TreeNode(3);
      root->left->left = new TreeNode(4);
      root->left->right = new TreeNode(5);
      return root;
  }
  ```
  + 满二叉树
  + 完全二叉树
  + 二叉排序树
  + 其他都不对

7. 已知二叉树的#(math-missing)中序遍历#(math-missing)是 [D, B, E, A, F, C]，先序遍历#(math-missing)是 [A, B, D, E, C, F]。请问该二叉树的后序遍历结果是（#slot）。
  + [D, E, B, F, C, A]
  + [D, B, E, F, C, A]
  + [D, E, B, C, F, A]
  + [B, D, E, F, C, A]

8. 完全二叉树可以用数组连续高效存储，如果节点从1开始编号，则对有两个孩子节点的节点i，（#slot）。
  + 左孩子位于2i，右孩子位于2i+1
  + 完全二叉树的叶子节点可以出现在最后一层的任意位置
  + 所有节点都有两个孩子
  + 左孩子位于2i+1，右孩子位于2i+2

9. 设有字符集{a, b, c, d, e, f}，其出现频率分别为{5, 9, 12, 13, 16, 45}。哈夫曼算法构造最优前缀编码，以下哪一组可能是对应的哈夫曼编码？（非叶子节点左边分支记作 0，右边分支记作 1，左右互换不影响正确性）。
  + a: 00；b: 01；c: 10；d: 110；e: 111；f: 0
  + a: 1100；b: 1101；c: 100；d: 101；e: 111；f: 0
  + a: 000；b: 001；c: 01；d: 10；e: 110；f: 111
  + a: 10；b: 01；c: 100；d: 101；e: 111；f: 0

10. 下面代码生成格雷编码，则横线上应填写（#slot）。

  ```cpp
  vector<string> grayCode(int n) {
      if (n == 0) return {"0"};
      if (n == 1) return {"0", "1"};
      vector<string> prev = grayCode(n-1);
      vector<string> result;
      for (string s : prev) {
          result.push_back("0" + s);
      }
      for (_______________) {  // 在此处填写代码
          result.push_back("1" + prev[i]);
      }
      return result;
  }
  int i = 0; i < prev.size(); i++
  int i = prev.size()-1; i >= 0; i--
  int i = prev.size()/2; i < prev.size(); i++
  ```
  + auto s : prev

11. 请将下列树的深度优先遍历代码补充完整，横线处应填入（#slot）。

  ```cpp
  struct TreeNode {
      int val;
      TreeNode* left;
      TreeNode* right;
      TreeNode(int x): val(x), left(nullptr), right(nullptr) {}
  };
  void dfs(TreeNode* root) {
      if (!root) return;
      ______<TreeNode*> temp;     // 在此处填写代码
      temp.push(root);
      while (!temp.empty()) {
          TreeNode* node = temp.top();
          temp.pop();
          cout << node->val << " ";
          if (node->right) temp.push(node->right);
          if (node->left) temp.push(node->left);
      }
  }
  ```
  + vector
  + list
  + queue
  + stack

12. 令$n$是树的节点数目，下列代码实现了树的广度优先遍历，其时间复杂度是（#slot）。

  ```cpp
  void bfs(TreeNode* root) {
      if (!root) return;
      queue<TreeNode*> q;
      q.push(root);
      while (!q.empty()) {
          TreeNode* node = q.front();
          q.pop();
          cout << node->val << " ";
          if (node->left) q.push(node->left);
          if (node->right) q.push(node->right);
      }
  }
  ```
  + 左子树
  + 右子树
  + 随机
  + 根节点

13. 在二叉排序树（Binary Search Tree, BST）中查找元素50，从根节点开始：若根值为60，则下一步应去搜索：
  + 左子树
  + 右子树
  + 随机
  + 根节点

14. 删除二叉排序树中的节点时，如果节点有两个孩子，则横线处应填入（#slot），其中findMax和findMin分别为寻找树的最大值和最小值的函数。

  ```cpp
  struct TreeNode {
      int val;
      TreeNode* left;
      TreeNode* right;
      TreeNode(int x): val(x), left(nullptr), right(nullptr) {}
  };
  TreeNode* deleteNode(TreeNode* root, int key) {
      if (!root) return nullptr;
      if (key < root->val) {
          root->left = deleteNode(root->left, key);
      }
      else if (key > root->val) {
          root->right = deleteNode(root->right, key);
      }
      else {
          if (!root->left) return root->right;
          if (!root->right) return root->left;
          TreeNode* temp = ____________;          // 在此处填写代码
          root->val = temp->val;
          root->right = deleteNode(root->right, temp->val);
      }
      return root;
  }
  findMin(root->right)
  findMax(root->left)
  ```
  + root-\>left
  + root-\>right

15. 给定 个物品和一个最大承重为#(math-missing)的背包，每个物品有一个重量wt[i]和价值val[i]，每个物品只能选择放或不放。目标是选择若干个物品放入背包，使得总价值最大，且总重量不超过$W$，则横线上应填写（#slot）。

  ```cpp
  int knapsack(int W, vector<int>& wt, vector<int>& val, int n) {
      vector<int> dp(W+1, 0);
      for (int i = 0; i < n; ++i) {
          for (int w = W; w >= wt[i]; --w) {
              ________________________        // 在此处填写代码
          }
      }
      return dp[W];
  }
  dp[w] = max(dp[w], dp[w] + val[i]);
  dp[w] = dp[w - wt[i]] + val[i];
  dp[w] = max(dp[w - 1], dp[w - wt[i]] + val[i]);
  dp[w] = max(dp[w], dp[w - wt[i]] + val[i]);
  ```

= 判断题（每题 2 分，共 20 分）

1. 当基类可能被多态使用，其析构函数应该声明为虚函数。

2. 哈夫曼编码是最优前缀码，且编码结果唯一。

3. 一个含有$100$个节点的完全二叉树，高度为$8$。

4. 在 C++ STL 中，栈（std::stack）的pop操作返回栈顶元素并移除它。

5. 循环队列通过模运算循环使用空间。

6. 一棵有$n$个节点的二叉树一定有$n - 1$条边。

7. 以下代码实现了二叉树的中序遍历。输入以下二叉树，中序遍历结果是4 2 5 1 3 6。

  ```cpp
  //     1
  //    / \
  //   2   3
  //  / \   \
  // 4   5   6
  struct TreeNode {
      int val;
      TreeNode* left;
      TreeNode* right;
      TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
  };
  void inorderIterative(TreeNode* root) {
      stack<TreeNode*> st;
      TreeNode* curr = root;
      while (curr || !st.empty()) {
          while (curr) {
              st.push(curr);
              curr = curr->left;
          }
          curr = st.top(); st.pop();
          cout << curr->val << " ";
          curr = curr->right;
      }
  }
  ```

8. 下面代码实现的二叉排序树的查找操作时间复杂度是$O(h)$，其中$h$为树高。

  ```cpp
  TreeNode* searchBST(TreeNode* root, int val) {
      while (root && root->val != val) {
          root = (val < root->val) ? root->left : root->right;
      }
      return root;
  }
  ```

9. 下面代码实现了动态规划版本的斐波那契数列计算，其时间复杂度是$O(2^n)$。

  ```cpp
  int fib_dp(int n) {
      if (n <= 1) return n;
      vector<int> dp(n+1);
      dp[0] = 0;
      dp[1] = 1;
      for (int i = 2; i <= n; i++) {
          dp[i] = dp[i-1] + dp[i-2];
      }
      return dp[n];
  }
  ```

10. 有一排香蕉，每个香蕉有不同的甜度值。小猴子想吃香蕉，但不能吃相邻的香蕉。以下代码能找到小猴子吃到最甜的香蕉组合。

  ```cpp
  // bananas：香蕉的甜度
  void findSelectedBananas(vector<int>& bananas, vector<int>& dp) {
      vector<int> selected;
      int i = bananas.size() - 1;
      while (i >= 0) {
          if (i == 0) {
              selected.push_back(0);
              break;
          }
          if (dp[i] == dp[i-1]) {
              i--;
          } else {
              selected.push_back(i);
              i -= 2;
          }
      }
      reverse(selected.begin(), selected.end());
      cout << "小猴子吃了第: ";
      for (int idx : selected)
          cout << idx+1 << " ";
      cout << "个香蕉" << endl;
  }
  int main() {
      vector<int> bananas = {1, 2, 3, 1}; // 每个香蕉的甜
      vector<int> dp(bananas.size());
      dp[0] = bananas[0];
      dp[1] = max(bananas[0], bananas[1]);
      for (int i = 2; i < bananas.size(); i++) {
          dp[i] = max(bananas[i] + dp[i-2], dp[i-1]);
      }
      findSelectedBananas(bananas, dp);
      return 0;
  }
  ```

= 编程题（每题 25 分，共 50 分）

== 编程题 1：划分字符串

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 有一个由$n$个小写字母组成的字符串$s$。他希望将$s$划分为若干个子串，使得子串中每个字母至多出现一次。例如，对于字符串street来说，str + e + e + t是满足条件的划分；而s + tree + t不是，因为子串tree中e出现了两次。额外地，小 A 还给出了价值$a_1, a_2, dots.h , a_n$，表示划分后长度为$i$的子串价值为$a_i$。小 A 希望最大化划分后得到的子串价值之和。你能帮他求出划分后子串价值之和的最大值吗？3.1.2 输 格式入第一行，一个正整数$n$，表示字符串的长度。第二行，一个包含$n$个小写字母的字符串$s$。第三行，$n$个正整数$a_1, a_2, dots.h , a_n$，表示不同长度的子串价值。

=== 输出格式

一行，一个整数，表示划分后子串价值之和的最大值。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
6
street
2 1 7 4 3 3
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
13
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
8
blossoms
1 1 2 3 5 8 13 21
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
8
```

=== 数据范围

对于$40$% 的测试点，保证$1 <= n <= 10^3$。对于所有测试点，保证$1 <= n <= 10^5$，$1 <= a_i <= 10^9$。

=== 参考程序

```cpp
#include <algorithm>
#include <cstdio>
#include <vector>
using namespace std;
const int N = 1e5 + 5;
int n;
char s[N];
int a[N];
long long f[N];
int main() {
    scanf("%d", &n);
    scanf("%s", s + 1);
    for (int i = 1; i <= n; i++) scanf("%d", &a[i]);
    for (int i = 1; i <= n; i++) {
        int mask = 0;
        for (int j = i; j; j--) {
            int cur = 1 << (s[j] - 'a');
            if (mask & cur) break;
            mask |= cur;
            f[i] = max(f[i], f[j - 1] + a[i - j + 1]);
        }
    }
    printf("%lld\n", f[n]);
    return 0;
}
```

== 编程题 2：货物运输

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

A 国有$n$座城市，依次以$1,2,dots.h ,n$编号，其中$1$号城市为首都。这$n$座城市由$n - 1$条双向道路连接，第$i$条道路（#slot）连接编号为#(math-missing)的两座城市，道路长度为。任意两座城市间均可通过双向道路到达。现在 A 国需要从首都向各个城市运送货物。具体来说，满载货物的车队会从首都开出，经过一座城市时将对应的货物送出，因此车队需要经过所有城市。A 国希望你设计一条路线，在从首都出发经过所有城市的前提下，最小化经过的道路长度总和。注意一座城市可以经过多次，车队最后可以不返回首都。

=== 输入格式

第一行，一个正整数$n$，表示 A 国的城市数量。接下来$n - 1$行，每行三个整数$u_i, v_i, l_i$，表示一条双向道路连接编号为$u_i, v_i$的两座城市，道路长度为$l_i$。

=== 输出格式

一行，一个整数，表示你设计的路线所经过的道路长度总和。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4
1 2 6
1 3 1
3 4 5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
18
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
7
1 2 1
2 3 1
3 4 1
7 6 1
6 5 1
5 1 1
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
9
```

=== 数据范围

对于$30$% 的测试点，保证$1 <= n <= 8$。对于另外$30$% 的测试点，保证仅与一条双向道路连接的城市恰有两座。对于所有测试点，保证$1 <= n <= 10^5$，$1 <= u_i, v_i <= n$，$1 <= l_i <= 10^9$。

=== 参考程序

```cpp
#include <algorithm>
#include <cstdio>
#include <vector>
using namespace std;
const int N = 1e5 + 5;
int n;
vector<vector<pair<int, int>>> e;
long long s, mx;
void dfs(int u, int f, long long d) {
    mx = max(d, mx);
    for (auto p : e[u]) {
        if (p.first != f) { dfs(p.first, u, d + p.second); }
    }
}
int main() {
    scanf("%d", &n);
    e.resize(n + 1);
    for (int i = 1; i < n; i++) {
        int u, v, w;
        scanf("%d%d%d", &u, &v, &w);
        e[u].emplace_back(make_pair(v, w));
        e[v].emplace_back(make_pair(u, w));
        s += w;
    }
    dfs(1, 0, 0);
    printf("%lld\n", s * 2 - mx);
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
