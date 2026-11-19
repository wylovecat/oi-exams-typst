// ===========================================================================
// GESP 2026-09 C++ 二级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2026-09/2026-09-L2.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 2,
  month: "2026 年 09 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 第二届世界人形机器人运动会开幕式上，机器人方阵通过控制程序来完成整场表演。表演前，工程师们使用集成开发环境（IDE）编写并调试方阵的控制程序。下列关于 IDE 功能的描述，错误的是（#slot）。
  + 可以提供代码自动补全，提高编程效率
  + 可以提供辅助信息，帮助排查程序逻辑错误
  + 可以直接控制机器人电机转动
  + 支持语法高亮，使代码更易阅读

2. 计算机 CPU 中的高速缓冲存储器（Cache）主要为提升系统性能而设计。下列关于 Cache 的说法中正确的是（#slot）。
  + Cache 的容量比主存大，速度比主存快
  + Cache 通常用于暂存 CPU 频繁访问的数据
  + Cache 中的数据断电后不会丢失，属于非易失性存储器
  + Cache 的访问速度比 CPU 寄存器还要快

3. 执行如下 C++ 代码，其输出是（#slot）。

  ```cpp
  cout << (3 == 3.0);
  ```
  + 1
  + 1.0
  + 0
  + -1

4. 执行如下 C++ 代码，其输出是（#slot）。

  ```cpp
  cout << (bool(5) + bool(-5) + bool(5.0));
  ```
  + 0
  + 1
  + 2
  + 31 / 10

5. 判断年份N是否为闰年的规则是：能被4整除但不能被100整除，或者能被400整除。以下 C++ 表达式中，能正确判断N是否为闰年的是（#slot）。

  ```cpp
  (N % 4 == 0 && N % 100 != 0) || (N % 400 == 0)
  N % 4 == 0 && N % 100 == 0 || N % 400 == 0
  (N / 4 == 0 && N / 100 != 0) || (N / 400 == 0)
  (N % 4 == 0 && N % 100 != 0) && (N % 400 == 0)
  ```

6. 执行如下 C++ 代码，其输出是（#slot）。

  ```cpp
  int tot, i;
  tot = 0;
  for (i = 0; i < 10; i++)
      if (i)
          tot += 1;
  cout << tot;
  ```
  + 0
  + 8
  + 9
  + 10

7. 执行如下 C++ 代码，当输入4时，其输出是（#slot）。

  ```cpp
  int n, tot, i, j;
  cin >> n;
  tot = 0;
  for (i = 1; i < n; i++)
      for (j = 1; j < i; j++)
          tot += 1;
  cout << tot;
  ```
  + 1
  + 3
  + 6
  + 10

8. 下面的 C++ 代码执行后其输出是（#slot）。

  ```cpp
  int tnt, i;
  tnt = 0;
  for (i = 0; i < 10; i++)
      if (i % 3)
          tnt += i;
  cout << tnt;
  ```
  + 12
  + 18
  + 22
  + 27

9. 下面的 C++ 代码之后的输出是（#slot）。2 / 10

  ```cpp
  int tot = 0, i;
  for (i = -5; i < 5; i++)
      if (not(i % 3 != 0))
          tot += 1;
  cout << tot;
  ```
  + 2
  + 3
  + 7
  + 9

10. 有关如下 C++ 代码描述，变量都是整型，错误的是（#slot）。

  ```cpp
  int n, limit, i;
  cout << "请输入一个正整数: ";
  cin >> n;
  if (n <= 1)
      printf("%d非素数", n);
  else if (n == 2)
      printf("2是素数");
  else {
      limit = sqrt(n) + 1;
      for (i = 2; i < limit; i++)
          if (n % i == 0) {
              printf("%d非素数", n);
              break;
          }
      if (i >= limit)
          printf("%d是素数", n);
  }
  ```
  + n \<= 1条件用于判断输入0、1以及负数时的情况，不能省略。
  + n == 2条件及其相关代码省略，程序的输出结果没有区别。
  + break语句不可以省略，否则非素数还将执行最后一行的语句。
  + limit = sqrt(n) + 1语句中的1可以修改为其他大于等于1的正整数，执行结果不会有错误，但循环次数增多，效率有所影响。

11. 执行以下 C++ 代码后，最终的输出结果是（#slot）。

  ```cpp
  int total, i, j;
  total = 0;
  i = 1;
  while (i <= 3) {
      for (j = 1; j < i + 1; j++)
          total += i * j;
      i += 1;
  }
  cout << total;
  ```
  + 9
  + 11
  + 23
  + 25

12. 下面 C++ 代码执行后其输出是（#slot）。3 / 10

  ```cpp
  int count, i, j;
  count = 0;
  for (i = 1; i < 4; i++)
      for (j = 0; j < i; j++) {
          if (j % 3 == 0)
              continue;
          count += 1;
          if (i * j >= 2)
              break;
      }
  printf("%d %d %d", i, j, count);
  ```
  + 2 3 2
  + 3 0 2
  + 4 1 2
  + 4 2 3

13. 如下的 C++ 代码执行时输入12将输出如下数字图形。注意：最后一行之前没有空格。横线处应填入的代码是（#slot）。

  ```cpp
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
   56789012345
  678901234567
  int line, i, j, k;
  i = 0;
  cout << "请输入行数：";
  cin >> line;
  for (j = 0; j < line; j++) {
      for (k = 0; k < ___________; k++) // L1
          cout << " ";
      for (k = 0; k < j + 1; k++) {
          cout << i;
          i += 1;
          if (i >= 10)
              i = 0;
      }
      cout << endl;
  }
  ```
  + line - j - 1
  + line - j
  + line
  + line + 1

14. 小北的身高是1.65米。班上有n个小朋友，小北想和身高最接近自己的人交朋友。如果有多个小朋友与小北的身高差相同，小北想和其中身高较矮的第一个小朋友做朋友。横线处应该填入的是（#slot）。4 / 10

  ```cpp
  int n, i;
  float target, h, best_height, min_diff, diff;
  cout << "请输入小朋友的人数: ";
  cin >> n;
  target = 1.65;
  best_height = 0.0;
  min_diff = 100.0;
  for (i = 0; i < n; i++) {
      cout << "请输入第 " << i << " 个小朋友的身高: ";
      cin >> h;
      diff = abs(h - target);
      if (____________________) { // L1
          min_diff = diff;
          best_height = h;
      }
  }
  cout << "小北的朋友身高为: " << best_height;
  diff < min_diff || (diff == min_diff && h < best_height)
  diff <= min_diff && h < best_height
  diff < min_diff && h < best_height
  diff < min_diff || h < best_height
  ```

15. 小北的身高是1.65米。班上有n个小朋友，小北想和身高最接近自己的人交朋友。如果有多个小朋友与小北的身高差相同，小北想和其中身高较矮的第一个小朋友做朋友。横线处应该填入的是（#slot）。5 / 10

  ```cpp
  int n, i;
  float target, h, best_height, min_diff, diff;
  cout << "请输入小朋友的人数: ";
  cin >> n;
  target = 1.65;
  best_height = 0.0;
  min_diff = 100.0;
  for (i = 0; i < n; i++) {
      cout << "请输入第 " << (i + 1) << " 个小朋友的身高: ";
      cin >> h;
      if (h > target)
          diff = h - target;
      else
          diff = target - h;
      if (diff < min_diff) {
          min_diff = diff;
          best_height = h;
      } else if (diff == min_diff) {
          __________________
          __________________
      }
  }
  cout << "小北的朋友身高为:" << best_height;
  ```
  + ```cpp
    if (h < best_height)
        best_height = h;
    ```
  + ```cpp
    if (h > best_height)
        best_height = h;
    ```
  + ```cpp
    if (h > target)
        best_height = h;
    ```
  + ```cpp
    if (h >= best_height)
        best_height = h;
    ```

= 判断题（每题 2 分，共 20 分）

1. C++ 程序执行cin或scanf语句时通常是使用键盘等输入设备来输入某个变量的值。

2. 执行 C++ 语句cout \<\< ( 5 && 2 );将输出1。

3. C++ 表达式2 \* - '2' / 4的值是-1。

4. 如下 C++ 代码执行后的输出是10。

  ```cpp
  int a;
  a = 5;
  a == +5;
  cout << a;
  ```

5. 执行 C++ 代码cout \<\< (not not 5)将输出5。

6. 下面 C++ 代码执行后将输出369。

  ```cpp
  for (int i = 1; i < 10; i++)
      if (not(i % 3))
          cout << i;
  ```

7. N是整数，执行如下 C++ 代码，将能输出0到N之间(包含N)所有数之和。

  ```cpp
  int N, tot, i;
  cin >> N;
  tot = 0;
  for (i = 0; i < N + 1; i++)
      tot += i;
  cout << tot;
  ```

8. 如下 C++ 代码执行后，输出值为0。6 / 10

  ```cpp
  int cnt, i, j;
  cnt = 0;
  for (i = 0; i < 10; i++) {
      continue;
      for (j = 0; j < i; j++)
          cnt += 1;
  }
  cout << i * cnt;
  ```

9. 求解鸡兔同笼。在如下 C++ 代码中，tou代表鸡和兔的头总数，jiao代表鸡和兔的脚总数。先后两个输入均为正整数。该程序能求解鸡兔同笼。

  ```cpp
  int tou, jiao, tu_tou, ji_tou;
  cout << "请输入鸡和兔的头总数：";
  cin >> tou;
  cout << "请输入鸡和兔的脚总数：";
  cin >> jiao;
  for (tu_tou = 0; tu_tou < tou + 1; tu_tou++) {
      ji_tou = tou - tu_tou;
      if (tu_tou * 4 + ji_tou * 2 == jiao)
          printf("兔的数量=%d,鸡的数量=%d\n", tu_tou, ji_tou);
  }
  if (tu_tou == tou)
      printf("无解\n");
  ```

10. 如果N和M均为整数，下列 C++ 代码则可以判断正整数N是M的平方。比如9是3的平方。

  ```cpp
  int N, M;
  cout << "请输入正整数N:";
  cin >> N;
  cout << "请输入整数M:";
  cin >> M;
  if (int(sqrt(N)) == abs(M))
      printf("%d是%d的平方\n", N, M);
  ```

= 编程题（每题 25 分，共 50 分）

== 编程题 1：直角三角形

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小双刚学会勾股定理，得知直角三角形的斜边的平方等于两直角边的平方和。小双创造了直角三角形数列：数列前两项由小双指定，从第三项开始，数列中的每个数字的平方等于前两项的平方和。例如，第一项是$3.0$，第二项是$4.0$，则第三项是$sqrt(3.0^2 + 4.0^2) = 5.0$。其中$sqrt(x)$表示#(math-missing)的算术平方根，可以使用 C/C++/Python 标准库中对应函数计算。小双给定了数列的前两项，并给定一个数列上限，想让你算算数列的第几项会超过小双给定的数列上限？7 / 103.1.2 输 格式入输入三行，第一行一个浮点数是数列第一项，第二行一个浮点数是数列第二项，第三行一个浮点数表示数列上限。

=== 输出格式

输出一个正整数，表示第几项开始会超过小双给定的数列上限。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3.0
4.0
10.0
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
6
```

=== 数据范围

输入均为不超过$10000$的正数。题目保证给定第一项小于第二项。

=== 提示

数列依次为：，，，，，，因此第$6$项会超过上限。

=== 参考程序

```cpp
#include <iostream>
#include <cmath>
using namespace std;
int main() {
    double a, b, U;
    cin >> a >> b >> U;
    int ans = 1;
    if (a <= U) ans++;
    while (b <= U) {
        ans++;
        double t = sqrt(a * a + b * b);
        a = b, b = t;
    }
    cout << ans << endl;
    return 0;
}8 / 10
```

== 编程题 2：字符变换

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小明有一个$8 times 16$的画布（8 行 16 列），画布中的格子从上到下从左到右编号，左上的编号为$1$，第一排最后一个的编号为$16$，最后一排第一个编号为$113$，右下为$128$。初始画布中的每个格子都是\*，随后小明会给定三个正整数，小明会将对应编号的格子变为该正整数对应的 ASCII编码字符。最后请帮小明输出整个画布。3.2.2 输 格式入输入包含三行，每行一个正整数，表示需要替换的画布格子编号。

=== 输出格式

输出$8 times 16$的画布。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
48
65
97
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
****************
****************
***************0
****************
A***************
****************
a***************
****************
```

=== 数据范围

输入范围是$48$到$57$，$65$到$90$，以及$97$到$122$（即 ASCII 编码的0到9，A到Z，以及a到z）。9 / 10

=== 参考程序

```cpp
#include <iostream>
using namespace std;
int main() {
    int a, b, c, p = 0;
    cin >> a >> b >> c;
    for (int i = 1; i <= 8; ++i) {
        for (int j = 1; j <= 16; ++j) {
            ++p;
            if (p == a)
                cout << (char)a;
            else if (p == b)
                cout << (char)b;
            else if (p == c)
                cout << (char)c;
            else
                cout << '*';
        }
        cout << '\n';
    }
    return 0;
}10 / 10
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
