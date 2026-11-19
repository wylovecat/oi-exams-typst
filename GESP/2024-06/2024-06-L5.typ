// ===========================================================================
// GESP 2024-06 C++ 五级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-06/2024-06-L5.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 5,
  month: "2024 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 下面C++代码用于求斐波那契数列，该数列第1、2项为1，以后各项均是前两项之和。函数fibo（#slot）属于（#slot）。

  ```cpp
  int fibo(int n) {
      if (n <= 0)
          return 0;
      if (n == 1 || n == 2)
          return 1;
      int a = 1  b = 1, next;
      for (int i = 3; i <= n; i++) {
          next = a + b;
          a = b;
          b = next;
      }
      return next;
  }
  ```
  + 枚举算法
  + 贪心算法
  + 迭代算法
  + 递归算法

2. 下面C++代码用于将输入金额换成最少币种组合方案，其实现算法是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  #define N_COINS 7
  int coins[N_COINS] = {100, 50, 20, 10, 5, 2, 1}; //货币面值，单位相同
  int coins_used[N_COINS];
  void find_coins(int money) {
      for (int i = 0; i < N_COINS; i++) {
          coins_used[i] = money / coins[i];
          money = money % coins[i];
      }
      return;
  }
  int main() {
      int money;
      cin >> money;   //输入要换算的金额
      find_coins(money);
      for (int i = 0; i < N_COINS; i++)
          cout << coins_used[i] << endl;
      return 0;
  }
  ```
  + 枚举算法
  + 贪心算法
  + 迭代算法
  + 递归算法

3. 小杨采用如下双链表结构保存他喜欢的歌曲列表：小杨想在头指针为head的双链表中查找他喜欢的某首歌曲，采用如下查询函数，该操作的时间复杂度为（#slot）。

  ```cpp
  struct dl_node {
      string song;
      dl_node* next;
      dl_node* prev;
  };
  dl_node* search(dl_node* head, string my_song) {
      dl_node* temp = head;
      while (temp != nullptr) {
          if (temp->song == my_song)
              return temp;
          temp = temp->next;
      }
      return nullptr;
  }
  ```
  + $O(1)$
  + $O(n)$
  + $O(log n)$
  + $O(n^2)$

4. 小杨想在如上题所述的双向链表中加入一首新歌曲。为了能快速找到该歌曲，他将其作为链表的第一首歌曲，则下面横线上应填入的代码为（#slot）。

  ```cpp
  void insert(dl_node *head, string my_song) {
      p = new dl_node;
      p->song = my_song;
      p->prev = nullptr;
      p->next = head;
      if (head != nullptr) {
          ________________________________  // 在此处填入代码
      }
      head = p;
  }
  head->next->prev = p;
  ```
  + head-\>next = p;
  + head-\>prev = p;
  + 触发异常，不能对空指针进行操作。

5. 下面是根据欧几里得算法编写的函数，它计算的是 与 的（#slot）。

  ```cpp
  int gcd(int a, int b) {
      while (b != 0) {
          int temp = b;
          b = a % b;
          a = temp;
      }
      return a;
  }
  ```
  + 最小公倍数
  + 最大公共质因子
  + 最大公约数
  + 最小公共质因子

6. 欧几里得算法还可以写成如下形式:下面有关说法，错误的是（#slot）。

  ```cpp
  int gcd(int a, int b) {
      return b == 0 ? a : gcd(b, a % b);
  }
  ```
  + 本题的gcd（#slot）实现为递归方式。
  + 本题的gcd（#slot）代码量少，更容易理解其辗转相除的思想。
  + 当$a$较大时，本题的gcd（#slot）实现会多次调用自身，需要较多额外的辅助空间。
  + 当 较大时，相比上题中的gcd（#slot）的实现，本题的gcd（#slot）执行效率更高。

7. 下述代码实现素数表的线性筛法，筛选出所有小于等于 的素数，则横线上应填的代码是（#slot）。

  ```cpp
  vector<int> linear_sieve(int n) {
      vector<bool> is_prime(n + 1, true);
      vector<int> primes;
      is_prime[0] = is_prime[1] = 0; //0和1两个数特殊处理
      for (int i = 2; i <= n; ++i) {
          if (is_prime[i]) {
              primes.push_back(i);
          }
          ________________________________ {    // 在此处填入代码
              is_prime[i * primes[j]] = 0;
              if (i % primes[j] == 0)
                  break;
          }
      }
      return primes;
  }
  for (int j = 0;  j < primes.size() && i * primes[j] <= n;  j++)
  for (int j = 0;  j <= sqrt(n) && i * primes[j] <= n;  j++)
  for (int j = 0;  j <= n;  j++)
  for (int j = 1;  j <= sqrt(n);  j++)
  ```

8. 上题代码的时间复杂度是（#slot）。
  + $O(n^2)$
  + $O(n log n)$
  + $O(n log log n)$
  + $O(n)$

9. 为了正确实现快速排序，下面横线上的代码应为（#slot）。

  ```cpp
  void qsort(vector<int>& arr, int left, int right) {
      int i, j, mid;
      int pivot;
      i = left;
      j = right;
      mid = (left + right) / 2; // 计算中间元素的索引
      pivot = arr[mid]; // 选择中间元素作为基准值
      do {
          while (arr[i] < pivot) i++;
          while (arr[j] > pivot) j--;
          if (i <= j) {
              swap(arr[i], arr[j]); // 交换两个元素
              i++; j--;
          }
      } ________________________________; // 在此处填入代码
      if (left < j) qsort(arr, left, j);   // 对左子数组进行快速排序
      if (i < right) qsort(arr, i, right); // 对右子数组进行快速排序
  }
  ```
  + while (i \<= mid)
  + while (i \< mid)
  + while (i \< j)
  + while (i \<= j)

10. 关于分治算法，以下哪个说法正确？
  + 分治算法将问题分成子问题，然后分别解决子问题，最后合并结果。
  + 归并排序不是分治算法的应用。
  + 分治算法通常用于解决小规模问题。
  + 分治算法的时间复杂度总是优于$O(n log (n))$。

11. 根据下述二分查找法，在排好序的数组1，3，6，9，17，31，39，52，61，79，81，90，96中查找数值82，和82比较的数组元素分别是（#slot）。

  ```cpp
  int binary_search(vector<int>& nums, int target) {
      int left = 0;
      int right = nums.size() - 1;
      while (left <= right) {
          int mid = (left + right) / 2;
          if (nums[mid] == target) {
              return mid;
          } else if (nums[mid] < target) {
              left = mid + 1;
          } else {
              right = mid - 1;
          }
      }
      return -1; // 如果找不到目标元素，返回-1
  }
  ```
  + 52, 61, 81, 90
  + 52, 79, 90, 81
  + 39, 79, 90, 81
  + 39, 79, 90

12. 要实现一个高精度减法函数，则下面代码中加划线应该填写的代码为（#slot）。

  ```cpp
  //假设a和b均为正数，且a表示的数比b大
  vector<int> minus(vector<int> a, vector<int> b) {
      vector<int> c
      int len1 = a.size();
      int len2 = b.size();
      int i, t;
      for (i = 0; i < len2; i++) {
          if (a[i] < b[i]) {  //借位
              _____________   // 在此处填入代码
              a[i] += 10;
          }
          t = a[i] - b[i];
          c.push_back(t);
      }
      for (; i < len1; i++)
          c.push_back(a[i]);
      len3 = c.size();
      while (c[len3 - 1] == 0) {//去除前导0
          c.pop_back();
          len3--;
      }
      return c;
  }
  ```
  + a[i + 1]--;
  + a[i]--;
  + b[i + 1]--;
  + b[i]--;

13. 设 和 是两个长度为 的有序数组，现将 和 合并成一个有序数组，归并排序算法在最坏情况下至少要做（#slot）次比较。
  + $n^2$
  + $n log n$
  + $2n - 1$
  + $n$

14. 给定如下函数：则当$n = 7$时，函数返回值为（#slot）。

  ```cpp
  int fun(int n) {
      if (n == 1) return 1;
      if (n == 2) return 2;
      return fun(n - 2) - fun(n - 1);
  }
  ```
  + 0
  + 1
  + 21
  + -11

15. 给定如下函数（函数功能同上题，增加输出打印）：则当$n = 4$时，屏幕上输出序列为（#slot）。

  ```cpp
  int fun(int n) {
      cout << n << " ";
      if (n == 1) return 1;
      if (n == 2) return 2;
      return fun(n - 2) - fun(n - 1);
  }
  ```
  + 4 3 2 1
  + 1 2 3 4
  + 4 2 3 1 2
  + 4 2 3 2 1

= 判断题（每题 2 分，共 20 分）

1. 如果将双向链表的最后一个结点的下一项指针指向第一个结点，第一个结点的前一项指针指向最后一个结点，则该双向链表构成循环链表。

2. 数组和链表都是线性表，链表的优点是插入删除不需要移动元素，并且能随机查找。

3. 链表的存储空间物理上可以连续，也可以不连续。

4. 找出自然数n以内的所有质数，常用算法有埃拉托斯特尼（埃氏）筛法和线性筛法，其中埃氏筛法效率更高。

5. 唯一分解定理表明任何一个大于1的整数都可以唯一地表示为一系列质数的乘积，即质因数分解是唯一的。

6. 贪心算法通过每一步选择局部最优解来获得全局最优解，但并不一定能找到最优解。

7. 归并排序和快速排序都采用递归实现，也都是不稳定排序。（#slot）

8. 插入排序有时比快速排序时间复杂度更低。

9. 在进行全国人口普查时，将其分解为对每个省市县乡来进行普查和统计。这是典型的分治策略。

10. 在下面C++代码中，由于删除了变量ptr，因此ptr所对应的数据也随之删除，故执行下述代码时，将报错。

  ```cpp
  int* ptr = new int(10);
  cout << *ptr << endl;
  delete ptr;
  cout << ptr << endl;
  ```

= 编程题（每题 25 分，共 50 分）

== 编程题 1：黑白格

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有一个$n$行$m$列的网格图，其中每个格子要么是白色，要么是黑色。小杨想知道至少包含$k$个黑色格子的最小子矩形包含了多少个格子。

=== 输入格式

第一行包含三个正整数$n, m, k$，含义如题面所示。之后$n$行，每行一个长度为$m$的$01$串，代表网格图第$i$行格子的颜色，如果为$0$，则对应格子为白色，否则为黑色。

=== 输出格式

输出一个整数，代表至少包含$k$个黑色格子的最小子矩形包含格子的数量，如果不存在则输出$0$。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4 5 5
00000
01111
00011
00011
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
6
```

=== 数据范围

子任务编号 数据点占比1#(math-missing)20%2#(math-missing)40%3#(math-missing)40%对于全部数据，保证有$1 <= n, m <= 100, 1 <= k <= n times m$。

=== 提示

对于样例1，假设$(i,j)$（#slot） 代表第$i$行第$j$列，至少包含$5$个黑色格子的最小子矩形的四个顶点为 （#slot），（#slot），（#slot），)，共包含$6$个格子。

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
const int N = 110;
int w[N][N];
int sum[N][N];
int n,m;
int main(){
    int k;
    cin>>n>>m>>k;
    for(int i=1;i<=n;i++){
        string s;
        cin>>s;
        for(int j=1;j<=m;j++){
            w[i][j]=s[j-1]-'0';
            sum[i][j]=sum[i][j-1]+w[i][j];
        }
    }
    int ans = 0;
    for(int i=1;i<=m;i++){
        for(int j=i;j<=m;j++){
            vector<int> num;
            int now = 0;
            for(int l=1;l<=n;l++){
                int tmp = sum[l][j]-sum[l][i-1];
                now+=tmp;
                num.push_back(now);
                if(now>=k){
                    if(ans ==0)ans=(j-i+1)*l;
                    else ans=min(ans,(j-i+1)*l);
                    int L=1,R=l;
                    while (L < R){
                        int mid = L + R + 1 >> 1;
                        if (now-num[mid-1]>=k) L = mid;
                        else R = mid - 1;
                    }
                    if(now-num[L-1]>=k){
                        if(ans ==0)ans=(j-i+1)*(l-L);
                        else ans=min(ans,(j-i+1)*(l-L));
                    }
                }
            }
        }
    }
    cout<<ans<<"\n";
}
```

== 编程题 2：小杨的幸运数字

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨认为他的幸运数字应该恰好有两种不同的质因子，例如，$12 = 2 times 2 times 3$的质因子有$2,3$，恰好为两种不同的质因子，因此$12$是幸运数字，而$30 = 2 times 3 times 5$的质因子有$2,3,5$，不符合要求，不为幸运数字。小杨现在有$n$个正整数，他想知道每个正整数是否是他的幸运数字。

=== 输入格式

第一行包含一个正整数$n$，代表正整数个数。之后$n$行，每行一个正整数。

=== 输出格式

输出$n$行，对于每个正整数，如果是幸运数字，输出$1$，否则输出$0$。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
7
12
30
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
0
1
0
```

=== 数据范围

子任务编号 数据点占比#(math-missing)正整数值域1#(math-missing)40%2#(math-missing)60%对于全部数据，保证有$1 <= n <= 10^4$，每个正整数$a_i$满足$2 <= a_i <= 10^6$。

=== 提示

的质因子有$7$，只有一种。的质因子有$2,3$，恰好有两种。，的质因子有$2,3,5$，有三种。，，

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
map<int,int> mp;
const int N = 1e5+10;
int calc(int x) {
    int res = 0;
    set<int> s;
    for (int i = 2; i * i <= x; i++) {
        if (x % i == 0) {
            s.insert(i);
            while (x% i == 0){
                x/= i;
            }
        }
    }
    if (x != 1) {
        s.insert(x);
    }
    return (int)s.size();
}
int a[N];
int main(){
    int n;
    cin>>n;
    long long ans = 0;
    int pre = 0;
    for(int i=1;i<=n;i++){
        cin>>a[i];
        int x = calc(a[i]);
        if(x==2)cout<<"1\n";
        else cout<<"0\n";
    }
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
