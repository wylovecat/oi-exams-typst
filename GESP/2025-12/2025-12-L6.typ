// ===========================================================================
// GESP 2025-12 C++ 六级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-12/2025-12-L6.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 6,
  month: "2025 年 12 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 在面向对象编程中，下列关于#(math-missing)虚函数#(math-missing)的描述中，错误的是（#slot）。
  + 虚函数用于支持运行时多态
  + 通过基类指针调用虚函数时，会根据对象实际类型决定调用版本
  + 构造函数可以声明为虚函数以支持多态
  + 基类析构函数常声明为虚函数以避免资源泄漏

2. 执行如下代码，会输出#(math-missing)钢琴：叮咚叮咚#(math-missing)和#(math-missing)吉他：咚咚当当。这体现了面向对象编程的（#slot）特性。第 1 页 / 共 13 页

  ```cpp
  class Instrument {
  public:
      virtual void play() {
          cout << "乐器在演奏声音" << endl;
      }
      virtual ~Instrument() {}
  };
  class Piano : public Instrument {
  public:
      void play() override {
          cout << "钢琴：叮咚叮咚" << endl;
      }
  };
  class Guitar : public Instrument {
  public:
      void play() override {
          cout << "吉他：咚咚当当" << endl;
      }
  };
  int main() {
      Instrument* instruments[2];
      instruments[0] = new Piano();
      instruments[1] = new Guitar();
      for (int             i = 0; i < 2; ++i) {
          instruments[i]->play();
      }
      for (int             i = 0; i < 2; ++i) {
          delete instruments[i];
      }
      return 0;
  }
  ```
  + 继承
  + 封装
  + 多态
  + 链接

3. 关于以下代码，说法正确的是（#slot）。第 2 页 / 共 13 页

  ```cpp
  class Instrument {
  public:
     void play() {
          cout << "乐器在演奏声音" << endl;
      }
      virtual ~Instrument() {}
  };
  class Piano : public Instrument {
  public:
      void play() override {
          cout << "钢琴：叮咚叮咚" << endl;
      }
  };
  class Guitar : public Instrument {
  public:
      void play() override {
          cout << "吉他：咚咚当当" << endl;
      }
  };
  int main() {
      Instrument* instruments[2];
      instruments[0] = new Piano();
      instruments[1] = new Guitar();
      for (int i = 0; i < 2; ++i) {
          instruments[i]->play();
      }
      for (int             i = 0; i < 2; ++i) {
          delete instruments[i];
      }
      return 0;
  }
  ```
  + 执行代码会输出两行，内容分别为：钢琴：叮咚叮咚#(math-missing)和#(math-missing)吉他：咚咚当当
  + 执行代码会输出两行，内容分别为：乐器在演奏声音#(math-missing)和#(math-missing)乐器在演奏声音
  + 代码编译出现错误
  + 代码运行出现错误

4. 某文本编辑器把用户输入的字符依次压入栈 S。用户依次输入A, B, C, D后，用户按了两次撤销（每次撤销，弹出栈顶一个字符）。此时栈从栈底到栈顶的内容是：（#slot）。
  + A B
  + A B C
  + A B D
  + B C

5. 假设循环队列数组长度为N，其中队空判断条件为：front == rear，队满判断条件为：(rear + 1) % N == front，出队对应的操作为：front = (front + 1) % N，入队对于的操作为：rear = (rear + 1) %N。循环队列长度N = 6，初始front = 1, rear = 1，执行操作序列为：入队, 入队, 入队, 出队, 入队, 入队，则最终(front, rear)的值是（#slot）。
  + (2, 5)第 3 页 / 共 13 页
  + (2, 0)
  + (3, 5)
  + (3, 0)

6. 以下函数check（#slot）用于判断一棵二叉树是否为（#slot）。

  ```cpp
  bool check(TreeNode* root) {
      if (!root) return true;
      queue<TreeNode*> q;
      q.push(root);
      bool hasNull = false;
      while (!q.empty()) {
          TreeNode* cur = q.front(); q.pop();
          if (!cur) {
              hasNull = true;
          } else {
              if (hasNull) return false;
              q.push(cur->left);
              q.push(cur->right);
          }
      }
      return true;
  }
  ```
  + 满二叉树
  + 完全二叉树
  + 二叉搜索树
  + 平衡二叉树

7. 以下代码实现了二叉树的（#slot）。

  ```cpp
  void traverse(TreeNode* root) {
      if (!root) return;
      traverse(root->left);
      traverse(root->right);
      cout << root->val << " ";
  }
  ```
  + 前序遍历
  + 中序遍历
  + 后序遍历
  + 层序遍历

8. 下面代码实现了哈夫曼编码，则横线处应填写的代码是（#slot）。第 4 页 / 共 13 页第 5 页 / 共 13 页

  ```cpp
  struct Symbol {
      char ch;            //字符
      long long freq;     //频率
      string code;        //哈夫曼编码
  };
  struct Node {
      long long w;        //权值
      int l, r;           //左右孩子（节点下标），-1 表示空
      int sym;            // 叶子对应符号下标；内部节点为 -1
      Node(long long _w=0, int _l=-1, int _r=-1, int _sym=-1)
          : w(_w), l(_l), r(_r), sym(_sym) {}
  };
  // 从 A(leafIdx) 和 B(internalIdx) 的队首取最小的一个节点下标
  static int PopMinNode(const vector<Node>& nodes,
                        const vector<int>& leafIdx, int n, int& pA,
                        const vector<int>& internalIdx, int& pB) {
      if (pA < n && (pB >= (int)internalIdx.size() ||
                     nodes[leafIdx[pA]].w <= nodes[internalIdx[pB]].w)) {
          return leafIdx[pA++];
      }
      else {
          return internalIdx[pB++];
      }
  }
  // DFS 生成编码（左 0，右 1
  static void DFSBuildCodes(int u, const vector<Node>& nodes, Symbol sym[], string& path) {
      if (u == -1) return;
      if (nodes[u].sym != -1) {               // 叶子
          sym[nodes[u].sym].code = path;
          return;
      }
      path.push_back('0');
      DFSBuildCodes(nodes[u].l, nodes, sym, path);
      path.pop_back();
      path.push_back('1');
      DFSBuildCodes(nodes[u].r, nodes, sym, path);
      path.pop_back();
  }
  int BuildHuffmanCodes(Symbol sym[], int n) {
      for (int i = 0; i < n; i++) sym[i].code.clear();
      if (n <= 0) return -1;
      // 只有一个字符：约定编码为 "0"
      if (n == 1) {
          sym[0].code = "0";
          return 0;
      }
      vector<Node> nodes;
      nodes.reserve(2 * n);
      // 1) 建立叶子节点
      vector<int> leafIdx(n);
      for (int i = 0; i < n; i++) {
          leafIdx[i] = (int)nodes.size();
          nodes.push_back(Node(sym[i].freq, -1, -1, i));
      }
      // 2) 叶子按权值排序（A 队列）
      sort(leafIdx.begin(), leafIdx.end(),
           [&](int a, int b) {
               if (nodes[a].w != nodes[b].w) return nodes[a].w < nodes[b].w;
               return nodes[a].sym < nodes[b].sym; // 稳定一下
           });
      // B 队列（内部节点下标队列）
      vector<int> internalIdx;
      internalIdx.reserve(n);
      int pA = 0, pB = 0;
      // 3) 合并 n-1 次
      for (int k = 1; k < n; k++) {
          int x = PopMinNode(nodes, leafIdx, n, pA, internalIdx, pB);
          int y = PopMinNode(nodes, leafIdx, n, pA, internalIdx, pB);
          int z = (int)nodes.size();
          ________________________        // 在此处填写代码
      }
      int root = internalIdx.back();
      // 4) DFS 生成编码
      string path;
      DFSBuildCodes(root, nodes, sym, path);
      return root;
  }
  ```
  + ```cpp
    nodes.push_back(Node(nodes[x].w + nodes[y].w, x, y, -1));
    internalIdx.push_back(z);
    ```
  + ```cpp
    nodes.push_back(Node(nodes[x].w + nodes[y].w, x, y, -1));
    leafIdx.push_back(z);
    ```
  + ```cpp
    internalIdx.push_back(z);
    nodes.push_back(Node(nodes[x].w + nodes[y].w, x, y, x+y));
    ```
  + ```cpp
    nodes.push_back(Node(nodes[x].w + nodes[y].w, x, y, x+y));
    leafIdx.push_back(z);
    ```

9. 以下关于哈夫曼编码的说法，正确的是（#slot）。
  + 哈夫曼编码是定长编码
  + 哈夫曼编码中，没有任何一个字符的编码是另一个字符编码的前缀
  + 哈夫曼编码一定唯一
  + 哈夫曼编码不能用于数据压缩

10. 以下函数实现了二叉排序树（BST）的（#slot）操作。第 6 页 / 共 13 页

  ```cpp
  TreeNode* op(TreeNode* root, int x) {
      if (!root) return new TreeNode(x);
      if (x < root->val)
          root->left = op(root->left, x);
      else
          root->right = op(root->right, x);
      return root;
  }
  ```
  + 查找
  + 插入
  + 删除
  + 遍历

11. 下列代码实现了树的深度优先遍历，则横线处应填入（#slot）。

  ```cpp
  struct TreeNode {
      int val;
      TreeNode* left;
      TreeNode* right;
      TreeNode(int x): val(x), left(nullptr), right(nullptr) {}
  };
  void dfs(TreeNode* root) {
      if (!root) return;
      stack<TreeNode*> st;
      st.push(root);
      while (!st.empty()) {
          TreeNode* node = st.top(); st.pop();
          cout << node->val << " ";
          if (node->right) st.push(node->right);
          ________________________
      }
  }
  if (node->left) st.push(node->left);
  if (node->left) st.pop(node->left);
  if (node->left) st.front(node->left);
  if (node->left) st.push(node->right);
  ```

12. 给定一棵普通二叉树（节点值没有大小规律），下面代码判断是否存在值为x的结点，则横线处应填入（#slot）。第 7 页 / 共 13 页

  ```cpp
  struct TreeNode {
      int val;
      TreeNode* left;
      TreeNode* right;
      TreeNode(int x): val(x), left(nullptr), right(nullptr) {}
  };
  TreeNode* bfsFind(TreeNode* root, int x) {
      if (!root) return nullptr;
      queue<TreeNode*> q;
      q.push(root);
      while (!q.empty()) {
          TreeNode* cur = q.front(); q.pop();
          if (cur->val == x) return cur;
          ________________________
      }
      return nullptr;
  }
  if (cur->right) q.push(cur->right);
  ```
  + q.push(cur);
  + ```cpp
    if (cur->left)
        q.push(cur->left);
    if (cur->right)
        q.push(cur->right);
    ```
  + ```cpp
    q.push(cur->left);
    q.push(cur->right);
    ```

13. 在二叉排序树（Binary Search Tree, BST）中，假设节点值互不相同。给定如下搜索函数，以下说法一定正确的是（#slot）。

  ```cpp
  bool find(Node* root, int x) {
      while (root) {
          if (root->val == x) return true;
          root = (x < root->val) ? root->left : root->right;
      }
      return false;
  }
  ```
  + 最坏情况下，访问结点数是
  + 最坏情况下，访问结点数是
  + 无论如何，访问结点数都不超过树高的一半
  + 一定比在普通二叉树中搜索快

14. 0/1 背包（每件物品最多选一次）问题通常可用一维动态规划求解，核心代码如下。则下面说法正确的是（#slot）。第 8 页 / 共 13 页

  ```cpp
  for each item (w, v):
      for (int j = W; j >= w; --j)
          dp[j] = max(dp[j], dp[j-w] + v);
  ```
  + 内层j必须从小到大，否则会漏解
  + 内层j必须从大到小，否则同一件物品会被用多次
  + j从大到小或从小到大都一样
  + 只要dp初始为0，方向无所谓

15. 以下关于动态规划的说法中，错误的是（#slot）。
  + 动态规划方法通常能够列出递推公式。
  + 动态规划方法的时间复杂度通常为状态的个数。
  + 动态规划方法有递推和递归两种实现形式。
  + 对很多问题，递推实现和递归实现动态规划方法的时间复杂度相当。

= 判断题（每题 2 分，共 20 分）

1. 以下代码中，构造函数被调用的次数是1次。

  ```cpp
  class Test {
  public:
      Test() { cout << "T "; }
  };
  int main() {
      Test a;
      Test b = a;
  }
  ```

2. 面向对象编程中，封装是指将数据和操作数据的方法绑定在一起，并对外隐藏实现细节。

3. 以下代码能够正确统计二叉树中叶子结点的数量。

  ```cpp
  int countLeaf(TreeNode* root) {
      if (!root) return 0;
      if (!root->left && !root->right) return 1;
      return countLeaf(root->left) + countLeaf(root->right);
  }
  ```

4. 广度优先遍历二叉树可用栈来实现。

5. 函数调用管理可用栈来管理。

6. 在二叉排序树（BST）中，若某结点的左子树为空，则该结点一定是整棵树中的最小值结点。

7. 下面的函数能正确判断一棵树是不是二叉排序树（左边的数字要比当前数字小，右边的数字要比当前数字大）。

  ```cpp
  bool isBST(TreeNode* root, int minVal, int maxVal) {
      if (!root) return true;
      if (root->val <= minVal || root->val >= maxVal)
          return false;
      return isBST(root->left, minVal, root->val) &&
             isBST(root->right, root->val, maxVal);
  }
  第 9 页 / 共 13 页
  ```

8. 格雷编码相邻两个编码之间必须有多位不同，以避免数据传输错误。

9. 小杨在玩一个闯关游戏，从第 1 关走到第 4 关。每一关的体力消耗如下（下标表示关卡编号）：cost = [ 0, 3, 5, 2, 4 ]，其中cost[i]表示到达第i关需要消耗的体力，cost[0]=0表示在开始状态，体力消耗为0。小杨每次可以从当前关卡#(math-missing)前进 1 步或 2 步。按照上述规则，从第 1 关到第 4 关所需消耗的最小体力为 7。

10. 假定只有一个根节点的树的深度为1，则一棵有$n$个节点的完全二叉树，则树的深度为$floor.l log _2(n) floor.r + 1$。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：路径覆盖

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

给定一棵有$n$个结点的有根树$T$，结点依次以$1,2,dots.h ,n$编号，根结点编号为$1$。方便起见，编号为$i$的结点称为结点。初始时$T$中的结点均为白色。你需要将$T$中的若干个结点染为黑色，使得所有叶子到根的路径上至少有一个黑色结点。将结点$i$染为黑色需要代价$c_i$，你需要在满足以上条件的情况下，最小化染色代价之和。叶子是指$T$中没有子结点的结点。3.1.2 输 格式入第一行，一个正整数$n$，表示结点数量。第二行，$n-1$个正整数$f_2, f_3, dots.h , f_n$，其中$f_i$表示结点$i$的父结点的编号，保证$f_i < i$。第三行，$n$个正整数$c_1, c_2, dots.h , c_n$，其中$c_i$表示将结点$i$染为黑色所需的代价。

=== 输出格式

一行，一个整数，表示在满足所有叶子到根的路径上至少有一个黑色结点的前提下，染色代价之和的最小值。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4
1 2 3
5 6 2 3
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
2
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
7
1 1 2 2 3 3
64 16 15 4 3 2 1
第 10 页 / 共 13 页
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
10
```

=== 数据范围

对于 40% 的测试点，保证$2 <= n <= 16$。对于另外 20% 的测试点，保证$f_i=i-1$。对于所有测试点，保证$2 <= n <= 10^5$，$1 <= c_i <= 10^9$。

=== 参考程序

```cpp
#include <cstdio>
#include <algorithm>
using namespace std;
const int N = 1e5 + 5;
int n;
int f[N], c[N], cnt[N];
long long ans[N];
int main() {
    scanf("%d", &n);
    for (int i = 2; i <= n; i++) {
        scanf("%d", &f[i]);
        cnt[f[i]]++;
    }
    for (int i = 1; i <= n; i++)
        scanf("%d", &c[i]);
    for (int i = n; i >= 1; i--) {
        if (cnt[i] == 0)
            ans[i] = c[i];
        ans[i] = min(ans[i], 1ll * c[i]);
        ans[f[i]] += ans[i];
    }
    printf("%lld\n", ans[1]);
    return 0;
}
```

== 编程题 2：道具商店

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

道具商店里有$n$件道具可供挑选。第$i$件道具可为玩家提升$a_i$点攻击力，需要$c_i$枚金币才能购买，每件道具只能购买一次。现在你有$k$枚金币，请问你最多可以提升多少点攻击力？第 11 页 / 共 13 页

=== 输入格式

第一行，两个正整数$n,k$，表示道具数量以及你所拥有的金币数量。接下来$n$行，每行两个正整数$a_i, c_i$，表示道具所提升的攻击力点数，以及购买所需的金币数量。

=== 输出格式

输出一行，一个整数，表示最多可以提升的攻击力点数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3 5
99 1
33 2
11 3
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
132
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
4 100
10 1
20 11
40 33
100 99
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
110
```

=== 数据范围

对于$60$的测试点，保证$1 <= k <= 500$，$1 <= c_i <= 500$。对于所有测试点，保证$1 <= n <= 500$，$1 <= k <= 10^9$，$1 <= a_i <= 500$，$1 <= c_i <= 10^9$。第 12 页 / 共 13 页

=== 参考程序

```cpp
#include <cstdio>
#include <algorithm>
using namespace std;
const int N = 505;
const int oo = 1e9 + 10;
int n, k;
int f[N * N];
int main() {
    scanf("%d%d", &n, &k);
    for (int i = 1; i < N * N; i++)
        f[i] = oo;
    int s = 0;
    for (int i = 1; i <= n; i++) {
        int a, c;
        scanf("%d%d", &a, &c);
        s += a;
        for (int j = s; j >= a; j--)
            f[j] = min(f[j], f[j - a] + c);
    }
    int ans = 0;
    for (int i = 0; i < N * N; i++)
        if (f[i] <= k)
            ans = i;
    printf("%d\n", ans);
    return 0;
}第 13 页 / 共 13 页
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
