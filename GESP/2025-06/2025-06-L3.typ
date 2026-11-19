// ===========================================================================
// GESP 2025-06 C++ 三级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-06/2025-06-L3.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 3,
  month: "2025 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 8位二进制原码能表示的最小整数是：（#slot）
  + -127
  + -128
  + -255
  + -256

2. 反码表示中，零的表示形式有：
  + 1种
  + 2种
  + 8种
  + 16种

3. 补码 1011 1011 对应的真值是（#slot）
  + -69
  + -59
  + -68
  + -58

4. 若X的8位补码为 0000 1010，则 X/2 的补码是（#slot）。
  + 0000 0101
  + 1000 0101
  + 0000 0101 或 1000 0101
  + 算术右移后结果取决于符号位

5. 二进制数 1101.101 对应的十进制数是（#slot）
  + 13.625
  + 12.75
  + 11.875
  + 14.5

6. 补码加法中，若符号位无进位而次高位有进位，则说明（#slot）
  + 结果正确
  + 发生上溢
  + 发生下溢
  + 结果符号位错误

7. 八进制数 35.6 对应的十进制数是（#slot）
  + 29.75
  + 28.5
  + 27.625
  + 30.25

8. 二进制数 1010 | 1100 的结果是（#slot）
  + 1000
  + 1110
  + 1010
  + 1100

9. 以下哪个位运算可以交换两个变量的值（无需临时变量）（#slot）

  ```cpp
  a = a ^ b; b = a ^ b; a = a ^ b;
  a = a & b; b = a | b; a = a & b;
  a = a | b; b = a ^ b; a = a ^ b;
  a = ~a; b = ~b; a = ~a;
  ```

10. 如何正确定义一个长度为5的整型数组（#slot）

  ```cpp
  int array = new int[5];
  int[] array = {1,2,3,4,5};
  ```
  + array int[5];
  + int array[5];

11. 以下程序使用枚举法（穷举法）求解满足条件的三位数，横线处应该填入的是（#slot）

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int count = 0;
      for (int i = 100; i <= 999; i++) {
          int a = i / 100;
          ————————————————————
          int c = i % 10;
          if (a * a + b * b == c * c) {
              count++;
          }
      }
      cout << count << endl;
      return 0;
  }
  int b = (i / 10) / 10;
  int b = (i / 10) % 10;
  int b = (i % 10) / 10;
  int b = (i % 10) % 10;
  ```

12. 以下程序模拟了一个简单的小球反弹过程，横线处应该填入的是（#slot）

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int height = 10;
      int distance = 0;
      for (int i = 1; i <= 5; i++) { // 模拟5次落地
          ——————————————————————
          height /= 2;
          distance += height;
      }
      cout << distance << endl;
      return 0;
  }
  distance += height/2;
  distance += height;
  distance += height*2;
  distance += height+1;
  ```

13. C++代码string s = "GESP考试";，s占据的字节数是（#slot）
  + 10
  + 8
  + 8或10
  + 取决于计算机采用什么编码

14. C++语句string s="Gesp Test";执行s.rfind("e")以后,输出的是（#slot）
  + 1
  + 2
  + 6
  + 3

15. 字符串"Gesp考试",字符数是（#slot）
  + 10
  + 8
  + 6
  + 字符数多少取决于编码

= 判断题（每题 2 分，共 20 分）

1. C++中string的==运算符比较的是字符串的内存地址，而非内容

2. string的substr(1, 3)返回从下标1开始的3个字符的子串。

3. x是浮点数，(x \>\> 1)等价于x / 2

4. string("hello") == "hello"的比较结果为true。

5. sort可以直接用于排序set中的元素。

6. (x & 1) == 0可以判断整数x是否为偶数。

7. string的substr(2, 10)在字符串长度不足时会抛出异常。

8. 在数学纸面计算中，pow(2, 3)的计算结果一定是8，但是在C++中，如果遇到数据类型是浮点数，那就不一定正确。

9. 在 C++ 中，枚举的底层类型可以是非整型（如float或double）。

10. 函数声明double f（#slot）;返回int时，会自动转换为double

= 编程题（每题 25 分，共 50 分）

== 编程题 1：奇偶校验

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

数据在传输过程中可能出错，因此接收方收到数据后通常会校验传输的数据是否正确，奇偶校验是经典的校验方式之一。给定$n$个非负整数$c_1, c_2, dots.h , c_n$代表所传输的数据，它们的校验码取决于这些整数在二进制下$1$的数量之和的奇偶性。如果这些整数在二进制下共有奇数个$1$，那么校验码为$1$；否则校验码为$0$。你能求出这些整数的校验码吗？

=== 输入格式

第一行，一个正整数$n$，表示所传输的数据量。第二行，$n$个非负整数$c_1, c_2, dots.h , c_n$，表示所传输的数据。

=== 输出格式

输出一行，两个整数，以一个空格分隔：第一个整数表示$c_1, c_2, dots.h , c_n$在二进制下$1$的总数量；第二个整数表示校验码（0或1）。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4
71 69 83 80
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
13 1
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
6
1 2 4 8 16 32
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
6 0
```

=== 数据范围

对于所有测试点，保证，。

=== 参考程序

```cpp
#include <cstdio>
using namespace std;
int n, v;
int main() {
    scanf("%d", &n);
    for (int i = 1; i <= n; i++) {
        int c;
        scanf("%d", &c);
        while (c) {
            v += c & 1;
            c >>= 1;
        }
    }
    printf("%d %d\n", v, v & 1);
    return 0;
}
```

== 编程题 2：分糖果

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

有$n$位小朋友排成一队等待老师分糖果。第$i$位小朋友想要至少$a_i$颗糖果，并且分给他的糖果数量必须比分给前一位小朋友的糖果数量更多，不然他就会不开心。老师想知道至少需要准备多少颗糖果才能让所有小朋友都开心。你能帮帮老师吗？

=== 输入格式

第一行，一个正整数$n$，表示小朋友的人数。第二行，$n$个正整数$a_1, a_2, dots.h , a_n$，依次表示每位小朋友至少需要的糖果数量。

=== 输出格式

输出一行，一个整数，表示最少需要准备的糖果数量。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4
1 4 3 3
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
16
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
15
314 15926 53589793 238462643 383279502 8 8 4 1 9 7 1 6 9 3
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
4508143253
```

=== 数据范围

对于所有测试点，保证，。

=== 参考程序

```cpp
#include <cstdio>
#include <algorithm>
using namespace std;
const int N = 1005;
int n, a[N];
long long ans;
int main() {
    scanf("%d", &n);
    for (int i = 1; i <= n; i++) {
        scanf("%d", &a[i]);
        a[i] = max(a[i - 1] + 1, a[i]);
        ans += a[i];
    }
    printf("%lld\n", ans);
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
