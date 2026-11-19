// ===========================================================================
// GESP 2026-06 C++ 二级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2026-06/2026-06-L2.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 2,
  month: "2026 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 学校组织到未来农场参观，小明听讲解员介绍，在智能温室中，湿度传感器可以连续检测土壤的湿度变化，并将检测到的湿度数据实时发送给中央控制器。中央控制器根据这些数据判断是否开启灌溉系统。请问，这里的湿度传感器所发挥的作用，类似于计算机系统中的哪一类组件？（#slot）
  + 处理器
  + 存储器
  + 输入设备
  + 输出设备

2. 小明去农场参观回来后就在自己的电脑上安装了一个 3D 农场仿真模拟系统，因为他今年买的二手电脑有点老旧，系统运行时经常弹出“系统内存不足”的警告，导致系统卡顿严重。他计划通过增加物理内存来解决问题。请问他应该购买以下哪种硬件组件？（#slot）
  + 机械硬盘
  + 内存条
  + 图形显卡
  + 移动硬盘

3. 有关如下 C++ 代码的说法，正确的是（#slot）。

  ```cpp
  float a = 3 + 3.5;
  cout << a;
  ```
  + 代码执行将报错。如果将a = 3 + 3.5改为a = float(3) + 3.5将能正常执行。
  + 代码执行将报错。如果将a = 3 + 3.5改为a = 3.0 + 3.5将能正常执行。
  + 代码能正常执行，将输出6。
  + 代码能正常执行，将输出6.5。

4. 下面选择项中，与 C++ 表达式not (x \> 5 or y \<= 10)等价的是（#slot）。

  ```cpp
  not x > 5 and not y <= 10
  ```
  + x \<= 5 or y \> 10
  + x \> 5 and y \<= 10
  + x \<= 5 and y \> 101 / 10

5. 小明在某开发环境中执行 C++ 代码cout \<\< (2.5 + 2.25) \<\< ' ' \<\< (2.2 + 2.1)时输出4.754.300000000000001 ，其原因最可能是（#slot）。
  + C++ 的+运算符在处理浮点数时有时正确，有时错误
  + 某些浮点数难以精确表示，导致微小误差
  + +运算符不能用于浮点数，只能用于整数
  + 因为cout函数难以输出太长的数值

6. 执行如下 C++ 程序后，当输入4时，输出的最后一行是（#slot）。

  ```cpp
  int n;
  cin >> n;
  for (int i = n; i > 0; i--) {
      for (int j = 0; j < i; j++)
          cout << j + 1 << ' ';
      cout << endl;
  }
  ```
  + 0
  + 1
  + 1 2
  + 1 2 3 4

7. 下面的 C++ 代码执行后其输出是（#slot）。

  ```cpp
  int tnt = 0;
  for (int i = 1; i < 5; i += 3) {
      for (int j = 0; j < i; j++)
          tnt += 1;
      cout << tnt << "#";
  }
  cout << tnt;
  ```
  + 1\#5\#5
  + 1\#5\#5\#
  + 1\#5\#12\#12
  + 0

8. 下面的 C++ 代码执行之后的输出是（#slot）。

  ```cpp
  int i;
  for (i = -2; i < 2; i++)
      if (not i % 3 == 0)
          cout << i << "#";
  cout << i;
  ```
  + -2\#-1\#1\#2
  + -2\#-1\#1\#2\#3
  + 1\#2\#3
  + 0\#1\#2\#3

9. 下面的 C++ 代码执行后其输出是（#slot）。2 / 10

  ```cpp
  int cnt = 0, i, j;
  for (i = 0; i < 3; i++) {
      j = i;
      while (j) {
          cnt += 1;
          j -= 1;
      }
  }
  cout << i << ' ' << j << ' ' << cnt;
  ```
  + 3 0 3
  + 2 0 4
  + 2 0 5
  + 3 0 5

10. 下面 C++ 代码执行后其输出是（#slot）。

  ```cpp
  int count = 0, i, j;
  for (i = 1; i < 4; i++)
      for (j = 0; j < i; j++) {
          if (j % 3 != 0)
              continue;
          count += 1;
          break;
      }
  cout << i << ' ' << j << ' ' << count;
  ```
  + 4 0 4
  + 3 0 0
  + 3 2 0
  + 4 0 3

11. 如下 C++ 代码执行后输出是1 2 3 4 5 6 7 8 9 10 11 5 6 7 8 9 10 11 5 6 7 8 9 10 11 5 6 7 8 9 10 11 5 6 7。横线处应该填入的运算符是（#slot）。

  ```cpp
  int num = 1;
  for (int i = 0; i < 35; i++) {
      cout << num << " ";
      if (num _______ 10)
          num _______ 2;
      else
          num _______ 1;
  }
  ```
  + \>/=+=
  + \>=%=+=
  + \>/==+
  + \>=%==+

12. 如下数字图形在通过执行后续的 C++ 代码时，输入10来输出。横线处应填入的代码是（#slot）。3 / 10

  ```cpp
  1 1 1 1 1 1 1 1 1 1
  1 1 0 0 0 0 0 0 0 1
  1 0 1 0 0 0 0 0 0 1
  1 0 0 1 0 0 0 0 0 1
  1 0 0 0 1 0 0 0 0 1
  1 0 0 0 0 1 0 0 0 1
  1 0 0 0 0 0 1 0 0 1
  1 0 0 0 0 0 0 1 0 1
  1 0 0 0 0 0 0 0 1 1
  1 1 1 1 1 1 1 1 1 1
  int N;
  cin >> N;
  for (int i = 1; i < N + 1; i++) {
      for (int j = 1; j < N + 1; j++)
          if (________)
              cout << "1 ";
          else
              cout << "0 ";
      cout << endl;
  }
  i == j and i == 1 and j == 1 and i == N and j == N
  i == j or i == 1 or j == 1 or i == N or j == N
  i == j or i == 0 or j == 0 or i == (N + 1) or j == (N + 1)
  i == j and i == 1 and j == 1 and i == (N + 1) and j == (N + 1)
  ```

13. 英文corner case通常翻译为极端案例或边角案例，通常指正常范围以外的问题或者情形。在如下 C++代码中，变量都是整型，则corner case最应该是（#slot）。

  ```cpp
  int tnt = 0, cnt = 0;
  while (1) {
      int score;
      cin >> score;
      if (score == -1)
          break;
      tnt += score;
      cnt += 1;
  }
  cout << tnt / cnt;
  ```
  + tnt = 0, cnt = 0是corner case，应分为两行
  + while(1)是corner case，因为while(1)将会导致死循环
  + cin \>\> score是corner case，因为输入数据前应该提示整型数据
  + cout \<\< tnt / cnt是corner case，因为如果直接输入-1，将导致执行错误，虽然这种情况较为罕见

14. 如下 C++ 代码执行后，输入4后，输出的数字图形是（#slot）。4 / 10

  ```cpp
  int n;
  cin >> n;
  for (int i = n; i > 0; i--) {
      for (int j = 0; j < n - i; j++)
          cout << "0 ";
      for (int k = 0; k < i; k++)
          cout << k + 1 << " ";
      cout << endl;
  }
  ```
  + ```cpp
    1 2 3 4
    1 2 3 0
    1 2 0 0
    1 0 0 0
    ```
  + ```cpp
    1 2 3 4
    0 1 2 3
    0 0 1 2
    0 0 0 1
    ```
  + ```cpp
    1 2 3 4
    2 3 4 0
    3 4 0 0
    4 0 0 0
    ```
  + ```cpp
    0 0 0 1
    0 0 1 2
    0 1 2 3
    1 2 3 4
    ```

15. 某学校举办“校园演讲比赛”，每位选手由$8$位评委打分（分数为$0～10$的整数），且每位评委必须打分。计分规则：去掉一个最高分，去掉一个最低分。如下程序通过键盘先输入选手编号，然后依次输入$8$个分数，并计算最终得分。下列说法正确的是（#slot）。5 / 10

  ```cpp
  for (int i = 0; i < 10; i++) {
      int id, score;
      printf("输入选手编号: ");
      scanf("%d", &id);
      int max_score = 0, min_score = 100; // 最高分和最低分
      int total_score = 0; // 总分
      for (int j = 1; j < 9; j++) {
          printf("输入选手第%d个成绩:", j);
          scanf("%d", &score);
          if (max_score < score)
              max_score = score;
          if (min_score > score)
              min_score = score;
          total_score += score;
      }
      total_score = total_score - max_score - min_score;
      printf("%d号选手的成绩:\
              去掉一个最高分%d,\
              去掉一个最低分%d,\
              最后成绩是：%d", id, max_score, min_score, total_score);
  }
  int total = total_score - max_score - min_score;
  total_score = total;
  ```
  + 上述代码能完成题目要求
  + max\_score = 0, min\_score = 100应修改为max\_score = 0, min\_score = 0
  + max\_score \< score和min\_score \> score必须相应修改为\<=和\>=
  + total\_score = total\_score - max\_score - min\_score不能达到预期，可修改如下：

= 判断题（每题 2 分，共 20 分）

1. 又到期末考试周，小明发现这次许多闭卷考试不仅禁止携带手机、平板电脑，还有最近比较时髦的各类 AI眼镜（也有叫智能眼镜）也同样不允许带入考场。这些 AI 眼镜应该也是内置了操作系统并可能支持 Wi-Fi 或蓝牙连接。

2. C++ 代码cout \<\< (not ('5' % 2 == 0) == ((not '5' % 2) == 0))执行后的输出是1。

3. 执行 C++ 语句cout \<\< (int(3.5) \* 2)将输出6。

4. 下面 C++ 代码执行后将输出1-4-7-。

  ```cpp
  for (int i = 1; i < 10; i += 3) {
      if (not i % 3)
          break;
      cout << i << "-";
  }
  6 / 10
  ```

5. 执行如下 C++ 代码，将从小到大依次输出abs(N)个整数，并在最后输出1。

  ```cpp
  int N;
  cin >> N;
  int start_num = 1, end_num = N + 1, i;
  if (N < 0)
      start_num = N, end_num = 0;
  for (i = start_num; i < end_num; i++)
      cout << i << " ";
  cout << endl << ((i - 1) == abs(N)) << endl;
  ```

6. 如下 C++ 代码执行后，输出值为9。

  ```cpp
  int cnt = 0, i;
  for (i = 0; i < 10; i++) {
      for (int j = 0; j < i; j++)
          cnt += 1;
      break;
  }
  cout << i;
  ```

7. 如下 C++ 代码执行时如输入10，输出将是100。

  ```cpp
  int cnt = 0, N;
  cout << "请输入正整数：";
  cin >> N;
  for (int i = 0; i < N; i++)
      for (int j = -i; j < i; j++)
          cnt += 1;
  cout << cnt;
  ```

8. 如下 C++ 代码执行其输出是3。

  ```cpp
  int count = 0;
  int i = 0;
  while (i < 3) {
      int j = 0;
      while (j < 3) {
          if (i + j >= 3)
              count += 1;
          j += 1;
      }
      i += 1;
  }
  cout << count;
  ```

9. 如下 C++ 代码执行时如果输入正整数，其输出将是输入的正整数。7 / 10

  ```cpp
  int N;
  cin >> N;
  int i = 0, Nbase = 1;
  int rst = 0;
  while (N != 0) {
      rst = rst + N % 10 * Nbase;
      N /= 10, Nbase *= 10;
      i += 1;
  }
  cout << rst;
  ```

10. 如下 C++ 代码执行时如输入5，将输出代码后的字符图形。

  ```cpp
  int n;
  cin >> n;
  for (int i = 1; i < n + 1; i++) {
      for (int j = 1; j < n - i + 1; j++)
          cout << 0;
      for (int k = 1; k < 2 * i; k++) {
          if (k <= i)
              cout << k;
          else
              cout << 2 * i - k;
      }
      for (int j = 1; j < n - i + 1; j++)
          cout << 0;
      cout << endl;
  }
  000010000
  000121000
  001232100
  012343210
  123454321
  ```

= 编程题（每题 25 分，共 50 分）

== 编程题 1：完全平方数计数

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨同学正在研究完全平方数。平方：一个数的平方等于这个数乘以这个数本身。完全平方数：指可以恰好表示为某个正整数的平方的数。例如，$9$是完全平方数，因为$9 = 3^2 = 3 times 3$；但$27$不是，因为$27$不能表示为任何正整数的平方。给定两个正整数$l$和$r$（保证$l <= r$），小杨同学想知道$l$到$r$之间的所有正整数中（包含$l$和$r$），有多少个数是完全平方数。8 / 103.1.2 输 格式入输入两行，第一行为一个正整数$l$，第二行为一个正整数$r$。

=== 输出格式

输出一个非负整数，表示$l$到$r$中，有多少个正整数是完全平方数。如果$l$到#(math-missing)中没有完全平方数，则输出0。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
1
21
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
4
```

=== 数据范围

。

=== 提示

在$1$到$21$中，有以下$4$个整数是完全平方数：

=== 参考程序

```cpp
#include <iostream>
using namespace std;
int main() {
    int ans = 0, l, r;
    cin >> l >> r;
    for (int i = 1; i * i <= r; ++i)
    {
        if (i * i >= l)
            ans++;
    }
    cout << ans << endl;
    return 0;
}
```

== 编程题 2：菱形

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

给定正整数$n$，在$(2n - 1) times (2n - 1)$个网格的画布中，使用字符画一个边长为$n$个网格的菱形。其中，空白网格使用.表示，菱形边所在的网格用+表示。例如当$n = 3$时，图形如下：9 / 10

=== 输入格式

输入一个正整数$n$；

=== 输出格式

输出$2n-1$行，表示按要求画的菱形。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
...+...
..+.+..
.+...+.
+.....+
.+...+.
..+.+..
...+...
```

=== 数据范围

。

=== 参考程序

```cpp
#include <iostream>
using namespace std;
int main() {
    int n;
    cin >> n;
    for (int i = 1; i <= 2 * n - 1; ++i) {
        for (int j = 1; j <= 2 * n - 1; ++j) {
            if (i + j == n + 1 || i + j == 3 * n - 1)
                cout << '+';
            else if (i - j == n - 1 || j - i == n - 1)
                cout << '+';
            else
                cout << '.';
        }
        cout << '\n';
    }
    return 0;
}10 / 10
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
