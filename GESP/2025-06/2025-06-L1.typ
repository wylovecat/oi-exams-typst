// ===========================================================================
// GESP 2025-06 C++ 一级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-06/2025-06-L1.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 1,
  month: "2025 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 2025年4月19日在北京举行了一场颇为瞩目的人形机器人半程马拉松赛。比赛期间，跑动着的机器人会利用身上安装的多个传感器所反馈的数据来调整姿态、保持平衡等，那么这类传感器类似于计算机的（#slot）。
  + 处理器
  + 存储器
  + 输入设备
  + 输出设备

2. 在某集成开发环境中调试下面代码段时尝试设置断点和检查局部变量，下面哪个说法是错误的（#slot）。

  ```cpp
  int i,N = 0; // L1
  cin >> N; // L2
  for (i = 1; i < 9; i++)
      if (N % i == 0) break;  // L3
  if (i < 9)
      printf("N不能大于9\n"); // L4
  ```
  + 断点不可以设在L1标记的代码行
  + 执行暂停在L2标记的代码行时，可以检测i的值
  + 执行暂停在L3标记的代码行时，可以修改i的值
  + 执行有可能暂停在L4标记的代码行

3. 对下列C++的代码，描述准确的是（#slot）。

  ```cpp
  int first = 10;
  printf("{%d}\n", First)
  ```
  + 执行后输出10
  + 执行后输出{First}
  + 执行后输出"{First}"
  + 编译报错，因为First应该是first

4. 在C++中，下列可以做变量名的是（#slot）。
  + X.cpp
  + X-cpp
  + X\#cpp
  + X\_cpp

5. C++表达式14-3\*3%2的值是（#slot）。
  + 0
  + 11
  + 13
  + -67

6. 下面的C++代码执行后，其输出是（#slot）。

  ```cpp
  int x = 10, y = 20;
  x = x + y;
  y = x - y;
  x = x - y;
  cout << x << ' ' << y;
  ```
  + 10 20
  + 20 10
  + 10 10
  + 20 20

7. 定义整型变量int a=16，则执行++a += 3之后，a的值会是（#slot）。
  + 3
  + 17
  + 19
  + 20

8. C++的int类型变量X的值为8，如果执行cout \<\< (++X)++;，则输出和执行后X的值分别是（#slot）。
  + 8 9
  + 9 9
  + 9 10
  + 编译错误，无法执行

9. 下面C++代码执行后的输出是（#slot）。

  ```cpp
  int a,b;
  a = 3;
  b = 4;
  printf("a+b=%02d#a+b={a+b}", a+b, a+b);
  ```
  + a+b=07\#a+b={a+b}
  + a+b= 7\#a+b=7
  + a+b=7\#a+b={a+b}
  + a+b=7\#a+b=7

10. 下面的C++代码用于求M天后是星期几，两处横线处分别应填入的代码是（#slot）。

  ```cpp
  int N, M, D;
  cout << "当前星期几? "; // 星期日是0
  cin >> N;
  cout << "求多少天后? "; // 输入正整数
  cin >> M;
  D = ____________;
  if (____________)
      printf("%d天后是星期日", M);
  else
      printf("%d天后是星期%d", M, D);
  (N + M) / 7
  D == 0
  (N + M) / 7
  D <= 0
  ```
  + $a + b = 07 a + b = ( a + b)$
  + ```cpp
    (N + M) % 7
    D == 0
    ```
  + $a + b = 7 a + b = ( a + b)$
  + ```cpp
    (N + M) % 7
    D = 0
    ```

11. 下面C++代码执行后输出是（#slot）。

  ```cpp
  int i;
  for (i = 1; i < 11; i += 3){
      continue;
      if (i % 2 == 0)
          break;
      printf("%d#", i);
  }
  if (i >= 11)
      printf("END");
  ```
  + END
  + 1\#
  + 1\#4\#END
  + 1\#4\#7\#10\#END

12. 下面的C++代码用于求N的所有因数（即能将N整除的数），如输入12则将输出12,6,4,3,2,1。（#slot）。

  ```cpp
  int i, N;
  cin >> N;
  i = N;
  while (_______){
      if (N % i == 0)
          printf("%d,", i);
      i -= 1;
  }
  printf("1");
  ```
  + i -= 1
  + i == 1
  + i \> 1
  + i \>= 1

13. 下面C++代码执行后输出的是（#slot）。

  ```cpp
  int Sum = 0;
  for (int i = 0; i < 10; i++){
      if (i % 2 == 0)
          continue;
      if (i % 5 == 0)
          break;
      Sum += i;
  }
  cout << Sum;
  ```
  + 55
  + 15
  + 9
  + 4

14. 试图编译并执行下面C++代码，下面描述正确的是（#slot）。

  ```cpp
  float x;
  x = 101;
  x++;
  cout << ++x;
  ```
  + 输出101
  + 输出102
  + 输出103
  + 编译将报错，无法执行

15. 以下C++代码可以找出百位、十位和个位满足特定条件的三位数，横线处应该填入的是（#slot）

  ```cpp
  int count = 0;
  for (int i = 100; i <= 999; i++) {
      int a = i / 100;
      _________________________
      int c = i % 10;
      if (a * a + b * b == c * c) {
          count++;
      }
  }
  int b = (i / 10) / 10;
  int b = (i / 10) % 10;
  int b = (i % 10) / 10;
  int b = (i % 10) % 10;
  ```

= 判断题（每题 2 分，共 20 分）

1. 人们现在参加很多闭卷考试时通常都不允许带智能手机、平板电脑等，此外很多种智能手表同样因为具有嵌入操作系统及通信等功能，所以也不允许随身携带。（#slot）

2. 如果N是C++的整型变量，值为5，则表达式(N + !N)的值为4。 （#slot）

3. 在下面C++代码中，删除break语句对程序执行结果没有影响。 （#slot）

  ```cpp
  int i;
  for (i = 0; i < 10; i++){
      continue;
      cout << i << "#";
      break;
  }
  if (i >= 10)
      cout << "END";
  ```

4. 删除下面C++代码中的continue后其输出是0\#2\#4\#6\#8\#。（#slot）

  ```cpp
  int i;
  for (i = 0; i < 10; i++){
      if (i % 2 == 0){
          cout << i << "#";
          continue;
      }
  }
  if (i >= 10)
      cout << "END";
  ```

5. 将下面C++代码中的i \< 100; i = i + 1修改为i \< 200; i += i + 1，其输出与当前代码输出相同。（#slot）

  ```cpp
  int cnt = 0;
  for (int i = 0; i < 100; i = i + 1)
      cnt += 1;
  cout << cnt;
  ```

6. 交换下面C++代码中的i += 2和cnt += 1，交换前后分别运行的两次输出相同。（#slot）

  ```cpp
  int i, cnt = 0;
  cnt = 0;
  while (i < 10){
      i += 2;
      cnt += 1;
  }
  cout << cnt;
  ```

7. 下面的C++代码执行后将输出45。（#slot）

  ```cpp
  int cnt;
  for (int i = 0; i < 10; i++)
      cnt += 1;
  cout << cnt;
  ```

8. 执行C++代码cout \<\< (12 + 12.12)将报错，因为12是int类型，而12.12是float类型，不同类型不能直接运算。（#slot）

9. 在C++代码中，不可以将变量命名为false，因为false是C++语言的关键字。（#slot）

10. X是C++的整型变量，则表达式3 \< X \< 5求值结果是4。（#slot）

= 编程题（每题 25 分，共 50 分）

== 编程题 1：假期阅读

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 有一本厚厚的书。这本书总共有$n$页，小 A 一天中最多只能阅读完其中的$k$页。小 A 的假期总共有$t$天，他想知道在假期中最多能阅读完这本书的多少页。

=== 输入格式

第一行，一个正整数$n$，表示书的页数。第二行，一个正整数$k$，表示小 A 每天最多阅读的页数。第三行，一个正整数$t$，表示小 A 假期的天数。

=== 输出格式

一行，一个整数，表示假期中所能阅读的最多页数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
8
3
2
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
6
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
19
3
30
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
19
```

=== 数据范围

对于所有测试点，保证$n,k,t$均不超过$1000$。

=== 参考程序

```cpp
#include <cstdio>
using namespace std;
int n, k, t;
int ans;
int main() {
    scanf("%d", &n);
    scanf("%d", &k);
    scanf("%d", &t);
    ans = k * t;
    if (n < ans)
        ans = n;
    printf("%d\n", ans);
    return 0;
}
```

== 编程题 2：值日

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨和小红是值日生，负责打扫教室。小杨每$m$天值日一次，小红每$n$天值日一次。今天他们两个一起值日，请问至少多少天后，他们会再次同一天值日？

=== 输入格式

第一行，一个正整数$m$，表示小杨的值日周期；第二行，一个正整数$n$，表示小红的值日周期。

=== 输出格式

一行，一个整数，表示至少多少天后他们会再次同一天值日。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4
6
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
12
```

=== 数据范围

对于所有测试点，保证$1 <= m, n <= 100$。

=== 参考程序

```cpp
#include <cstdio>
#include <algorithm>
#include <iostream>
using namespace std;
int main() {
    int m, n;
    cin >> m >> n;
    for (int i = max(m, n); ; i ++)
        if (i % m == 0 && i % n == 0) {
            cout << i << endl;
            break ;
        }
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
