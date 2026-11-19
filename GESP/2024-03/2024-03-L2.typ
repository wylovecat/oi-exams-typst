// ===========================================================================
// GESP 2024-03 C++ 二级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-03/2024-03-L2.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 2,
  month: "2024 年 03 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 下列流程图的输出结果是？（#slot）
  + 优秀
  + 良好
  + 不及格
  + 没有输出

2. 以下选项中不符合 C++变量命名规则的是？（#slot）
  + student
  + 2\_from
  + \_to
  + Text

3. 以下选项中，不能用于表示分支结构的C++保留字是？（#slot）
  + switch
  + return
  + else
  + if

4. 下列说法错误的是？（#slot）
  + while循环满足循环条件时不断地运行，直到指定的条件不满足为止
  + if语句通常用于执行条件判断
  + 在C++中可以使用foreach循环
  + break和continue语句都可以用在for循环和while循环中

5. 下列4个表达式中，答案不是整数8的是？（#slot）
  + abs(-8)
  + min(max(8, 9), 10)
  + int(8.88)
  + sqrt(64)

6. 下面C++代码执行后的输出是？（#slot）

  ```cpp
  int n,a,m,i;
  n=3, a = 5;
  m = (a - 1) * 2;
  for (i=0; i<n-1; i++)
      m = (m - 1) * 2;
  cout << m;
  ```
  + 8
  + 14
  + 26
  + 50

7. 下面C++代码执行后的输出是？（#slot）

  ```cpp
  int n,i,result;
  n = 81;
  i = 1, result = 1;
  while (i * i <= n){
      if (n % (i * i) == 0)
          result = i * i;
      i += 1;
  }
  cout << result;
  ```
  + 16
  + 36
  + 49
  + 81

8. 下面C++代码执行后的输出是？（#slot）

  ```cpp
  int s,t,ans;
  s = 2, t = 10;
  ans = 0;
  while (s != t){
      if (t % 2 == 0 && t / 2 >= s)
          t /= 2;
      else
          t -= 1;
      ans += 1;
  }
  cout << ans;
  ```
  + 2
  + 3
  + 4
  + 5

9. 下面C++代码执行后的输出是？（#slot）

  ```cpp
  int n, masks, days,cur;
  n = 17, masks = 10, days = 0;
  cur = 2;
  while (masks != n){
      if (cur == 0 || cur == 1)
          masks += 7;
      masks -= 1;
      days += 1;
      cur = (cur + 1) % 7;
  }
  cout << days;
  ```
  + 5
  + 6
  + 7
  + 8

10. 以下C++代码判断一个正整数N的各个数位是否都是偶数。如果都是，则输出“是”，否则输出“否”。例如N=2024时输出“是”。则横线处应填入（#slot）。

  ```cpp
  int N,Flag;
  cin >> N;
  Flag = true;
  while (N != 0){
      if (N %2 != 0){
          Flag = false;
          _____________
      }
      else
          N /= 10;
  }
  if(Flag == true)
      cout << "是";
  else
      cout << "否";
  ```
  + break
  + continue
  + N = N / 10
  + N = N % 10

11. 有句俗话叫“三天打渔，两天晒网”。如果小杨前三天打渔，后两天晒网，一直重复这个过程，以下程序代码用于判断，第n天小杨是在打鱼还是晒网，横线处应填写？（#slot）

  ```cpp
  int n,i;
  cin >> n;
  i = n % 5;
  if (__________________) // 在此处填写代码
      cout << "晒网";
  else
      cout << "打鱼";
  ```
  + i == 0
  + i == 4
  + i == 0 && i == 4
  + i == 0 || i == 4

12. 一个数的所有数字倒序排列后这个数的大小保持不变，这个数就是回文数，比如 101 与 6886 都是回文数，而 100 不是回文数。以下程序代码用于判断一个数是否为回文数，横线处应填写？（#slot）

  ```cpp
  int n,a,k;
  cin >> n;
  a = 0;
  k = n;
  while (n > 0){
      a = __________;  // 在此处填写代码
      n /= 10;
  }
  if (a == k)
      cout << "是回文数";
  else
      cout << "不是回文数";
  ```
  + 10 \* a + n % 10
  + a + n % 10
  + 10 \* a + n / 10
  + a + n / 10

13. 给定两个整数$n$与$k$，打印出一个栅栏图形，这个栅栏应该分成#(math-missing)段，段与段之间的间隔为+，#(math-missing)段内的填充为#(math-missing)个-。形如，#(math-missing)时，图形如下：以下程序代码用于绘制该图形，横线处应填写？（#slot）

  ```cpp
  +------+------+------+------+------+
  int n, k, i, j;
  n = 5, k = 6;
  for (i = 0; i < n; i++){
       __________ // 在此处填写代码
       for (j = 1; j < k; j++)
       cout << '-' ;
  }
  cout << '+';
  cout << '+' << endl;
  cout << '+' << ' ' << endl;
  cout << '+' << ' ';
  ```
  + cout \<\< '+';

14. 小杨的父母最近刚刚给他买了一块华为手表，他说手表上跑的是鸿蒙，这个鸿蒙是。（#slot）
  + 小程序
  + 计时器
  + 操作系统
  + 神话人物

15. 中国计算机学会（CCF）在2024年1月27日的颁奖典礼上颁布了王选奖，王选先生的重大贡献是（#slot）。
  + 制造自动驾驶汽车
  + 创立培训学校
  + 发明汉字激光照排系统
  + 成立方正公司

= 判断题（每题 2 分，共 20 分）

1. 如果有以下C++代码：

  ```cpp
  double s;
  int t;
  s = 18.5;
  t = int(s) + 10;
  那么cout << t的结果为28.5。
  ```

2. Xyz，xYz，xyZ是三个不同的变量。

3. cout \<\< (8\< 9\< 10)的输出结果为true。

4. for (i = 0; i \< 100; i+=2) ;语句中变量i的取值范围是0到99。

5. C++中cout \<\< float(2022)与cout \<\< float('2022')运行后的输出结果均为2022。

6. 已知A的ASCII码值为65，表达式int('C')+abs(-5.8)的值为72.8。

7. bool（#slot）函数用于将给定参数或表达式转换为布尔类型。语句bool(-1)返回的是false值。（#slot）

8. 如果变量a的值使得C++表达式sqrt(a)==abs(a)，则a的值为0。（#slot）

9. 小杨今年春节回奶奶家了，奶奶家的数字电视要设置ip地址并接入到WIFI盒子才能收看节目，那这个WIFI盒子具有路由器的功能。（#slot）

10. 任何一个for循环都可以转化为等价的while循环（#slot）。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：乘法问题

=== 题目描述

小 A 最近刚刚学习了乘法，为了帮助他练习，我们给他若干个正整数，并要求他将这些数乘起来。对于大部分题目，小 A 可以精准地算出答案，不过，如果这些数的乘积超过$10^6$，小 A 就不会做了。请你写一个程序，告诉我们小 A 会如何作答。

=== 输入格式

第一行一个整数$n$，表示正整数的个数。接下来$n$行，每行一个整数$a$。小 A 需要将所有的$a$乘起来。保证，。

=== 输出格式

输出一行，如果乘积超过$10^6$，则输出\>1000000；否则输出所有数的乘积。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
2
3
5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
15
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
3
100
100
100
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
1000000
```

#text(size: 12pt, weight: "bold")[输入样例 3]

```text
4
100
100
100
2
```

#text(size: 12pt, weight: "bold")[输出样例 3]

```text
>1000000
```

=== 提示

在常规程序中，输入、输出时提供提示是好习惯。但在本场考试中，由于系统限定，请不要在输入、输出中附带任何提示信息。

=== 参考程序

```cpp
#include <iostream>
using namespace std;
int main() {
    int n;
    cin >> n;
    long long product = 1;
    for (int i = 0; i < n; ++i) {
        int a;
        cin >> a;
        if (product * a > 1000000) {
            cout << ">1000000" << endl;
            return 0;
        }
        product *= a;
    }
    cout << product << endl;
    return 0;
}
```

== 编程题 2：小杨的日字矩阵

=== 题目描述

小杨想要构造一个$N times N$的日字矩阵（$N$为奇数），具体来说，这个矩阵共有$N$行，每行$N$个字符，其中最左列、最右列都是|，而第一行、最后一行、以及中间一行（即第$frac(N+1, 2)$行）的第$2 tilde.op N-1$个字符都是-，其余所有字符都是半角小写字母x。例如，一个#(math-missing)的日字矩阵如下：请你帮小杨根据给定的$N$打印出对应的“日字矩阵”。

=== 输入格式

一行一个整数$N$（$5 <= N <= 49$，保证$N$为奇数）。

=== 输出格式

输出对应的“日字矩阵”。请严格按格式要求输出，不要擅自添加任何空格、标点、空行等任何符号。你应该恰好输出$N$行，每行除了换行符外恰好包含$N$个字符，这些字符要么是-，要么是|，要么是x。你的输出必须和标准答案完全一致才能得分，请在提交前仔细检查。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
|---|
|xxx|
|---|
|xxx|
|---|
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
7
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
|-----|
|xxxxx|
|xxxxx|
|-----|
|xxxxx|
|xxxxx|
|-----|
```

=== 提示

在常规程序中，输入、输出时提供提示是好习惯。但在本场考试中，由于系统限定，请不要在输入、输出中附带任何提示信息。

=== 参考程序

```cpp
#include <iostream>
using namespace std;
int main() {
    int n;
    cin >> n;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            char ch;
            if (j == 0 || j == n - 1) {
                ch = '|';
            } else if (i == 0 || i == n - 1 || i == n / 2) {
                ch = '-';
            } else {
                ch = 'x';
            }
            cout << ch;
        }
        cout << endl;
    }
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
