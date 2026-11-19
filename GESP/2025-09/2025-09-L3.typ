// ===========================================================================
// GESP 2025-09 C++ 三级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-09/2025-09-L3.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 3,
  month: "2025 年 09 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 执行以下C++代码后，c的数值是（#slot）。

  ```cpp
  int a = 10, b = 3;
  double c = a / b;
  ```
  + 3.33333
  + 3.333
  + 3.0
  + 3.3

2. 下列C++表达式的结果为true的是（#slot）。

  ```cpp
  (5 <= 5) && (7 < 5)
  (10 != 10) || (5 >= 3)
  (5 == 3) && (4 > 2)
  ```
  + !(10 \> 5)

3. 以下关于C++数组的说法，错误的是（#slot）。
  + 数组的下标通常从0开始。
  + int arr[5];声明了一个包含5个整数的数组。
  + 数组的大小必须在编译时确定，不能使用变量定义大小。
  + 可以通过arr[5]来访问int arr[5];数组的最后一个元素。

4. 执行以下C++代码后，变量sum的值是（#slot）。

  ```cpp
  int sum = 0;
  for (int i = 1; i <= 5; i += 2) {
      sum += i;
      int sum=0;
  }
  ```
  + 6
  + 9
  + 15
  + 死循环

5. 要正确定义一个返回两个整数中较大值的函数max，应该使用（#slot）。

  ```cpp
  void max(int a, int b) { return a > b ? a : b; }
  int max(int a, int b) { if (a > b) return a; else return b; }
  int max(a, b) { if (a > b) return a; else return b; }
  void max(a, b) { cout << (a > b ? a : b); }
  ```

6. 执行以下C++代码后，数组arr的内容是（#slot）。

  ```cpp
  int arr[4] = {1, 2, 3};
  arr[3] = arr[0] + arr[2];
  ```
  + {1, 2, 3, 3}
  + {1, 2, 3, 4}
  + {1, 2, 3, 5}
  + {1, 2, 3, 6}

7. 以下关于C++函数的描述，正确的是（#slot）。
  + 函数必须要有参数。
  + 函数通过return语句只能返回一个值。但是可以通过很多间接的方式返回多个值。
  + main函数可以被其他函数调用。
  + 函数的定义可以直接嵌套，即一个函数内部可以真正定义另一个函数。

8. 以下C++代码count++执行的次数是（#slot）。

  ```cpp
  int i = 10;
  int count=0;
  while (i > 0) {
      i -= 3;
      continue;
      count++;
  }
  ```
  + 2
  + 3
  + 4
  + 0

9. 以下C++代码段的输出是（#slot）。

  ```cpp
  for (int i = 0; i < 4; i++) {
      for (int j = 0; j <= i; j++) {
          cout << j;
      }
      cout << "#";
  }
  ```
  + 0\#01\#012\#0123\#
  + 1\#12\#123\#1234\#
  + 0\#1\#2\#3\#
  + 0\#01\#012\#01243\#

10. 以下关于C++变量作用域的说法，错误的是（#slot）。
  + 在for循环语句中声明的变量，其作用域仅限于该循环体内。
  + 在函数内部声明的变量（局部变量），仅在函数内部有效。
  + 在所有函数外部声明的变量，在整个程序中都有效。
  + 不同函数中的局部变量可以同名，它们代表不同的内存单元

11. 关于以下代码的说法正确的是（#slot）。

  ```cpp
  int reversed = 0;
  while (x != 0) {
      int digit = x % 10;
      x /= 10;
      reversed = reversed * 10 + digit;
  }
  ```
  + 能够反转任何位数的整数
  + 能够反转的最大位数正整数是 2147483647
  + 能够反转的最大位数正整数是 2147483648
  + 能够反转的最大位数正整数是 1463847412

12. 以下C++代码试图查找数组中的最大值，划线处应填入（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int findMax(int arr[], int size) {
      int maxVal = ________; // 划线处
      for (int i = 1; i < size; i++) {
          if (arr[i] > maxVal) {
              maxVal = arr[i];
          }
      }
      return maxVal;
  }
  ```
  + 0
  + arr[-1]
  + arr[0]
  + size

13. 以下关于C++函数的说法，正确的是（#slot）。
  + 函数参数传递只有值传递一种方式。
  + 函数的形参在函数调用结束后依然占用内存空间
  + 没有返回值的函数必须声明为void类型，且不能包含return语句
  + C++11 及之后标准要求函数必须显式声明返回类型，不允许默认返回int

14. 以下C++代码中存在几处错误（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      const int SIZE = 5;
      int arr[SIZE];
      for (int i = 0; i <= SIZE; i++) {
          arr[i] = i * 2;
      }
      cout << arr[SIZE] << endl;
      return 0;
  }
  ```
  + 0处
  + 1处
  + 2处
  + 3处

15. 以下关于C++中string类和字符数组(char[])的说法，错误的是（#slot）。
  + string对象可以使用=进行赋值，而字符数组需要使用strcpy。
  + string对象的长度可以使用length（#slot）成员函数获取，而字符数组需要使用strlen（#slot）函数。
  + string对象在内存中是动态分配空间的，因此可以自动处理字符串长度的变化。
  + string对象和字符数组都可以使用==运算符来直接比较两个字符串的内容是否相同。

= 判断题（每题 2 分，共 20 分）

1. 表达式sizeof('a')的结果总是1，因为'a'是一个字符。

2. 在C++中，所有全局变量如果没有显式初始化，都会被自动初始化为0。

3. do { ... } while (false);循环体内的语句至少会被执行一次。

4. 在C++中，++i是一个左值表达式，而i++是一个右值表达式。

5. 对于enum Color { RED, GREEN, BLUE };，RED的类型是int

6. \#define SQUARE(x) x \* x是一个安全的宏定义，SQUARE(2+3)会正确计算出25。

7. 在C++中，char类型的取值范围总是 -128 到 127。

8. 表达式a \> b ? a : b = 10;一定是合法的C++代码。

9. \#include "file.h"和\#include \<file.h\>在编译器查找头文件时的搜索策略是完全相同的。

10. 在同一个作用域内，extern声明的变量可以多次定义。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：数组清零

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 有一个由$n$个非负整数构成的数组$a = [a_1, a_2, dots.h , a_n]$。他会对数组$a$重复进行以下操作，直到数组$a$只包含。在一次操作中，小 A 会依次完成以下三个步骤：1. 在数组$a$中找到最大的整数，记其下标为$k$。如果有多个最大值，那么选择其中下标最大的。2. 从数组$a$所有不为零的整数中找到最小的整数$a_j$。3. 将第一步找出的$a_k$减去$a_j$。例如，数组$a = [2,3,4]$需要$7$次操作变成：小 A 想知道，对于给定的数组$a$，需要多少次操作才能使得$a$中的整数全部变成$0$。可以证明，$a$中整数必然可以在有限次操作后全部变成$0$。你能帮他计算出答案吗？3.1.2 输 格式入第一行，一个正整数$n$，表示数组$a$的长度。第二行，$n$个非负整数$a_1, a_2, dots.h , a_n$，表示数组$a$中的整数。

=== 输出格式

一行，一个正整数，表示$a$中整数全部变成$0$所需要的操作次数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
2 3 4
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
7
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
5
1 3 2 2 5
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
13
```

=== 数据范围

对于所有测试点，保证$1 <= n <= 100$，$0 <= a_i <= 100$。

=== 参考程序

```cpp
#include <algorithm>
#include <cstdio>
using namespace std;
const int N = 105;
int n;
int a[N];
int cnt;
int main() {
    scanf("%d", &n);
    for (int i = 1; i <= n; i++) scanf("%d", &a[i]);
    while (1) {
        int mx = n;
        for (int i = 1; i <= n; i++)
            if (a[i] >= a[mx]) mx = i;
        if (a[mx] == 0) break;
        int mn = a[mx];
        for (int i = 1; i <= n; i++)
            if (a[i] > 0) mn = min(mn, a[i]);
        a[mx] -= mn;
        cnt++;
    }
    printf("%d\n", cnt);
    return 0;
}
```

== 编程题 2：日历制作

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 想制作 2025 年每个月的日历。他希望你能编写一个程序，按照格式输出给定月份的日历。具体来说，第一行需要输出MON TUE WED THU FRI SAT SUN，分别表示星期一到星期日。接下来若干行中依次输出这个月所包含的日期，日期的个位需要和对应星期几的缩写最后一个字母对齐。例如，2025 年 9 月 1 日是星期一，在输出九月的日历时，1 号的个位1就需要与星期一MON的最后一个字母N对齐。九月的日历输出效果如下：你能帮助小 A 完成日历的制作吗？

=== 输入格式

一行，一个正整数$m$，表示需要按照格式输出 2025 年$m$月的日历。

=== 输出格式

输出包含若干行，表示 2025 年$m$月的日历。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
9
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
MON TUE WED THU FRI SAT SUN
  1   2   3   4   5   6   7
  8   9  10  11  12  13  14
 15  16  17  18  19  20  21
 22  23  24  25  26  27  28
 29  30
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
6
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
MON TUE WED THU FRI SAT SUN
                          1
  2   3   4   5   6   7   8
  9  10  11  12  13  14  15
 16  17  18  19  20  21  22
 23  24  25  26  27  28  29
 30
```

=== 数据范围

对于所有测试点，保证$1 <= m <= 12$。

=== 参考程序

```cpp
#include <algorithm>
#include <cstdio>
using namespace std;
int days[20] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
int main() {
    int m;
    scanf("%d", &m);
    printf("MON TUE WED THU FRI SAT SUN\n");
    int d = days[m];
    int w = 1;
    if (m > 9) {
        for (int i = 9; i < m; i++) w = (w + days[i] - 1) % 7 + 1;
    } else if (m < 9) {
        for (int i = 8; i >= m; i--) w = ((w - days[i]) % 7 + 7) % 7;
        if (w == 0) w = 7;
    }
    for (int i = 1; i < w; i++) printf("    ");
    for (int i = 1; i <= d; i++) {
        printf("% 3d", i);
        w = w % 7 + 1;
        if (w == 1 || i == d)
            printf("\n");
        else
            printf(" ");
    }
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
