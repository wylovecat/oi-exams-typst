// ===========================================================================
// GESP 2024-12 C++ 四级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2024-12/2024-12-L4.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 4,
  month: "2024 年 12 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 下面的语句中，（#slot）正确定义了一个计算浮点数$x$的平方（#slot）的函数,并成功调用该函数。
  + ```cpp
    float square(float x) {
        return x * x;
    }
    float area = square(2);
    ```
  + ```cpp
    square(float x) {
        return x * x;
    }
    float area = square(2);
    ```
  + ```cpp
    void square(float x) {
        return x * x;
    }
    area = square(2.0);
    ```
  + ```cpp
    void square(float x) {
        x * x;
        return;
    }
    area = square(2);
    ```

2. 下面代码的描述中，正确的是（#slot）。

  ```cpp
  void n_chars(char c, int n) {
     while (n-- > 0)
          cout << c;
  }
  char my_char = 'w';
  int times = 5;
  n_chars(my_char, times);
  ```
  + 代码执行结束后，times的值为0
  + n是形参，times是实参
  + n是实参，times是形参
  + 代码最后一行换成n\_chars(times, my\_char);也可以

3. 给定以下代码，执行上述代码后，变量a的值为（#slot）。

  ```cpp
  void func(int& x) {
      x = x * 2;
  }
  int a = 5;
  func(a);
  ```
  + 5
  + 10
  + 15
  + 20

4. 运行下面代码，屏幕上输出是（#slot）。

  ```cpp
  double* p_arr = new double [3];
  p_arr[0] = 0.2;
  p_arr[1] = 0.5;
  p_arr[2] = 0.8;
  p_arr += 1;
  cout << p_arr[0] << endl;
  p_arr -= 1;
  delete p_arr;
  ```
  + 0.2
  + 0.5
  + 1.2
  + 1.5

5. 运行下面代码片段后，x和\*p的结果分别是（#slot）。

  ```cpp
  int x = 20;
  int* p = &x;
  *p = *p + 2
  ```
  + 20 20
  + 20 22
  + 22 20
  + 22 22

6. 下面的描述中，（#slot）不能正确定义一个名为Student的结构体以及一个包含20个元素的结构数组。
  + ```cpp
    struct Student {
        string name;
        int age;
        float score;
    };
    struct Student  students[20];
    ```
  + ```cpp
    struct Student {
        string name;
        int age;
        float score;
    };
    Student  students[20];
    ```
  + ```cpp
    struct Student {
        string name;
        int age;
        float score;
    };
    Student*  students = new Student[20];
    ```
  + ```cpp
    struct Student {
        string name;
        int age;
        float score;
    };
    Student  students = new Student[20];
    ```

7. 假定整型是32位，对一个$2$行$3$列的二维整数数组array,假设数组第一个元素在内存中的地址为0x7ffee4065820，则第2行第2个元素的地址&array[1][1]为（#slot）。

  ```cpp
  int array[2][3] = {
      {0, 1, 2},
      {3, 4, 5}
  };
  ```
  + 0x7ffee4065824
  + 0x7ffee4065828
  + 0x7ffee406582c
  + 0x7ffee4065830

8. 下面（#slot）正确定义二维数组。

  ```cpp
  int a[][2] = {{1,2},{1,2},{3,4}};
  ```
  + int a[3][];
  + int a[][];
  + int a[][4];

9. 下面代码采用递推算法来计算斐波那契数列$f(n) = f(n - 1) + f(n - 2)$，则横线上应填写（#slot）。

  ```cpp
  int fib(int n) {
      if (n == 0 || n == 1)
          return n;
      int f1 = 0;
      int f2 = 1;
      int result = 0;
      for (int i = 2; i <= n; i++) {
          ________________________________     // 在此处填入代码
      }
      return result;
  }
  result = f1 + f2;
  f2 = result;
  f1 = f2;
  ```
  + ```cpp
    result = f1 + f2;
    f1 = f2;
    f2 = result;
    ```
  + ```cpp
    result += f1 + f2;
    f1 = f2;
    f2 = result;
    ```
  + ```cpp
    result += f1 + f2;
    f2 = result;
    f1 = f2;
    ```
  + $O(n)$

10. 下面关于排序算法（冒泡排序、插入排序和选择排序）的描述中，不正确的是（#slot）。
  + 冒泡排序基于元素交换实现，需借助临时变量，共涉及$3$个单元操作；而插入排序基于元素赋值实现，仅需个单元操作。因此冒泡排序的计算开销通常比插入排序更高。
  + 选择排序在任何情况下的时间复杂度都为$O(n^2)$。
  + 冒泡排序在任何情况下的时间复杂度都为$O(n^2)$。
  + 如果给定数据部分有序，插入排序通常比选择排序效率更高。

11. 冒泡排序的第一轮操作是从左到右遍历数组，通过两两比较相邻元素，将当前最大的元素移动到末尾。给定数组arr[]={4, 1, 3, 1, 5, 2}，执行第一轮冒泡排序后数组arr中的内容为（#slot）。
  + 1, 4, 3, 1, 5, 2
  + 1, 3, 1, 4, 2, 5
  + 1, 4, 3, 1, 2, 5
  + 4, 1, 3, 1, 5, 2

12. 给定如下代码，其时间复杂度为（#slot）。

  ```cpp
  int cellRecur(int n) {
      if (n == 1)
          return 1;
      return cellRecur(n - 1) + cellRecur(n - 1) + 1;
  }
  ```
  + $O(n^2)$
  + $O(2^n)$
  + $O(1)$
  + 第 10 题 下面关于排序算法（冒泡排序、插入排序和选择排序）的描述中，不正确的是（#slot）。

13. 下面代码实现了插入排序函数，则横线上应填写（#slot）。

  ```cpp
  void insertion_sort(vector<int> &nums) {
      for (int i = 1; i < nums.size(); i++) {
          ________________________________ {    // 在此处填入代码
          while (j >= 0 && nums[j] > base)
              nums[j + 1] = nums[j];
              j--;
          }
          nums[j + 1] = base;
      }
  }
  int base = nums[i], j = i - 1;
  int base = nums[i], j = i;
  int base = nums[0], j = i - 1;
  int base = nums[0], j = i;
  ```

14. 下面哪种方式不能实现将字符串"Welcome to GESP!"输出重定向到文件log.txt（#slot）。
  + ```cpp
    freopen("log.txt", "w", stdout);
    cout << "Welcome to GESP!" << endl;
    fclose(stdout);
    ```
  + ```cpp
    std::ofstream outFile("log.txt");
    outFile << "Welcome to GESP!" << endl;
    outFile.close();
    ```
  + ```cpp
    std::ofstream outFile("log.txt");
    cout << "Welcome to GESP!" << endl;
    outFile.close();
    ```
  + ```cpp
    ofstream log_file("log.txt");
    streambuf* org_cout = cout.rdbuf();
    cout.rdbuf(log_file.rdbuf());
    cout << "This output will go to the log file." << endl;
    cout.rdbuf(oorg_cout);
    ```

15. 运行下面的代码，将出现什么情况？（#slot）

  ```cpp
  double hmean(double a, double b) {
      if (a == -b )
          throw runtime_error("Runtime error occurred");
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
  + 屏幕上输出Caught: Runtime error occurred
  + 屏幕上输出Caught an unknown exception
  + 程序调用 std::terminate（#slot）
  + 编译错误

= 判断题（每题 2 分，共 20 分）

1. 在 C++ 中，下面代码可以正确定义指针和初始化指针。

  ```cpp
  int* ptr;
  *ptr = 10;
  ```

2. 一个函数必须在调用之前既声明又定义。

3. 函数参数可以通过值传递、引用传递和指针传递，这样函数内对参数的修改可以直接修改传入变量的值。

4. int arr[3][]是一个正确的二维数组的声明。

5. 递推是一种通过已知的初始值和递推公式，逐步求解目标值的算法。

6. 某算法的递推关系式为$T(n) = T(n - 1) + n$（ 为正整数）及$T(0) = 1$，则该算法的时间复杂度为$O(n^2)$。

7. 冒泡排序的平均时间复杂度为$O(n^2)$，但最优情况下为$O(n)$。

8. 冒泡排序和插入排序都是稳定的排序算法。

9. 选择排序是稳定的排序算法。

10. 在 C++语言中，如果一个函数可能抛出异常，那么一定要在try 子句里调用这个函数。

= 编程题（每题 25 分，共 50 分）

== 编程题 1：Recamán

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨最近发现了有趣的 Recamán 数列，这个数列是这样生成的：数列的第一项$a_1$是$1$；如果$a_(k - 1) - k$是正整数并且没有在数列中出现过，那么数列的第$k$项$a_k$为$a_(k - 1) - k$，否则为$a_(k - 1) + k$。小杨想知道 Recamán 数列的前$n$项从小到大排序后的结果。手动计算非常困难，小杨希望你能帮他解决这个问题。

=== 输入格式

第一行，一个正整数$n$。

=== 输出格式

一行，$n$个空格分隔的整数，表示 Recamán 数列的前$n$项从小到大排序后的结果。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
1 2 3 6 7
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
8
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
1 2 3 6 7 12 13 20
```

=== 数据范围

对于所有数据点，保证$1 <= n <= 3000$。

=== 提示

对于样例 1，$n=5$：；，不是正整数，因此；，不是正整数，因此；，是正整数，且没有在数列中出现过，因此；，不是正整数，因此；从小到大排序后的结果为1 2 3 6 7。

=== 参考程序

```cpp
#include <cstdio>
#include <algorithm>
using namespace std;
const int N = 2e5 + 5;
const int C = 1e6 + 5;
int n;
int a[N];
int vis[C];
void bubble_sort(int *a, int n) {
    bool flag = true;
    while (flag) {
        flag = false;
        for (int i = 1; i < n; ++i) {
            if (a[i] > a[i + 1]) {
                flag = true;
                int t = a[i];
                a[i] = a[i + 1];
                a[i + 1] = t;
            }
        }
    }
}
int main() {
    scanf("%d", &n);
    a[1] = 1;
    vis[1] = 1;
    for (int i = 2; i <= n; i++) {
        if (a[i - 1] - i <= 0 || vis[a[i - 1] - i])
            a[i] = a[i - 1] + i;
        else
            a[i] = a[i - 1] - i;
        vis[a[i]] = 1;
    }
    bubble_sort(a, n);
    for (int i = 1; i <= n; i++)
        printf("%d%c", a[i], " \n"[i == n]);
    return 0;
}
```

== 编程题 2：字符排序

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨有$n$个仅包含小写字母的字符串$s_1, s_2, dots.h , s_n$，小杨想将这些字符串按一定顺序排列后拼接到一起构成字符串。小杨希望最后构成的字符串$t$满足：假设$t_i$为字符串$t$的第$i$个字符，对于所有的$j < i$均有$t_j <= t_i$。两个字符的大小关系与其在字母表中的顺序一致，例如$e < g < p < s$。小杨想知道是否存在满足条件的字符串排列顺序。

=== 输入格式

第一行包含一个正整数$T$，代表测试数据组数。对于每组测试数据，第一行包含一个正整数$n$，含义如题面所示。之后$n$行，每行包含一个字符串$s_i$。

=== 输出格式

对于每组测试数据，如果存在满足条件的排列顺序，输出 1，否则输出 0。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
3
aa
ac
de
2
aac
bc
1
gesp
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
1
0
0
```

=== 提示

对于第一组测试数据，一种可行的排列顺序为 aa+ac+de，构成的字符串#(math-missing)为 aaacde，满足条件。对于全部数据，保证有$1 <= t, n <= 100$，每个字符串的长度不超过$10$。

=== 参考程序

```cpp
#include<bits/stdc++.h>
using namespace std;
string s[110];
void bubble_sort(string *a, int n) {
    bool flag = true;
    while (flag) {
        flag = false;
        for (int i = 1; i < n; ++i) {
            if (a[i] > a[i + 1]) {
                flag = true;
                string t = a[i];
                a[i] = a[i + 1];
                a[i + 1] = t;
            }
        }
    }
}
int main(){
    int t;
    cin>>t;
    while(t--){
        int n;
        cin>>n;
        for(int i=1;i<=n;i++){
            cin>>s[i];
        }
        bubble_sort(s, n);
        string t="";
        for(int i=1;i<=n;i++){
            t+=s[i];
        }
        int m = t.size();
        int fl=1;
        for(int i=1;i<m;i++){
            if(t[i]<t[i-1]){
                fl=0;
                break;
            }
        }
        cout<<fl<<"\n";
    }
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
