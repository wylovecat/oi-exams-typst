// ===========================================================================
// GESP 2024-03 C++ 三级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-03/2024-03-L3.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 3,
  month: "2024 年 03 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 整数-5的16位补码表示是（#slot）。
  + 1005
  + 1006
  + FFFA
  + FFFB

2. 如果16位短整数-2的二进制是"FFFE"，则短整数-4的十六进制是（#slot）。
  + FF04
  + FFFA
  + FFFC
  + FFFH

3. 下面C++代码执行后的输出是（#slot）。

  ```cpp
  int main()
  {
      cout << (3|16) << endl;
      cout << endl;
      return 0;
  }
  ```
  + 3
  + 16
  + 19
  + 48

4. 定义整数int x=-5，则执行C++代码cout \<\< (x == (x\<\<1\>\>1))输出是（#slot）。
  + 0
  + 1
  + -5
  + 5

5. 已知字符'0'的ASCII编码的十进制表示为48，则执行下面C++代码后，输出是（#slot）。

  ```cpp
  int main()
  {
      string s="316";
      int n=s.length();
      int x=0;
      for(int i = 0; i < n; i++)
          x += s[i];
      cout << x  << endl;
      cout << endl;
      return 0;
  }
  ```
  + 10
  + 58
  + 154
  + 316

6. 下面C++代码执行后数组中大于0的数的特征是（#slot）。

  ```cpp
  int main()
  {
      int a[20],i;
      for(i = 0; i < 20; i++)
          a[i] = i+1;
      for(int i = 0; i < 20; i++)
          if((a[i]%2)&&(a[i]%3))
              a[i] = 0;
      for(i = 0; i < 20; i++)
          if(a[i])
              cout << a[i] << " ";
      cout << endl;
      return 0;
  }
  ```
  + 2的倍数
  + 3的倍数
  + 能被2或3整除的数
  + 能被2和3同时整除的数

7. 执行下面C++代码后输出的第一个数是（#slot）。

  ```cpp
  int main()
  {
      int a[20],i;
      for(i = 0; i < 20; i++)
          a[i] = i+1;
      for( ; i > 0; i--)
          cout << a[i-1] << " ";
      cout << endl;
      return 0;
  }
  ```
  + 20
  + 19
  + 1
  + 不确定

8. 在下列代码的横线处填写（#slot），可以使得输出是GESP IS INTERESTING。

  ```cpp
  int main()
  {
      string str="gEsP is Interesting";
      int x = str.length();
      for(int i = 0; i < x; i++)
          if ((str[i]>='a') && (str[i]<='z'))
              ________________________;
      cout << str << endl;
      cout << endl;
      return 0;
  }
  ```
  + str[i]+='a'-'A'
  + str[i]+=20
  + str[i]+='A'-'a'
  + 无法实现

9. 假设英文句子由若干词构成。下面C++代码统计输出的词数是（#slot）。

  ```cpp
  int main()
  {
      string str="gEsP is  Interesting  !";
      int x = str.length();
      int nwords = 0;
      for(int i = 0; i < x; i++)
          if (str[i]==' '){
              nwords++;
              while(str[++i]==' ') ;
          }
      cout << nwords << endl;
      cout << endl;
      return 0;
  }
  ```
  + 1
  + 2
  + 3
  + 4

10. C++的字符变量的码值是整数，下面字面量形式的字符码值最大的是（#slot）。
  + 100
  + 075
  + 0x70
  + 0x60

11. 下面C++程序执行的结果是（#slot）。

  ```cpp
  int main()
  {
      int a[20],i;
      int cnt=0;
      for(i = 0; i < 20; i++)
          a[i] = i+1;
      for( ; i > 1; i--)
          if((a[i-1]+a[i-2])%3)
              cnt++;
      cout << cnt << endl;
      cout << endl;
      return 0;
  }
  ```
  + 5
  + 6
  + 10
  + 12

12. 定义字符数组char str[20] = {'G', 'E', 'S', 'P'};，则str的字符串长度为（#slot）。
  + 4
  + 5
  + 19
  + 20

13. 定义整型变量int a=3, b=16，则a|b的值和a+b的关系是（#slot）。
  + 大于
  + 等于
  + 小于
  + 等于或小于

14. 小杨的父母最近刚刚给他买了一块华为手表，他说手表上跑的是鸿蒙，这个鸿蒙是（#slot）。
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

1. 任意整数a的二进制反码与补码都有1位不同。 （#slot）

2. 对整型变量int a = 3，执行C++代码a\<\<2将把2输出到a中。（#slot）

3. 下面C++代码可以计算1到100的累加和，采用的是穷举法。

  ```cpp
  int main()
  {
      int i,sum=0;
      for(int i = 1; i <= 100 ; i++)
          sum += i;
      cout << sum  << endl;
      cout << endl;
      return 0;
  }
  ```

4. 一个int类型变量a，执行操作(a\<\<2\>\>2)后的值一定是a。（#slot）

5. 在C++语言中，(010\<\<1)执行结果是100。（#slot）

6. 执行下面C++代码后将输出2。（#slot）

  ```cpp
  int main()
  {
      string str="gEsP is Interesting";
      int x = str.find("s");
      cout << x << endl;
      cout << endl;
      return 0;
  }
  ```

7. 在C++语言中，字符数组被定义时，它的大小可以调整。（#slot）

8. 对定义的数组int a[7]={2,0,2,4,3,1,6}，可以用简单循环就找到其中最小的整数。（#slot）

9. 小杨今年春节回奶奶家了，奶奶家的数字电视要设置ip地址并接入到WIFI盒子才能收看节目，那这个WIFI盒子具有路由器的功能。（#slot）

10. 任何一个for循环都可以转化为等价的while循环（#slot）。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：字母求和

=== 题目描述

小杨同学发明了一种新型密码，对于每一个小写英文字母，该小写字母代表了一个正整数，即该字母在字母顺序中的位置，例如字母 a 代表了正整数 1，字母 b 代表了正整数 2；对于每一个大写英文字母，该大写字母代表了一个负整数，即该字母的 ASCII 码的相反数，例如字母 A 代表了正整数 -65。小杨同学利用这种方式对一个整数进行了加密并得到了一个由大写字母和小写字母组成的字符串，该字符串中每个字母所代表数字的总和即为加密前的整数，例如 aAc 对应的加密前的整数为 1+(-65)+3=-61。对于给定的字符串，请你计算出它对应的加密前的整数是多少。

=== 输入格式

第一行一个正整数$n$，表示字符串中字母的个数。第二行一个由大写字母和小写字母的字符串$T$，代表加密后得到的字符串。

=== 输出格式

输出一行一个整数，代表加密前的整数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
aAc
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
-61
```

=== 参考程序

```cpp
#include <iostream>
#include <assert.h>
#include <cstdlib>
#include <cstdio>
#include <cstring>
using namespace std;
const int N = 100005;
char str[N];
int main() {
    int n;
    cin >> n;
    cin >> str;
    assert(n == strlen(str));
    int ans = 0;
    for (int i = 0; i < n; i ++) {
        if (str[i] >= 'a' && str[i] <= 'z')
            ans += str[i] - 'a' + 1;
        else if (str[i] >= 'A' && str[i] <= 'Z')
            ans -= str[i];
        else
            assert(false);
    }
    cout << ans << endl;
    return 0;
}
```

== 编程题 2：完全平方数

=== 题目描述

小杨同学有一个包含$n$个非负整数的序列$A$，他想要知道其中有多少对下标组合$< i, j > (1 <= i, j <= n, i < j)$ （#slot），使得是完全平方数。如果$x$是完全平方数，则存在非负整数$y$使得$y times y = x$。

=== 输入格式

第一行一个非负整数$n$，表示非负整数个数。第二行包含$n$个非负整数$A_1, A_2, dots.h , A_n$，表示序列$A$包含的非负整数。

=== 输出格式

输出一个非负整数，表示和是完全平方数的非负整数对数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5
1 4 3 3 5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
3
```

=== 参考程序

```cpp
#include <bits/stdc++.h>
using namespace std;
const int N = 1010;
int a[N];
int main(){
    int n;
    cin >> n;
    for(int i=1;i<=n;i++){
        cin>>a[i];
    }
    int ans=0;
    for(int i=1;i<=n;i++){
        for(int j=i+1;j<=n;j++){
            int m = a[i] + a[j];
            int t = sqrt(m + 1e-7);
            if(t * t == m)
                ans++;
        }
    }
    cout<<ans<<"\n";
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
