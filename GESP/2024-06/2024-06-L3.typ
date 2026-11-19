// ===========================================================================
// GESP 2024-06 C++ 三级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-06/2024-06-L3.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 3,
  month: "2024 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 小杨父母带他到某培训机构给他报名参加CCF组织的GESP认证考试的第1级，那他可以选择的认证语言有（#slot）种。
  + 1
  + 2
  + 3
  + 4

2. 下面流程图在yr输入2024时，可以判定yr代表闰年，并输出2月是29天，则图中菱形框中应该填入（#slot）。

  ```cpp
  (yr%400==0) || (yr%4==0)
  (yr%400==0) || (yr%4==0 && yr%100!=0)
  (yr%400==0) && (yr%4==0)
  (yr%400==0) && (yr%4==0 && yr%100!=0)
  ```

3. 一般默认64位计算机系统中整型变量（int）还是32位，则整数能够表示的数据范围是（#slot）。
  + ～
  + ～
  + ～
  + ～

4. 下列代码将十进制转化成八进制，则横线上应填入（#slot）。

  ```cpp
  #include <iostream>
  using namespace  std;
  void decimal2octal(int decimal) {
      int oct_number[100];
      int i = 0;
      while (decimal > 0) {
          __________________________   //在此处填入代码
      }
      for (int j = i - 1; j >= 0; j--) {
          cout << oct_number[j];
      }
      cout << endl;
  }
  oct_number[i] = decimal % 8;    decimal /= 8;
  oct_number[i] = decimal / 8;    decimal %/= 8;
  oct_number[i++] = decimal % 8;    decimal /= 8;
  oct_number[i++] = decimal / 8;    decimal %= 8;
  ```

5. 二进制数101.11对应的十进制数是（#slot）。
  + 6.5
  + 5.5
  + 5.75
  + 5.25

6. 下列流程图的输出结果是（#slot）。
  + 5
  + 10
  + 20
  + 30

7. 下列代码的输出结果是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int a = 12;
      int result = a >> 2;
      cout << result << endl;
      return 0;
  }
  ```
  + 12
  + 6
  + 3
  + 1

8. 下列代码的输出结果是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int a = 5;
      int b = 10;
      a = a ^ b;
      b = a ^ b;
      a = a ^ b;
      cout << "a = " << a << ", b = " << b << endl;
      return 0;
  }
  ```
  + a = 5, b = 10
  + a = 5, b = 5
  + a = 10, b = 5
  + a = 10, b = 10

9. 如果字符串定义为char str[] = "GESP";，则字符数组str的长度为（#slot）。
  + 0
  + 4
  + 5
  + 6

10. 在下列代码的横线处填写（#slot），可以使得输出是“7”。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int array[5] = {3  7  5  2  4};
      int max = 0;
      for(int i=0; i<5; i++)
          if(______________)  // 在此处填入代码
              max = array[i];
      cout << max << endl;
      return 0;
  }
  ```
  + max \> array[i]
  + max \< array[i]
  + max = array[i]
  + 以上均不对

11. 小杨在做数学题，题目要求找出从1到35中能被7整除的数字，即[7, 14, 21, 28, 35]，则横线处应填入哪个代码？（#slot）

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int arr[35];
      int count = 0;
      for (int i = 1; i <= 35; i++) {
          if (i % 7 == 0)
              __________________________  // 在此处填入代码
      }
      for (int i = 0; i < count; i++)
          cout << arr[i] << endl;
      return 0;
  }
  arr[count] = count++;
  ```
  + arr[count++] = i;
  + arr[i] = count++;
  + arr[i] = count;

12. 已知字符 '0' 的ASCII编码的十进制表示为48，则执行下面C++代码后，输出是（#slot）。

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      string s = "0629";
      int n = s.length();
      int x = 0;
      for(int i = 0; i < n; i++)
          x += s[i];
      cout << x << endl;
      return 0;
  }
  ```
  + 17
  + 158
  + 209
  + 316

13. 某小学男子篮球队招募新成员，要求加入球队的成员身高在135厘米以上（不含135厘米）。本次报名的人员有10人，他们的身高分别是125、127、136、134、137、138、126、135、140、145。完善以下代码，求出本次球队能够招募到新成员的人数？（#slot）

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int arr[10] = {125, 127, 136, 134, 137, 138, 126, 135, 140, 145};
      int count = 0;
      for(int i=0; i<10; i++)
          __________________________  // 在此处填入代码
      cout << count << endl;
      return 0;
  }
  count = arr[i]>135? 1: 0;
  count += arr[i]>135? 1: 0;
  ```
  + count++;
  + 以上都不对

14. 下面可以正确输出They're planning a party for their friend's birthday.的C++语句是？（#slot）

  ```cpp
  cout << 'They\'re planning a party for their friend'\s birthday." << endl;
  cout << "They\'re planning a party for their friend's birthday.'<< endl;
  cout << 'They're planning a party for their friend's birthday.'<< endl;
  cout << "They\'re planning a party for their friend\'s birthday." << endl;
  ```

15. 如果执行下面C++代码后，输出的结果是“gesp ccf org cn ”，则横线上应填入哪个代码？（#slot）

  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      string str = "gesp.ccf.org.cn";
      string delimiter = ".";
      string result="";
      string token;
      size_t found = str.find(delimiter);
      while (found != string::npos)  {
          token = str.substr(0, found);
          result += token;
          result += " ";
          __________________________  // 在此处填入代码
          found = str.find(delimiter);
      }
      //最后一部分
      result += str;
          result += " ";
      cout << result << endl;
      return 0;
  }
  str = str.substr(found + delimiter.length(), str.length() - 1);
  str = str.substr(found, str.length() );
  str = str.substr(found, str.length() -1);
  ```
  + 以上都不对

= 判断题（每题 2 分，共 20 分）

1. GESP测试是对认证者的编程能力进行等级认证，同一级别的能力基本上与编程语言无关。

2. 整数-6的16位补码可用十六进制表示为FFFA。

3. 补码的优点是可以将减法运算转化为加法运算，从而简化计算机的硬件设计。

4. 字符常量'\\0'常用来表示字符串结束，和字符常量'0'相同。

5. 数组的所有元素在内存中可以不连续存放。

6. C++中可以对数组和数组的每个基础类型的元素赋值。

7. 如果 为int类型的变量，且表达式((a | 3) == 3)的值为true，则说明#(math-missing)在从0到3之间（可能为0、可能为3）。

8. 执行下面C++代码后，输出的结果是8。

  ```cpp
  int a = 0b1010;
  int b = 01100;
  int c = a & b;
  cout << c <<endl;
  ```

9. 执行下面C++代码后，输出的结果不可能是89781。（#slot）

  ```cpp
  #include <iostream>
  #include <cstdlib>  // 为了使用 rand() 和 srand()
  #include <ctime>    // 为了使用 time()
  using namespace std;
  int main() {
      // 设置随机种子
      srand(time(NULL));
      int i = 1;
      int s[5];
      while(i <= 5)
      {
          int a = rand() % 10;
          if(a % 3 == (i + 1) % 3)
              s[i++] = a;
      }
      for(int i = 1; i <= 5; i++)
          cout << s[i];
      cout << endl;
      return 0;
  }
  ```

10. 把整数3025从中剪开分为30和25两个数，此时再将这两数之和平方，计算结果又等于原数。(30 + 25) × (30 + 25) = 55 × 55 = 3025，这样的数叫“雷劈数”。可以使用枚举的方法求出所有符合这样条件的四位数。（#slot）

= 编程题（每题 25 分，共 50 分）

== 编程题 1：移位

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨学习了加密技术移位，所有大写字母都向后按照一个固定数目进行偏移。偏移过程会将字母表视作首尾相接的环，例如，当偏移量是3的时候，大写字母 A 会替换成 D，大写字母 Z 会替换成 C，总体来看，大写字母表ABCDEFGHIJKLMNOPQRSTUVWXYZ 会被替换成 DEFGHIJKLMNOPQRSTUVWXYZABC。注：当偏移量是26的倍数时，每个大写字母经过偏移后会恰好回到原来的位置，即大写字母表ABCDEFGHIJKLMNOPQRSTUVWXYZ 经过偏移后会保持不变。

=== 输入格式

第一行包含一个正整数$n$。

=== 输出格式

输出在偏移量为$n$的情况下，大写字母表 ABCDEFGHIJKLMNOPQRSTUVWXYZ 移位替换后的结果。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
DEFGHIJKLMNOPQRSTUVWXYZABC
```

=== 数据范围

对于全部数据，保证有$1 <= n <= 100$。

=== 提示

当偏移量是3的时候，大写字母 A 会替换成 D，大写字母 Z 会替换成 C，总体来看，大写字母表ABCDEFGHIJKLMNOPQRSTUVWXYZ 会被替换成 DEFGHIJKLMNOPQRSTUVWXYZABC。

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
int main(){
    int n;
    cin>>n;
    int fl=0;
    for(int i=0;i<26;i++){
        int j = (i+n)%26;
        char ch = 'A'+j;
        cout<<ch;
    }
    cout<<"\n";
}
```

== 编程题 2：寻找倍数

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有一个包含$n$个正整数的序列$A = [a_1, a_2, dots.h , a_n]$，他想知道是否存在$i (1 <= i <= n)$（#slot） 使得$a_i$是序列$A$中所有数的倍数。

=== 输入格式

第一行包含一个正整数$t$，代表测试用例组数。接下来是$t$组测试用例。对于每组测试用例，一共两行。其中，第一行包含一个正整数$n$；第二行包含$n$个正整数，代表序列$A$。

=== 输出格式

对于每组测试用例，如果存在$i(1 <= i <= n)$（#slot）满足对于所有$k(1 <= k <= n)a_i$（#slot） 是$a_k$的倍数，输出 Yes，否则输出 No。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
2
3
1 2 4
5
1 2 3 4 5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
Yes
No
```

=== 数据范围

对于全部数据，保证有$1 <= t <= 10, 1 <= n <= 10^5, 1 <= a_i <= 10^9$。

=== 提示

对于第一组数据，对于$a_3=4$，满足$a_3$是$a_1$和$a_2$的倍数。

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
const int N = 1e5+10;
int a[N];
int main(){
    int t;
    cin>>t;
    while(t--){
        int n;
        cin>>n;
        int x = 0;
        for(int i=1;i<=n;i++){
            cin>>a[i];
            x =max(x,a[i]);
        }
        int fl = 0;
        for(int i=1;i<=n;i++){
            if(x%a[i])fl=1;
        }
        if(fl)cout<<"No\n";
        else cout<<"Yes\n";
    }
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
