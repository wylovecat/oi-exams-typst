// ===========================================================================
// GESP 2025-06 C++ 四级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-06/2025-06-L4.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 4,
  month: "2025 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 在C++中，声明一个指向整型变量的指针的正确语法是（#slot）。
  + int\* ptr;
  + \*int ptr;
  + int ptr\*;
  + ptr int;

2. 下面的函数接收一个 行 列的二维数组并输出其中元素，则横线上不能填写（#slot）。

  ```cpp
  void printArray(________) {
      for (int i = 0; i < 3; ++i)
          for (int j = 0; j < 4; ++j)
              std::cout << arr[i][j] << " ";
  }
  ```
  + int arr[3][4]
  + int arr[][4]
  + int (\*arr)[4]
  + int\*\* arr

3. 在C++中，int arr[3][4]和int\* arr = new int[12]均可模拟一个$3$行$4$列的二维数组。关于这两种方式，下面说法错误的是（#slot）。
  + int arr[3][4]在栈上分配空间，适合数组较小的情况；
  + int\* arr = new int[12]在堆上分配空间，数组较大时也适用；
  + 这两种方式申请的内存空间都是连续的。
  + 这两种方式申请的内存都能自动释放。

4. 关于以下 C++代码，说法正确的是（#slot）。

  ```cpp
  int main() {
      greet();
      return 0;
  }
  void greet() {
      cout << "Hello!" << endl;
  }
  ```
  + 正确编译并输出Hello!
  + 编译错误：找不到函数greet（#slot）
  + 编译警告但可以运行
  + 链接错误

5. 在C++中，如果希望通过函数修改传入的结构体对象的内容，应该使用哪种参数传递方式？
  + 值传递或引用传递
  + 值传递或指针传递
  + 引用传递或指针传递
  + 仅指针传递

6. 以下哪个选项正确描述了C++中形参和实参的区别？
  + 形参是函数调用时传递给函数的具体值，实参是函数定义中声明的变量。
  + 形参是函数定义中声明的变量，实参是函数调用时传递给函数的具体值。
  + 形参和实参在函数调用时是完全相同的。
  + 形参只在函数内部可见，实参在函数外部可见。

7. 运行如下代码会输出（#slot）。

  ```cpp
  int value = 100;
  void print1() {
      int value = 50;
      cout << value << " ";
      cout << ::value << " ";
  }
  void print2() {
      cout << value << " ";
  }
  print1();
  print2();
  ```
  + 100 100 100
  + 50 50 50
  + 50 100 100
  + 50 50 100

8. 小杨在整理一副扑克牌的所有红心扑克牌，使其从小到大排列。他的做法是：最开始抓到第1张扑克牌被认为已经排好序；然后抓第2张扑克牌，将其插入至有序部分的正确位置；不断循环步骤，每次将新抓到扑克牌插入至有序部分，直至抓完所有扑克牌，这样抓牌结束时就完成了扑克牌的排序。小杨这种整理扑克牌的方式与（#slot）排序的方式最接近。
  + 冒泡排序
  + 插入排序
  + 选择排序
  + 直接排序

9. 以下哪种情况是使用插入排序的合适场景？
  + 数据量非常大，且乱序严重
  + 希望获得稳定排序，但不要求实时性
  + 数据几乎有序，只需少量调整
  + 想在交换次数最少的前提下排好大数组

10. 以下关于递推算法基本思想的描述，正确的是（#slot）。
  + 递推算法通过将问题分解为相互独立的子问题来解决。
  + 递推算法从已知的基础情况出发，通过某种关系逐步推导出更大规模问题的解。
  + 递推算法通常用于穷举所有可能的解决方案。
  + 递推算法适用于在每一步做出局部最优选择以达到全局最优。

11. 给定如下算法，其时间复杂度为（#slot）。

  ```cpp
  bool f(int arr[], int n, int target) {
      for (int i = 0; i < n; i++) {
          int sum = 0;
          for (int j = 0; j < n; j++) {
              if (i & (1 << j)) {
                  sum += arr[j];
              }
          }
          if (sum == target) return true;
      }
      return false;
  }
  ```
  + 冒泡排序
  + 插入排序
  + 选择排序
  + 直接排序

12. 下述斐波那契数列计算的时间复杂度是（#slot）。

  ```cpp
  int fibonacci(int n) {
      if (n == 0) return 0;
      if (n == 1) return 1;
      return fibonacci(n - 1) + fibonacci(n - 2);
  }
  ```
  + 将从标准输入读取每行，并输出到屏幕
  + 程序无法运行，因为getline 只能读取 cin
  + 将 data.txt 中的每一行读取并输出到屏幕
  + 程序将创建 data.txt 并写入默认文本

13. 关于下面 C++ 程序的描述，（#slot）最准确。

  ```cpp
  ifstream in("data.txt");
  string line;
  while (getline(in, line)) {
      cout << line << endl;
  }
  ```
  + 将从标准输入读取每行，并输出到屏幕
  + 程序无法运行，因为getline只能读取cin
  + 将 data.txt 中的每一行读取并输出到屏幕
  + 程序将创建 data.txt 并写入默认文本

14. 在C++中，异常处理机制（try-catch块）的主要目的是（#slot）。
  + 提高程序的运行速度。
  + 在程序发生运行时错误时，提供一种结构化的错误处理方式。
  + 确保程序在编译时没有错误。
  + 减少程序的内存占用。

15. 为了提高冒泡排序的效率，如果某轮“冒泡”中没有执行任何交换操作，说明数组已经完成排序，可直接返回结果，则两条横线上分别应该填写（#slot）。

  ```cpp
  void bubbleSortWithFlag(vector<int> &nums) {
      for (int i = nums.size() - 1; i > 0; i--) {
          bool flag;
          ________________    // 在此处填入代码
          for (int j = 0; j < i; j++) {
              if (nums[j] > nums[j + 1]) {
                  swap(nums[j], nums[j + 1]);
                  ___________________________    // 在此处填入代码
              }
          }
          if (!flag)
              break;
      }
  }
  flag = false;
  flag = false;
  ```
  + 提高程序的运行速度。
  + ```cpp
    flag = false;
    flag = true;
    ```
  + ```cpp
    flag = true;
    flag = false;
    ```
  + ```cpp
    flag = true;
    flag = true;
    ```

= 判断题（每题 2 分，共 20 分）

1. 下面C++代码正确声明了一个返回int类型、接受两个int参数的函数。

  ```cpp
  int add(int, int);
  ```

2. 下面C++代码的输出是15。

  ```cpp
  void foo(int x) {
      x += 5;
  }
  int main() {
      int a = 10;
      foo(a);
      cout << a << endl;
  }
  ```

3. 下面c++代码在一个结构体中又定义了别的结构体。这种结构嵌套定义的方式语法不正确。

  ```cpp
  #include <string>
  #include <vector>
  using namespace std;
  struct Library {
      struct Book {
          struct Author {
              string name;
              int birthYear;
          };
          string title;
          int year;
          Author author;
      };
      string name;
      vector<Book> books;
  };
  ```

4. 在C++中，相比于值传递，使用引用传递作的优点可以直接操作和修改原始变量，避免数据拷贝，提高效率。

5. 下面这段代码不合法，因为每一行都必须显式初始化 个元素。

  ```cpp
  int arr[2][3] = {{1, 2}, {3}};
  ```

6. 以下程序中使用了递推方式计算阶乘（#slot），计算结果正确。

  ```cpp
  int factorial(int n) {
      int res = 1;
      for (int i = 0; i < n; ++i) {
          res *= i;
      }
      return res;
  }
  ```

7. 无论初始数组是否有序，选择排序都执行$O(n^2)$次比较

8. 以下C++代码，尝试对有n个整数的数组arr进行排序。这个代码实现了选择排序算法。

  ```cpp
  for (int i = 0; i < n - 1; ++i) {
      int minIndex = i;
      for (int j = i + 1; j < n; ++j) {
          if (arr[j] < arr[minIndex])
              minIndex = j;
      }
      if (minIndex != i)
          swap(arr[i], arr[minIndex]);
  }
  ```

9. 如果一个异常在 try 块中抛出但没有任何 catch 匹配，它将在编译时报错。

10. 下面C++代码实现将Hello写入data.txt。

  ```cpp
  ofstream out("data.txt");
  out << "Hello";
  out.close();
  ```

= 编程题（每题 25 分，共 50 分）

== 编程题 1：画布裁剪

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 在高为$h$宽为$w$的矩形画布上绘制了一幅画。由于画布边缘留白太多，小 A 想适当地裁剪画布，只保留画的主体。具体来说，画布可以视为$h$行$w$列的字符矩阵，其中的字符均为 ASCII 码位于$33 tilde.op 126$之间的可见字符，小 A只保留画布中由第$x_1$行到第$x_2$行、第$y_1$列到第$y_2$列构成的子矩阵。小 A 将画布交给了你，你能帮他完成画布的裁剪吗？

=== 输入格式

第一行，两个正整数$h, w$，分别表示画布的行数与列数。第二行，四个正整数$x_1, x_2, y_1, y_2$，表示保留的行列边界。接下来$h$行，每行一个长度为$w$的字符串，表示画布内容。

=== 输出格式

输出共$x_2 - x_1 + 1$行，每行一个长度为$y_2 - y_1 + 1$的字符串，表示裁剪后的画布。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3 5
2 2 2 4
.....
.>_<.
.....
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
>_<
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
5 5
1 2 3 4
AbCdE
fGhIk
LmNoP
qRsTu
VwXyZ
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
Cd
hI
```

=== 数据范围

对于所有测试点，保证$1 <= h, w <= 100$，$1 <= x_1 <= x_2 <= h$，$1 <= y_1 <= y_2 <= w$。

=== 参考程序

```cpp
#include <cstdio>
using namespace std;
const int N = 105;
int n, m;
char s[N][N];
int x1, x2, y1, y2;
int main() {
    scanf("%d%d", &n, &m);
    scanf("%d%d%d%d", &x1, &x2, &y1, &y2);
    for (int i = 1; i <= n; i++)
        scanf("%s", s[i] + 1);
    for (int i = x1; i <= x2; i++) {
        s[i][y2 + 1] = 0;
        printf("%s\n", s[i] + y1);
    }
    return 0;
}
```

== 编程题 2：排序

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

体育课上有$n$名同学排成一队，从前往后数第$i$位同学的身高为$h_i$，体重为$w_i$。目前排成的队伍看起来参差不齐，老师希望同学们能按照身高从高到低的顺序排队，如果身高相同则按照体重从重到轻排序。在调整队伍时，每次只能交换相邻两位同学的位置。老师想知道，最少需要多少次交换操作，才能将队伍调整成目标顺序。

=== 输入格式

第一行，一个正整数$n$，表示队伍人数。接下来$n$行，每行两个正整数$h_i$和$w_i$，分别表示第$i$位同学的身高和体重。

=== 输出格式

输出一行，一个整数，表示最少需要的交换次数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5
1 60
3 70
2 80
4 55
4 50
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
8
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
5
4 0
4 0
2 0
3 0
1 0
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
1
```

=== 数据范围

对于所有测试点，保证，保证。

=== 参考程序

```cpp
#include <cstdio>
#include <algorithm>
#include <vector>
#include <iostream>
using namespace std;
int main() {
    int n, ans = 0;
    scanf("%d", &n);
    vector<pair<int,int>> a(n);
    for (int i = 0; i < n; i ++)
        scanf("%d%d", &a[i].first, &a[i].second);
    for (int i = 0; i < n; i ++)
        for (int j = i + 1; j < n; j ++)
            if (a[i] < a[j])
                ans ++;
    cout << ans << '\n';
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
