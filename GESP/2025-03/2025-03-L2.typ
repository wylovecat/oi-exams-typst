// ===========================================================================
// GESP 2025-03 C++ 二级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-03/2025-03-L2.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 2,
  month: "2025 年 03 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 2025年春节有两件轰动全球的事件，一个是DeepSeek横空出世，另一个是贺岁片《哪吒2》票房惊人，入了全球票房榜。下面关于DeepSeek与《哪吒2》的描述成立的是（#slot）。
  + 《哪吒2》是一款新型操作系统
  + DeepSeek是深海钻探软件
  + 《哪吒2》可以生成新的软件
  + DeepSeek可以根据《哪吒2》的场景生成剧情脚本

2. 对整型变量N，如果它能够同时被3和5整除，则输出N是含有至少两个质因数。如果用流程图来描述处理过程，则输出语句应该在哪种图形框中（#slot）。
  + 圆形框
  + 椭圆形框
  + 平行四边形框
  + 菱形框

3. 下面C++代码执行，其输出是（#slot）。

  ```cpp
  int a=3, b = 4;
  a == b;
  b == a;
  cout << a << ' ' << b << endl;
  ```
  + 3 4
  + 3 3
  + 4 4
  + 4 3

4. 求三色彩球的颜色。有数量无限的红(Red)绿(Green)蓝(Blue)三种彩球排成一行，每组先为5个红色球，随后3个绿色，最后为2个蓝色。每个球都有编号，从左到右依次为1,2,3……。输入整数代表编号，求该编号球的颜色。下面是C++代码是实现，正确说法是（#slot）。

  ```cpp
  int N, remainder;
  cin >> N;
  remainder = N % 10; // remainder变量保存余数
  if((1 <= remainder) && (remainder<= 5))
      cout << "Red";
  else if ((6 <= remainder) &&  (remainder <= 8))
      cout << "Green";
  else if ((remainder == 9) || (remainder == 0))
      cout << "Blue";
  remainder <= 8)
  ```
  + 将else if ((remainder == 9) || (remainder == 0))修改为else效果相同
  + 将((1 \<= remainder) && (remainder\<= 5))修改为(remainder \<= 5)效果相同
  + else if ((6 \<= remainder) && (remainder \<= 8))写法错误，应修改为else if (6 \<=
  + 根据题意remainder = N % 10应修改为remainder = N / 10

5. 下面C++代码执行后其输出是（#slot）。

  ```cpp
  int tnt = 0;
  for (int i = 0; i < 10;i ++)
      if (i % 3)
          tnt += 1;
      else
          tnt += 2;
  cout << tnt;
  ```
  + 18
  + 17
  + 16
  + 14

6. 下面C++代码执行后输出是（#slot）。

  ```cpp
  int i;
  for (i = 10; i > 0; i -= 2)
      break;
  cout << i;
  ```
  + 10
  + 8
  + 0
  + 因为循环执行时会执行break语句而终止循环，所以i的值不确定

7. 下面C++代码执行后输出是（#slot）。

  ```cpp
  int i;
  for (i =0; i < 10; i++){
      if (i % 3 == 0)
          continue;
      cout << "0" << "#";
  }
  if (i >= 10)
      cout << "1" << "#";
  ```
  + 0\#0\#0\#0\#0\#0\#
  + 0\#0\#0\#0\#0\#0\#0\#1\#
  + 0\#0\#0\#0\#1\#
  + 0\#0\#0\#0\#0\#0\#1\#

8. 下面C++代码执行后的输出是（#slot）。

  ```cpp
  int i,j;
  for (i = 0; i < 5; i++)
      for (j = i; j > 0; j -= 1)
          printf("%d-",j);
  1-2-1-3-2-1-4-3-2-1-
  1-2-1-3-2-1-4-3-2-1
  0-0-1-0-1-2-0-1-2-3-
  0-0-1-0-1-2-0-1-2-3
  ```

9. 下面C++代码执行后，将输出能被2整除且除以7余数为2的数。下列选项不能实现的是（#slot）。

  ```cpp
  for (int i = 0; i < 100; i++)
      if _______________________
          cout << i << "  ";
  ((i % 2 == 0) && (i % 7 == 2))
  ((!(i % 2)) && (i % 7 == 2))
  ((!(i % 2)) && (!(i % 7)))
  ((i % 2 != 1) && (i % 7 == 2))
  ```

10. 下面C++代码用于求1到N之间正整数中含有3的数的个数，比如123和32都是符合条件的数。则前后两处横线应填入代码分别是（#slot）。

  ```cpp
  int i,j;
  int cnt = 0, N;
  cout << "请输入正整数N  ";
  cin >> N;
  for (i = 1; (j=i) < N; i++)
      while (j != 0)
          if (j % 10 == 3){
              cnt +=1;
              __________;
          }
          else
              __________;
  cout << cnt << "  ";
  ```
  + ```cpp
    continue
    j /= 10
    ```
  + ```cpp
    break
    j /= 10
    ```
  + ```cpp
    continue
    j %= 10
    ```
  + ```cpp
    break
    j %= 10
    ```

11. 在数学中N!表示N的阶乘，即1到N的乘积，如3!=1\*2\*3，且0! = 1。下面的两段C++代码用于求1到N的阶乘之和，如N为3，则结果是9（1!+2!+3!的值）。选项中的说法正确的是（#slot）。

  ```cpp
  // 实现1
  int i,N;
  cin >> N;
  int tnt = 0, last = 1;
  for (i = 1; i < N + 1; i++){
      last *= i;
      tnt += last;
  }
  cout << tnt << endl;
  // 实现2
  int i,N;
  cin >> N;
  int tnt = 0, tmp;
  for (i = 1; i < N + 1; i++){
      tmp = 1;
      for (int j = 1; j < i + 1; j++)
          tmp *= j;
      tnt += tmp;
  }
  cout << tnt << endl;
  ```
  + 虽然实现1的代码短小，但效率并不高
  + 实现2的代码效率更高，且更易于理解
  + 实现1因为应用了前项计算结果，计算量更小，因此效率高
  + 两种实现，效率几乎一致

12. 哥德巴赫猜想是指大于2的偶数都可以分解为两个质数之和，下面的代码用于验证4-1000之内的偶数能否分解为两个质数之和。下面C++代码中假设isPrime（#slot）是已经定义好用于判断正整数N是否为质数, 返回bool值。对该段代码，错误的说法是（#slot）。

  ```cpp
  for (i = 4; i < 1000; i += 2)
      for (j = 2; j < i; j++)
          if (isPrime(j) && isPrime(i-j)){
              printf("%d=%d+%d\n", i, j, i-j);
              break;
          }
  ```
  + 将代码isPrime(j) && isPrime(i-j)修改为isPrime(j) == true && isPrime(i-j) == true效果相同
  + 代码执行后，输出的一对质数，一定是小的数在前
  + 即便将外层循环中i的上界1000修改为很大的整数，也不能说从数学上证明了哥德巴赫猜想
  + 根据题意，break语句应该移到if语句块之外

13. 已知C++代码和执行后的期望输出如下，相关说法正确的是（#slot）。

  ```cpp
  int i,j;
  int last, N;
  cout << "请输入层数N  ";
  cin >> N;
  last = 1;
  for (i = 1; i < N; i++){
      for (j = 1; j < i + 1; j++){ // L1
          if (last > 9)
              last = 1;
          cout << last << " ";
          last += 1;
      }
      printf("\n");
  }
  请输入层数N  10
  1
  2 3
  4 5 6
  7 8 9 1
  2 3 4 5 6
  7 8 9 1 2 3
  4 5 6 7 8 9 1
  2 3 4 5 6 7 8 9
  1 2 3 4 5 6 7 8 9
  ```
  + 倒数第二行的printf("\\n")有错，应该修改为cout \<\< endl;，printf（#slot）函数不能输出换行
  + last += 1修改为last = last + 1执行效果相同
  + 代码中L1标记行中的j \< i + 1应修改为j \< i
  + 外层for循环前的last = 1修改为last = 0执行效果相同

14. 在C++中，（#slot）最适合填入横线处连续5次正确生成1到10之间的随机整数？

  ```cpp
  for(int i=0; i<5; i++)
      __________________;
  ```
  + rand（#slot） % 11
  + rand（#slot） % 10
  + rand（#slot） % 10 + 1
  + rand（#slot） % 9 + 1

15. 在C++中，如果a和b均为float类型的变量，那么二者如果相差足够小（比如0.000001），就可以视作相等。比如2.2345676和2.2345677就可以视作相等。下列哪个表达式能用来正确判断“a等于b” （#slot）。

  ```cpp
  ((b-a) < 0.000001 )
  ((b-a) <= 0.000001 )
  (abs(b-a) <= 0.000001 )
  (sqrt(b-a) <= 0.000001 )
  ```

= 判断题（每题 2 分，共 20 分）

1. C++、Python都是高级编程语言，它们的每条语句最终都要通过机器指令来完成。（#slot）

2. 在C++代码中，假设N为正整数，则N - N / 10 \* 10与N % 10都将获得N的个位数。（#slot）

3. C++语句cout \<\< ((10 \<= N \<= 12)? "true":"false")中，假设整型变量N为12，则其输出为true。原因是执行10 \<= N后其值为true，true与12相比仍然是true。（#slot）

4. C++表达式(sqrt(N) \* sqrt(N)) == N中的N如果为正整数，则表达式的值为true，相当于开平方后平方是本身。（#slot）

5. 下面C++执行后将输出3\*2=6。 （#slot）

  ```cpp
  int a=2, b = 3;
  a=a-b;
  b=a+b;
  a=b-a;
  printf("%d*%d=%d\n", a, b, a*b);
  ```

6. 下面C++代码执行后将输出10。（#slot）

  ```cpp
  int i;
  for (i = 0; i < 10; i++)
      continue;
  cout << i << endl;
  ```

7. 下面C++代码执行后将输出1。（#slot）

  ```cpp
  int i;
  for (i = 1; i < 10; i++){
      break;
      continue;
  }
  cout << i << endl;
  ```

8. 下面的C++代码执行后将输出10行"OK"。（#slot）

  ```cpp
  for (int i = 0; i < 5; i++)
      for(int j = 0; j < i; j++)
          printf("OK\n");
  ```

9. 将下面C++代码中的for循环中的i = 1调整为i = 0的输出结果相同。（#slot）

  ```cpp
  int tnt = 0;
  for (int i = 1; i < 5; i++) // i=1
      tnt += i;
  cout << tnt;
  ```

10. 下面C++代码执行后将输出0123。（#slot）

  ```cpp
  for (i = 0; i < 5; i++)
      for (i = 0; i < i; i++)
              continue;
      printf("%d\n", i);
  ```

= 编程题（每题 25 分，共 50 分）

== 编程题 1：等差矩阵

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 想构造一个$n$行$m$列的矩阵，使得矩阵的每一行与每一列均是等差数列。小 A 发现，在矩阵的第$i$行第$j$列填入整数$i times j$，得到的矩阵能满足要求。你能帮小 A 输出这个矩阵吗？

=== 输入格式

一行，两个正整数$n,m$。

=== 输出格式

共$n$行，每行$m$个由空格分割的整数，表示小 A 需要构造的矩阵。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3 4
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
1 2 3 4
2 4 6 8
3 6 9 12
```

=== 数据范围

对于所有测试点，保证$1 <= n <= 50$，$1 <= m <= 50$。

=== 参考程序

```cpp
#include <bits/stdc++.h>
using namespace std;
int n, m;
int main() {
    scanf("%d%d", &n, &m);
    assert(1 <= n && n <= 50 && 1 <= m && m <= 50);
    for (int i = 1; i <= n; i++)
        for (int j = 1; j <= m; j++)
            printf("%d%c", i * j, " \n"[j == m]);
    return 0;
}
```

== 编程题 2：时间跨越

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

假设现在是$y$年$m$月$d$日$h$时而$k$小时后是$y'$年$m'$月$d'$日$h'$时，对于给定的$y, m, d, h, k$，小杨想请你帮他计算出对应的$y', m', d', h'$是多少。

=== 输入格式

输入包含五行，每行一个正整数，分别代表$y,m,d,h,k$。

=== 输出格式

输出四个正整数，代表$y', m', d', h'$。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
2008
2
28
23
1
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
2008 2 29 0
```

=== 数据范围

对于全部数据，保证有$2000 <= y <= 3000, 1 <= m <= 12, 1 <= d <= 31, 0 <= h <= 23, 1 <= k <= 24$。数据保证为合法时间。

=== 提示

闰年判断规则普通闰年：年份能被 4 整除，但不能被 100 整除。世纪闰年：年份能被 400 整除。满足以上任意一条规则的年份就是闰年，否则是平年。

=== 参考程序

```cpp
#include <iostream>
using namespace std;
int main() {
    int y, m, d, h, k;
    cin >> y >> m >> d >> h >> k;
    h += k;
    if (h >= 24) {
        h -= 24;
        d += 1;
        int days = 0;
        if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) {
            days = 31;
        } else if (m == 4 || m == 6 || m == 9 || m == 11) {
            days = 30;
        } else if (m == 2) {
            if ((y % 4 == 0 && y % 100 != 0) || (y % 400 == 0)) {
                days = 29;
            } else {
                days = 28;
            }
        }
        if (d > days) {
            d -= days;
            m += 1;
            if (m > 12) {
                m = 1;
                y += 1;
            }
        }
    }
    cout << y << " " << m << " " << d << " " << h << "\n";
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
