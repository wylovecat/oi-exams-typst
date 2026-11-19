// ===========================================================================
// GESP 2026-09 C++ 三级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2026-09/2026-09-L3.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 3,
  month: "2026 年 09 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 关于计算机的数据编码，下面说法不正确的是（#slot）。
  + 数字$5$，不管采用原码、反码、补码，它的 8 位二进制形式都是$(00000101)_2$。
  + 计算机科学中，单位换算默认1KB = 1024B，而非$1000upright("B")$。
  + 原码是最直观的一种有符号数表示方法。
  + 反码运算中，最高位进位要抛掉。

2. 关于进制转换，下面说法不正确的是（#slot）
  + 数字$1101B$可以分解为：（十进制）
  + 数字$42Q$可以分解为：（十进制）
  + 数字2BEH可以分解为：（十进制）
  + （通常写作E3H）

3. 下面程序的运行结果是（#slot）

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int x = 1;
      for (int i = 0; i = 0; i <= 5) {
          x++;
      }
      cout << x << endl;
      return 0;
  }
  ```
  + 1
  + 10
  + 15
  + 程序编译错误1 / 10

4. 关于计算机编码中补码，下面说法错误的是（#slot）。
  + 正数的补码：与其原码、反码相同。
  + 负数的补码：将其对应的正数的原码按位取反（得到反码），然后加$1$。
  + 8 位的补码，最大表示数据是$128$，最小表示数据是$-128$。
  + 负数的补码，从右往左扫描正数的二进制形式，遇到第一个$1$之后，左边的所有位都取反。

5. 下面程序执行的结果是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int x = 2026;
      int count = 0;
      while (x > 0) {
          count++;
          x = x & (x - 1);
      }
      cout << count << endl;
  }
  ```
  + 2026
  + 8
  + 16
  + 32

6. 关于位运算，下列说法错误的是（#slot）。
  + 找唯一数：数组中唯一出现一次的数，其余出现两次，全部异或结果即为该数。例子：数组[5, 7, 9, 7, 5]（唯一数是9）
  + 若左移导致高位溢出（如超过整型范围），结果不再符合乘法规律。
  + 有符号整数左移溢出时结果确定。
  + $n+2$位二进制数A\_1A\_2… A\_n00，一定是$4$的倍数（最后两位$00$是二进制的$00$）。

7. 计算3 & 7 | 15 ^ ～11（a=3, b=7, c=15, d=11）：（#slot）。
  + -9
  + -1
  + -7
  + -5

8. 下面函数是一个加密解密的函数，横线处应该填入的程序段是（#slot）。2 / 10

  ```cpp
  #include <iostream>
  #include <string>
  using namespace std;
  int main() {
      int key;
      cin >> key;
      string msg = "Hello GESP";
      cout << msg << endl;
      for (int i = 0; i < msg.size(); i++) {
          msg[i] = msg[i] ^ key;
      }
      cout << msg << endl;
      _________________________________
      cout << msg << endl;
      return 0;
  }
  ```
  + ```cpp
    for (int i = 0; i < msg.size(); i++) {
        msg[i] = msg[i] | key;
    }
    ```
  + ```cpp
    for (int i = 0; i < msg.size(); i++) {
        msg[i] = msg[i] >> key;
    }
    ```
  + ```cpp
    for (int i = 0; i < msg.size(); i++) {
        msg[i] = msg[i] ^ key;
    }
    ```
  + ```cpp
    for (int i = 0; i < msg.size(); i++) {
        msg[i] = msg[i] & key;
    }
    ```

9. 下列程序是分别判断输入的N个数是否可能是二进制、八进制、十进制、十六进制，横线处应该填入的是（#slot）3 / 10

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int n = 0;
      cin >> n;
      for (int i = 0; i < n; i++) {
          char str[11];
          cin >> str;
          char max = '0';
          for (int i = 0; str[i] != '\0'; i++)
              if (str[i] > max)
                  max = str[i];
          _____________________________
      }
      return 0;
  }
      cout << (max <= '1') << " " << (max <= '7') << " " << (max <= '9') << " " << (max <=
  'F') << endl;
      cout << (max <= 1) << " " << (max <= 7) << " " << (max <= 9) << " " << (max <= 'F') <<
  endl;
      cout << (max <= 1) << " " << (max <= 7) << " " << (max <= 9) << " " << (max <= F) <<
  endl;
      cout << (max >= 1) << " " << (max >= 7) << " " << (max >= 9) << " " << (max >= F) <<
  endl;
  ```

10. 下面的程序是位掩码技术实现权限的组合管理。首先定义四个权限常量，分别对应读、写、修改、删除，每个权限占用整数的一个独立二进制位。初始化权限掩码mask为0，代表没有任何权限。如果想实现如下的操作：添加读权限；添加写权限；清除读权限，其他位不变；添加删除权限。则横线处应该填入的是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      const int READ = 1 << 0;
      const int WRITE = 1 << 1;
      const int MODIFY = 1 << 2;
      const int DELETE_ = 1 << 3;
      int mask = 0;
      __________________________
      return 0;
  }
  mask = mask | READ;
  mask = mask | WRITE;
  mask = mask & (~READ);
  mask = mask | DELETE_;
  mask = mask & READ;
  mask = mask & WRITE;
  mask = mask | (~READ);
  mask = mask & DELETE_;
  mask = mask | READ;
  mask = mask | WRITE;
  mask = mask | (~READ);
  mask = mask | DELETE_;
  ```
  + num \>\> 1，对于正整数，等价于对 num 做整数除以 2，向下取整
  + 第11题 下面选项中提到的变量都是正整数，关于位运算，下面说法错误的是（#slot）。
  + ```cpp
    mask = mask | READ;
    mask = mask & WRITE;
    mask = mask & (~READ);
    mask = mask | DELETE_;
    ```
  + 若 num 右移时低位被移出丢弃，结果一定符合除法数学规律

11. 下面选项中提到的变量都是正整数，关于位运算，下面说法错误的是（#slot）。
  + num \>\> 1，对于正整数，等价于对num做整数除以$2$，向下取整
  + num | 0x0F，可以把num的低 4 位全部置为1，高位保持不变4 / 10
  + num ^ num的结果一定等于0
  + 若num右移时低位被移出丢弃，结果一定符合除法数学规律

12. 已知：a=0, b=2, c=11, d=7, e=5，表达式!a & b \<\< c ^ d | e的结果是（#slot）
  + 5
  + 13
  + 7
  + 28

13. 关于string的成员函数，下面说法错误的是（#slot）
  + size（#slot）返回字符串的字符个数，不包含末尾的'\\0'；length（#slot）和size（#slot）功能完全等价
  + s.empty（#slot）：字符串为空时返回true，字符串不为空返回false
  + s.substr(pos, len)，当省略第二个参数len时，代表从pos位置一直截取到字符串末尾
  + s.erase(2)表示删除字符串中下标为 2 的这一个字符

14. 以下数组定义，符合 C++ 语法的是（#slot）

  ```cpp
  int a[] = {1, 2, 3.0};
  ```
  + int b['A'];
  + int c[ ];
  + float d[10.0];

15. 三进制有个奇妙的应用，有 1000 个酒缸，恰好 1 缸有毒。毒酒喝下后 24 小时毒发死亡；无毒酒无影响。总共有 48 小时，可以做两轮实验，每轮可以重新安排老鼠喝酒。有三种情况，这只老鼠两轮都不喝这缸酒；这只老鼠第一轮喝这缸酒；这只老鼠第二轮喝这缸酒，要保证找出毒酒，最少需要多少只老鼠？（#slot）
  + 5
  + 13
  + 7
  + 28

= 判断题（每题 2 分，共 20 分）

1. 对于计算机编码运算，补码做加法运算时，如果最高位产生进位，需要把该进位循环加到结果的最低位。

2. 求$-13$的补码，可以对正数$13$的二进制，从右向左扫描，遇到第一个$1$之后，右边所有位全部取反，左边保持不变。

3. 一个 8 位二进制原码表示的有符号数，可表示的数值范围是$-128$到$+127$。

4. 这段代码执行后，能够将数组中所有大于0的元素赋值为0。5 / 10

  ```cpp
  int a[] = {2, -5, 7, 0, -1};
  int n = sizeof(a) / sizeof(a[0]);
  for (int num : a) {
      if (num > 0) {
          num = 0;
      }
  }
  ```

5. a是int有符号整型，若(a & 1) == 1结果为true，则a一定是正奇数。

6. char str[4] = "GESP";将在内存空间中给str[4]分配5个字节。

7. 判断字符串中字符是否是'0'或者'1'，可以写条件：if(str[i]==0 || str[i]==1)。

8. 下面程序执行后，将输出98。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int a = 'a', b = 'b';
      if (a > 0 || b++ > 0) {
      }
      cout << b;
  }
  ```

9. 枚举可以在保证不漏解的前提下缩小枚举范围，不是必须遍历全部。6 / 10

10. 下面流程图逻辑：初始化$upright("sum") arrow.l 0$，$i arrow.l 0$；当$i < n$成立时，执行$upright("sum") arrow.l upright("sum") + a[i]$，再执行$i arrow.l i + 1$；循环结束输出sum。该流程图可以正确计算一维数组a[0]∼a[n]全部元素的总和。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：公共二进制位

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小红有$n$个非负整数$a_1, a_2, dots.h , a_n$。她将每个整数转换为二进制后，想知道有多少个二进制位在所有整数中均为$1$。二进制位从右向左编号为$0,1,2,$。若某个整数的二进制表示中没有第$k$位，则认为它的第$k$位为$0$。请你求出满足条件的二进制位数量。3.1.2 输 格式入第一行一个整数$n$，表示整数的个数。第二行$n$个非负整数$a_1, a_2, dots.h , a_n$。7 / 10

=== 输出格式

输出一个整数，表示所有整数的二进制表示中均为$1$的二进制位数量。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
13 7 15
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
2
```

=== 数据范围

，。

=== 提示

三个整数的二进制表示分别为$(1101)_2$、$(0111)_2$和$(1111)_2$。其中第$0$位和第$2$位均为$1$，因此答案为$2$。

=== 参考程序

```cpp
#include <iostream>
using namespace std;
int a[20010];
int main() {
    int n;
    cin >> n;
    for (int i = 0; i < n; ++i)
        cin >> a[i];
    int S = a[0];
    for (int i = 1; i < n; ++i)
        S &= a[i];
    int ans = 0;
    while (S > 0) {
        if (S & 1) ans++;
        S >>= 1;
    }
    cout << ans;
    return 0;
}
```

== 编程题 2：分割字符串

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小明拿到了一段字符串文本，小明希望用下面的规则分割这个字符串：8 / 101. 小明从左到右扫描字符串，遇到第一个空格后停止，并将字符串分割为左右两个部分（舍弃用于分割的这个空格）；2. 对于上次分割后右侧的字符串，小明继续扫描，第一次遇到连续两个空格后停止，并将字符串分割为左右两个部分（舍弃用于分割的这两个空格）；3. 对于上次分割后右侧的字符串，小明继续扫描，第一次遇到连续三个空格后停止，并将字符串分割为左右两个部分（舍弃用于分割的这三个空格）；4. 以此类推，小明每分割一次，下一次分割就需要更长的连续空格；直到字符串无法再次分割。最后输出每次分割的左侧的字符串，以及最后一次分割的右侧字符串。如果字符串完全无法进行任何一次分割，直接输出其本身。3.2.2 输 格式入输入一行，一个字符串。

=== 输出格式

输出若干行。每行为分割后的一个字符串，注意依次输出：第一次分割左侧的字符串，第二次分割左侧的字符串，...，最后一次分割左侧的字符串，最后一次分割右侧的字符串。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
sdfd 55 55   99312
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
sdfd
55 55
 99312
```

=== 数据范围

字符串长度不超过$1000$，字符串中只包含大写字母、小写字母，数字，或空格，且输入字符串不会以空格结尾。特别强调：输入仅一行，但可能包含若干空格

=== 提示

1. 第一次分割将字符串分割为sdfd和55 55   99312；2. 第二次分割将字符串分割为55 55和 99312。对于第二次分割，注意55和55之间虽然有空格，但是第二次分割需要连续两个空格才行；另外，55 55和99312之间有三个空格，第二次分割只需要两个，所以会分割为55 55和 99312，也就是右侧会留下一个空格；因为只留下了一个空格，所以不再满足第三次分割要求。3.2.8 输 样例 2入9 / 101. 第一次分割将字符串分割为AbCd和  999；2. 第二次分割将字符串分割为#(math-missing)空字符串#(math-missing)和999。由于AbCd和999之间有三个空格，第一次分割消耗掉一个，因此还能进行第二次分割，这个时候会分割出空字符串，因此输出中会输出一个空行（不能省略）。

=== 参考程序

```cpp
#include <iostream>
#include <string>
using namespace std;
int main() {
    string s = "";
    getline(cin, s);
    for (int k = 1;; ++k) {
        string spaces = "";
        for (int i = 0; i < k; ++i) {
            spaces += " ";
        }
        int pos = s.find(spaces);
        if (pos < 0 || pos >= s.size()) break;
        for (int i = 0; i < pos; ++i) {
            cout << s[i];
        }
        cout << endl;
        string rest = "";
        for (int i = pos + k; i < s.length(); ++i) {
            rest += s[i];
        }
        s = rest;
    }
    cout << s << endl;
    return 0;
}10 / 10
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
