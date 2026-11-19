// ===========================================================================
// GESP 2024-09 C++ 三级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-09/2024-09-L3.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 3,
  month: "2024 年 09 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 下列代码中，输出结果是（#slot）

  ```cpp
  #include<iostream>
  using namespace std;
  int main()
  {
       double a=0.9;
       double b=1.0;
       if(((b-a)==0.1))
       {
           cout<<"Equal"<<endl;
       }
       else
       {
           cout<<"Not equal"<<endl;
       }
  }
  ```
  + Equal
  + Not equal
  + 程序不能正确执行
  + 没有输出

2. 关于计算机中的编码，下列说法中正确的是（#slot）
  + 机器数的形式值和真值是一致的
  + 原码就是符号位加上真值
  + 机器数是带符号的
  + [-1]=[1000 0001]原=[1111 1111]反

3. 8进制数3703转换成16进制数是（#slot）
  + 7C3
  + 7A3
  + 7B3
  + 7D3

4. 0.8125变成二进制是（#slot）。
  + 0.1110
  + 0.1 1111 1011 1101
  + 0.1 1111 1011 1100
  + 0.1101

5. 下面说法正确的是（#slot）
  + （22&01）==（22&&01）成立
  + (23|11)==30
  + (23|10)==31
  + (23|01)==31

6. 下列说法正确的是（#slot）
  + 2\>\>1和1\>\>1的值是一样的
  + (2\>\>2)和(1\>\>1)的值是一样的
  + (11^00)和(1^0)的值是一样的
  + (～0的输出值是1)

7. 下列代码实现的是（#slot）

  ```cpp
  void Swap(int &a, int &b) {
       if (a != b) {
           a ^= b;
           b ^= a;
           a ^= b;
       }
  }
  ```
  + a和b的异或
  + a和b的同或
  + a和b的值交换
  + a和b的高低位互换

8. a&～1运算实现的是（#slot）。
  + 使a的最低位为1
  + 使a的最高位为1
  + 使a的最低位为0
  + 使a的最高位为0

9. a=1010 1110,a\<\<2,下面关于这个说法正确的是（#slot）。
  + a的值变为1011 1000
  + a的值变为1011 1010
  + a的值变为0101 1101
  + a的值变为0101 1100

10. 下列程序中，result和result2输出分别是（#slot）

  ```cpp
  long a = 123;
  int b = 1;
  long result = a & b;
  cout<<result<<endl;
  long a2 = -123;
  unsigned int b2 = -1;
  long result2 = a2 & b2;
  cout<<result2<<endl;
  ```
  + 123 -1
  + 123 -123
  + 1 -1
  + 1 -123

11. 陈A歹种植一批农作物，第一天需要浇水一次，随后的两天（第2、第3天），每天需要浇水2次，再随后的3天（第4、第5、第6天），需要每天浇水3次，这样持续下去，随后的n天，每天需要浇水n次。请问在100天里，总共浇了多少次水（#slot）
  + 994
  + 996
  + 995
  + 945

12. 关于一维数组，下列程序能够正确执行的是（#slot）。

  ```cpp
  int a[10];
  int sum=0;
  for(int i=0;i<=10;i++) {
   sum=sum+a[i];
  }
  int a[10]={1,2,3,4,5,6,7,8,9,10};
  int sum=0;
  for(int i=0;i<=10;i++) {
   sum=sum+a[i];
  }
  int a[10]={1,2,3,4,5,6,7,8,9,10};
  int sum=0;
  for(int i=0;i<10;i++) {
   um=sum+a[i];
  }
  int a[10]={0};
  int sum=0;
  for(int i=0;i<=10;i++) {
   sum=sum+a[i];
  }
  ```
  + a的值变为1011 1000
  + a的值变为1011 1010
  + 10
  + 不确定的值

13. 下面的程序中，会输出（#slot）。

  ```cpp
  int a[10]={1,2,3,4,5,6,7,8,9,10};
  cout<<a[10]<<endl;
  ```
  + 1
  + 0
  + 10
  + 不确定的值

14. 有ABCD4个人，其中一个是小偷，每个人说一句话，只有小偷说的是假话，其中A说：不是我。B说：是C。C说：是D。D说：C瞎说，请问谁是小偷（#slot）。
  + A
  + B
  + C
  + D

15. 下列程序输出的是（#slot）

  ```cpp
  string str = "Hello,CHAD";
  cout << str.find("A") << '\n';
  ```
  + 9
  + 8
  + 7
  + 6

= 判断题（每题 2 分，共 20 分）

1. +1和-1的原码进行1+（-1）计算的结果是-2。（#slot）

2. ～1的输出值是-2。（#slot）

3. ～1 = 1111 1110。（#slot）

4. 取X的低四位，可以用Y = 0000 1111，用X&Y获取X的低四位。（#slot）

5. 下列程序输出的是A。（#slot）

  ```cpp
  char x=65;
  x++;
  cout<<x++<<endl;
  ```

6. 下列程序输出的是3。（#slot）

  ```cpp
  string str="CHADai";
  size_t pos = str.find('D');
  cout<<pos<<endl;
  ```

7. 下列程序将输出1。（#slot）

  ```cpp
  int a[10]={1};
  cout<<a[1]<<endl;
  ```

8. 下列程序将输出A。（#slot）

  ```cpp
  int a=65;
  cout<<(char)a<<endl;
  ```

9. 16进制数AB，表示成2进制数是10101011。（#slot）

10. def(十六进制) = 103231(五进制)。（#slot）

= 编程题（每题 25 分，共 50 分）

== 编程题 1：平衡序列

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有一个包含$n$个正整数的序列$a$，他认为一个序列是平衡的当且仅当存在一个正整数$i$（#slot）使得序列第个到第#(math-missing)个数字的总和等于第#(math-missing)个到第#(math-missing)个数字的总和。小杨想请你判断序列$a$是否是平衡的。

=== 输入格式

第一行包含一个正整数$t$，代表测试用例组数。接下来是$t$组测试用例。对于每组测试用例，一共两行。第一行包含一个正整数$n$，代表序列长度。第二行包含$n$个正整数，代表序列$a$。

=== 输出格式

对于每组测试用例，如果序列$a$是否是平衡的，输出 Yes，否则输出 No。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
3
1 2 3
4
2 3 1 4
5
1 2 3 4 5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
Yes
Yes
No
```

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
int a[10010];
int main(){
     int t;
     cin>>t;
     while(t--){
         int n;
         cin>>n;
         int sum=0;
         for(int i=1;i<=n;i++){
             cin>>a[i];
             sum+=a[i];
         }
         int tot=0,fl=0;
         for(int i=1;i<n;i++){
             tot+=a[i];
             if(tot*2==sum){
                 fl=1;
                 break;
             }
         }
         if(fl)cout<<"Yes\n";
         else cout<<"No\n";
     }
}
```

== 编程题 2：回文拼接

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

一个字符串是回文串，当且仅当该字符串从前往后读和从后往前读是一样的，例如，aabaa和ccddcc都是回文串，但abcd不是。小杨有$n$个仅包含小写字母的字符串，他想请你编写程序判断每个字符串是否由两个长度至少为$2$的回文串前后拼接而成。

=== 输入格式

第一行包含一个正整数$n$，代表字符串数量。之后$n$行每行一个仅包含小写字母的字符串。

=== 输出格式

对于每个字符串输出一行，如果该字符串由两个长度至少为$2$的回文串前后拼接而成则输出 Yes，否则输出 No。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4
abcd
aabbb
aaac
abcdd
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
No
Yes
No
No
```

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
int main(){
     int n,k;
     cin>>n;
     for(int i=1;i<=n;i++){
         string s;
         cin>>s;
         int m = s.length();
         int fl = 0;
         for(int j=2;j<=m-2;j++){
             string s1=s.substr(0,j);
             string s2=s.substr(j,m-j);
             string t1="",t2="";
             for(int k=(int)s1.size()-1;k>=0;k--)t1+=s1[k];
             for(int k=(int)s2.size()-1;k>=0;k--)t2+=s2[k];
             if(t1==s1&&t2==s2){
                 fl=1;
                 break;
             }
         }
         if(fl)cout<<"Yes\n";
         else cout<<"No\n";
     }
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
