// ===========================================================================
// GESP 2026-09 C++ 五级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2026-09/2026-09-L5.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 5,
  month: "2026 年 09 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 小杨用单链表保存任务序列，并同时维护头指针head和尾指针tail。在链表非空且已知tail的情况下，在表尾插入新结点的时间复杂度是（#slot）。

  ```cpp
  struct Node {
      int value;
      Node *next;
  };
  Node *head;
  Node *tail;
  ```
  + $O(1)$
  + $O(log n)$
  + $O(n)$
  + $O(n log n)$

2. 在不带哨兵结点的双向链表中，结点p既不是头结点也不是尾结点。删除p的正确代码是（#slot）。

  ```cpp
  struct Node {
      int value;
      Node *prev;
      Node *next;
  };
  ```
  + ```cpp
    p->prev = p->next;
    p->next = p->prev;
    delete p;
    ```
  + ```cpp
    p->prev->next = p;
    p->next->prev = p;
    delete p;
    ```
  + ```cpp
    p->prev->next = p->next;
    p->next->prev = p->prev;
    delete p;
    ```
  + ```cpp
    p->next = p->prev;
    p->prev->next = nullptr;
    delete p;
    ```

3. 下面函数使用快慢指针查找单链表的中间结点。横线处应填写（#slot）。

  ```cpp
  struct Node {
      int value;
      Node *next;
  };
  Node *middle(Node *head) {
      Node *slow = head;
      Node *fast = head;
      while (fast != nullptr && fast->next != nullptr) {
          slow = slow->next;
          ______________________
      }
      return slow;
  }
  fast = fast->next->next;
  ```
  + fast = fast-\>next;
  + fast = slow-\>next;
  + fast = head-\>next;

4. 函数gcd(int a, int b)定义如下，则gcd(105, 45)的结果是（#slot）。

  ```cpp
  int gcd(int a, int b) {
      return b == 0 ? a : gcd(b, a % b);
  }
  ```
  + 3
  + 5
  + 15
  + 45

5. 下面函数用于判断正整数n是否为质数。横线处的最佳写法是（#slot）。

  ```cpp
  bool isPrime(int n) {
      if (n < 2)
          return false;
      for (int i = 2; __________________; i++) {
          if (n % i == 0)
              return false;
      }
      return true;
  }
  (long long) i * i <= n
  ```
  + i \< n
  + i \<= n / 2
  + i \* i \< n2 / 11

6. 下面代码实现线性筛法。为了保证每个合数只被其最小质因子筛去一次，横线处应填写（#slot）。

  ```cpp
  vector<int> linearSieve(int n) {
      vector<bool> composite(n + 1, false);
      vector<int> primes;
      for (int i = 2; i <= n; i++) {
          if (!composite[i])
              primes.push_back(i);
          for (int p : primes) {
              if ((long long)i * p > n)
                  break;
              composite[i * p] = true;
              if (__________________)
                  break;
          }
      }
      return primes;
  }
  ```
  + p % i == 0
  + i % p == 0
  + i == p
  + i \* p == n

7. 根据唯一分解定理，整数$756$的正确质因数分解是（#slot）。
  + $2^2 times 3^3 times 7$
  + $2^3 times 3^2 times 7$
  + $2^2 times 3^2 times 21$
  + $2 times 3^3 times 14$

8. 函数f(int n)定义如下，则f(4)的结果是（#slot）。

  ```cpp
  int f(int n) {
      if (n == 1)
          return 1;
      return n + f(n - 1);
  }
  ```
  + 4
  + 7
  + 9
  + 10

9. 在升序数组中查找第一个严格大于x的元素位置，下面代码中的横线应填写（#slot）。3 / 11

  ```cpp
  int upperBound(const vector<int> &a, int x) {
      int l = 0, r = (int)a.size();
      while (l < r) {
          int mid = l + (r - l) / 2;
          if (__________________) {
              l = mid + 1;
          } else {
              r = mid;
          }
      }
      return l;
  }
  ```
  + a[mid] \< x
  + a[mid] \>= x
  + a[mid] \<= x
  + a[mid] \> x

10. 小杨需要把若干箱货物按原顺序分配到days天中，每天运输连续的若干箱，求能够完成任务的最小载重量。函数check(cap)判断载重量为cap时能否在规定天数内运完。横线处应填写（#slot）。

  ```cpp
  long long l = maxWeight;
  long long r = totalWeight;
  while (l < r) {
      long long mid = l + (r - l) / 2;
      if (check(mid)) {
          ____________________
      } else {
          ____________________
      }
  }
  cout << l;
  ```
  + l = mid + 1;和r = mid;
  + r = mid;和l = mid + 1;
  + r = mid - 1;和l = mid;
  + l = mid;和r = mid - 1;

11. 下面是归并排序中合并两个有序区间（升序排序）的部分代码。若希望排序保持稳定，横线处应填写（#slot）。

  ```cpp
  while (i <= mid && j <= right) {
      if (__________________) {
          temp.push_back(a[i++]);
      } else {
          temp.push_back(a[j++]);
      }
  }
  ```
  + a[i] \< a[j]
  + a[i] \> a[j]
  + a[i] \>= a[j]
  + a[i] \<= a[j]4 / 11

12. 下面快速排序的划分函数以a[right]为枢轴，并把不大于枢轴的元素移动到左侧。横线处应填写（#slot）。

  ```cpp
  int partition(int a[], int left, int right) {
      int pivot = a[right];
      int i = left - 1;
      for (int j = left; j < right; j++) {
          if (__________________) {
              i++;
              swap(a[i], a[j]);
          }
      }
      swap(a[i + 1], a[right]);
      return i + 1;
  }
  ```
  + a[j] \<= pivot
  + a[j] \> pivot
  + a[i] \<= pivot
  + a[right] \< a[j]

13. 小杨要在一个教室安排尽可能多场活动，每场活动具有开始时间start和结束时间end。采用贪心算法时，正确的选择策略是（#slot）。

  ```cpp
  struct Activity {
      int start;
      int end;
  };
  ```
  + 每次选择开始时间最早的活动
  + 每次选择持续时间最短的活动
  + 每次选择参与人数最少的活动
  + 按结束时间从早到晚排序，依次选择与已选活动不冲突的活动

14. 下面函数使用迭代方法求最大连续子段和。对于数组{-2, 3, -1, 5, -6, 2}，函数返回值是（#slot）。

  ```cpp
  int maxSubArray(const vector<int> &a) {
      int best = a[0];
      int current = a[0];
      for (int i = 1; i < (int)a.size(); i++) {
          current = max(a[i], current + a[i]);
          best = max(best, current);
      }
      return best;
  }
  ```
  + 5
  + 6
  + 7
  + 8

15. 数组a和b按低位在前的顺序保存两个非负大整数。下面代码实现高精度加法，横线处应填写（#slot）。5 / 11

  ```cpp
  vector<int> add(const vector<int> &a, const vector<int> &b) {
      vector<int> c;
      int carry = 0;
      int n = max(a.size(), b.size());
      for (int i = 0; i < n; i++) {
          int sum = carry;
          if (i < a.size())
              sum += a[i];
          if (i < b.size())
              sum += b[i];
          c.push_back(sum % 10);
          ____________________
      }
      if (carry)
          c.push_back(carry);
      return c;
  }
  ```
  + carry = sum % 10;
  + carry = sum;
  + carry = sum / 10;
  + carry = c[i] / 10;

= 判断题（每题 2 分，共 20 分）

1. 下面代码在已知结点p的情况下，能够以$O(1)$的时间在单链表的p结点之后插入新结点s。

  ```cpp
  s->next = p->next;
  p->next = s;
  ```

2. 下面代码可以安全地删除单链表的头结点，并使head指向删除后的新头结点。

  ```cpp
  Node *p = head;
  delete p;
  head = p->next;
  ```

3. 下面欧几里得算法既适用于a \> b，也适用于a \< b，只要a、b是正整数。

  ```cpp
  int gcd(int a, int b) {
      while (b != 0) {
          int r = a % b;
          a = b;
          b = r;
      }
      return a;
  }
  ```

4. 下面埃氏筛从i \* i开始标记，是因为i \* i之前的i的合数倍数已经被更小的质因子标记过。6 / 11

  ```cpp
  for (int i = 2; (long long)i * i <= n; i++) {
      if (isPrime[i]) {
          for (int j = i * i; j <= n; j += i) {
              isPrime[j] = false;
          }
      }
  }
  ```

5. 下面程序的时间复杂度为$O(n)$。

  ```cpp
  for (int i = 1; i <= n; i *= 2) {
      cout << i << endl;
  }
  ```

6. 若数组a已按升序排列，下面函数能够返回最后一个小于等于x的元素下标；如果不存在，则返回-1。

  ```cpp
  int findLastLE(const vector<int> &a, int x) {
      int l = 0, r = (int)a.size() - 1;
      int ans = -1;
      while (l <= r) {
          int mid = l + (r - l) / 2;
          if (a[mid] <= x) {
              ans = mid;
              l = mid + 1;
          } else {
              r = mid - 1;
          }
      }
      return ans;
  }
  ```

7. 快速排序中如果选取区间第一个元素作为枢轴。当输入数组已经升序排列时，其最坏时间复杂度仍为。

8. 归并排序的递推式为$T(n) = 2T(n / 2) + O(n)$，对应的时间复杂度为$O(n log n)$。

9. 下面的贪心代码一定能对任意硬币面值集合coins求出money所需的最少硬币数。

  ```cpp
  int count = 0;
  for (int coin : coins) { // coins 按面值从大到小排列
      count += money / coin;
      money %= coin;
  }
  ```

10. 假设两个非负高精度整数分别存储在数组a和b中，且$a >= b$。数组采用低位在前的方式存储，即a[0]表示个位。下面代码中的c可以正确保存a - b的各位数字。

  ```cpp
  int borrow = 0;
  for (int i = 0; i < len; ++i) {
      int t = a[i] - b[i] + borrow;
      if (t < 0) {
          t += 10;
          borrow = 1;
      } else {
          borrow = 0;
      }
      c[i] = t;
  }
  7 / 11
  ```

= 编程题（每题 25 分，共 50 分）

== 编程题 1：哥德巴赫猜想

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

众所周知，哥德巴赫猜想是说，任何大于$2$的偶数都能写成两个质数（素数）之和。例如：聪明的你肯定想知道，对于大于$2$的偶数$n$，它有多少种写成两个质数之和的方法。例如$4$，$6$和$8$都只有一种方法，$10$有两种方法。请你编写程序计算这个问题的答案。在本题中，我们认为两种方案不同，当且仅当两种分解方案包含的素数互不相同；即$10 = 3 + 7$和$10 = 7 + 3$是同一种方案，不能重复计数。

=== 输入格式

一行，一个大于$2$的偶数$n$。

=== 输出格式

一行，一个整数，表示将$n$写成两个质数之和的方法数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
1
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
10
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
2
```

=== 数据范围

对于$40%$的测试点，保证$4 <= n <= 100$。对于所有测试点，保证$4 <= n <= 10^6$。8 / 11

=== 参考程序

```cpp
#include <cassert>
#include <cstdio>
using namespace std;
int n, ans;
bool not_prime[1000005];
int primes[500000], pcnt = 0;
void get_primes() {
    not_prime[1] = true;
    for (int i = 2; i <= n; ++i) {
        if (!not_prime[i]) {
            primes[pcnt++] = i;
            for (int j = 2; i * j <= n; ++j) {
                not_prime[i * j] = true;
            }
        }
    }
}
int main() {
    scanf("%d", &n);
    get_primes();
    for (int i = 0; i < pcnt && primes[i] <= n / 2; ++i)
        if (!not_prime[n - primes[i]])
            ans++;
    printf("%d\n", ans);
    return 0;
}
```

== 编程题 2：饮品调制

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

你想调制一份甜度恰到好处的饮品给你的朋友们品尝。有$n$种原料可供用于调制饮品。第$i$种原料存量有$v_i$升，每升含有$s_i$克糖分。你可以自由选择原料加入饮品，但每种原料的使用量不得超过其剩余存量。也就是说，假设第$i$种原料选用$k_i$升，应当有$0 <= k_i <= v_i$，$k_i$可以取$0$到之间的任何数字（包括小数）。一份甜度恰到好处的饮品需要保证甜度恰好为$t$。最终你调制得到的饮品甜度将为。为了让更多的朋友喝到饮品，请问最多能调制出多少升甜度恰到好处的饮品？如果无法调制出甜度恰到好处的饮品，则认为答案是$0$。3.2.2 输 格式入第一行，两个整数$n,t$，分别表示原料种类数量，恰到好处的甜度。接下来$n$行，每行两个整数$v_i, s_i$，分别表示第$i$种原料的存量体积，每升含有的糖分质量。

=== 输出格式

一行，一个小数，表示能调制出的甜度恰到好处的饮品最大体积，保留三位小数。9 / 11

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4 2
6 1
5 2
8 5
1 0
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
14.667
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
2 5
3 4
5 3
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
0.000
```

=== 数据范围

对于$40%$的测试点，保证$n=2$。对于所有测试点，保证，，，保证。10 / 11

=== 参考程序

```cpp
#include <cstdio>
#include <algorithm>
using namespace std;
const int N = 2005;
int n, t;
int v[N], s[N], p[N];
double ans;
bool cmp(int x, int y) {
    return s[x] < s[y];
}
int main() {
    scanf("%d%d", &n, &t);
    for (int i = 1; i <= n; i++) {
        scanf("%d%d", &v[i], &s[i]);
        p[i] = i;
    }
    sort(p + 1, p + n + 1, cmp);
    int ss = 0, sv = 0;
    for (int i = 1; i <= n; i++) {
        int cv = v[p[i]], cs = s[p[i]];
        if (ss + cs * cv > t * (sv + cv)) {
            double k = (double)(t * sv - ss) / (cs - t);
            ans = max(ans, sv + k);
            break;
        }
        ss += cs * cv;
        sv += cv;
    }
    if (ss == sv * t) ans = max(ans, (double) sv);
    sv = ss = 0;
    for (int i = n; i >= 1; i--) {
        int cv = v[p[i]], cs = s[p[i]];
        if (ss + cs * cv < t * (sv + cv)) {
            double k = (double)(t * sv - ss) / (cs - t);
            ans = max(ans, sv + k);
            break;
        }
        ss += cs * cv;
        sv += cv;
    }
    if (ss == sv * t) ans = max(ans, (double) sv);
    printf("%.3lf\n", ans);
    return 0;
}11 / 11
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
