// ===========================================================================
// GESP 2025-06 C++ 二级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-06/2025-06-L2.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 2,
  month: "2025 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 2025年4月19日在北京举行了一场颇为瞩目的人形机器人半程马拉松赛。比赛期间，跑动着的机器人会利用身上安装的多个传感器所反馈的数据来调整姿态、保持平衡等，那么这类传感器类似于计算机的（#slot）。
  + 处理器
  + 存储器
  + 输入设备
  + 输出设备

2. 小明购置的计算机使用一年后觉得内存不够用了，想购置一个容量更大的内存条，这时他需要的内存条是（#slot）。
  + RAM
  + ROM
  + CACHE
  + EPROM

3. 下面C++代码执行后的输出是（#slot）。

  ```cpp
  int a=3;
  float b = 3.5;
  cout << (a *= b);
  ```
  + 3
  + 3.5
  + 10
  + 11

4. 下面C++代码用于获得正整数的第3位数，如1234则输出2。如果是一位数或两位数，则输出0。横线处应填入的代码是（#slot）。

  ```cpp
  int N, remainder;
  cout << "请输入正整数:";
  cin >> N;
  cout << _________________;
  ```
  + N % 1000 / 100
  + N / 1000 % 100
  + N / 1000 / 100
  + N % 100 / 100

5. 下面C++代码执行，其输出是（#slot）。

  ```cpp
  int a, b = (6, 28);
  b == a;
  a = b;
  cout << a << ' ' << b;
  ```
  + 6 28
  + 6 6
  + 28 6
  + 28 28

6. 今天星期六，其后第N天星期几？如果是星期一到星期六输出形如：星期1、星期2等，星期天则输出星期天。下面的C++代码用于完成上述要求，横线处应填上的代码是（#slot）。

  ```cpp
  int N, remainder;
  cin >> N;
  remainder = _____________;
  if(remainder == 0)
      printf("星期六后第%d天是星期天\n", N);
  else
      printf("星期六后第%d天是星期%d\n", N, remainder);
  ```
  + (N + 6) / 7
  + (N + 6) // 7
  + N % 7
  + (N + 6) % 7

7. 下面的C++代码执行后其输出是（#slot）。

  ```cpp
  int i, Sum = 0;
  for (i = 1; i < 10; i++){
      Sum += i;
      if(i % 2) continue;
      if(i % 7) break;
  }
  cout << Sum;
  ```
  + 45
  + 28
  + 3
  + 0

8. 下面C++代码执行后其输出是（#slot）。

  ```cpp
  int i, j;
  for(i = 1; i < 12; i++)
      for(j = 1; j < i; j++)
          if(i * j % 2 == 1)
              break;
  cout << i * j;
  ```
  + 110
  + 22
  + 12
  + 3

9. 下面C++代码执行后输出是（#slot）。

  ```cpp
  int i, cnt = 0;
  for(i = -99; i < 100; i += 2)
      cnt = 1 + cnt;
  cout << cnt;
  ```
  + 101
  + 100
  + 99
  + 98

10. 下面C++代码执行后输出是（#slot）。

  ```cpp
  int i;
  for(i = 1; i < 10; i++){
      if(i % 3 != 0){
          printf("A#");
          continue;
      }
      else
          break;
      printf("0#");
  }
  if(i == 10) cout << "1";
  ```
  + A\#A\#
  + A\#0\#A\#0
  + A\#A\#1
  + A\#0\#A\#0\#1

11. 下面C++代码执行后的输出是（#slot）。

  ```cpp
  int i,j;
  for(i = 0; i < 3; i++)
      for(j = 0; j < i; j++)
          printf("%d#%d-", i, j);
  printf("END");
  ```
  + 0\#0-1\#0-2\#0-2\#1-END
  + 0\#0-1\#0-1\#1-2\#0-2\#1-2\#2-3\#0-3\#1-3\#2-END
  + 0\#0-1\#0-1\#1-2\#0-2\#1-2\#2-END
  + 1\#0-2\#0-2\#1-END

12. 下面C++代码执行后，将输出不能被3整除且除以5余数为2的数。下列选项不能实现的是（#slot）。

  ```cpp
  int i,j;
  for(i = 0; i < 100; i++)
      if(______________________)
          cout << i << endl;
  ```
  + (i % 3 != 0) && (i % 5 == 2)
  + (i % 3) && (i % 5 == 2)
  + (i % 3) && !(i % 5 != 2)
  + !(i % 3) && (i % 5 == 2)

13. 下面C++代码用于判断一个大于0的正整数是几位数，横线处应填入代码先后是（#slot）。

  ```cpp
  int N, cnt;
  cout << "请输入大于0的正整数：";
  cin >> N;
  cnt = 0;
  while  (_________){
      cnt += 1;
      ______________;
  }
  cout << cnt;
  ```
  + ```cpp
    N > 1
    N = N / 10
    ```
  + ```cpp
    N > 1
    N /= 10
    ```
  + ```cpp
    N == 0
    N /= 10
    ```
  + ```cpp
    N > 0
    N /= 10
    ```

14. 判断一个数是否为自守数。自守数的定义是如果一个数的平方其尾数与该数相同，则为自守数，如25的平方是625，其尾数是25，所以25是自守数。相关说法错误的是（#slot）。

  ```cpp
  int N, N1, M1;
  cout << "输入一个正整数：";
  cin >> N;
  N1 = N, M1 = N * N;
  bool Flag = true;
  while (N1 > 0){
      if (N1 % 10 != M1 % 10){
          Flag = false;
          break;
      }
      else{
          N1 = N1 / 10, M1 = M1 / 10;
      }
  }
  if (Flag == true)
      printf("%d的平方是%d,是自守数", N, N * N);
  else
      printf("%d的平方是%d,不是自守数", N, N * N);
  ```
  + 如果Flag在循环中不被改为false，则说明该数是自守数
  + 代码if (N1 % 10 != M1 % 10)用于判断其个位数是否相等，如果不等，则表明不是自守数
  + 代码N1 = N1 / 10, M1 = M1 / 10将个位数去掉
  + 将N1 \> 0改为N \> 0效果相同

15. 下面C++代码实现输出如下图形，相关说法错误的是（#slot）。

  ```cpp
  请输入层数: 10
  0
  12
  345
  6789
  01234
  567890
  1234567
  89012345
  678901234
  5678901234
  int line_number, now_number;
  int i,row;
  cout << "请输入行数: ";
  cin >> line_number;
  now_number = 0;
  for (row = 1; row < line_number + 1; row++){ // L1
      for (i = 0; i < row; i++){ // L2
          cout << now_number;
          now_number += 1;
          if (now_number == 10) now_number = 0; // L3
      }
      cout << endl;
  }
  ```
  + 代码now\_number = 0移动到L1和L2标记的两行代码之间，效果维持不变
  + 代码now\_number += 1修改为now\_number = 1 + now\_number效果维持不变
  + 将代码now\_number == 10调整为now\_number \> 9效果维持不变
  + 将最后一行的cout \<\< endl修改为cout \<\< "\\n"，效果维持不变

= 判断题（每题 2 分，共 20 分）

1. 人们现在参加很多闭卷考试时通常都不允许带智能手机、平板电脑等，此外很多种智能手表同样因为具有嵌入操作系统及通信等功能，所以也不允许随身携带。（#slot）

2. 在C++代码中，假设N为正整数，则N / 10舍弃个位数。如果N小于10，则其值为0，大于10则是舍弃个位数的数。（#slot）

3. 下列C++代码执行后，其输出为10 20，即a == b和b == a对a和b的值没有任何影响。（#slot）

  ```cpp
  int a = 10, b = 20;
  a == b;
  b == a;
  cout << (a, b);
  ```

4. a和b分别是C++的整型变量，如果表达式max(a, b) == min(a, b)的值为真，则说明a和b相等。（#slot）

5. 下面C++代码编译时将报错，因为字符变量a被赋值了浮点值。 （#slot）

  ```cpp
  char a = '1';
  a = 45.6;
  cout << a;
  ```

6. 下面C++代码执行时如输入59.99，将输出及格两个汉字。（#slot）

  ```cpp
  int score;
  cout << "请输入学生成绩: ";
  cin >> score;
  if (score < 60)
      cout << "不及格";
  else
      cout << "及格";
  ```

7. 在下面的C++代码中，因为continue将被执行，因此不会有输出。（#slot）

  ```cpp
  int i;
  for (i = 1; i < 10; i++)
      if (i % 2 == 0)
          continue;
  if(i == 10)
      cout << "END";
  ```

8. 下面的C++代码执行后将输出15。（#slot）

  ```cpp
  int Sum = 0;
  for (int i = 0; i < 5; i++)
      Sum += i;
  cout << Sum;
  ```

9. 将下面C++代码中的(int i = 5; i \> 1; i--)调整为(int i = 1; i \< 5; i++)输出结果相同，因为5到1与1到5的求和相同。（#slot）

  ```cpp
  int tnt;
  tnt = 0;
  for (int i = 5; i > 1; i--)
      tnt += i;
  cout << tnt;
      cout << endl;
  ```

10. 为实现如下效果，即N行N列字符。当输入是奇数时，中间列为\*，其他是-；当输入是偶数时，则中间两列是\*，其他是-。字符阵列后的代码能实现其效果。（#slot）

  ```cpp
  /*
  5
  --*--
  --*--
  --*--
  --*--
  --*--
  */
  int N;
  cin >> N;
  int i,j;
  for (i = 0; i < N; i++){
      for (j = 0; j < N; j++)
          if ((j == N / 2) || (j == (N-1) / 2))
              cout << "*";
          else
              cout << "-";
      cout << endl;
  }
  ```

= 编程题（每题 25 分，共 50 分）

== 编程题 1：数三角形

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

直角三角形有两条直角边与一条斜边，设两条直角边的长度分别为$a,b$，则直角三角形的面积为ab/2。请你计算当直角边长$a, b$均取不超过$n$的正整数时，有多少个不同的面积为整数的直角三角形。直角边长分别为和$a', b'$的两个直角三角形相同，当且仅当$a = a', b = b'$或者$a = b', b = a'$。

=== 输入格式

一行，一个整数$n$，表示直角边长的最大值。

=== 输出格式

输出一行，一个整数，表示不同的直角三角形数量。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
3
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
5
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
9
```

=== 数据范围

对于所有测试点，保证$1 <= n <= 1000$。

=== 参考程序

```cpp
#include <iostream>
using namespace std;
int main()
{
    int n, a, b, cnt=0;
    cin >> n;
    for(a=1; a<=n; a++)
    {
        for(b=a; b<=n; b++)
        {
            if(a*b%2==0) cnt++;
        }
    }
    cout << cnt <<endl;
    return 0;
}
```

== 编程题 2：幂和数

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

对于正整数$n$，如果$n$可以表为两个$2$的次幂之和，即$n = 2^x + 2^y$（$x, y$均为非负整数），那么称$n$为幂和数。给定正整数$l, r$，请你求出满足$l <= n <= r$的整数$n$中有多少个幂和数。

=== 输入格式

一行，两个正整数$l,r$，含义如上。

=== 输出格式

输出一行，一个整数，表示$l,r$之间幂和数的数量。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
2 8
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
6
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
10 100
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
20
```

=== 数据范围

对于所有测试点，保证$1 <= l <= r <= 10^4$。

=== 参考程序

```cpp
#include <iostream>
using namespace std;
int main()
{
    int l, r, a, b, n, cnt = 0;
    cin >> l >> r;
    a = 1;
    while(a<=r)
    {
        b = a;
        while(b<=r)
        {
            n = a+b;
            if(n>=l && n<=r) cnt++;
            b *= 2;
        }
        a *= 2;
    }
    cout << cnt <<endl;
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
