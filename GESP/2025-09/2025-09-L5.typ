// ===========================================================================
// GESP 2025-09 C++ 五级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-09/2025-09-L5.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 5,
  month: "2025 年 09 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 以下哪种情况使用链表比数组更合适？
  + 数据量固定且读多写少
  + 需要频繁在中间或开头插入、删除元素
  + 需要高效随机访问元素
  + 存储空间必须连续

2. 函数removeElements删除单链表中所有结点值等于val的结点，并返回新的头结点，其中链表头结点为head，则横线处填写（#slot）。

  ```cpp
  // 结点结构体
  struct Node {
      int val;
      Node* next;
      Node() : val(0), next(nullptr) {}
      Node(int x) : val(x), next(nullptr) {}
      Node(int x, Node *next) : val(x), next(next) {}
  };
  Node* removeElements(Node* head, int val) {
      Node dummy(0, head);        // 哑结点，统一处理头结点
      Node* cur = &dummy;
      while (cur->next) {
          if (cur->next->val == val) {
              _______________________        // 在此填入代码
          }
          else {
              cur = cur->next;
          }
      }
      return dummy.next;
  }
  Node* del = cur;
  cur = del->next;
  delete del;
  Node* del = cur->next;
  cur->next = del;
  delete del;
  ```
  + 数据量固定且读多写少
  + 需要频繁在中间或开头插入、删除元素
  + ```cpp
    Node* del = cur->next;
    cur->next = del->next;
    delete del;
    ```
  + ```cpp
    Node* del = cur->next;
    delete del;
    cur->next = del->next;
    ```

3. 函数hasCycle采用Floyd快慢指针法判断一个单链表中是否存在环，链表的头节点为head，即用两个指针在链表上前进：slow每次走 1 步，fast每次走 2 步，若存在环，fast终会追上slow（相遇）；若无环，fast会先到达 nullptr，则横线上应填写（#slot）。

  ```cpp
  struct Node {
      int val;
      Node *next;
      Node(int x) : val(x), next(nullptr) {}
  };
  bool hasCycle(Node *head) {
      if (!head || !head->next)
          return false;
      Node* slow = head;
      Node* fast = head->next;
      while (fast && fast->next) {
          if (slow == fast) return true;
          _______________________        // 在此填入代码
      }
      return false;
  }
  ```
  + ```cpp
    slow = slow->next;
    fast = fast->next->next;
    ```
  + ```cpp
    slow = fast->next;
    fast = slow->next->next;
    ```
  + ```cpp
    slow = slow->next;
    fast = slow->next->next;
    ```
  + ```cpp
    slow = fast->next;
    fast = fast->next->next;
    ```

4. 函数isPerfectNumber判断一个正整数是否为完全数（该数是否即等于它的真因子之和），则横线上应填写（#slot）。一个正整数n的真因子包括所有小于n的正因子，如28的真因子为1, 2, 4, 7, 14。

  ```cpp
  bool isPerfectNumber(int n) {
      if(n <= 1) return false;
      int sum = 1;
      for(int i = 2; ______; i++) {
          if(n % i == 0) {
              sum += i;
              if(i != n/i) sum += n/i;
          }
      }
      return sum == n;
  }
  ```
  + i \<= n
  + i\*i \<= n
  + i \<= n/2
  + i \< n

5. 以下代码计算两个正整数的最大公约数(GCD)，横线上应填写（#slot）。

  ```cpp
  int gcd0(int a, int b) {
      if (a < b) {
          swap(a, b);
      }
      while(b != 0) {
          int temp = a % b;
          a = b;
          b = temp;
      }
      return ______;
  }
  ```
  + b
  + a
  + temp
  + a \* b

6. 函数sieve实现埃拉托斯特尼筛法(埃氏筛)，横线处应填入（#slot）。

  ```cpp
  vector<bool> sieve(int n) {
      vector<bool> is_prime(n+1, true);
      is_prime[0] = is_prime[1] = false;
      for(int i = 2; i <= n; i++) {
          if(is_prime[i]) {
              for(int j = ______; j <= n; j += i) {
                  is_prime[j] = false;
              }
          }
      }
      return is_prime;
  }
  ```
  + i
  + i+1
  + i\*2
  + i\*i

7. 函数linearSieve实现线性筛法(欧拉筛)，横线处应填入（#slot）。

  ```cpp
  vector<int> linearSieve(int n) {
      vector<bool> is_prime(n+1, true);
      vector<int> primes;
      for(int i = 2; i <= n; i++) {
          if(is_prime[i]) primes.push_back(i);
          for(int p : primes) {
              if(p * i > n) break;
              is_prime[p * i] = false;
              if(________) break;
          }
      }
      return primes;
  }
  ```
  + i % p == 0
  + p % i == 0
  + i == p
  + i \* p == n

8. 关于#(math-missing)埃氏筛#(math-missing)和#(math-missing)线性筛#(math-missing)的比较，下列说法错误的是（#slot）。
  + 埃氏筛可能会对同一个合数进行多次标记
  + 线性筛的理论时间复杂度更优，所以线性筛的速度往往优于埃氏筛
  + 线性筛保证每个合数只被其最小质因子筛到一次
  + 对于常见范围（#slot），埃氏筛因实现简单，常数较小，其速度往往优于线性筛

9. 唯一分解定理描述的是（#slot）。
  + 每个整数都能表示为任意素数的乘积
  + 每个大于 1 的整数能唯一分解为素数幂乘积（忽略顺序）
  + 合数不能分解为素数乘积
  + 素数只有两个因子：1 和自身

10. 给定一个n x n的矩阵matrix，矩阵的每一行和每一列都按升序排列。函数countLE返回矩阵中第k小的元素，则两处横线上应分别填写（#slot）。

  ```cpp
  // 统计矩阵中 <= x 的元素个数：从左下角开始
  int countLE(const vector<vector<int>>& matrix, int x) {
      int n = (int)matrix.size();
      int i = n - 1, j = 0, cnt = 0;
      while (i >= 0 && j < n) {
          if (matrix[i][j] <= x) {
              cnt += i + 1;
              ++j;
          }
          else {
              --i;
          }
      }
      return cnt;
  }
  int kthSmallest(vector<vector<int>>& matrix, int k) {
      int n = (int)matrix.size();
      int lo = matrix[0][0];
      int hi = matrix[n - 1][n - 1];
      while (lo < hi) {
          int mid = lo + (hi - lo) / 2;
          if (countLE(matrix, mid) >= k) {
              ________________    // 在此处填入代码
          } else {
              ________________    // 在此处填入代码
          }
      }
      return lo;
  }
  hi = mid - 1;
  lo = mid + 1;
  hi = mid;
  lo = mid;
  hi = mid;
  lo = mid + 1;
  hi = mid + 1;
  lo = mid;
  ```
  + 快速排序之所以叫“快速”，是因为它在平均情况下运行速度较快，常数小、就地排序，实践中通常比归并排序更高效。
  + 在平均情况下，划分的递归层数为 $log n$ ，每层中的总循环数为 n，总时间为 $O(n log n)$
  + 在最差情况下，每轮划分操作都将长度为 $n$ 的数组划分为长度为 0 和 $n - 1$ 的两个子数组，此时递归层数
  + 划分函数 partition 中“从右往左查找”与“从左往右查找”的顺序可以交换。

11. 下述C++代码实现了快速排序算法，下面说法错误的是（#slot）。

  ```cpp
  int partition(vector<int>& arr, int low, int high) {
      int i = low, j = high;
      int pivot = arr[low];                 // 以首元素为基准
      while (i < j) {
          while (i < j && arr[j] >= pivot) j--;   //从右往左查找
          while (i < j && arr[i] <= pivot) i++;   //从左往右查找
          if (i < j) swap(arr[i], arr[j]);
      }
      swap(arr[i], arr[low]);
      return i;
  }
  void quickSort(vector<int>& arr, int low, int high) {
      if (low >= high) return;
      int p = partition(arr, low, high);
      quickSort(arr, low, p - 1);
      quickSort(arr, p + 1, high);
  }
  ```
  + 快速排序之所以叫“快速”，是因为它在平均情况下运行速度较快，常数小、就地排序，实践中通常比归并排序更高效。
  + 在平均情况下，划分的递归层数为$log n$，每层中的总循环数为$n$，总时间为$O(n log n)$。
  + 在最差情况下，每轮划分操作都将长度为$n$的数组划分为长度为 0 和$n - 1$的两个子数组，此时递归层数达到，每层中的循环数为$n$，总时间为$O(n^2)$。
  + 划分函数partition中“从右往左查找”与“从左往右查找”的顺序可以交换。

12. 下述C++代码实现了归并排序算法，则横线上应填写（#slot）。

  ```cpp
  void merge(vector<int> &nums, int left, int mid, int right) {
      // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
      vector<int> tmp(right - left + 1);
      int i = left, j = mid + 1, k = 0;
      while (i <= mid && j <= right) {
          if (nums[i] <= nums[j])
              tmp[k++] = nums[i++];
          else
              tmp[k++] = nums[j++];
      }
      while (i <= mid) {
          tmp[k++] = nums[i++];
      }
      while (________) {    // 在此处填入代码
          tmp[k++] = nums[j++];
      }
      for (k = 0; k < tmp.size(); k++) {
          nums[left + k] = tmp[k];
      }
  }
  void mergeSort(vector<int> &nums, int left, int right) {
      if (left >= right)
          return;
      int mid = (left + right) / 2;
      mergeSort(nums, left, mid);
      mergeSort(nums, mid + 1, right);
      merge(nums, left, mid, right);
  }
  ```
  + i \< mid
  + j \< right
  + i \<= mid
  + j \<= right

13. 假设你是一家电影院的排片经理，只有一个放映厅。你有一个电影列表movies，其中movies[i] = [start\_i, end\_i]表示第i部电影的开始和结束时间。请你找出最多能安排多少部不重叠的电影，则横线上应分别填写的代码为（#slot）。

  ```cpp
  int maxMovies(vector<vector<int>>& movies) {
      if (movies.empty()) return 0;
      sort(movies.begin(), movies.end(), [](const vector<int>& a, const vector<int>& b) {
          return ______; // 在此处填入代码
      });
      int count = 1;
      int lastEnd = movies[0][1];
      for (int i = 1; i < movies.size(); i++) {
          if (movies[i][0] >= lastEnd) {
              count++;
              ______ = movies[i][1]; // 在此处填入代码
          }
      }
      return count;
  }
  ```
  + a[0] \< b[0]和lastEnd
  + a[1] \< b[1]和lastEnd
  + a[0] \< b[0]和movies[i][0]
  + a[1] \< b[1]和movies[i][0]

14. 给定一个整数数组nums，下面代码找到一个具有最大和的连续子数组，并返回该最大和。则下面说法错误的是（#slot）。

  ```cpp
  int crossSum(vector<int>& nums, int left, int mid, int right) {
      int leftSum = INT_MIN, rightSum = INT_MIN;
      int sum = 0;
      for (int i = mid; i >= left; i--) {
          sum += nums[i];
          leftSum = max(leftSum, sum);
      }
      sum = 0;
      for (int i = mid + 1; i <= right; i++) {
          sum += nums[i];
          rightSum = max(rightSum, sum);
      }
      return leftSum + rightSum;
  }
  int helper(vector<int>& nums, int left, int right) {
      if (left == right)
          return nums[left];
      int mid = left + (right - left) / 2;
      int leftMax = helper(nums, left, mid);
      int rightMax = helper(nums, mid + 1, right);
      int crossMax = crossSum(nums, left, mid, right);
      return max({leftMax, rightMax, crossMax});
  }
  int maxSubArray(vector<int>& nums) {
      return helper(nums, 0, nums.size() - 1);
  }
  ```
  + 上述代码采用分治算法实现
  + 上述代码采用贪心算法
  + 上述代码时间复杂度为
  + 上述代码采用递归方式实现

15. 给定一个由非负整数组成的数组digits，表示一个非负整数的各位数字，其中最高位在数组首位，且digits不含前导0（除非是0本身）。下面代码对该整数执行 +1 操作，并返回结果数组，则横线上应填写（#slot）。

  ```cpp
  vector<int> plusOne(vector<int>& digits) {
      for (int i = (int)digits.size() - 1; i >= 0; --i) {
          if (digits[i] < 9) {
              digits[i] += 1;
              return digits;
          }
          ________________    // 在此处填入代码
      }
      digits.insert(digits.begin(), 1);
      return digits;
  }
  digits[i] = 10;
  ```
  + ```cpp
    digits[i] = 0;
    ```
  + ```cpp
    digits[i] = 9;
    ```
  + ```cpp
    digits[i] = 1;
    ```
  + 第1题基于下面定义的函数，通过判断isDivisibleBy9(n) == isDigitSumDivisibleBy9

= 判断题（每题 2 分，共 20 分）

1. 基于下面定义的函数，通过判断isDivisibleBy9(n) == isDigitSumDivisibleBy9(n)代码可验算如果一个数能被9整除，则它的各位数字之和能被9整除。

  ```cpp
  bool isDivisibleBy9(int n) {
      return n % 9 == 0;
  }
  bool isDigitSumDivisibleBy9(int n) {
      int sum = 0;
      string numStr = to_string(n);
      for (char c : numStr) {
          sum += (c - '0');
      }
      return sum % 9 == 0;
  }
  ```

2. 假设函数gcd（#slot）能正确求两个正整数的最大公约数，则下面的findMusicalPattern(4，6)函数返回2。

  ```cpp
  void findMusicalPattern(int rhythm1, int rhythm2) {
      int commonDivisor = gcd(rhythm1, rhythm2);
      int patternLength = (rhythm1 * rhythm2) / commonDivisor;
      return patternLength
  }
  ```

3. 下面递归实现的斐波那契数列的时间复杂度为$O(2^n)$。

  ```cpp
  long long fib_memo(int n, long long memo[]) {
      if (n <= 1) return n;
      if (memo[n] != -1) return memo[n];
      memo[n] = fib_memo(n - 1, memo) + fib_memo(n - 2, memo);
      return memo[n];
  }
  int main() {
      int n = 40;
      long long memo[100];
      fill_n(memo, 100, -1);
      long long result2 = fib_memo(n, memo);
      return 0;
  }
  ```

4. 链表通过更改指针实现高效的结点插入与删除，但结点访问效率低、占用内存较多，且对缓存利用不友好。

5. 二分查找依赖数据的有序性，通过循环逐步缩减一半搜索区间来进行查找，且仅适用于数组或基于数组实现的数据结构。

6. 线性筛关键是“每个合数只会被最小质因子筛到一次”，因此为$O(n)$。

7. 快速排序和归并排序都是稳定的排序算法。

8. 下面代码采用分治算法求解标准 3 柱汉诺塔问题，时间复杂度为$O(n log n)$。

  ```cpp
  void move(vector<int> &src, vector<int> &tar) {
      int pan = src.back();
      src.pop_back();
      tar.push_back(pan);
  }
  void dfs(int n, vector<int> &src, vector<int> &buf, vector<int> &tar) {
      if (n == 1) {
          move(src, tar);
          return;
      }
      dfs(n - 1, src, tar, buf);
      move(src, tar);
      dfs(n - 1, buf, src, tar);
  }
  void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
      int n = A.size();
      dfs(n, A, B, C);
  }
  ```

9. 所有递归算法都可以转换为迭代算法。

10. 贪心算法总能得到全局最优解。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：数字选取

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

给定正整数$n$，现在有$1,2,dots.h ,n$共计$n$个整数。你需要从这$n$个整数中选取一些整数，使得所选取的整数中任意两个不同的整数均互质（也就是说，这两个整数的最大公因数为$1$）。请你最大化所选取整数的数量。例如，当$n = 9$时，可以选择$1,5,7,8,9$共计$5$个整数。可以验证不存在数量更多的选取整数的方案。

=== 输入格式

一行，一个正整数$n$，表示给定的正整数。

=== 输出格式

一行，一个正整数，表示所选取整数的最大数量。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
6
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
4
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
9
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
5
```

=== 数据范围

对于 % 的测试点，保证。对于所有测试点，保证$1 <= n <= 10^5$。

=== 参考程序

```cpp
#include <algorithm>
#include <cstdio>
using namespace std;
const int N = 1e5 + 5;
int n, p[N], cnt;
bool np[N];
int main() {
    scanf("%d", &n);
    for (int i = 2; i <= n; i++) {
        if (!np[i]) p[++cnt] = i;
        for (int j = 1; j <= cnt && i * p[j] <= n; j++) {
            np[i * p[j]] = 1;
            if (i % p[j] == 0) break;
        }
    }
    printf("%d\n", 1 + cnt);
    return 0;
}
```

== 编程题 2：有趣的数字和

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

如果一个正整数的二进制表示包含奇数个$1$，那么小 A 就会认为这个正整数是有趣的。例如，$7$的二进制表示为$(111)_2$，包含$1$的个数为$3$个，所以$7$是有趣的。但是$9 = (1001)_2$包含$2$个$1$，所以$9$不是有趣的。给定正整数$l, r$，请你统计满足$l <= n <= r$的有趣的整数$n$之和。

=== 输入格式

一行，两个正整数$l,r$，表示给定的正整数。

=== 输出格式

一行，一个正整数，表示$l, r$之间有趣的整数之和。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3 8
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
19
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
65 36248
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
328505490
```

=== 数据范围

对于$40$% 的测试点，保证$1 <= l <= r <= 10^4$。对于另外$30$% 的测试点，保证$l=1$并且$r = 2^k - 1$，其中$k$是大于$1$的正整数。对于所有测试点，保证$1 <= l <= r <= 10^9$。

=== 提示

由于本题的数据范围较大，整数类型请使用long long。

=== 参考程序

```cpp
#include <algorithm>
#include <cstdio>
using namespace std;
int l, r;
long long ans;
pair<int, long long> cal2(int n, int p) {
    if (n == 0) { return {1 - p, 0}; }
    if (n == 1) { return {1, p}; }
    return {(n + 1) / 2, 1ll * n * (n + 1) / 4};
}
pair<int, long long> cal(int n, int p) {
    if (n <= 1) { return cal2(n, p); }
    long long x = 1ll << (31 - __builtin_clz(n));
    auto l = cal2(x - 1, p);
    auto r = cal(n - x, 1 - p);
    return {l.first + r.first, l.second + r.second + x * r.first};
}
int main() {
    scanf("%d%d", &l, &r);
    ans -= cal(l - 1, 1).second;
    ans += cal(r, 1).second;
    printf("%lld\n", ans);
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
