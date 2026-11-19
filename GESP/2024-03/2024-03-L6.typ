// ===========================================================================
// GESP 2024-03 C++ 六级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-03/2024-03-L6.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 6,
  month: "2024 年 03 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 在构建哈夫曼树时，每次应该选择（#slot）合并。
  + 最小权值的节点
  + 最大权值的节点
  + 随机节点
  + 深度最深的节点

2. 面向对象的编程思想主要包括以下哪些原则（#slot）？
  + 贪心、动态规划、回溯
  + 并发、并行、异步
  + 递归、循环、分治
  + 封装、继承、多态

3. 在队列中，元素的添加和删除是按照（#slot）原则进行的。
  + 先进先出
  + 先进后出
  + 最小值先出
  + 随机进出

4. 给定一个简单的类定义如下，（#slot）语句在类的外部正确地创建了一个Circle对象并调用了getArea函数？

  ```cpp
  class Circle {
  private:
      double radius;
  public:
      Circle(double r) : radius(r) {}
      double getArea() {
          return 3.14 * radius * radius;
      }
  };
  Circle c = Circle(5.0); c.getArea(c);
  Circle c(5.0); getArea(c);
  Circle c = new Circle(5.0); c.getArea();
  Circle c(5.0); c.getArea();
  ```

5. 以下代码希望能在一棵二叉排序树中搜索特定的值，请在横线处填入（#slot），使其能正确实现相应功能。

  ```cpp
  TreeNode* search(TreeNode* root, int target) {
      if (root == NULL || root->val == target) {
          return root;
      }
      if (_______________) {
          return search(root->left, target);
      } else {
          return search(root->right, target);
      }
  }
  target < root->left
  target > root->left
  ```
  + target \< root-\>val
  + target \> root-\>val

6. 3 位格雷编码的正确顺序是（#slot）。
  + 000, 001, 010, 011, 100, 101, 110, 111
  + 000, 001, 011, 010, 110, 111, 101, 100
  + 000, 010, 001, 011, 100, 110, 101, 111
  + 000, 010, 110, 100, 111, 101, 011, 001

7. 以下动态规划算法的含义与目的是（#slot）。

  ```cpp
  int function(vector<int>& nums) {
      int n = nums.size();
      if (n == 0)
          return 0;
      if (n == 1)
          return nums[0];
      vector<int> dp(n, 0);
      dp[0] = nums[0];
      dp[1] = max(nums[0], nums[1]);
      for (int i = 2; i < n; ++i) {
          dp[i] = max(dp[i - 1], nums[i] + dp[i - 2]);
      }
      return dp[n - 1];
  }
  ```
  + 计算数组nums中的所有元素的和
  + 计算数组nums中相邻元素的最大和
  + 计算数组nums中不相邻元素的最大和
  + 计算数组nums中的最小元素

8. 阅读以下广度优先搜索的代码：使用以上算法遍历以下这棵树，可能的输出是（#slot）。

  ```cpp
  void bfs(TreeNode* root) {
      if (root == NULL) {
          return;
      }
      queue<TreeNode*> q;
      q.push(root);
      while (!q.empty()) {
          TreeNode* current = q.front();
          q.pop();
          cout << current->val << " ";
          if (current->left) {
              q.push(current->left);
          }
          if (current->right) {
              q.push(current->right);
          }
      }
  }
      1
     / \
    2   3
   / \   \
  8   9   6
     / \   \
    4   5   7
           / \
          10 11
  1 2 8 9 4 5 3 6 7 10 11
  1 2 3 4 5 6 7 8 9 10 11
  1 2 3 8 9 6 4 5 7 10 11
  1 2 3 8 9 4 5 6 7 10 11
  ```

9. 给定一个空栈，执行以下操作序列：操作序列：push(1), push(2), push(3), pop（#slot）, pop（#slot）, push(4), push(5), pop（#slot）最终栈中的元素是（#slot）。
  + 1, 2
  + 1, 4, 5
  + 1, 2, 5
  + 1, 4

10. 一个有 124 个叶子节点的完全二叉树，最多有（#slot）个结点。
  + 247
  + 248
  + 249
  + 250

11. 在求解最优化问题时，动态规划常常涉及到两个重要性质，即最优子结构和（#slot）。
  + 重叠子问题
  + 分治法
  + 贪心策略
  + 回溯算法

12. 若一棵二叉树的先序遍历为：A, B, D, E, C, F、中序遍历为：D, B, E, A, F, C，它的后序遍历为（#slot）。
  + D, E, B, F, C, A
  + E, D, B, F, C, A
  + D, E, B, C, F, A
  + E, D, B, C, F, A

13. 线性筛法与埃氏筛法相比的优势是（#slot）。
  + 更容易实现
  + 更节省内存
  + 更快速
  + 更准确

14. 以下代码使用了辗转相除法求解最大公因数，请在横线处填入（#slot），使其能正确实现相应功能。

  ```cpp
  int gcd(int a, int b) {
      while (b != 0) {
          ______________________
      }
      return a;
  }
  int temp = b; b = a / b; a = temp;
  int temp = a; a = b / a; b = temp;
  int temp = b; b = a % b; a = temp;
  ```
  + b = a % b; a = b;

15. 下面的代码片段用于反转单链表，请进行（#slot）修改，使其能正确实现相应功能。

  ```cpp
  ListNode* reverseLinkedList(ListNode* head) {
      ListNode* prev = nullptr;
      ListNode* current = head;
      while (current != nullptr) {
          ListNode* next = current->next;
          current->next = next;
          prev = current;
          current = next;
      }
      return prev;
  }
  ```
  + current-\>next = next;应该改为current-\>next = prev;
  + ListNode\* next = current-\>next;应该改为ListNode\* next = prev-\>next;
  + current != nullptr应该改为current-\>next != nullptr
  + ListNode\* prev = nullptr;应该改为ListNode\* prev = head;

= 判断题（每题 2 分，共 20 分）

1. 哈夫曼树是一种二叉树。

2. 在动态规划中，状态转移方程的作用是定义状态之间的关系。

3. 继承是将已有类的属性和方法引入新类的过程。

4. 完全二叉树的任意一层都可以不满。

5. 删除单向链表中的节点，只需知道待删除节点的地址即可，无需访问前一个节点。

6. 在宽度优先搜索中，通常使用队列来辅助实现。

7. 哈夫曼编码的主要应用领域是有损数据压缩。

8. 二叉搜索树的查找操作的时间复杂度是$O(N)$。

9. 栈的基本操作包括入栈（push）和出栈（pop）。

10. 使用哈夫曼编码对一些字符进行编码，如果两个字符的频率差异最大，则它们的编码可能出现相同的前缀。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：游戏

=== 题目描述

你有四个正整数$n,a,b,c$，并准备用它们玩一个简单的小游戏。在一轮游戏操作中，你可以选择将$n$减去$a$，或是将$n$减去$b$。游戏将会进行多轮操作，直到当$n <= c$时游戏结束。你想知道游戏结束时有多少种不同的游戏操作序列。两种游戏操作序列不同，当且仅当游戏操作轮数不同，或是某一轮游戏操作中，一种操作序列选择将$n$减去$a$，而另一种操作序列选择将$n$减去$b$。如果$a=b$，也认为将$n$减去与将$n$减去$b$是不同的操作。由于答案可能很大，你只需要求出答案对$1000000007$取模的结果。

=== 输入格式

一行四个正整数$n,a,b,c$。保证$1 <= a, b, c <= n$。

=== 输出格式

一行一个整数，表示不同的游戏操作序列数量对$1000000007$取模的结果。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
114514 191 9 810
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
384178446
```

=== 数据范围

对于$20$的测试点，保证$a=b=c=1$，$n <= 30$。对于$20$的测试点，保证$a=b=c=1$，$n <= 30$。对于所有测试点，保证$1 <= n <= 2 times 10^5$。

=== 参考程序

```cpp
#include <cstdio>
using namespace std;
const int N = 2e5 + 5;
const int mod = 1e9 + 7;
int n, a, b, c;
int f[N << 1];
int ans;
int main()
{
    scanf("%d%d%d%d", &n, &a, &b, &c);
    f[N + n] = 1;
    for (int i = n; i > c; i--)
    {
        f[N + i - a] = (f[N + i - a] + f[N + i]) % mod;
        f[N + i - b] = (f[N + i - b] + f[N + i]) % mod;
    }
    for (int i = 0; i <= N + c; i++)
        ans = (ans + f[i]) % mod;
    printf("%d\n", ans);
    return 0;
}
```

== 编程题 2：好斗的牛

=== 题目描述

你有$10^9$个牛棚，从左到右一字排开。你希望把$N$头牛安置到牛棚里。麻烦的是，你的牛很好斗，如果他们附近有其他的牛，他们就会不安分地去挑事。其中，第$i$头牛的攻击范围是$(a_i, b_i)$，这意味着，如果他的左边$a_i$个牛棚或右边$b_i$个牛棚里有其他牛，他就会去挑事。你想留下连续的一段牛棚，并把其他牛棚都卖掉。请问你最少需要留下多少牛棚，才能保证至少存在一种方案能够把所有的$N$头牛都安置进剩余的牛棚里，且没有牛会挑事？

=== 输入格式

第一行 1 个正整数$N$。接下来一行$N$个用空格隔开的正整数$a_1, dots.h , a_N$。接下来一行$N$个用空格隔开的正整数$a_1, dots.h , a_N$。

=== 输出格式

输出一行一个整数，表示你最少需要留下多少牛棚。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
2
1 2
1 2
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
4
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
3
1 2 3
3 2 1
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
7
```

=== 数据范围

对于$20$的测试点，保证$N=2$；对于另外$20$的测试点，保证$N=3$；对于$20$的测试点，保证$N=2$；对于所有测试点，保证，。

=== 提示

在常规程序中，输入、输出时提供提示是好习惯。但在本场考试中，由于系统限定，请不要在输入、输出中附带任何提示信息。你可以留下$4$个牛棚，并如此安排你的牛：牛棚#(math-missing)牛棚#(math-missing)牛棚#(math-missing)牛棚牛#(math-missing)牛

=== 参考程序

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
int N;
vector<int> a, b;
int ans = 1e9;
int main() {
    cin >> N;
    a.resize(N);
    b.resize(N);
    for (int i = 0; i < N; ++i) {
        cin >> a[i];
    }
    for (int i = 0; i < N; ++i) {
        cin >> b[i];
    }
    vector<int> permutation;
    permutation.resize(N);
    for (int i = 0; i < N; i ++)
        permutation[i] = i;
    do {
        int curr_len = N;
        for (int i = 1; i < N; ++i) {
            curr_len += max(b[permutation[i - 1]], a[permutation[i]]);
        }
        ans = min(ans, curr_len);
    } while(next_permutation(permutation.begin(), permutation.end()));
    cout << ans << endl;
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
