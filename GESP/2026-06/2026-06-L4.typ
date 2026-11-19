// ===========================================================================
// GESP 2026-06 C++ 四级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2026-06/2026-06-L4.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 4,
  month: "2026 年 06 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 小杨正在编写一个“数字交换器”程序，他希望通过函数交换两个变量的值。请问运行以下代码后，屏幕上输出的是（#slot）。

  ```cpp
  void exchange(int *a, int &b) {
      int t = *a;
      *a = b;
      b = t;
  }
  int main() {
      int x = 100, y = 200;
      exchange(&x, y);
      cout << x << " " << y;
      return 0;
  }
  ```
  + 100 200
  + 200 100
  + 200 200
  + 编译错误

2. 下面程序想通过函数计算三门课总分，横线处应填入的是（#slot）。

  ```cpp
  int sumScore(int a, int b, int c) {
      return a + b + c;
  }
  int main() {
      int chinese = 88, math = 95, english = 90;
      int total = __________;
      cout << total;
      return 0;
  }
  sumScore(chinese, math, english)
  sumScore(int chinese, int math, int english)
  ```
  + sumScore
  + sumScore(a, b, c)

3. 下面程序输出结果是（#slot）。1 / 10

  ```cpp
  int addOne(int x) {
      return x + 1;
  }
  int main() {
      int a = 6;
      cout << addOne(a) + addOne(3);
      return 0;
  }
  ```
  + 9
  + 10
  + 11
  + 12

4. 关于下面程序，说法正确的是（#slot）。

  ```cpp
  void show() {
      int stars = 5;
  }
  int main() {
      cout << stars;
      return 0;
  }
  ```
  + 程序输出5
  + 程序可以通过编译，但输出随机值
  + 程序不能通过编译，因为stars只在show函数中有效
  + 程序不能通过编译，因为cout不能输出变量

5. 小杨在调试一个“等级提升”系统，代码逻辑如下，执行后\*p的值是（#slot）。

  ```cpp
  int lv = 5, next_lv = 6;
  int *p = &lv;
  *p = *p + 1;
  p = &next_lv;
  ```
  + 5
  + 6
  + lv的地址
  + next\_lv的地址

6. 小杨正在开发一款名为“星际网格”的游戏，他用二维数组int map[5][4];来表示地图。已知int占字节，如果map的内存地址是0x2000，则表达式&map + 1的地址值是（#slot）。
  + 0x204c
  + 0x205c
  + 0x2050
  + 0x2058

7. 执行完下面代码后，变量val的值是（#slot）。2 / 10

  ```cpp
  int data[] = {10, 20, 30, 40, 50};
  int *ptr = data + 2;
  int val = *(ptr - 1) + *(ptr + 1);
  ```
  + 50
  + 60
  + 70
  + 80

8. 某班$3$个小组、每组$4$名同学的分数存入下面的二维数组score，则score[1][2]的值是（#slot）。

  ```cpp
  int score[3][4] = {
      {80, 81, 82, 83},
      {90, 91, 92, 93},
      {70, 71, 72, 73}
  };
  ```
  + 81
  + 90
  + 92
  + 72

9. 小杨定义了一个结构体Hero来表示游戏角色，下面哪种初始化方式会由于语法错误导致编译失败？（#slot）。

  ```cpp
  struct Hero {
      string name;
      int hp;
  };
  Hero h = {"Arthur", 100};
  ```
  + ```cpp
        Hero h;
        h.name = "Arthur";
        h.hp = 100;
    Hero h = new Hero{"Arthur", 100};
    Hero *p = new Hero{"Arthur", 100};
    ```

10. 下面程序输出结果是（#slot）。

  ```cpp
  struct Book {
      string title;
      int pages;
  };
  int main() {
      Book books[2] = {{"Math", 120}, {"Science", 150}};
      cout << books[1].title;
      return 0;
  }
  ```
  + Math
  + Science3 / 10
  + 120
  + 150

11. 小杨在对“能量晶石”按亮度进行排序。如果两块晶石亮度相同，他希望保持它们在原始序列中的相对顺序。下列关于排序算法稳定性的说法，错误的是（#slot）。
  + 冒泡排序是稳定的，因为只有在左边比右边大时才交换。
  + 插入排序是稳定的，因为它将元素插入到相等元素的右侧。
  + 选择排序是稳定的，因为它每次选出最小元素放在前面。
  + 稳定性是指排序后相等元素的相对位置不发生改变。

12. 小杨的机器人正在能量踏板上跳跃，踏板编号为$1,2,3,…$。跳到第$n$块踏板的方案数满足递推式。若$f(1) = 1, f(2) = 2$，则运行以下代码计算jump(5)的结果是（#slot）。

  ```cpp
  int jump(int n) {
      if (n <= 2)
          return n;
      int a = 1, b = 2, c = 0;
      for (int i = 3; i <= n; i++) {
          c = a + b;
          a = b;
          b = c;
      }
      return c;
  }
  ```
  + 5
  + 8
  + 13
  + 21

13. 在“模拟实验室”程序中，为了防止除以#(math-missing)导致崩溃，小杨使用了异常处理机制。执行以下代码将输出（#slot）。

  ```cpp
  try {
      int x = 10, y = 0;
      if (y == 0) throw "Zero Error";
      cout << x / y;
  } catch (int e) {
      cout << "Error Code: " << e;
  } catch (const char* msg) {
      cout << "Caught: " << msg;
  }
  ```
  + 0
  + Error Code: 0
  + Caught: Zero Error
  + 程序直接崩溃

14. 下面代码使用某种排序算法，将数组中的元素按从小到大排序。这段代码使用的排序算法是（#slot）。4 / 10

  ```cpp
  void mystery_sort(double arr[], int n) {
      for (int i = 0; i < n - 1; i++) {
          int minPos = i;
          for (int j = i + 1; j < n; j++) {
              if (arr[j] < arr[minPos]) {
                  minPos = j;
              }
          }
          double temp = arr[i];
          arr[i] = arr[minPos];
          arr[minPos] = temp;
      }
  }
  ```
  + 冒泡排序
  + 插入排序
  + 选择排序
  + 非典型排序

15. 小杨正在读取“冒险日志”文件quest.txt。若文件内容为Level 10，执行以下程序后输出为（#slot）。

  ```cpp
  ifstream fin("quest.txt");
  string s;
  int v;
  fin >> s >> v;
  cout << s.length() * v;
  ```
  + 50
  + 15
  + 70
  + 5

= 判断题（每题 2 分，共 20 分）

1. 运行以下程序后，变量a的值最终会变为20。

  ```cpp
  void modify(int *p) {
      *p = *p + 10;
  }
  int main() {
      int a = 10;
      modify(&a);
      return 0;
  }
  ```

2. 在 C++ 中，引用一旦初始化并绑定到某个变量后，可以通过赋值语句将其重新绑定到另一个变量。

3. 下面程序可以正确计算并输出$3$名学生的平均成绩。5 / 10

  ```cpp
  struct Student {
      int id;
      int score;
  };
  int main() {
      Student students[3] = {
          {1, 90},
          {2, 80},
          {3, 100}
      };
      int sum = 0;
      for (int i = 0; i < 3; i++) {
          sum += students[i].score;
      }
      double average = sum / 3.0;
      cout << average << endl;
      return 0;
  }
  ```

4. 选择排序算法在寻找每一轮最小值时，如果遇到相等的元素不进行交换，则选择排序是一种稳定的排序算法。

5. 如果使用带flag的冒泡排序，且待排序数组一开始就是有序的，那么算法只需一轮扫描即可结束，时间复杂度为$O(n)$。

6. 在 C++ 中定义二维数组并初始化时，可以省略第一维，但不能省略第二维。因此int a[][2] = {{1, 2}, {3, 4}};是合法的，而int a[][] = {{1, 2}, {3, 4}};是不合法的。

7. 下面代码的时间复杂度是$O(2^n)$。

  ```cpp
  int cnt = 0;
  for (int i = 1; i <= n; i++) {
      for (int j = 1; j <= i; j++) {
          cnt++;
      }
  }
  ```

8. 假设文件output.txt能正常打开，下面代码通过rdbuf将cout的输出重定向到了文件中。

  ```cpp
  ofstream fout("output.txt");
  streambuf* old_buf = cout.rdbuf();
  cout.rdbuf(fout.rdbuf());
  cout << "GESP Exam";
  cout.rdbuf(old_buf);
  ```

9. 小杨想通过下面程序给饭卡充值，程序会输出70。

  ```cpp
  void recharge(int money) {
      money += 20;
  }
  int main() {
      int card = 50;
      recharge(card);
      cout << card;
      return 0;
  }
  ```

10. 下面代码可以通过编译。6 / 10

  ```cpp
  int a[5];
  a++;
  ```

= 编程题（每题 25 分，共 50 分）

== 编程题 1：扫雷

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小杨同学正在游玩经典游戏「扫雷」，他想自己生成一个「扫雷」的地图。小杨同学希望生成的地图大小为$n$行$m$列，一共$n times m$个区块。区块行号为$1,2,dots.h ,n$，列号为$1,2,dots.h ,m$。其中一些区块为雷区，其它区块不为雷区。小杨同学指定了$q$个区块为雷区，而其它区块均不为雷区。小杨同学希望你帮忙计算非雷区的区块，每个区块与多少个雷区相邻？我们定义区块相邻，当且仅当两个区块至少有一个公共顶点（也就是说对于不在地图边缘的区块，周围$8$个区块均与其相邻）。3.1.2 输 格式入输入包含$q + 1$行。第一行，三个正整数$n$，$m$和$q$，分别表示地图行数和列数，以及雷区数量。接下来的$q$行，每行有$2$个整数，分别表示第$i$个雷区的行号和列号。保证输入的雷区不重复。

=== 输出格式

输出$n$行，每行$m$个#(math-missing)字符（使用空格分割），对于第$i$行第$j$列，输出地图对应区块的信息：1. 如果为雷区，输出\*；2. 如果不是雷区，输出其相邻雷区数量（输出$0$到$8$中的一个数字）。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3 4 4
1 1
1 3
2 4
3 2
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
* 2 * 2
2 3 3 *
1 * 2 1
```

=== 数据范围

。输入的雷区必定在地图内且不重复，注意行号和列号均从$1$开始。

=== 参考程序

```cpp
#include <iostream>
using namespace std;
int mp[510][510];
int main() {
    int n, m, q;
    cin >> n >> m >> q;
    for (int i = 0; i < q; ++i) {
        int x, y;
        cin >> x >> y;
        mp[x-1][y-1] = -1;
    }
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            if (mp[i][j] == -1) {
                cout << '*' << ' ';
                continue;
            }
            for (int di = -1; di <= 1; ++di) {
                for (int dj = -1; dj <= 1; ++dj) {
                    if (i + di < 0 || i + di >= n || j + dj < 0 || j + dj >= m)
                        continue;
                    if (mp[i+di][j+dj] == -1)
                        mp[i][j] += 1;
                }
            }
            cout << mp[i][j] << ' ';
        }
        cout << '\n';
    }
    return 0;
}
```

== 编程题 2：身高体重指数

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

一个人的身高体重指数（BMI）等于其体重（千克为单位）除以其身高（米为单位）的平方。例如，一个体重为50kg，身高为$1.6upright("m")$的人的身高体重指数为50kg / 1.6m / 1.6m = 19.53125kg / m^2。现在有$n$个小朋友，第$i$个小朋友的编号为$i$，体重为$w_i$，身高为$h_i$。请按照身高体重指数从高到低为小朋友们排序，数据保证不存在两个小朋友的身高体重指数完全相同。输出排序后小朋友的编号。3.2.2 输 格式入输入$3$行，第一行为一个正整数$n$，表示小朋友的个数；第二行为$n$个整数$w_1, w_2, dots.h , w_n$表示小朋友们的体重，单位为kg；第三行为$n$个浮点数$h_1, h_2, dots.h , h_n$表示小朋友们的身高，单位为$m$。

=== 输出格式

输出一行$n$个数，表示按照身高体重指数从高到低排序后的编号。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
3
45 33 39
1.55 1.33 1.44
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
3 1 2
```

=== 数据范围

，#(math-missing)均恰有两位小数。9 / 10

=== 提示

三个小朋友（编号依次为1，2，3）的身高体重指数分别为（保留两位小数的结果）：$18.73$，$18.66$，$18.81$，故排序后输出的编号为3 1 2。

=== 参考程序

```cpp
#include <iostream>
using namespace std;
struct Human {
    int id;
    int w;
    double h;
} humans[1010];
void bubble_sort(int n) {
    for (int i = 0; i < n; ++i) {
        for (int j = 1; j < n - i; ++j) {
            double bmi1 = (double)humans[j-1].w / humans[j-1].h / humans[j-1].h;
            double bmi2 = (double)humans[j].w / humans[j].h / humans[j].h;
            if (bmi1 < bmi2)
                swap(humans[j - 1], humans[j]);
        }
    }
}
int main() {
    int n;
    cin >> n;
    for (int i = 0; i < n; ++i)
        humans[i].id = i + 1;
    for (int i = 0; i < n; ++i)
        cin >> humans[i].w;
    for (int i = 0; i < n; ++i)
        cin >> humans[i].h;
    bubble_sort(n);
    for (int i = 0; i < n; ++i)
        cout << humans[i].id << ' ';
    cout << endl;
    return 0;
}10 / 10
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
