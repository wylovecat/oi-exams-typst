// ===========================================================================
// GESP 2024-06 C++ 二级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-06/2024-06-L2.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 2,
  month: "2024 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 小杨父母带他到某培训机构给他报名参加CCF组织的GESP认证考试的第1级，那他可以选择的认证语言有几种？（#slot）
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

3. 在C++中，下列不可做变量的是（#slot）。
  + five-Star
  + five\_star
  + fiveStar
  + \_fiveStar

4. 在C++中，与for(int i=0; i\<10; i++)效果相同的是（#slot）。

  ```cpp
  for(int i=0; i<10; i+=1)
  for(int i=1; i<=10; i++)
  for(int i=10; i>0; i--)
  for(int i=10; i<1; i++)
  ```

5. 在C++中，cout \<\< (5 % 2 && 5 % 3)的输出是（#slot）。
  + 1
  + 2
  + true
  + false

6. 6.执行下面的C++代码时输入1，则输出是（#slot）。

  ```cpp
  int month;
  cin >> month;
  switch(month){
      case 1:
          cout << "Jan ";
      case 3:
          cout << "Mar ";
          break;
      default:
          ;
  }
  ```
  + Jan
  + Mar
  + Jan Mar
  + 以上均不对

7. 执行下面C++代码后，有关说法错误的是（#slot）。

  ```cpp
  int a, b;
  cin >> a >> b;
  if (a && b)
      cout << "1";
  else if (!(a || b))
      cout << "2";
  else if (a || b)
      cout << "3";
  else
      cout << "4";
  ```
  + 如果先后输入1和1，则将输出1
  + 如果先后输入0和1或者1和0，则将输出3
  + 如果先后输入0和0，则将输出2
  + 如果先后输入0和0，则将输出4

8. 某货币由5元，2元和1元组成。输入金额（假设为正整数），计算出最少数量。为实现其功能，横线处应填入代码是（#slot）。

  ```cpp
  int N;
  cin >>N;
  int M5,M2,M1;
  M5 = N / 5;
  M2 = ______________;
  M1 = ______________;
  printf("5*%d+2*%d+1*%d", M5, M2, M1);
  ```
  + 第1横线处应填入：N / 2第2横线处应填入：N - M5 - M2
  + 第1横线处应填入：(N - M5 \* 5) / 2第2横线处应填入：N - M5 \* 5 - M2 \* 2
  + 第1横线处应填入：N - M5 \* 5 / 2第2横线处应填入：N - M5 \* 5 - M2 \* 2
  + 第1横线处应填入：(N - M5 \* 5) / 2第2横线处应填入：N - M5 - M2

9. 下面C++代码执行后的输出是（#slot）。

  ```cpp
  int loopCount = 0;
  for (int i=0; i < 10; i++)
      for (int j=1; j < i; j++)
          loopCount += 1;
  cout << loopCount;
  ```
  + 55
  + 45
  + 36
  + 28

10. 下面C++代码执行后的输出是（#slot）。

  ```cpp
  int loopCount = 0;
  for (int i=0; i < 10; i++){
      for (int j=0; j < i; j++)
          if (i * j % 2)
              break;
      loopCount += 1;
  }
  cout << loopCount;
  ```
  + 25
  + 16
  + 10
  + 9

11. 假设下面C++代码执行过程中仅输入正负整数或0，有关说法错误的是（#slot）。

  ```cpp
  int N,Sum = 0;
  cin >> N;
  while (N){
      Sum += N;
      cin >> N;
  }
  cout << Sum;
  ```
  + 执行上面代码如果输入0，将终止循环
  + 执行上面代码能实现所有非0整数的求和
  + 执行上面代码第一次输入0，最后将输出0
  + 执行上面代码将陷入死循环，可将while (N)改为while (N==0)

12. 执行下面的C++代码，有关说法正确的是（#slot）【质数是指仅能被1和它本身整除的正整数】。

  ```cpp
  int N;
  cin >> N;
  bool Flag = true;
  for ( int i = 2; i < N; i++){
      if (i * i > N)
          break;
      if (N % i == 0){
          Flag = false;
          break;
      }
  }
  if (Flag)
      cout << N << "是质数" << endl;
  else
      cout << N << "不是质数" << endl;
  ```
  + 如果输入正整数，上面代码能正确判断N是否为质数
  + 如果输入整数，上面代码能正确判断N是否为质数
  + 如果输入大于等于0的整数，上面代码能正确判断N是否质数
  + 如将Flag = true修改为Flag = N\>=2? true:false则能判断所有整数包括负整数、0、正整数是否为质数

13. 下面C++代码用于实现如下图所示的效果，其有关说法正确的是（#slot）。

  ```cpp
  for (int i = 1; i < 6; i++){ // L1
      for (int j = 1; j < i+1; j++) //L2
          cout << i*j << " ";
      cout << endl;
  }
  ```
  + 当前代码能实现预期效果，无需调整代码
  + 如果cout \<\< endl;移到循环L2内部，则可实现预期效果
  + 如果cout \<\< endl;移到循环L1外部，则可实现预期效果
  + 删除cout \<\< endl;行，则可实现预期效果

14. 下面C++代码执行后，输出是（#slot）。

  ```cpp
  int cnt1 = 0, cnt2 = 0;
  for (int i = 0; i < 10; i++){
      if (i % 2 == 0)
          continue;
      if (i % 2)
          cnt1 += 1;
      else if (i % 3 == 0)
          cnt2 += 1;
  }
  cout << cnt1 << " " << cnt2;
  ```
  + 5 2
  + 5 0
  + 0 2
  + 0 0

15. 在下面的C++代码中，N必须是小于10大于1的整数，M为正整数（大于0）。如果M被N整除则M为幸运数，如果M中含有N且能被N整除，则为超级幸运数，否则不是幸运数。程序用于判断M是否为幸运数或超级幸运数或非幸运数。阅读下面代码，有关说法正确的是（#slot）。

  ```cpp
  int N, M;
  cout << "请输入幸运数字：";
  cin >> N;
  cout << "请输入正整数：";
  cin >> M;
  bool Lucky;
  if (M % N == 0)
      Lucky = true;
  else
      Lucky = false;
  while (M){
      if (M % 10 == N && Lucky){
          printf("%d是%d的超级幸运数!", M, N);
          break;
      }
      M /= 10;
  }
  if (M == 0)
      if (Lucky)
          printf("%d是%d的幸运数!", M, N);
      else
          printf("%d非%d的幸运数!", M, N);
  ```
  + 如果N输入3，M输入36则将输出：36是3的超级幸运数!
  + 如果N输入7，M输入21则将输出：21是7的幸运数!
  + 如果N输入8，M输入36则将输出：36非8的超级幸运数!
  + 如果N输入3，M输入63则将输出：63是3的超级幸运数!

= 判断题（每题 2 分，共 20 分）

1. 执行C++代码cout \<\< '9'+'1';的输出为10。（#slot）

2. C++表达式-12 % 10的值为2。（#slot）

3. C++表达式int(12.56)的值为13。（#slot）

4. C++的整型变量N被赋值为10，则语句cout \<\< N / 3 \<\< "-" \<\< N % 3执行后输出是3-1。 （#slot）

5. 在C++代码中，不可以将变量命名为scanf，因为scanf是C++语言的关键字。（#slot）

6. 下面C++代码执行后将导致死循环。（#slot）

  ```cpp
  for (int i = 0; i < 10; i++)
      continue;
  ```

7. 下面C++代码执行后将输出10。（#slot）

  ```cpp
  int cnt = 0;
  for (int i = 0; i < 10; i++)
      for (int j = 0; j < i; j++){
          cnt += 1;
          break;
      }
  cout << cnt;
  ```

8. 下面C++代码执行后，将输出5。（#slot）

  ```cpp
  int cnt = 0;
  for (int i = 1; i < 5; i++)
      for (int j = i; j < 5; j +=i)
          if (i * j % 2 == 0)
              cnt += 1;
  cout << cnt;
  ```

9. 下面C++代码能实现正整数各位数字之和。（#slot）

  ```cpp
  int N,Sum = 0;
  cin >> N;
  while (N){
      Sum += N % 10;
      N /= 10;
  }
  cout << Sum;
  ```

10. GESP测试是对认证者的编程能力进行等级认证，同一级别的能力基本上与编程语言无关。（#slot）

= 编程题（每题 25 分，共 50 分）

== 编程题 1：平方之和

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有$n$个正整数$a_1, a_2, dots.h , a_n$，他想知道对于所有的$i (1 <= i <= n)$（#slot），是否存在两个正整数$x$和$y$满足。

=== 输入格式

第一行包含一个正整数$n$，代表正整数数量。之后$n$行，每行包含一个正整数，代表$a_i$。

=== 输出格式

对于每个正整数$a_i$，如果存在两个正整数$x$和$y$满足$x times x + y times y = a_i$，输出 Yes，否则输出 No。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
2
5
4
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
Yes
No
```

=== 数据范围

对于全部数据，保证有$1 <= n <= 10, 1 <= a_i <= 10^6$。

=== 提示

对于第一个正整数，存在$1 times 1 + 2 times 2 = 5$，因此答案为 Yes。

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
bool check(int x){
    int y = sqrt(x);
    return y*y==x;
}
int main(){
    int t;
    cin>>t;
    while(t--){
        int n;
        cin>>n;
        int fl=0;
        for(int i=1;i*i<n;i++){
            int j=n-i*i;
            if(check(j))fl=1;
        }
        if(fl)cout<<"Yes\n";
        else cout<<"No\n";
    }
}
```

== 编程题 2：计数

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨认为自己的幸运数是正整数$k$（注：保证$1 <= k <= 9$）。小杨想知道，对于从$1$到$n$的所有正整数中，$k$出现了多少次。

=== 输入格式

第一行包含一个正整数$n$。第二行包含一个正整数$k$。

=== 输出格式

输出从$1$到$n$的所有正整数中，$k$出现的次数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
25
2
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
9
```

=== 数据范围

对于全部数据，保证有$1 <= n <= 1000, 1 <= k <= 9$。

=== 提示

从$1$到#(math-missing)中，$2$出现的正整数有$2,12,20,21,22,23,24,25$，一共出现了$9$次。

=== 参考程序

```cpp
#include <iostream>
using namespace std;
int check(int x, int y) {
    int cnt = 0;
    while (x > 0) {
        int tmp = x % 10;
        if (tmp == y) {
            cnt++;
        }
        x = x / 10;
    }
    return cnt;
}
int main() {
    int n, k;
    cin >> n >> k;
    int ans = 0;
    for (int i = 1; i <= n; i++) {
        ans += check(i, k);
    }
    cout << ans << endl;
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
