// ===========================================================================
// GESP 2025-06 C++ 六级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-06/2025-06-L6.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 6,
  month: "2025 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 下列哪一项不是面向对象编程的基本特征？
  + 继承
  + 封装
  + 多态
  + 链接

2. 2. 为了让Dog类的构造函数能正确地调用其父类Animal的构造方法，横线线处应填入（#slot）。

  ```cpp
  class Animal {
  public:
      std::string name;
      Animal(std::string str) : name(str) {
              std::cout << "Animal created\n";
          }
      virtual void speak() {
          cout << "Animal speaks" << endl;
      }
  };
  class Dog : public Animal {
      std::string breed;
  public:
      Dog(std::string name, std::string b) : _________________, breed(b) {
              std::cout << "Dog created\n";
          }
      void speak() override {
          cout << "Dog barks" << endl;
      }
  };
  int main() {
      Animal* p = new Dog("Rex", "Labrador");
      p->speak();
      delete p;
      return 0;
  }
  Animal::Animal(name)
  ```
  + Animal(name)
  + super(name)
  + Animal（#slot）

3. 代码同上一题，代码执行结果是（#slot）。
  + 输出 Animal speaks
  + 输出 Dog barks
  + 编译错误
  + 程序崩溃

4. 以下关于栈和队列的代码，执行后输出是（#slot）。

  ```cpp
  stack<int> s;
  queue<int> q;
  for (int i = 1; i <= 3; ++i) {
      s.push(i);
      q.push(i);
  }
  cout << s.top() << " " << q.front() << endl;
  ```
  + 1 3
  + 3 1
  + 3 3
  + 1 1

5. 在一个循环队列中，front是指向队头的指针，rear指向队尾的指针，队列最大容量为maxSize。判断队列已满的条件是（#slot）。

  ```cpp
  (rear + 1) % maxSize == front
  (rear - 1 + maxSize) % maxSize == front
  (rear - 1) == front
  ```
  + rear == front

6. （#slot）只有最底层的节点未被填满，且最底层节点尽量靠左填充。
  + 完美二叉树
  + 完全二叉树
  + 完满二叉树
  + 平衡二叉树

7. 在使用数组表示完全二叉树时，如果一个节点的索引为 （从 开始计数），那么其左子节点的索引通常是（#slot）。
  + 输出Animal speaks
  + $i + 1$
  + $i * 2$
  + $2 * i + 1$

8. 已知一棵二叉树的前序遍历序列为GDAFEMHZ，中序遍历序列为ADFGEHMZ，则其后序遍历序列为（#slot）。
  + ADFGEHMZ
  + ADFGHMEZ
  + AFDGEMZH
  + AFDHZMEG

9. 设有字符集 {a, b, c, d, e}，其出现频率分别为 {5, 8, 12, 15, 20}，得到的哈夫曼编码为（#slot）。

  ```cpp
  a: 010
  b: 011
  c: 00
  d: 10
  e: 11
  a: 00
  b: 10
  c: 011
  d: 100
  e: 111
  a: 10
  b: 01
  c: 011
  d: 100
  e: 111
  a: 100
  b: 01
  c: 011
  d: 100
  e: 00
  ```
  + ADFGEHMZ
  + ADFGHMEZ
  + AFDGEMZH
  + AFDHZMEG

10. 3位格雷编码中，编码 101 之后的下一个编码不可能是（#slot）。
  + 100
  + 111
  + 110
  + 001

11. 请将下列 C++ 实现的深度优先搜索（DFS）代码补充完整，横线处应填入（#slot）。

  ```cpp
  struct TreeNode {
      int val;
      TreeNode* left;
      TreeNode* right;
      TreeNode(int x): val(x), left(nullptr), right(nullptr) {}
  };
  void dfs(TreeNode* root, vector<int>& result) {
      if (root == nullptr) return;
      __________________________
  }
  ```
  + ```cpp
    result.push_back(root->val);
    dfs(root->left);
    dfs(root->right);
    ```
  + ```cpp
    result.push_back(root->left->val);
    dfs(root->right);
    dfs(root->left);
    ```
  + ```cpp
    result.push_back(root->left->val);
    dfs(root->left);
    dfs(root->right);
    ```
  + ```cpp
    result.push_back(root->right->val);
    dfs(root->right);
    dfs(root->left);
    ```

12. 给定一个二叉树，返回每一层中最大的节点值，结果以数组形式返回，横线处应填入（#slot）。

  ```cpp
  #include <vector>
  #include <queue>
  #include <algorithm>
  struct TreeNode {
      int val;
      TreeNode* left;
      TreeNode* right;
      TreeNode(int x): val(x), left(nullptr), right(nullptr) {}
  };
  vector<int> largestValues(TreeNode* root) {
      vector<int> result;
      if (!root) return result;
      queue<TreeNode*> q;
      q.push(root);
      while (!q.empty()) {
          int sz = q.size();
          int maxVal = INT_MIN;
          for (int i = 0; i < sz; ++i) {
              TreeNode* node;
              _______________________________
              maxVal = max(maxVal, node->val);
              if (node->left) q.push(node->left);
              if (node->right) q.push(node->right);
          }
          result.push_back(maxVal);
      }
      return result;
  }
  ```
  + ```cpp
    node = q.end();
    ```
  + ```cpp
    node = q.front();
    ```
  + ```cpp
    q.pop();
    node = q.front();
    ```
  + ```cpp
    node = q.front();
    q.pop();
    ```

13. 下面代码实现一个二叉排序树的插入函数（没有相同的数值），横线处应填入（#slot）。

  ```cpp
  struct TreeNode {
      int val;
      TreeNode* left;
      TreeNode* right;
      TreeNode(int x): val(x), left(nullptr), right(nullptr) {}
  };
  void insert(TreeNode*& root, int key) {
      if (!root) {
          root = new TreeNode(key);
          return;
      }
      _______________________________
  }
  insert(root->left, key);
  insert(root->right, key);
  insert(root->right, key);
  insert(root->left, key);
  ```
  + ```cpp
    if (key < root->val)
        insert(root->left, key);
    else if (key > root->val)
        insert(root->right, key);
    ```
  + ```cpp
    if (key < root->val)
        insert(root->right, key);
    else if (key > root->val)
        insert(root->left, key);
    ```
  + 只能从底至顶迭代求解
  + 必须使用递归实现，不能使用迭代

14. 以下关于动态规划算法特性的描述，正确的是（#slot）。
  + 子问题相互独立，不重叠
  + 问题包含重叠子问题和最优子结构
  + 只能从底至顶迭代求解
  + 必须使用递归实现，不能使用迭代

15. 给定 个物品和一个最大承重为#(math-missing)的背包，每个物品有一个重量wt[i]和价值val[i]，每个物品只能选择放或不放。目标是选择若干个物品放入背包，使得总价值最大，且总重量不超过。关于下面代码，说法正确的是（#slot）。

  ```cpp
  int knapsack1D(int W, vector<int>& wt, vector<int>& val, int n) {
      vector<int> dp(W+1, 0);
      for (int i = 0; i < n; ++i) {
          for (int w = W; w >= wt[i]; --w) {
              dp[w] = max(dp[w], dp[w - wt[i]] + val[i]);
          }
      }
      return dp[W];
  }
  ```
  + 该算法不能处理背包容量为0的情况
  + 外层循环i遍历背包容量，内层遍历物品
  + 从大到小遍历w是为了避免重复使用同一物品
  + 这段代码计算的是最小重量而非最大价值

= 判断题（每题 2 分，共 20 分）

1. 构造函数可以被声明为 virtual。

2. 给定一组字符及其出现的频率，构造出的哈夫曼树是唯一的。

3. 为了实现一个队列，使其出队操作（pop）的时间复杂度为$O(1)$并且避免数组删除首元素的$O(n)$问题，一种常见且有效的方法是使用环形数组，通过调整队首和队尾指针来实现。

4. 对一棵二叉排序树进行中序遍历，可以得到一个递增的有序序列。

5. 如果二叉搜索树在连续的插入和删除操作后，所有节点都偏向一侧，导致其退化为类似于链表的结构，这时其查找、插入、删除操作的时间复杂度会从理想情况下的$O(log n)$退化到$O(n log n)$。

6. 执行下列代码，my\_dog.name的最终值是Charlie。

  ```cpp
  class Dog {
  public:
      std::string name;
      Dog(std::string str) : name(str) {}
  };
  int main() {
      Dog my_dog("Buddy");
      my_dog.name = "Charlie";
      return 0;
  }
  ```

7. 下列 C++ 代码可以成功编译，并且子类Child的实例能通过其成员函数访问父类Parent的属性value。

  ```cpp
  class Parent {
  private:
      int value = 100;
  };
  class Child : public Parent {
  public:
      int get_private_val() {
          return value; // 尝试访问父类的私有成员
      }
  };
  ```

8. 下列代码中的tree向量，表示的是一棵完全二叉树 (-1代表空节点)按照层序遍历的结果。

  ```cpp
  #include <vector>
  std::vector<int> tree = {1, 2, 3, 4, -1, 6, 7};
  ```

9. 在树的深度优先搜索（DFS）中，使用栈作为辅助数据结构以实现“先进后出”的访问顺序。

10. 下面代码采用动态规划求解零钱兑换问题：给定 种硬币，第𝑖种硬币的面值为𝑐𝑜𝑖𝑛𝑠[𝑖 − 1]，目标金额为𝑎𝑚𝑡，每种硬币可以重复选取，求能够凑出目标金额的最少硬币数量；如果不能凑出目标金额，返回-1。

  ```cpp
  int coinChangeDPComp(vector<int> &coins, int amt) {
      int n = coins.size();
      int MAX = amt + 1;
      vector<int> dp(amt + 1, MAX);
      dp[0] = 0;
      for (int i = 1; i <= n; i++) {
          for (int a = 1; a <= amt; a++) {
              if (coins[i - 1] > a)
                  dp[a] = dp[a];
              else
                  dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
          }
      }
      return dp[amt] != MAX ? dp[amt] : -1;
  }
  ```

= 编程题（每题 25 分，共 50 分）

== 编程题 1：学习小组

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

班主任计划将班级里的$n$名同学划分为若干个学习小组，每名同学都需要分入某一个学习小组中。观察发现，如果一个学习小组中恰好包含$k$名同学，则该学习小组的讨论积极度为$a_k$。给定讨论积极度$a_1, a_2, dots.h , a_n$，请你计算将这$n$名同学划分为学习小组的所有可能方案中，讨论积极度之和的最大值。

=== 输入格式

第一行，一个正整数$n$，表示班级人数。第二行，$n$个非负整数$a_1, a_2, dots.h , a_n$，表示不同人数学习小组的讨论积极度。

=== 输出格式

输出共一行，一个整数，表示所有划分方案中，学习小组讨论积极度之和的最大值。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4
1 5 6 3
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
10
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
8
0 2 5 6 4 3 3 4
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
12
```

=== 数据范围

对于$40$% 的测试点，保证$1 <= n <= 10$。对于所有测试点，保证，。

=== 参考程序

```cpp
#include <cstdio>
#include <algorithm>
using namespace std;
const int N = 1005;
int n;
int a[N];
int main() {
    scanf("%d", &n);
    for (int i = 1; i <= n; i++) {
        scanf("%d", &a[i]);
        for (int j = 1; j < i; j++)
            a[i] = max(a[i], a[j] + a[i - j]);
    }
    printf("%d\n", a[n]);
    return 0;
}
```

== 编程题 2：最大因数

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

给定一棵有$10^9$个结点的有根树，这些结点依次以$1,2,dots.h ,10^9$编号，根结点的编号为$1$。对于编号为#(math-missing)（#slot）的结点，其父结点的编号为#(math-missing)的因数中除#(math-missing)以外最大的因数。现在有#(math-missing)组询问，第#(math-missing)（#slot）组询问给定，请你求出编号分别为#(math-missing)的两个结点在这棵树上的距离。两个结点之间的距离是连接这两个结点的简单路径所包含的边数。

=== 输入格式

第一行，一个正整数$q$，表示询问组数。接下来#(math-missing)行，每行两个正整数，表示询问结点的编号。

=== 输出格式

输出共$q$行，每行一个整数，表示结点#(math-missing)之间的距离。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
1 3
2 5
4 8
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
1
2
1
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
1
120 650
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
9
```

=== 数据范围

对于 % 的测试点，保证。对于所有测试点，保证，保证。

=== 参考程序

```cpp
#include <cstdio>
#include <algorithm>
using namespace std;
const int N = 50;
int q;
int a[N], cnta;
int b[N], cntb;
int f[N], t;
void factorize(int x, int a[], int &cnt) {
    a[0] = x;
    t = 0;
    for (int i = 2; i * i <= x; i++)
        while (x % i == 0) {
            f[++t] = i;
            x /= i;
        }
    if (x > 1)
        f[++t] = x;
    for (int i = 1; i <= t; i++)
        a[i] = a[i - 1] / f[i];
    cnt = t;
}
int main() {
    scanf("%d", &q);
    while (q--) {
        int x, y;
        scanf("%d%d", &x, &y);
        factorize(x, a, cnta);
        factorize(y, b, cntb);
        int px = 0, py = 0;
        while (a[px] != b[py]) {
            if (a[px] > b[py])
                px++;
            else
                py++;
        }
        printf("%d\n", px + py);
    }
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
