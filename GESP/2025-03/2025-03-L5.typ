// ===========================================================================
// GESP 2025-03 C++ 五级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-03/2025-03-L5.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 5,
  month: "2025 年 03 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 链表不具备的特点是（#slot）。
  + 可随机访问任何一个元素
  + 插入、删除操作不需要移动元素
  + 无需事先估计存储空间大小
  + 所需存储空间与存储元素个数成正比

2. 双向链表中每个结点有两个指针域prev和next，分别指向该结点的前驱及后继结点。设p指向链表中的一个结点，它的前驱结点和后继结点均非空。要删除结点p，则下述语句中错误的是（#slot）。

  ```cpp
  p->next->prev = p->next;
  p->prev->next = p->prev;
  delete p;
  p->prev->next = p->next;
  p->next->prev = p->prev;
  delete p;
  p->next->prev = p->prev;
  p->next->prev->next = p->next;
  delete p;
  p->prev->next = p->next;
  p->prev->next->prev = p->prev;
  delete p;
  ```
  + 可随机访问任何一个元素
  + 插入、删除操作不需要移动元素
  + 无需事先估计存储空间大小
  + 所需存储空间与存储元素个数成正比

3. 假设双向循环链表包含头尾哨兵结点(不存储实际内容)，分别为head和tail，链表中每个结点有两个指针域prev和next，分别指向该结点的前驱及后继结点。下面代码实现了一个空的双向循环链表，横线上应填的最佳代码是（#slot）。

  ```cpp
  // 链表结点
  template <typename T>
  struct ListNode {
      T data;
      ListNode* prev;
      ListNode* next;
      // 构造函数
      explicit ListNode(const T& val = T())
          : data(val), prev(nullptr), next(nullptr) {}
  };
  struct LinkedList {
      ListNode<T>* head;
      ListNode<T>* tail;
  };
  void InitLinkedList(LinkedList* list) {
      list->head = new ListNode<T>;
      list->tail = new ListNode<T>;
      ________________________________    // 在此处填入代码
  };
  ```
  + ```cpp
    list->head->prev = list->head;
    list->tail->prev = list->head;
    ```
  + ```cpp
    list->head->next = list->tail;
    list->tail->prev = list->head;
    ```
  + ```cpp
    list->head->next = list->tail;
    list->tail->next = list->head;
    ```
  + ```cpp
    list->head->next = list->tail;
    list->tail->next = nullptr;
    ```

4. 用以下辗转相除法（欧几里得算法）求gcd(84, 60)的步骤中，第二步计算的数是（#slot）。

  ```cpp
  int gcd(int a, int b) {
      int big = a > b ? a : b;
      int small = a < b ? a : b;
      if (big % small == 0) {
          return small;
      }
      return gcd(small, big % small);
  }
  ```
  + 84和60
  + 60和24
  + 24和12
  + 12和0

5. 根据唯一分解定理，下面整数的唯一分解是正确的（#slot）。
  + 18 = 3 × 6
  + 28 = 4 × 7
  + 36 = 2 × 3 × 6
  + 30 = 2 × 3 × 5

6. 下述代码实现素数表的线性筛法，筛选出所有小于等于 的素数，横线上应填的最佳代码是（#slot）。

  ```cpp
  vector<int> sieve_linear(int n) {
      vector<bool> is_prime(n +1, true);
      vector<int> primes;
      if (n < 2) return primes;
      is_prime[0] = is_prime[1] = false;
      for (int i = 2; i <= n/2; i++) {
          if (is_prime[i])
              primes.push_back(i);
          for (int j = 0; ________________________________ ; j++) {   // 在此处填入代码
              is_prime[ i * primes[j] ] = false;
              if (i % primes[j] == 0)
                  break;
          }
      }
      for (int i = n/2 +1; i <= n; i++) {
          if (is_prime[i])
              primes.push_back(i);
      }
      return primes;
  }
  j < primes.size() && i * primes[j] <= n
  ```
  + j \< primes.size（#slot）
  + i \* primes[j] \<= n
  + j \<= n

7. 在程序运行过程中，如果递归调用的层数过多，会因为（#slot）引发错误。
  + 系统分配的栈空间溢出
  + 系统分配的堆空间溢出
  + 系统分配的队列空间溢出
  + 系统分配的链表空间溢出

8. 对下面两个函数，说法错误的是（#slot）。

  ```cpp
  int factorialA(int n) {
      if (n <= 1) return 1;
      return n * factorialA(n-1);
  }
  int factorialB(int n) {
      if (n <= 1) return 1;
      int res = 1;
      for(int i=2; i<=n; i++)
          res   *= i;
  }
  ```
  + 两个函数的实现的功能相同。
  + 两个函数的时间复杂度均为$O(n)$。
  + factorialA采用递归方式。
  + factorialB采用递归方式。

9. 下算法中，（#slot）是不稳定的排序。
  + 选择排序
  + 插入排序
  + 归并排序
  + 冒泡排序

10. 考虑以下C++代码实现的快速排序算法，将数据从小到大排序，则横线上应填的最佳代码是（#slot）。

  ```cpp
  int partition(vector<int>& arr, int low, int high) {
      int pivot = arr[high]; // 基准值
      int i = low - 1;
      for (int j = low; j < high; j++) {
          ________________________________       // 在此处填入代码
      }
      swap(arr[i + 1], arr[high]);
      return i + 1;
  }
  // 快速排序
  void quickSort(vector<int>& arr, int low, int high) {
      if (low < high) {
          int pi = partition(arr, low, high);
          quickSort(arr, low, pi - 1);
          quickSort(arr, pi + 1, high);
      }
  }
  if (arr[j] < pivot) {
      swap(arr[i], arr[j]);
      i++;
  }
  ```
  + ```cpp
    if (arr[j] > pivot) {
        i++;
        swap(arr[i], arr[j]);
    }
    ```
  + ```cpp
    if (arr[j] < pivot) {
        i++;
        swap(arr[i], arr[j]);
    }
    ```
  + 第11题 若用二分法在[1, 100]内猜数，最多需要猜（#slot）次。
  + ```cpp
    if (arr[j] == pivot) {
        i++;
        swap(arr[i], arr[j]);
    }
    ```

11. 若用二分法在[1, 100]内猜数，最多需要猜（#slot）次。
  + 100
  + 10
  + 7
  + 5

12. 下面代码实现了二分查找算法，在数组arr找到目标元素target的位置，则横线上能填写的最佳代码是（#slot）。

  ```cpp
  int binarySearch(int arr[], int left, int right, int target) {
      while (left <= right) {
          ________________________________       // 在此处填入代码
          if (arr[mid] == target)
              return mid;
          else if (arr[mid] < target)
              left = mid + 1;
          else
              right = mid - 1;
      }
      return -1;
  }
  int mid = left + (right - left) / 2;
  int mid = (left + right) / 2;
  ```
  + int mid = left;
  + int mid = right;

13. 贪心算法的核心特征是（#slot）。
  + 总是选择当前最优解
  + 回溯尝试所有可能
  + 分阶段解决子问题
  + 总能找到最优解

14. 函数int findMax(int arr[], int low, int high)计算数组中最大元素，其中数组arr从索引low到high，（#slot）正确实现了分治逻辑。

  ```cpp
  if (low == high)
      return arr[low];
  int mid = (low + high) / 2;
  return arr[mid];
  if (low >= high)
      return arr[low];
  int mid = (low + high) / 2;
  int leftMax = findMax(arr, low, mid - 1);
  int rightMax = findMax(arr, mid, high);
  return leftMax + rightMax;
  if (low > high)
      return 0;
  int mid = low + (high - low) / 2;
  int leftMax = findMax(arr, low, mid);
  int rightMax = findMax(arr, mid + 1, high);
  return leftMax * rightMax;
  ```
  + int mid = left + (right - left) / 2;
  + int mid = left;
  + int mid = (left + right) / 2;
  + ```cpp
    if (low == high)
        return arr[low];
    int mid = low + (high - low) / 2;
    int leftMax = findMax(arr, low, mid);
    int rightMax = findMax(arr, mid + 1, high);
    return (leftMax > rightMax) ? leftMax : rightMax;
    ```

15. 小杨编写了一个如下的高精度乘法函数，则横线上应填写的代码为（#slot）。

  ```cpp
  vector<int> multiply(vector<int>& a, vector<int>& b) {
      int m = a.size(), n = b.size();
      vector<int> c(m + n, 0);
      // 逐位相乘，逆序存储
      for (int i = 0; i < m; i++) {
          for (int j = 0; j < n; j++) {
              c[i + j] += a[i] * b[j];
          }
      }
      // 处理进位
      int carry = 0;
      for (int k = 0; k < c.size(); ++k) {
          ________________________________     // 在此处填入代码
          c[k] = temp % 10;
          carry = temp / 10;
      }
      while (c.size() > 1 && c.back() == 0)
          c.pop_back();
      return c;
  }
  int temp = c[k] + carry;
  int temp = c[k] - carry;
  int temp = c[k] * carry;
  ```
  + int temp = c[k];

= 判断题（每题 2 分，共 20 分）

1. 要删除单链表中某个结点`p`(非尾结点)，但不知道头结点，可行的操作是将`p->next`的数据拷贝到`p`的数据部分，将`p->next`设置为`p->next->next`，然后删除`p->next`。

2. 链表存储线性表时要求内存中可用存储单元地址是连续的。

3. 线性筛相对于埃拉托斯特尼筛法，每个合数只会被它的最小质因数筛去一次，因此效率更高。

4. 贪心算法通过每一步选择当前最优解，从而一定能获得全局最优解。

5. 递归函数必须具有一个终止条件，以防止无限递归。

6. 快速排序算法的时间复杂度与输入是否有序无关，始终稳定为$O(n log n)$。

7. 归并排序算法的时间复杂度与输入是否有序无关，始终稳定为$O(n log n)$。

8. 二分查找适用于对无序数组和有序数组的查找。

9. 小杨有100元去超市买东西，每个商品有各自的价格，每种商品只能买1个，小杨的目标是买到最多数量的商品。小杨采用的策略是每次挑价格最低的商品买，这体现了分治思想。

10. 归并排序算法体现了分治算法，每次将大的待排序数组分成大小大致相等的两个小数组，然后分别对两个小数组进行排序，最后对排好序的两个小数组合并成有序数组。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：平均分配

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 有$2n$件物品，小 B 和小 C 想从小 A 手上买走这些物品。对于第$i$件物品，小 B 会以$b_i$的价格购买，而小 C 会以$c_i$的价格购买。为了平均分配这$2n$件物品，小 A 决定小 B 和小 C 各自只能买走恰好$n$件物品。你能帮小 A 求出他卖出这$2n$件物品所能获得的最大收入吗？

=== 输入格式

第一行，一个正整数$n$。第二行，$2n$个整数$b_1, b_2, dots.h , b_(2n)$。第三行，$2n$个整数$c_1, c_2, dots.h , c_(2n)$。

=== 输出格式

一行，一个整数，表示答案。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
1 3 5 6 8 10
2 4 6 7 9 11
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
36
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
2
6 7 9 9
1 2 10 12
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
35
```

=== 数据范围

对于$20$% 的测试点，保证$1 <= n <= 8$。对于另外 % 的测试点，保证，$0 <= c_i <= 10^9$。对于所有测试点，保证$1 <= n <= 10^5$，$0 <= b_i <= 10^9$，$0 <= c_i <= 10^9$。

=== 参考程序

```cpp
#include <bits/stdc++.h>
using namespace std;
const int N = 2e5 + 5;
int n;
long long b[N], c[N], d[N];
long long ans;
int main() {
    scanf("%d", &n);
    assert(1 <= n && n <= 1e5);
    for (int i = 1; i <= 2 * n; i++)
        scanf("%lld", &b[i]), assert(0 <= b[i] && b[i] <= 1e9);
    for (int i = 1; i <= 2 * n; i++)
        scanf("%lld", &c[i]), assert(0 <= c[i] && c[i] <= 1e9);
    for (int i = 1; i <= 2 * n; i++) {
        ans += b[i];
        d[i] = c[i] - b[i];
    }
    sort(d + 1, d + 2 * n + 1);
    for (int i = n + 1; i <= 2 * n; i++)
        ans += d[i];
    printf("%lld\n", ans);
    return 0;
}
```

== 编程题 2：原根判断

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 知道，对于质数$p$而言，$p$的原根$g$是满足以下条件的正整数：；；对于任意$1 <= i < p - 1$均有$g^i mod p != 1$。其中$a mod p$表示$a$除以$p$的余数。小 A 现在有一个整数$a$，请你帮他判断$a$是不是$p$的原根。

=== 输入格式

第一行，一个正整数$T$，表示测试数据组数。每组测试数据包含一行，两个正整数$a,p$。

=== 输出格式

对于每组测试数据，输出一行，如果$a$是$p$的原根则输出Yes，否则输出No。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
3 998244353
5 998244353
7 998244353
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
Yes
Yes
No
```

=== 数据范围

对于$40$% 的测试点，保证$3 <= p <= 10^3$。对于所有测试点，保证$1 <= T <= 20$，$3 <= p <= 10^9$，$1 < a < p$，$p$为质数。

=== 参考程序

```cpp
#include <cstdio>
using namespace std;
int a, p;
int ans;
int fpw(int b, int e) {
    if (e == 0)
        return 1;
    int r = fpw(b, e >> 1);
    r = 1ll * r * r % p;
    if (e & 1)
        r = 1ll * r * b % p;
    return r;
}
void check(int e) {
    if (fpw(a, e) == 1)
        ans = 0;
}
int main() {
    int T;
    scanf("%d", &T);
    while (T--) {
        scanf("%d%d", &a, &p);
        ans = 1;
        int phi = p - 1, r = phi;
        for (int i = 2; i * i <= phi; i++)
            if (phi % i == 0) {
                check(phi / i);
                while (r % i == 0)
                    r /= i;
            }
        if (r > 1)
            check(phi / r);
        printf(ans ? "Yes\n" : "No\n");
    }
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
