// ===========================================================================
// GESP 2023-12 C++ 五级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2023-12/2023-12-L5.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 5,
  month: "2023 年 12 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 下面C++代码用于求斐波那契数列，该数列第1、2项为1，以后各项均是前两项之和。下面有关说法错误的是（#slot）。
  + fiboA（#slot）用递归方式，fiboB（#slot）循环方式
  + fiboA（#slot）更加符合斐波那契数列的数学定义，直观易于理解，而fiboB（#slot）需要将数学定义转换为计算机程序实现
  + fiboA（#slot）不仅仅更加符合数学定义，直观易于理解，且因代码量较少执行效率更高
  + fiboB（#slot）虽然代码量有所增加，但其执行效率更高

2. 下面C++代码以递归方式实现合并排序，并假设merge (int T[], int R[], int s, int m, int t)函数将有序（同样排序规则）的T[s..m]和T[m+1..t]归并到R[s..t]中。横线处应填上代码是（#slot）。

  ```cpp
  mergeSort(SList, T2, s, m,len), mergeSort(SList, T2, m,t,len)
  mergeSort(SList, T2, s, m-1,len), mergeSort(SList, T2, m+1,t,len)
  mergeSort(SList, T2, s, m,len), mergeSort(SList, T2, m+1,t,len)
  mergeSort(SList, T2, s, m-1,len), mergeSort(SList, T2, m-1,t,len)
  ```

3. 阅读下面的C++代码，执行后其输出是（#slot）。

  ```cpp
  1->120<===>1->2->3->4->5->120
  1->120<===>2->3->4->5->6->120
  ```
  + 1-\>120\<===\>2-\>120
  + 1-\>120\<===\>1-\>120

4. 下面的C++用于对lstA排序，使得偶数在前奇数在后，横线处应填入（#slot）。

  ```cpp
  !isEven(lstA[j]) && isEven(lstA[j+1])
  isEven(lstA[j]) && !isEven(lstA[j+1])
  lstA[j] > lstA[j+1]
  lstA[j] < lstA[j+1]
  ```

5. 下面的C++代码用于将字符串保存到带头节点的双向链表中，并对重复的串计数，然后将最新访问的串的节点放在链头便于查找。横线处应填入代码是（#slot）。

  ```cpp
  if(pHead) {p->next = pHead->next, pHead->next->prev = p;}
  if(pHead->next) {p->next = pHead->next, pHead->next->prev = p;}
  p->next = pHead->next, pHead->next->prev = p;
  ```
  + 触发异常，不能对空指针进行操作。

6. 有关下面C++代码说法正确的是（#slot）。
  + 如果x小于10，rc值也不会超过20
  + foo可能无限递归
  + foo可以求出x和y的最大公共质因子
  + foo能够求出x和y的最小公倍数

7. 下面的C++代码实现对list的快速排序，有关说法，错误的是（#slot）。

  ```cpp
  qSort(less) + qSort(greater) +  (vector<int>)pivot
  (vector<int>)pivot + (qSort(less) + qSort(greater))
  (qSort(less) + (vector<int>)pivot + qSort(greater))
  qSort(less) + pivot + qSort(greater)
  ```

8. 下面C++代码中的isPrimeA（#slot）和isPrimeB（#slot）都用于判断参数N是否素数，有关其时间复杂度的正确说法是（#slot）。

  ```cpp
  isPrimeB( )
  isPrimeB( )
  ```
  + isPrimeA（#slot）的最坏时间复杂度是$O(frac(N, 2))$，isPrimeB（#slot）的最坏时间复杂度是$O(log N)$，isPrimeA（#slot）优于isPrimeB（#slot）
  + isPrimeA（#slot）的最坏时间复杂度是$O(frac(N, 2))$，isPrimeB（#slot）的最坏时间复杂度是$O(N^(frac(1, 2)))$，isPrimeB（#slot）绝大多数情况下优于isPrimeA（#slot）
  + isPrimeA（#slot）的最坏时间复杂度是$O(N^(frac(1, 2)))$，isPrimeB（#slot）的最坏时间复杂度是$O(N)$，isPrimeA（#slot）优于
  + isPrimeA（#slot）的最坏时间复杂度是$O(log N)$，isPrimeB（#slot）的最坏时间复杂度是$O(N)$，isPrimeA（#slot）优于

9. 下面C++代码用于有序list的二分查找，有关说法错误的是（#slot）。
  + 代码采用二分法实现有序list的查找
  + 代码采用分治算法实现有序list的查找
  + 代码采用递归方式实现有序list的查找
  + 代码采用动态规划算法实现有序list的查找

10. 在上题的\_binarySearch算法中，如果lst中有N个元素，其时间复杂度是（#slot）。
  + $O(N)$
  + $O(log N)$
  + $O(N log N)$
  + $O(N^2)$

11. 下面的C++代码使用数组模拟整数加法，可以处理超出大整数范围的加法运算。横线处应填入代码是（#slot）。

  ```cpp
  c.push_back(t % 10), t = t % 10;
  c.push_back(t / 10), t = t % 10;
  c.push_back(t / 10), t = t / 10;
  c.push_back(t % 10), t = t / 10;
  ```

12. 有关下面C++代码的说法正确的是（#slot）。
  + 上述代码构成单向链表
  + 上述代码构成双向链表
  + 上述代码构成循环链表
  + 上述代码构成指针链表

13. 通讯卫星在通信网络系统中主要起到（#slot）的作用。
  + 信息过滤
  + 信号中继
  + 避免攻击
  + 数据加密

14. 小杨想编写一个判断任意输入的整数N是否为素数的程序，下面哪个方法不合适？（#slot）
  + 埃氏筛法
  + 线性筛法
  + 二分答案
  + 枚举法

15. 下面的排序算法都要处理多趟数据，哪种排序算法不能保证在下一趟处理时从待处理数据中选出最大或最小的数据？（#slot）
  + 选择排序
  + 快速排序
  + 堆排序
  + 冒泡排序

= 判断题（每题 2 分，共 20 分）

1. 归并排序的时间复杂度是$O(N log N)$。（#slot）

2. 小杨在生日聚会时拿一块H\*W的巧克力招待来的K个小朋友，保证每位小朋友至少能获得一块相同大小的巧克力。那么小杨想分出来最大边长的巧克力可以使用二分法。（#slot）

3. 以下C++代码能以递归方式实现斐波那契数列，该数列第1、2项为1，以后各项均是前两项之和。（#slot）

4. 贪心算法可以达到局部最优，但可能不是全局最优解。（#slot）

5. 小杨设计了一个拆数程序，它能够将任意的非质数自然数N转换成若干个质数的乘积，这个程序是可以设计出来的。（#slot）

6. 插入排序有时比快速排序时间复杂度更低。（#slot）

7. 下面的C++代码能实现十进制正整数N转换为八进制并输出。（#slot）

8. 对数组int arr[] = {2, 6, 3, 5, 4, 8, 1, 0, 9, 10}执行sort(arr, arr+10)，则执行后arr中的数据调整为{0, 1, 2, 3, 4, 5, 6, 8,9, 10}。（#slot）

9. 小杨想写一个程序来算出正整数N有多少个因数，经过思考他写出了一个重复没有超过N/2次的循环就能够算出来了。（#slot）

10. 同样的整数序列分别保存在单链表和双向链中，这两种链表上的简单冒泡排序的复杂度相同。（#slot）

= 编程题（每题 25 分，共 50 分）

== 编程题 1：小杨的幸运数

#limits(time: "1.0 s", memory: "128.0 MB")

=== 题目描述

小杨认为，所有大于等于$a$的完全平方数都是他的超级幸运数。小杨还认为，所有超级幸运数的倍数都是他的幸运数。自然地，小杨的所有超级幸运数也都是幸运数。对于一个非幸运数，小杨规定，可以将它一直$+1$，直到它变成一个幸运数。我们把这个过程叫做幸运化。例如，如果$a=4$，那么$4$是最小的幸运数，而$1$不是，但我们可以连续对$1$做$3$次$+1$操作，使其变为$4$，所以我们可以说，$1$幸运化后的结果是$4$。现在，小样给出$N$个数，请你首先判断它们是不是幸运数；接着，对于非幸运数，请你将它们幸运化。

=== 输入格式

第一行 2 个正整数$a,N$。接下来$N$行，每行一个正整数$x$，表示需要判断（幸运化）的数。

=== 输出格式

输出$N$行，对于每个给定的$x$，如果它是幸运数，请输出lucky，否则请输出将其幸运化后的结果。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
2 4
1
4
5
9
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
4
lucky
8
lucky
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
16 11
1
2
4
8
16
32
64
128
256
512
1024
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
16
16
16
16
lucky
lucky
lucky
lucky
lucky
lucky
lucky
```

=== 数据范围

对于30%的测试点，保证，保证。对于60%的测试点，保证$a, x <= 10^6$。对于所有测试点，保证$a <= 1,000,001$；保证$N <= 2 times 10^5$；保证$1 <= x <= 1,000,001$。

=== 提示

在常规程序中，输入、输出时提供提示是好习惯。但在本场考试中，由于系统限定，请不要在输入、输出中附带任何提示信息。虽然是完全平方数，但它小于$a$，因此它并不是超级幸运数，也不是幸运数。将其进行$3$次$+1$操作后，最终得到幸运数。是幸运数，因此直接输出lucky。不是幸运数，将其进行$3$次$+1$操作后，最终得到幸运数$8$。是幸运数，因此直接输出lucky。

=== 参考程序

```cpp
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
#include <string>
#include <map>
#include <iostream>
#include <cmath>
using namespace std;
const int N = 1001 * 1001;
const double eps = 1e-8;
bool is_lucky[N + 5];
int next_lucky[N + 5];
void init() {
}
int main() {
    int a, T;
    scanf("%d%d", &a, &T);
    for (int i = 1; i <= N; i ++) {
        int t = int(sqrt(i) + eps);
        if (i >= a && t * t == i)
            is_lucky[i] = 1;
        if (! is_lucky[i])
            continue ;
        for (int j = i + i; j <= N; j += i)
            is_lucky[j] = 1;
    }
    for(int i = N; i; i --)
        next_lucky[i] = is_lucky[i] ? i : next_lucky[i + 1];
    while(T --) {
        int x;
        scanf("%d", &x);
        if (is_lucky[x])
            cout << "lucky" << endl;
        else
            cout << next_lucky[x] << endl;
    }
    return 0;
}
```

== 编程题 2：烹饪问题

#limits(time: "1.0 s", memory: "128.0 MB")

=== 题目描述

有$N$种食材，编号从$0$至$N - 1$，其中第$i$种食材的美味度为$a_i$。不同食材之间的组合可能产生奇妙的化学反应。具体来说，如果两种食材的美味度分别为$x$和$y$，那么它们的契合度为$a_i$。其中，and运算为按位与运算，需要先将两个运算数转换为二进制，然后在高位补足$0$，再逐位进行与运算。例如，与$6$的二进制表示分别为1100和0110，将它们逐位进行与运算，得到0100，转换为十进制得到$4$，因此。在 C++ 或 Python 中，可以直接使用&运算符表示与运算。现在，请你找到契合度最高的两种食材，并输出它们的契合度。

=== 输入格式

第一行一个整数$N$，表示食材的种数。接下来一行$N$个用空格隔开的整数，依次为$a_0, dots.h , a_(N-1)$，表示各种食材的美味度。

=== 输出格式

输出一行一个整数，表示最高的契合度。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
1 2 3
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
2
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
5
5 6 2 10 13
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
8
```

=== 数据范围

对于40%的测试点，保证$N <= 1,000$；对于所有测试点，保证$N <= 10^6$，$0 <= a_i <= 2, 147, 483, 647$。

=== 提示

在常规程序中，输入、输出时提供提示是好习惯。但在本场考试中，由于系统限定，请不要在输入、输出中附带任何提示信息。可以编号为$1,2$的食材之间的契合度为2and3=2，是所有食材两两之间最高的契合度。可以编号为$1,2$的食材之间的契合度为2and3=2，是所有食材两两之间最高的契合度。

=== 参考程序

```cpp
#include<cstdio>
#include<iostream>
#include<algorithm>
#include<cstdlib>
#include<cstring>
using namespace std;
const int MAX_N = int(1e6) + 100;
int a[MAX_N];
int sort(int l,int r,int k) {
    while(l <= r) {
        while ((l <= r) && (a[l] >> k & 1)) l++;
        while ((l <= r) && (!(a[r] >> k & 1))) r--;
        if (l <= r) swap(a[l++], a[r--]);
    }
    return r;
}
int main() {
    int n, j, ans=0;
    scanf("%d", &n);
    for (int i = 1; i <= n; i++) scanf("%d", &a[i]);
    for (int i = 31; i >= 0; i--)
        if ((j = sort(1, n, i)) >= 2) {
            ans = ans | 1 << i;
            n = j;
        }
    printf("%d\n", ans);
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
