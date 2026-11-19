// ===========================================================================
// GESP 2024-12 C++ 三级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-12/2024-12-L3.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 3,
  month: "2024 年 12 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 下列二进制表示的十进制数值分别是（#slot）

  ```cpp
  [10000011]原=
  [10000011]补=
  ```
  + -125，-3
  + -3, -125
  + -3，-3
  + -125，-125

2. 关于计算机中的编码，下列说法中错误的是（#slot）
  + 对于无符号数，原码就是真值
  + 正数的反码是其本身
  + 负数的反码和补码是不一样的
  + 负数的反码，在其原码的基础上, 各个位取反

3. 16进制数B2025转换成8进制数是（#slot）
  + 2620045
  + 2004526
  + 729125
  + 2420045

4. 625.625变成二进制是（#slot）。
  + 1001110001.101
  + 101.101
  + 101.1001110001
  + 1001110001.1101

5. 下面逻辑运算中，正确的是（#slot）
  + 5&&3==0
  + 5|3==8
  + 5||3==11
  + 5&3==0001

6. 补码1111 1101进行运算1111 1101\>\>1以后得到的结果是（#slot）
  + 1111 1100
  + -2
  + 1111 1101
  + 1111 1010

7. 下列代码输出的是

  ```cpp
  string s  ="1234@@chenadai";
  string str    ="12345";
  s.replace(1,5,str);
  cout<<s<<endl;
  ```
  + 12345
  + 2345\@
  + 112345chenadai
  + 12345chenadai

8. a|10（a与10都是10进制，且二进制表示最高位为1）运算的结果是（#slot）。
  + 使a的二进制表示从右往左的第二位为1
  + 使a的二进制表示从右往左的第一位为0
  + 使a的二进制表示从右往左第二位为0
  + 使a的二进制表示最高位为0

9. 下列程序输出的是（#slot）

  ```cpp
  string ch="hello";
  if(ch[5]==NULL)
  {
      cout<<"right"<<endl;
  }
  else if (ch[5]=='\0')
  {
      cout<<"wrong"<<endl;
  }
  else
  {
      cout<<"hello"<<endl;
  }
  ```
  + right
  + wrong
  + hello
  + 不能正确执行

10. 下列程序中，假设一个字符占用的内存空间是1，下列程序中，ch占用的内存空间是（#slot）

  ```cpp
  char ch[] = "hello world";
  size_t ret=strlen(ch);
  cout<<ret<<endl;
  ```
  + 11
  + 10
  + 13
  + 12

11. 下列程序最后输出的是（#slot）

  ```cpp
  int a=65;
  cout<<tolower(a)<<endl;
  ```
  + 65
  + A
  + a
  + 97

12. 想要计算从数字n到数字m之间（包含n和m）有多少个数字d出现，下列程序哪个能够实现（#slot）。

  ```cpp
  int n,m,res,d;
  cin >> n >> m>>d;
  for(int i = n+1; i <= m; i++){
      int temp = i;
      while(temp){
          if(temp % 10 == d) res++;
          temp /= 10;
      }
  }
  cout << res << endl;
  return 0;
  ```
  + right
  + ```cpp
    int n,m,res,d;
    cin >> n >> m>>d;
    for(int i = n; i <= m; i++){
        int temp = i;
        while(temp){
            if(temp % 10 = d) res++;
            temp /= 10;
        }
    }
    cout << res << endl;
    return 0;
    ```
  + ```cpp
    int n,m,res=0,d;
    cin >> n >> m>>d;
    for(int i = n; i <= m; i++){
        int temp = i;
        while(temp){
            if(temp % 10 == d) res++;
            temp /= 10;
        }
    }
    cout << res << endl;
    return 0;
    ```
  + ```cpp
    int n,m,res=0,d;
    cin >> n >> m>>d;
    for(int i = n; i <= m; i++){
        while(temp){
            if(temp % 10 == d) res++;
            temp /= 10;
        }
    }
    cout << res << endl;
    return 0;
    ```

13. 兔子五元一只，鸡三元一只，小鸭子一元三只，现在你有一百元要买一百只，兔子、鸡、鸭子，问兔子、鸡、鸭子各买多少只，每种必须至少一只，下列哪个程序能实现。（#slot）。
  + ```cpp
    for(int i = 0; i <= 100; i++){
        for(int j = 0; j <= 100; j++){
            for(int k = 0; k <= 100; k++){
                if(i + j + k == 100 && 25 * i + 10 * j + k == 300)
                    cout << i << " " << j << " " << k << endl;
            }
        }
    }
    ```
  + ```cpp
    for(int i = 0; i <= 100; i++){
        for(int j = 0; j <= 100; j++){
            for(int k = 0; k <= 100; k++){
                if(i + j + k == 100 && 20 * i + 10 * j + k == 300)
                    cout << i << " " << j << " " << k << endl;
            }
        }
    }
    ```
  + ```cpp
    for(int i = 0; i <= 20; i++){
        for(int j = 0; j <= 34; j++){
            for(int k = 0; k <= 20; k++){
                if(i + j + k == 100 && 15 * i + 9 * j + k == 300)
                    cout << i << " " << j << " " << k << endl;
            }
        }
    }
    ```
  + ```cpp
    for(int i = 0; i <= 100; i++){
        for(int j = 0; j <= 100; j++){
            for(int k = 0; k <= 100; k++){
                if(i + j + k == 100 && 15 * i + 9 * j + k == 300)
                    cout << i << " " << j << " " << k << endl;
            }
        }
    }
    ```

14. 求小于等于N的素数的方法中，有一种方法是将所有从2到它本身减1的数都除一遍，如果不能整除，就是素数。下列哪个程序，体现了这种方法（#slot）
  + ```cpp
    if(N >= 3){
    cout<<2<<endl;
    for(int i = 2;i <= N;i ++){
        for(int j = 2;j < i;j ++){
            if(i % j != 0){
                flag = 1;
            }
        }
        if(flag == 0){
            cout<<i<<endl;
        }
        flag = 0;
        }
    }
    ```
  + ```cpp
    if(N >= 2){
    for(int i = 3;i <= N;i ++){
        for(int j = 2;j < i;j ++){
            if(i % j == 0){
                flag = 1;
            }
        }
        if(flag == 0){
            cout<<i<<endl;
        }
        flag = 0;
        }
    }
    ```
  + ```cpp
    if(N >= 2){
    cout<<2<<endl;
    for(int i = 3;i <= N;i ++){
        for(int j = 2;j < i;j ++){
            if(i % j == 0){
                flag = 1;
            }
        }
        if(flag == 0){
            cout<<i<<endl;
        }
        flag = 0;
        }
    }
    ```
  + ```cpp
    if(N >= 2){
        cout<<2<<endl;
        for(int i = 3;i <= N;i ++){
            for(int j = 2;j < i;j ++){
                if(i % j == 0){
                    flag = 1;
                }
            }
            if(flag == 0){
                cout<<i<<endl;
            }
        }
    }
    ```

15. 工人工作一天，会得到一个金环作为工资报酬，某个工作需要15天完成，一条15个环的金环项链，为了严格执行每天工作结束时，完成对工人工资的结算，最少需要将金环项链剪裁成几段，每段几个金环（#slot）
  + 4段，分别是1、2，4，8
  + 15段，每段1个
  + 6段，分别是3、3、3、3、2、1
  + 9段，分别是2、2、2、2、2、2、1、1、1

= 判断题（每题 2 分，共 20 分）

1. 为了简化计算机基本运算电路，使加减法都只需要通过加法电路实现，也就是让减去一个正数或加上一个负数这样的运算可以用加上一个正数来代替。于是改变负数存储的形式，存储成一种可以直接当成正数来相加的形式，这种形式就是补码。

2. 使用原码进行的计算，2+(-1)的结果是-3

3. 反码计算加减法：加法与减法结果都是正确的，只是解决不了-0的问题

4. 10 进制数 63，在转换成二进制的计算过程中，产生了如下的式子：

  ```cpp
  63/2=31 余 1
  31/2=15 余 1
  15/2=7  余 1
  7/2=3   余 1
  3/2=1   余 1
  1/2=0   余 1
  按照从前往后的顺序，获得 63 的二进制值是 111111
  ```

5. 下列程序输出的是A

  ```cpp
  char x=65;
  x=x&00001111;
  cout<<x<<endl;
  ```

6. 下列可执行程序段中，最后pos的值是 4

  ```cpp
  string str="chenADai";
  int pos = str.find('D');
  --pos&11;
  ```

7. 

  ```cpp
  string ch="chen";
  cout<<ch[4]<<endl;
  该段程序将不能正确执行
  ```

8. 

  ```cpp
  char a='A';
  a=a+32;
  cout<<(int)a<<endl;
  将输出97
  ```

9. 自然界中，最小的素数是 2

10. CCF(十六进制) = 12363(七进制)

= 编程题（每题 25 分，共 50 分）

== 编程题 1：数字替换

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有一个包含$n$个数字的序列$A$，即$A = ( a_1, a_2, dots.h , a_n)$，他想将其中大于$k$的数字都替换为序列的最大值，将其中小于$k$的数字都替换为序列的最小值，请你帮他计算出替换后的序列。

=== 输入格式

第一行包含两个正整数$n,k$，含义如题面所示。第二行包含$n$个数字，代表序列$A$。

=== 输出格式

输出$n$个整数，代表替换后的结果。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5 0
-2 -1 0 1 2
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
-2 -2 0 2 2
```

=== 参考程序

```cpp
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
int a[100010];
int main() {
    int n, k;
    cin >> n >> k;
    for (int i = 1; i <=n; i++) {
        cin >> a[i];
    }
    int max_value = a[1],min_value=a[1];
    for (int i = 1; i <=n; i++) {
        max_value=max(max_value,a[i]);
        min_value=min(min_value,a[i]);
    }
    for (int i = 1; i <=n; i++) {
        if (a[i] > k) {
            a[i] = max_value;
        } else if (a[i] < k) {
            a[i] = min_value;
        }
        if (i != n) {
            cout << a[i] << " ";
        } else {
            cout << a[i] << endl;
        }
    }
    return 0;
}
```

== 编程题 2：打印数字

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨为数字 , , 和#(math-missing)设计了一款表示形式，每个数字占用了$5 times 5$的网格。数字 , , 和#(math-missing)的表示形式如下：小杨想请你将给定的数字$n$转换为对应的表示形式。

=== 输入格式

第一行包含一个正整数代表$n$。

=== 输出格式

输出对应的表示形式。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
12230
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
****.....................
****.****.****.****..***.
****.................***.
****..****.********..***.
****.....................
```

=== 参考程序

```cpp
#include <iostream>
#include <string>
using namespace std;
int main() {
    string n;
    cin >> n;
    for (int row = 0; row < 5; row++) {
        string line = "";
        for (char digit : n) {
            if (digit == '0') {
                if (row == 0 || row == 4) {
                    line += ".....";
                } else {
                    line += ".***.";
                }
            } else if (digit == '1') {
                line += "****.";
            } else if (digit == '2') {
                if (row == 0) {
                    line += ".....";
                } else if (row == 1) {
                    line += "****.";
                } else if (row == 2) {
                    line += ".....";
                } else if (row == 3) {
                    line += ".****";
                } else {
                    line += ".....";
                }
            } else if (digit == '3') {
                if (row == 0) {
                    line += ".....";
                } else if (row == 1) {
                    line += "****.";
                } else if (row == 2) {
                    line += ".....";
                } else if (row == 3) {
                    line += "****.";
                } else {
                    line += ".....";
                }
            }
        }
        cout << line << endl;
    }
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
