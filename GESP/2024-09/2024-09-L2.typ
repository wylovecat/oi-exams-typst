// ===========================================================================
// GESP 2024-09 C++ 二级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-09/2024-09-L2.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 2,
  month: "2024 年 09 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 据有关资料，山东大学于1972年研制成功DJL-1计算机，并于1973年投入运行，其综合性能居当时全国第三位。DJL-1计算机运算控制部分所使用的磁心存储元件由磁心颗粒组成，设计存贮周期为2μs（微秒）。那么该磁心存储元件相当于现代计算机的（#slot）。
  + 内存
  + 磁盘
  + CPU
  + 显示器

2. IPv4版本的因特网总共有（#slot）个A类地址网络。
  + 65000
  + 200万
  + 126
  + 128

3. 在C++中，下列不可做变量的是（#slot）。
  + ccf-gesp
  + ccf\_gesp
  + ccfGesp
  + \_ccfGesp

4. 在C++中，与for (int i = 1; i \< 10; i++)效果相同的是（#slot）。

  ```cpp
  for (int i = 0; i < 10; i++)
  for (int i = 0; i < 11; i++)
  for (int i = 1; i < 10; ++i)
  for (int i = 0; i < 11; ++i)
  ```

5. 在C++中，cout \<\< (5 / 2 + 5 % 3)的输出是（#slot）。
  + 1
  + 2
  + 4
  + 5

6. 假定变量a和b可能是整型、字符型或浮点型，则下面C++代码执行时先后输入-2和3.14后，其输出不可能是（#slot）。[已知字符'+'、'-'、'='的ASCII码值分别是43、45和61]

  ```cpp
  cin >> a;
  cin >> b;
  cout << (a + b);
  ```
  + 1
  + 1.14
  + 47
  + 将触发异常

7. 在C++代码中假设N为正整数，则下面代码能获得个位数的是（#slot）。
  + N % 10
  + N / 10
  + N && 10
  + 以上选项均不正确

8. 下面C++代码执行后的输出是（#slot）。

  ```cpp
  int i;
  for (i = 0; i < 10; i++){
      if (i % 2)
          break;
      cout << "0#";
  }
  if(i==10) cout << "1#";
  ```
  + 0\#
  + 1\#
  + 0\#0\#1
  + 没有输出

9. 执行下面C++代码并输入1和0，有关说法正确的是（#slot）。

  ```cpp
  int a,b;
  cin >> a >> b;
  if(a&&b)
      cout << ("1");
  else if(!(a||b))
      cout << ("2");
  else if(a || b)
      cout << ("3");
  else
      cout << ("4");
  ```
  + 1
  + 2
  + 3
  + 4

10. 下面C++代码执行后的输出是（#slot）。

  ```cpp
  int loopCount = 0;
  for (int i = 1; i < 5; i += 2)
      loopCount += 1;
  cout << (loopCount);
  ```
  + 1
  + 2
  + 3
  + 5

11. 下图是C++程序执行后的输出。为实现其功能，横线处应填入代码是（#slot）。

  ```cpp
  7
  1
  2 3
  3 4 5
  4 5 6 7
  5 6 7 8 9
  6 7 8 9 10 11
  7 8 9 10 11 12 13
  //////////////////////////////
  int lineNum;
  cin >> lineNum;
  for (int i= 1; i < lineNum+1; i++){
      for(int __________________)
          cout << j << " ";
      cout << endl;
  }
  j = i; j < i*2; j++
  j = i+1; j < i+i; j++
  ```
  + j = i; j \< i; j++
  + j = 1; j \< i; j++

12. 下面C++代码执行后输出逆序数，如输入123则输出321。如输入120则输出21。横线处先后应填入的代码是（#slot）。

  ```cpp
  int N;
  cin >> N;
  int rst = 0;
  while (N){
      ____________________;
      ____________________;
  }
  cout << (rst);
  rst = rst * 10 + N % 10  N = N / 10
  rst += N % 10  N = N / 10
  rst = rst * 10 + N / 10  N = N % 10
  rst +=  N / 10   N = N % 10
  ```

13. 下面的C++代码用于输入学生成绩，并根据人数计算出平均成绩，有关说法错误的是（#slot）。

  ```cpp
  float Sum = 0; // 保存总成绩
  int cnt = 0; // 保存学生人数
  while (1){
      int score;
      cin >> score;
      if (score < 0)
          break;
      cnt += 1;
      Sum += score;
  }
  cout << "总学生数：" << cnt << "平均分：" << Sum/cnt;
  ```
  + 代码while (1)写法错误
  + 如果输入负数，将结束输入，并正确输出
  + 如果输入的学生成绩含有小数，程序将无法正常执行
  + 变量int score初始值不确定，但不影响程序执行

14. 以下C++代码判断输入的正整数是否为质数，如果该数字是质数，则输出YES，否则输出NO。质数是指仅能被1和它本身整除的正整数。请在横线上填写代码。（#slot）

  ```cpp
  int num, i;
  cin >> num;
  for(i = 2; i < num; i++)
      if (__________){
          cout << ("NO");
          break;
      }
  if(i == num)
      cout << ("YES");
  ```
  + num % i
  + num % i == 0
  + num / i
  + num / i == 0

15. 一个数如果能被某个数（比如7）整除，或者含有该数，则说该数是某个数的相关数。下面C++代码用于判定输入的数与7是否有关。下列说法错误的是（#slot）。

  ```cpp
  int N, M;
  bool Flag = false;
  cin >> N;
  M = N;
  if (M % 7 == 0)
      Flag = true;
  while (!Flag && M){
      if (M % 10 == 7){
          Flag = true;
          break;
      }
      M /= 10;
  }
  if (Flag)
      cout << N << "与7有关";
  else
      cout << N << "与7无关";
  ```
  + 删除break语句不会导致死循环，但有时会导致结果错误
  + 删除M /= 10将可能导致死循环
  + 删除M = N并将其后代码中的M变量改为N，并调整输出同样能完成相关功能
  + 删除break语句不会导致死循环，但有时会影响效率

= 判断题（每题 2 分，共 20 分）

1. 小杨最近开始学习C++编程，老师说C++是一门面向对象的编程语言,也是一门高级语言。（#slot）

2. 在C++中，cout \<\< (3, 4, 5)可以输出3 4 5，且每个输出项之间用空格分开。（#slot）

3. C++表达式12 % 10 % 10的值为2。（#slot）

4. C++语句cout \<\< rand（#slot） \<\< ' ' \<\< rand（#slot）;的第二个输出值较大。（#slot）

5. 定义C++的int类型的变量ch，而且值为'1'，则语句cout \<\< int(ch);的输出为1。（#slot）

6. 下面C++代码执行后将输出10。（#slot）

  ```cpp
  int i;
  for (i = 0; i < 10; i++)
      continue;
  if(i == 10)
      cout << i;
  ```

7. 下面C++代码能求整数N和M之间所有整数之和，包含N和M。（#slot）

  ```cpp
  int N, M, Sum;
  cin >> N >> M;
  if (N > M){
      int tmp = N;
      N = M, M = tmp;
  }
  for (int i = N; i < M+1; i++)
      Sum += i;
  cout << Sum;
  ```

8. 将下面C++代码中的L3标记的代码行调整为for (int i = 0; i \< 5; i++)后输出结果相同。（#slot）

  ```cpp
  int loopCount = 0;
  for (int i = 1; i < 5; i++) // L3
      for (int j = 0; j < i; j++)
          loopCount += 1;
  cout << loopCount;
  ```

9. 某一系列数据的规律是从第3个数值开始是前两个数之和。下面的代码求第N个数的值，N限定为大于2。（#slot）

  ```cpp
  int start1; // 第1个数
  int start2; // 第2个数
  int N; //求N个数的值
  int tmp;
  cin >> start1 >> start2 >> N;
  for (int i = 2; i < N; i++){
      tmp = start1 + start2;
      start1 = start2;
      start2 = tmp;
  }
  cout << start2;
  ```

10. 下面C++代码执行时如果输入2024，则输出是4202。（#slot）

  ```cpp
  int N, flag=0;
  cin >> N;
  while (N){
      if(!flag) cout << N % 10;
      N /= 10;
      flag = (flag + 1)%2;
  }
  ```

= 编程题（每题 25 分，共 50 分）

== 编程题 1：数位之和

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有$n$个正整数，他认为一个正整数是美丽数字当且仅当该正整数每一位数字的总和是$7$的倍数。小杨想请你编写一个程序判断$n$个正整数哪些是美丽数字。

=== 输入格式

第一行包含一个正整数$n$，代表正整数个数。之后$n$行，每行包含一个正整数。

=== 输出格式

对于每个正整数，如果是美丽数字则输出 Yes，否则输出 No。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
7
52
103
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
int main(){
    int n;
    cin>>n;
    int ans=0;
    for(int i=1;i<=n;i++){
        int x;
        cin>>x;
        int tot=0;
        while(x){
            tot+=(x%10);
            x/=10;
        }
        if(tot%7==0)cout<<"Yes\n";
        else cout<<"No\n";
    }
    return 0;
}
```

== 编程题 2：小杨的

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨想要构造一个$m times m$的 N 字矩阵（$m$为奇数），这个矩阵的从左上角到右下角的对角线、第$1$列和第$m$列都是半角加号 + ，其余都是半角减号 - 。例如，一个$5 times 5$的 N 字矩阵如下：请你帮小杨根据给定的$m$打印出对应的 N 字矩阵。

=== 输入格式

第一行包含一个正整数$m$。

=== 输出格式

输出对应的 N 字矩阵。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
+---+
++--+
+-+-+
+--++
+---+
```

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
int main(){
    int n;
    cin>>n;
    for(int i=1;i<=n;i++){
        for(int j=1;j<=n;j++){
            if(j==1||j==n)cout<<"+";
            else{
                if(i==j)cout<<"+";
                else cout<<"-";
            }
        }
        cout<<"\n";
    }
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
