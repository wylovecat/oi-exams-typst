// ===========================================================================
// GESP 2024-03 C++ 五级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-03/2024-03-L5.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 5,
  month: "2024 年 03 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 唯一分解定理描述的内容是（#slot）？
  + 任意整数都可以分解为素数的乘积
  + 每个合数都可以唯一分解为一系列素数的乘积
  + 两个不同的整数可以分解为相同的素数乘积
  + 以上都不对

2. 贪心算法的核心思想是（#slot）？
  + 在每一步选择中都做当前状态下的最优选择
  + 在每一步选择中都选择局部最优解
  + 在每一步选择中都选择全局最优解
  + 以上都对

3. 下面的 C++ 代码片段用于计算阶乘。请在横线处填入（#slot），实现正确的阶乘计算。

  ```cpp
  int factorial(int n) {
      if (n == 0 || n == 1) {
          return 1;
      } else {
          _________________________________  // 在此处填入代码
      }
  }
  return n * factorial(n - 1);
  return factorial(n - 1) / n;
  return n * factorial(n);
  return factorial(n / 2) * factorial(n / 2);
  ```

4. 下面的代码片段用于在双向链表中删除一个节点。请在横线处填入（#slot），使其能正确实现相应功能。

  ```cpp
  void deleteNode(DoublyListNode*& head, int value) {
      DoublyListNode* current = head;
      while (current != nullptr && current->val != value) {
          current = current->next;
      }
      if (current != nullptr) {
          if (current->prev != nullptr) {
             ____________________________________ // 在此处填入代码
          } else {
              head = current->next;
          }
          if (current->next != nullptr) {
              current->next->prev = current->prev;
          }
          delete current;
      }
  }
  if (current->next != nullptr) current->next->prev = current->prev;
  current->prev->next = current->next;
  delete current->next;
  current->prev = current->next;
  ```

5. 辗转相除法也被称为（#slot）
  + 高斯消元法
  + 费马定理
  + 欧几里德算法
  + 牛顿迭代法

6. 下面的代码片段用于计算斐波那契数列。该代码的时间复杂度是（#slot）？

  ```cpp
  int fibonacci(int n) {
      if (n <= 1) {
          return n;
      } else {
          return fibonacci(n - 1) + fibonacci(n - 2);
      }
  }
  ```
  + 高斯消元法
  + 费马定理
  + 欧几里德算法
  + 牛顿迭代法

7. 下面的代码片段用于将两个高精度整数进行相加。请在横线处填入（#slot），使其能正确实现相应功能。

  ```cpp
  string add(string num1, string num2) {
      string result;
      int carry = 0;
      int i = num1.size() - 1, j = num2.size() - 1;
      while (i >= 0 || j >= 0 || carry) {
          int x = (i >= 0) ? num1[i--] - '0' : 0;
          int y = (j >= 0) ? num2[j--] - '0' : 0;
          int sum = x + y + carry;
          carry = sum / 10;
          _______________________________________
      }
      return result;
  }
  result = to_string(sum % 10) + result;
  result = to_string(carry % 10) + result;
  result = to_string(sum / 10) + result;
  result = to_string(sum % 10 + carry) + result;
  ```

8. 给定序列：1，3，6，9，17，31，39，52，61，79，81，90，96。使用以下代码进行二分查找查找元素 82时，需要循环多少次，即最后输出的 times 值为（#slot）。

  ```cpp
  int binarySearch(const std::vector<int>& arr, int target) {
      int left = 0;
      int right = arr.size() - 1;
      int times = 0;
      while (left <= right) {
          times ++;
          int mid = left + (right - left) / 2;
          if (arr[mid] == target) {
              cout << times << endl;
              return mid;
          } else if (arr[mid] < target) {
              left = mid + 1;
          } else {
              right = mid - 1;
          }
      }
      cout << times << endl;
      return -1;
  }
  ```
  + 2
  + 5
  + 3
  + 4

9. 下面的代码片段用于判断一个正整数是否为素数。请对以下代码进行修改，使其能正确实现相应功能。（#slot）

  ```cpp
  bool isPrime(int num) {
      if (num < 2) {
          return false;
      }
      for (int i = 2; i * i < num; ++i) {
          if (num % i == 0) {
              return false;
          }
      }
      return true;
  }
  ```
  + num \< 2应该改为num \<= 2
  + 循环条件i \* i \< num应该改为i \* i \<= num
  + 循环条件应该是i \<= num
  + 循环体中应该是if (num % i != 0)

10. 在埃拉托斯特尼筛法中，要筛选出不大于n的所有素数，最外层循环应该遍历什么范围（#slot）？

  ```cpp
  vector<int> sieveOfEratosthenes(int n) {
      std::vector<bool> isPrime(n + 1, true);
      std::vector<int> primes;
      _______________________ {
          if (isPrime[i]) {
              primes.push_back(i);
              for (int j = i * i; j <= n; j += i) {
                  isPrime[j] = false;
              }
          }
      }
      for (int i = sqrt(n) + 1; i <= n; ++i) {
          if (isPrime[i]) {
              primes.push_back(i);
          }
      }
      return primes;
  }
  for (int i = 2; i <= n; ++i)
  for (int i = 1; i < n; ++i)
  for (int i = 2; i <= sqrt(n); ++i)
  for (int i = 1; i <= sqrt(n); ++i)
  ```

11. 素数的线性筛法时间复杂度为（#slot）。
  + $O(n)$
  + $O(n log log n)$
  + $O(n log n)$
  + $O(n^2)$

12. 归并排序的基本思想是（#slot）。
  + 动态规划
  + 分治
  + 贪心算法
  + 回溯算法

13. 在快速排序中，选择的主元素（pivot）会影响算法的（#slot）。
  + 不影响
  + 时间复杂度
  + 空间复杂度
  + 时间复杂度和空间复杂度

14. 递归函数在调用自身时，必须满足（#slot），以避免无限递归？
  + 有终止条件
  + 函数参数递减（或递增）
  + 函数返回值固定
  + 以上都对

15. 假设给定链表为: 1 → 3 → 5 → 7 → nullptr，若调用searchValue(head, 5)，函数返回值为（#slot）。

  ```cpp
  int searchValue(ListNode* head, int target) {
      while (head != nullptr) {
          if (head->val == target) {
              return 1;
          }
          head = head->next;
      }
      return 0;
  }
  ```
  + 返回 1
  + 返回 0
  + 死循环，无法返回
  + 返回 -1

= 判断题（每题 2 分，共 20 分）

1. 辗转相除法用于求两个整数的最大公约数。

2. 插入排序的时间复杂度是$O(N log N)$。

3. 二分查找要求被搜索的序列是有序的，否则无法保证正确性。

4. 使用贪心算法解决问题时，每一步的局部最优解一定会导致全局最优解。

5. 分治算法的核心思想是将一个大问题分解成多个相同或相似的子问题进行解决，最后合并得到原问题的解。

6. 分治算法的典型应用之一是归并排序，其时间复杂度为$O(N log N)$。

7. 素数表的埃氏筛法和线性筛法的时间复杂度都是$O(N log log N)$。

8. 贪心算法是一种可以应用于所有问题的通用解决方案。

9. 单链表和双链表都可以在常数时间内实现在链表头部插入或删除节点的操作。

10. 在C语言中，递归的实现方式通常会占用更多的栈空间，可能导致栈溢出。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：成绩排序

=== 题目描述

有$N$名同学，每名同学有语文、数学、英语三科成绩。你需要按如下规则对所有同学的成绩从高到低排序：1. 比较总分，高者靠前；2. 如果总分相同，则比较语文和数学两科总分，高者靠前；3. 如果仍相同，则比较语文和数学两科的最高分，高者靠前；4. 如果仍相同，则二人并列。你需要输出每位同学的排名，如遇$x$人并列，则他们排名相同，并留空后面的$x-1$个名次。例如，有$3$名同学并列第$1$，则后一名同学自动成为第$4$名。

=== 输入格式

第一行一个整数$N$，表示同学的人数。接下来$N$行，每行三个非负整数$c_i, m_i, e_i$分别表示该名同学的语文、数学、英语成绩。保证。

=== 输出格式

输出$N$行，按输入同学的顺序，输出他们的排名。注意：请不要按排名输出同学的序号，而是按同学的顺序输出他们各自的排名

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
6
140 140 150
140 149 140
148 141 140
141 148 140
145 145 139
0 0 0
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
1
3
4
4
2
6
```

=== 数据范围

对于$30$的测试点，保证$N <= 100$，且所有同学的总分各不相同。对于所有测试点，保证$2 <= N <= 10^4$。

=== 提示

在常规程序中，输入、输出时提供提示是好习惯。但在本场考试中，由于系统限定，请不要在输入、输出中附带任何提示信息。

=== 参考程序

```cpp
#include <iostream>
#include <algorithm>
#include <tuple>
using namespace std;
const int MAX_N = 10005;
tuple<int, int, int, int> students[MAX_N];
int main() {
    ios::sync_with_stdio(false);
    int N;
    cin >> N;
    for (int i = 0; i < N; ++i) {
        int c, m, e;
        cin >> c >> m >> e;
        students[i] = make_tuple(c + m + e, c + m, max(c, m), i);
    }
    sort(students, students + N, greater<tuple<int, int, int, int>>());
    int rank[N];
    int curr_rank;
    tuple<int, int, int> last_student = make_tuple(-1, -1, -1);
    for (int i = 0; i < N; ++i) {
        if (make_tuple(get<0>(students[i]), get<1>(students[i]), get<2>
(students[i])) != last_student) {
            last_student = make_tuple(get<0>(students[i]), get<1>(students[i]),
get<2>(students[i]));
            curr_rank = i + 1;
        }
        rank[get<3>(students[i])] = curr_rank;
    }
    for (int i = 0; i < N; ++i) {
        cout << rank[i] << endl;
    }
    return 0;
}
```

== 编程题 2：$B$-smooth 数

=== 题目描述

小杨同学想寻找一种名为$B$-smooth 数的正整数。如果一个正整数的最大质因子不超过$B$，则该正整数为$B$-smooth 数。小杨同学想知道，对于给定的$n$和$B$，有多少个不超过$n$的$B$-smooth 数。

=== 输入格式

第一行包含两个正整数$n,B$，含义如题面所示。

=== 输出格式

输出一个非负整数，表示不超过$n$的$B$-smooth 数的数量。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
10 3
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
7
```

=== 数据范围

子任务编号 数据点占比123对于全部数据，保证有$1 <= n <= 10^6$，$1 <= B <= 10^6$。

=== 提示

在不超过#(math-missing)的正整数中，-smooth 数有，共$7$个。

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
int main() {
    int n, B;
    cin >> n >> B;
    assert(1 <= n && n <= 1e6);
    assert(1 <= B && B <= 1e6);
    vector<bool> vis = vector<bool>(n + 5, false);
    vector<int> mx_prime_factor = vector<int>(n + 5, 0);
    vector<int> prime;
    mx_prime_factor[1] = 1;
    for (int i = 2; i <= n; i ++) {
        if (! vis[i]) {
            mx_prime_factor[i] = i;
            prime.push_back(i);
        }
        for (int p : prime) {
            if (1ll * p * i > n)
                break ;
            vis[i * p] = 1;
            mx_prime_factor[i * p] = max(mx_prime_factor[i * p],
max(mx_prime_factor[i], p));
            if (i % p == 0)
                break ;
        }
    }
    int ans = 0;
    for (int i = 1; i <= n; i ++)
        ans += (mx_prime_factor[i] <= B);
    cout << ans;
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
