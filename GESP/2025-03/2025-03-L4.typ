// ===========================================================================
// GESP 2025-03 C++ 四级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-03/2025-03-L4.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 4,
  month: "2025 年 03 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 关于下述代码，说法错误的是（#slot）。

  ```cpp
  int multiply(int x, int y);
  int main() {
      int a = 4;
      int b = 5;
      int result = multiply(a, b);
      std::cout << "The result is: " << result << std::endl;
      return 0;
  }
  int multiply(int x, int y) {
      return x * y;
  }
  ```
  + 函数multiply的定义应该放到函数main之前。
  + 函数声明int multiply(int x, int y);中明确指定了函数multiply（#slot）的返回值为整数类型。
  + 在main函数中，函数multiply通过multiply(a, b)被调用，其中a和b是定义在main函数中的变量，它们作为实参传递给了multiply函数的形参x和y。
  + 运行上述代码，将输出The result is: 20。

2. 执行下述代码将输出（#slot）。

  ```cpp
  int x = 10;
  void func() { int x = 20; std::cout << x; }
  int main() {
      func();
      std::cout << x;
      return 0;
  }
  ```
  + 2020
  + 2010
  + 1010
  + 编译错误

3. 执行下述代码后，变量a的值为（#slot）。

  ```cpp
  int a = 10;
  int* p = &a;
  *p = 20
  ```
  + 10
  + 20
  + 随机值
  + 编译错误

4. 以下哪种参数传递方式可以避免拷贝大型对象？
  + 只能用值传递
  + 只能用引用传递
  + 只能用指针传递
  + 引用传递和指针传递均可

5. 执行下述代码，将输出（#slot）。

  ```cpp
  void swap(int a, int &b) {
      int temp = a;
      a = b;
      b = temp;
  }
  int main() {
      int x = 1, y = 2;
      swap(x, y);
      std::cout << x << y;
      return 0;
  }
  ```
  + 12
  + 21
  + 22
  + 11

6. 下面的描述中，（#slot）正确定义一个名为Person的结构体并正确初始化了一个Person结构体的变量p。

  ```cpp
  struct Person {
      string name;
      int age;
  };
  Person p("Yang", 10);
  struct Person {
      string name;
      int age;
  };
  Person p = new Person("Yang", 10);
  ```
  + 10
  + ```cpp
    struct Person {
        string name,
        int age;
    };
    Person p;
    p.name = "Yang";
    p.age = 10;
    ```
  + ```cpp
    struct Person {
        string name;
        int age;
    };
    Person p = { "Yang", 10 };
    ```
  + 结构的嵌套可以减少命名冲突，因此可以不必控制嵌套层次

7. 给定如下代码，下面描述错误的是（#slot）。

  ```cpp
  struct Person {
      std::string name;
      int age;
      struct Address {
          std::string street;
          std::string city;
      };
      Address address;
  };
  p.address.city = "Anytown";
  ```
  + 结构Person内嵌套结构Address
  + Person有一个Address类型的address成员
  + 一个Person类型的变量p的address的初始化可以写成：p.address.street = "123 Main St";
  + 结构的嵌套可以减少命名冲突，因此可以不必控制嵌套层次

8. 假设int arr[2][3] = {{1,2,3},{4,5,6}};，则arr[1][2]的值是（#slot）。
  + 2
  + 3
  + 5
  + 6

9. 下面（#slot）正确定义了二维数组。
  + int arr[3,4];
  + int arr[3][4];
  + int arr(3,4);
  + int a[3-4];

10. 小杨正在爬楼梯，需要爬 阶才能到达楼顶。如果每次可以爬 个或 个台阶，下面代码采用递推算法来计算一共有多少种不同的方法可以爬到楼顶，则横线上应填写（#slot）。

  ```cpp
  int f(int n) {
      if (n == 1 || n == 2)
          return n;
      int f1 = 1;
      int f2 = 2;
      int res = 0;
      for (int i = 3; i <= n; i++) {
          ________________________________     // 在此处填入代码
      }
      return res;
  }
  ```
  + ```cpp
    res += f1 + f2;
    f1 = f2;
    f2 = res;
    ```
  + ```cpp
    res = f1 + f2;
    f1 = f2;
    f2 = res;
    ```
  + ```cpp
    res += f1 + f2;
    f2 = res;
    f1 = f2;
    ```
  + ```cpp
    res = f1 + f2;
    f2 = res;
    f1 = f2;
    ```

11. 给定如下算法，其时间复杂度为（#slot）。

  ```cpp
  bool f(int arr[], int n, int target) {
      for (int i = 0; i < (1 << n); i++) {
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
  + $O(n^2)$
  + $O(n times 2^n)$
  + $O(1)$
  + $O(n^3)$

12. 下面关于排序稳定性的描述，正确的是（#slot）。
  + 稳定性指算法的时间复杂度恒定
  + 稳定排序保证相同元素的相对顺序不变
  + 选择排序是稳定排序
  + 插入排序不是稳定排序

13. 对数组arr[]={5, 3, 8, 1}进行升序排序，执行第一轮冒泡排序后数组arr中的内容为（#slot）。
  + 3, 5, 1, 8
  + 3, 1, 5, 8
  + 3, 5, 8, 1
  + 5, 3, 8, 1

14. 运行下面的代码，将出现（#slot）。

  ```cpp
  double hmean(double a, double b) {
      if (a == -b )
          throw runtime_error("Runtime error occurred.");
      return 2.0*a*b/(a + b);
  }
  int main() {
      double x = 10;
      double y = -10;
      try {
          int result = hmean(x, y);
          cout << "hmean: " << result << endl;
      }
      catch (const runtime_error& e) {
          cout << "Caught: " << e.what() << endl;
      } catch (...) {
          cout << "Caught an unknown exception." << endl;
      }
      return 0;
  }
  ```
  + 屏幕上输出Caught: Runtime error occurred.
  + 屏幕上输出Caught an unknown exception.
  + 程序调用 std::terminate（#slot）
  + 编译错误

15. 下面哪种方式不能实现将字符串"Happy Spring!"输出重定向到文件log.txt（#slot）。

  ```cpp
  freopen("log.txt", "w", stdout);
  cout << "Happy Spring!" << endl;
  fclose(stdout);
  std::ofstream outFile("log.txt");
  cout << "Happy Spring!" << endl;
  outFile.close();
  ofstream log_file("log.txt");
  streambuf* org_cout = cout.rdbuf();
  cout.rdbuf(log_file.rdbuf());
  cout << "Happy Spring!" << endl;
  cout.rdbuf(org_cout);
  ```
  + 屏幕上输出 Caught: Runtime error occurred.
  + ```cpp
    std::ofstream outFile("log.txt");
    outFile << "Happy Spring!" << endl;
    outFile.close();
    ```
  + 程序调用 std::terminate（#slot）
  + 编译错误

= 判断题（每题 2 分，共 20 分）

1. 函数是C++中的核心概念，用于封装可重用的代码块。

2. 在C++中，函数的返回类型可以省略，默认为int。

3. 结构体的成员默认是public访问权限。

4. 假设整数数组arr[4]= {0, 1, 2, 3};的第一个元素在内存中的地址为0x7ffee4065820, 经过int\* p = arr; p += 1;后，指针p的值是1。

5. 二维数组作为函数参数时，必须显式指定所有维度的大小。

6. 递推是一种通过已知的初始值和递推公式，逐步求解目标值的算法。

7. 考虑最坏情况下冒泡排序算法的时间复杂度，$T(n)$为待排序数字的数目为$n$的复杂度，则其递推关系式为，。

8. 插入排序在最好情况（已有序）下的时间复杂度是$O(n^2)$。

9. 对数组arr[]={4, 3, 1, 5, 2}进行升序排序，执行第一轮选择排序后数组arr中的内容是{1, 4, 3, 5, 2}。

10. 未捕获异常会调用std::terminate终止程序。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：荒地开垦

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有一大片荒地，可以表示为一个$n$行$m$列的网格图。小杨想要开垦这块荒地，但荒地中一些位置存在杂物，对于一块不存在杂物的荒地，该荒地可以开垦当且仅当其上下左右四个方向相邻的格子均不存在杂物。小杨可以选择至多一个位置，清除该位置的杂物，移除杂物后该位置变为荒地。小杨想知道在清除至多一个位置的杂物的情况下，最多能够开垦多少块荒地。

=== 输入格式

第一行包含两个正整数$n,m$，含义如题面所示。之后$n$行，每行包含一个长度为#(math-missing)且仅包含字符.和\#的字符串。如果为.，代表该位置为荒地，如果为\#，代表该位置为杂物。

=== 输出格式

输出一个整数，代表在清除至多一个位置的杂物的情况下，最多能够开垦的荒地块数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3 5
.....
.#..#
.....
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
11
```

=== 数据范围

对于全部数据，保证有$1 <= n, m <= 1000$。

=== 提示

移除第二行从左数第二块空地的杂物后：第一行从左数前$4$块荒地，第二行从左数前$3$块荒地，第三行从左数前$4$块荒地，均可开垦，$4 + 3 + 4 = 11$。

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
const int N = 1005;
char mat[N][N];
int a[N][N];
const int d[4][2] = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
int main() {
    int n, m, ans = 0;
    scanf("%d%d", &n, &m);
    assert(1 <= n && n <= 1000);
    assert(1 <= m && m <= 1000);
    for (int i = 1; i <= n; i ++)
        scanf("%s", mat[i] + 1);
    for (int i = 1; i <= n; i ++)
        for (int j = 1; j <= m; j ++) {
            int num = 0, p = -1;
            for (int k = 0; k < 4; k ++)
                if (mat[i + d[k][0]][j + d[k][1]] == '#')
                    num ++, p = k;
            if (mat[i][j] == '.' && num == 1)
                a[i + d[p][0]][j + d[p][1]] ++;
            else if (mat[i][j] == '.' && num == 0)
                ans ++;
            else if (mat[i][j] == '#' && num == 0)
                a[i][j] ++;
        }
    int mx = 0;
    for (int i = 1; i <= n; i ++)
        for (int j = 0; j <= m; j ++)
            mx = max(mx, a[i][j]);
    cout << ans + mx << endl;
    return 0;
}
```

== 编程题 2：二阶矩阵

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 有一个$n$行$m$列的矩阵$A$。小 A 认为一个$2 times 2$的矩阵$D$是好的，当且仅当$D_(1,1) times D_(2,2) = D_(1,2) times D_(2,1)$。其中$D_(i,j)$表示矩阵$D$的第$i$行第$j$列的元素。小 A 想知道$A$中有多少个好的子矩阵。

=== 输入格式

第一行，两个正整数$n,m$。接下来$n$行，每行$m$个整数$A_(i,1), A_(i,2), dots.h , A_(i,m)$。

=== 输出格式

一行，一个整数，表示$A$中好的子矩阵的数量。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3 4
1 2 1 0
2 4 2 1
0 3 3 0
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
2
```

=== 数据范围

对于所有测试点，保证$1 <= n <= 500$，$1 <= m <= 500$，$-100 <= A_(i,j) <= 100$。

=== 提示

样例中的好的子矩阵如下：

=== 参考程序

```cpp
#include <bits/stdc++.h>
using namespace std;
const int N = 505;
int n, m;
int a[N][N];
int ans;
int main() {
    scanf("%d%d", &n, &m);
    assert(1 <= n && n <= 500 && 1 <= m && m <= 500);
    for (int i = 1; i <= n; i++)
        for (int j = 1; j <= m; j++) {
            scanf("%d", &a[i][j]);
            assert(-100 <= a[i][j] && a[i][j] <= 100);
        }
    for (int i = 1; i < n; i++)
        for (int j = 1; j < m; j++)
            if (a[i][j] * a[i + 1][j + 1] == a[i + 1][j] * a[i][j + 1])
                ans++;
    printf("%d\n", ans);
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
