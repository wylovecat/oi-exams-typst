// ===========================================================================
// GESP 2025-09 C++ 四级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-09/2025-09-L4.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 4,
  month: "2025 年 09 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 运行下面程序后变量a的值是（#slot）。

  ```cpp
  int a = 42;
  int* p = &a;
  *p = *p + 1;
  ```
  + 42
  + 43
  + 编译错误
  + 不确定

2. 以下关于数组的描述中，（#slot）是错误的。
  + 数组名是一个指针常量
  + 随机访问数组的元素方便快捷
  + 数组可以像指针一样进行自增操作
  + sizeof(arr)返回的是整个数组arr占用的字节数

3. 给定如下定义的数组arr，则\*(\*(arr + 1) + 2)的值是（#slot）。

  ```cpp
  int arr[2][3] = {{1, 2, 3}, {4, 5, 6}};
  ```
  + 2
  + 5
  + 4
  + 6

4. 下面这段代码会输出（#slot）。

  ```cpp
  int add(int a, int b = 1); // 函数声明
  int main() {
      cout << add(2) << " " << add(2, 3);
      return 0;
  }
  int add(int a, int b) { // 函数定义
      return a + b;
  }
  ```
  + 3 5
  + 编译失败：定义处少了默认参数
  + 运行错误
  + 链接失败：未定义引用

5. 下面这段代码会输出（#slot）。

  ```cpp
  int x = 5;
  void foo() {
      int x = 10;
      cout << x << " ";
  }
  void bar() {
      cout << x << " ";
  }
  int main() {
      foo();
      bar();
  }
  ```
  + 5 5
  + 10 10
  + 5 10
  + 10 5

6. 下面程序运行的结果是（#slot）。

  ```cpp
  void increaseA(int x) {
      x++;
  }
  void increaseB(int* p) {
      (*p)++;
  }
  int main() {
      int a = 5;
      increaseA(a);
      cout << a << " ";
      increaseB(&a);
      cout << a;
  }
  ```
  + 6 7
  + 6 6
  + 5 6
  + 5 5

7. 关于结构体初始化，以下哪个选项中正确的是（#slot）。

  ```cpp
  struct Point {int x,y;};
  Point p = new {1,2};
  ```
  + Point p = (1,2);
  + Point p = {1,2};
  + Point p = \<1,2\>;

8. 运行如下代码会输出（#slot）。

  ```cpp
  struct Cat {
      string name;
      int age;
  };
  void birthday(Cat& c) {
      c.age++;
  }
  int main() {
      Cat kitty{"Mimi", 2};
      birthday(kitty);
      cout << kitty.name << " " << kitty.age;
  }
  ```
  + Mimi 2
  + Mimi 3
  + kitty 3
  + kitty 2

9. 关于排序算法的稳定性，以下说法错误的是（#slot）。
  + 稳定的排序算法不改变相等元素的相对位置
  + 冒泡排序是稳定的排序算法
  + 选择排序是稳定的排序算法
  + 插入排序是稳定的排序算法

10. 下面代码试图实现选择排序，使其能对数组nums排序为升序，则横线上应分别填写（#slot）。

  ```cpp
  void selectionSort(vector<int>& nums) {
      int n = nums.size();
      for (int i = 0; i < n - 1; ++i) {
          int minIndex = i;
          for (int j = i + 1; j < n; ++j) {
              if ( __________ ) {     // 在此处填入代码
                  minIndex = j;
              }
          }
         ____________________; // 在此处填入代码
      }
  }
  nums[j] < nums[minIndex]
  swap(nums[i], nums[minIndex])
  nums[j] > nums[minIndex]
  swap(nums[i], nums[minIndex])
  nums[j] <= nums[minIndex]
  swap(nums[j], nums[minIndex])
  nums[j] <= nums[minIndex]
  swap(nums[i], nums[j])
  ```
  + Point p = (1,2);
  + 最好情况是 $O(n)$ ，最坏情况是 $O(n^2)$
  + 最好情况是 $O(n)$ ，最坏情况是 $O(2^n)$
  + 第 12 题 关于插入排序的时间复杂度，下列说法正确的是（#slot）。

11. 下面程序实现插入排序（升序排序），则横线上应分别填写（#slot）。

  ```cpp
  void insertionSort(int arr[], int n) {
      for (int i = 1; i < n; i++) {
          int key = arr[i];
          int j = i - 1;
          while ( j >= 0 && ____________________ ) { // 在此处填入代码
              arr[j + 1] = arr[j];
              j--;
          }
          ____________________; // 在此处填入代码
      }
  }
  arr[j] > key
  arr[j + 1] = key
  arr[j] < key
  arr[j] = key
  ```
  + 最好情况和最坏情况的时间复杂度都是 $O(n^2)$
  + ```cpp
    arr[j] < key
    arr[j + 1] = key
    ```
  + ```cpp
    arr[j] > key
    arr[j] = key
    ```
  + 最好情况是 $O(n^2)$ ，最坏情况是 $O(2^n)$

12. 关于插入排序的时间复杂度，下列说法正确的是（#slot）。
  + 最好情况和最坏情况的时间复杂度都是
  + 最好情况是$O(n)$，最坏情况是
  + 最好情况是$O(n)$，最坏情况是
  + 最好情况是$O(n^2)$，最坏情况是

13. 小杨正在爬楼梯，需要$n$阶才能到达楼顶，每次可以爬$1$阶或$2$阶，求小杨有多少种不同的方法可以爬到楼顶，横线上应填写（#slot）。

  ```cpp
  int climbStairs(int n) {
      if (n <= 2) return n;
      int prev2 = 1;
      int prev1 = 2;
      int current = 0;
      for (int i = 3; i <= n; ++i) {
          ________________    // 在此处填入代码
      }
      return current;
  }
  ```
  + ```cpp
    prev2 = prev1;
    prev1 = current;
    current = prev1 + prev2;
    ```
  + ```cpp
    current = prev1 + prev2;
    prev2 = prev1;
    prev1 = current;
    ```
  + ```cpp
    current = prev1 + prev2;
    prev1 = current;
    prev2 = prev1;
    ```
  + ```cpp
    prev1 = current;
    prev2 = prev1;
    current = prev1 + prev2;
    ```

14. 假设有一个班级的成绩单，存储在一个长度为n的数组scores中，每个元素是一个学生的分数。老师想要找出#(math-missing)所有满足scores[i] + scores[j] + scores[k] == 300的三元组，其中 i \< j \< k。下面代码实现该功能，请问其时间复杂度是（#slot）。

  ```cpp
  int cnt = 0;
  for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
          for (int k = j + 1; k < n; k++) {
              if (scores[i] + scores[j] + scores[k] == 300) {
                  cnt++;
              }
          }
      }
  }
  ```
  + 
  + 
  + 
  + 

15. 关于异常处理，以下说法错误的是（#slot）。
  + try块中的代码可能会抛出异常
  + catch块可以有多个，处理不同类型的异常
  + throw语句用于抛出异常
  + 所有异常都必须被捕获，否则程序会崩溃

= 判断题（每题 2 分，共 20 分）

1. 以下代码能正确初始化指针。

  ```cpp
  int a = 5;
  int *p = a;
  ```

2. 执行下面C++代码将输出11。

  ```cpp
  int x = 10;
  void f() {
      int x = x + 1;
      cout << x << endl;
  }
  int main() {
      f();
  }
  ```

3. 以下C++代码合法。

  ```cpp
  struct Student {
      string name;
      int age;
      float score;
  };
  Student* students = new Student[20];
  ```

4. 执行下面C++代码将输出10。

  ```cpp
  void func(int* p) {
      *p = 10;
  }
  int main() {
      int a = 5;
      func(&a);
      cout << a << endl;
      return 0;
  }
  ```

5. 下面代码将二维数组arr传递给函数f，函数内部用arr[i][j]访问元素，函数参数声明为int arr[] [4]是错误的。

  ```cpp
  void f(int arr[][4], int rows) {
      // 访问 arr[i][j]
  }
  int main() {
      int arr[3][4] = { /* 初始化 */ };
      f(arr, 3);
  }
  ```

6. 递推是在给定初始条件下，已知前一项（或前几项）求后一项的过程。

7. 虽然插入排序的时间复杂度为$O(n^2)$，但由于单元操作相对较少，因此在小数据量的排序任务中非常受欢迎。

8. 对整数数组{4, 1, 3, 1, 5, 2}进行冒泡排序（将最大元素放到最后），执行一轮之后是{4, 1, 3, 1, 2, 5}。

9. 以下代码只能捕获int类型异常。

  ```cpp
  int main() {
      try {
          throw 42;
      } catch (...) {
          cout << "Caught" << endl;
      }
      return 0;
  }
  ```

10. 以下代码将Hello写入文件data.txt。

  ```cpp
  ofstream file("data.txt");
  cout<<"Hello"<< endl;
  file.close();
  ```

= 编程题（每题 25 分，共 50 分）

== 编程题 1：排兵布阵

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

作为将军，你自然需要合理地排兵布阵。地图可以视为$n$行$m$列的网格，适合排兵的网格以1标注，不适合排兵的网格以0标注。现在你需要在地图上选择一个矩形区域排兵，这个矩形区域内不能包含不适合排兵的网格。请问可选择的矩形区域最多能包含多少网格？

=== 输入格式

第一行，两个正整数$n, m$，分别表示地图网格的行数与列数。接下来$n$行，每行$m$个整数$a_(i,1), a_(i,2), dots.h , a_(i,m)$，表示各行中的网格是否适合排兵。

=== 输出格式

一行，一个整数，表示适合排兵的矩形区域包含的最大网格数。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4 3
0 1 1
1 0 1
0 1 1
1 1 1
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
4
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
3 5
1 0 1 0 1
0 1 0 1 0
0 1 1 1 0
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
3
```

=== 数据范围

对于所有测试点，保证，保证。

=== 参考程序

```cpp
#include <algorithm>
#include <cstdio>
using namespace std;
const int N = 15;
int n, m;
int a[N][N];
int ans;
int main() {
    scanf("%d%d", &n, &m);
    for (int i = 1; i <= n; i++)
        for (int j = 1; j <= m; j++) scanf("%d", &a[i][j]);
    for (int u = 1; u <= n; u++)
        for (int l = 1; l <= m; l++)
            for (int d = u; d <= n; d++) {
                int chk = 1;
                for (int r = l; r <= m; r++) {
                    for (int x = u; x <= d; x++) chk &= a[x][r];
                    if (!chk) break;
                    ans = max(ans, (r - l + 1) * (d - u + 1));
                }
            }
    printf("%d\n", ans);
    return 0;
}
```

== 编程题 2：最长连续段

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

对于$k$个整数构成的数组$[b_1, b_2, dots.h , b_k]$，如果对$1 <= i < k$都有$b_(i+1) = b_i + 1$，那么称数组$b$是一个连续段。给定由$n$个整数构成的数组$[a_1, a_2, dots.h , a_n]$，你可以任意重排数组$a$中元素顺序。请问在重排顺序之后，$a$所有是连续段的子数组中，最长的子数组长度是多少？例如，对于数组$[1,0,2,4]$，可以将其重排为$[4,0,1,2]$，有以下$10$个子数组：其中除$[4,0],[4,0,1],[4,0,1,2]$以外的子数组均是连续段，因此是连续段的子数组中，最长子数组长度为$3$。3.2.2 输 格式入第一行，一个正整数$n$，表示数组长度。第二行，$n$个整数$a_1, a_2, dots.h , a_n$，表示数组中的整数。

=== 输出格式

一行，一个整数，表示数组$a$重排顺序后，所有是连续段的子数组的最长长度。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
4
1 0 2 4
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
3
```

#text(size: 12pt, weight: "bold")[输入样例 2]

```text
9
9 9 8 2 4 4 3 5 3
```

#text(size: 12pt, weight: "bold")[输出样例 2]

```text
4
```

=== 数据范围

对于$40$% 的测试点，保证$1 <= n <= 8$。对于所有测试点，保证$1 <= n <= 10^5$，$-10^9 <= a_i <= 10^9$。

=== 参考程序

```cpp
#include <algorithm>
#include <cstdio>
using namespace std;
const int N = 1e5 + 5;
int n;
int a[N];
int last, cnt, mx;
int main() {
    scanf("%d", &n);
    for (int i = 1; i <= n; i++) scanf("%d", &a[i]);
    sort(a + 1, a + n + 1);
    last = a[1];
    cnt = mx = 1;
    for (int i = 1; i <= n; i++) {
        if (a[i] == last) continue;
        if (a[i] == last + 1)
            cnt++;
        else
            cnt = 1;
        last = a[i];
        mx = max(cnt, mx);
    }
    printf("%d\n", mx);
    return 0;
}
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
