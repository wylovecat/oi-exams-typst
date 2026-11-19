// ===========================================================================
// GESP 2025-12 C++ 四级
// 由 _build/gesp_typ.py 从 _build/gesp_json/ 生成，勿手改（重放会覆盖）。
// 编译：typst compile --root . GESP/2025-12/2025-12-L4.typ
// ===========================================================================
#import "/_typst/gesp.typ": *

#show: doc => gesp(
  level: 4,
  month: "2025 年 12 月",
  doc,
)

= 单选题（每题 2 分，共 30 分）

1. 小杨想让指针p指向整数变量x，正确写法是（#slot）。

  ```cpp
  int p = &x;
  ```
  + 第2题 小杨写了如下的指针接力程序，程序执行完后变量 a 、 \*p1 和 \*p2 的值分别是（#slot）。
  + ```cpp
    int *p = x;
    ```
  + ```cpp
    int *p = &x;
    ```
  + ```cpp
    p = *x;
    ```

2. 小杨写了如下的指针接力程序，程序执行完后变量a、\*p1和\*p2的值分别是（#slot）。

  ```cpp
  int a = 5;
  int* p1 = &a;
  int* p2 = p1;
  *p2 = 10;
  ```
  + 5 10 10
  + 5 10 15
  + 10 10 10
  + 5 5 10

3. 小杨用一个二维数组表示棋盘，其中 1 表示有棋子，0 表示没有棋子。他想知道第 2 行#(math-missing)第 3 列有没有棋子，可采用的代码是：（#slot）。第 1 页 / 共 12 页

  ```cpp
  int a[3][4] = {
      {1, 0, 1, 0},
      {0, 1, 0, 1},
      {1, 1, 0, 0}
  };
  cout << a[1, 2] << endl;
  cout << a[1][2] << endl;
  cout << a(1, 2) << endl;
  cout << a{1}{2} << endl;
  ```

4. 执行完下面的代码后，\*(p + 5)和arr[1][1]的值分别是（#slot）。

  ```cpp
  int arr[3][4] = {{1,2,3,4}, {5,6,7,8}, {9,10,11,12}};
  int* p = &arr[0][0];
  ```
  + 5 6
  + 6 5
  + 5 5
  + 6 6

5. 执行完下面的代码后，sum的值是（#slot）。

  ```cpp
  int arr[2][3][2] = {
          {{1,2}, {3,4}, {5,6}},
          {{7,8}, {9,10}, {11,12}}
      };
  int sum = 0;
  for(int i = 0; i < 2; i++)
      for(int j = 0; j < 3; j++)
          for(int k = 0; k < 2; k++)
              if((i+j+k) % 2 == 0)
                  sum += arr[i][j][k];
  ```
  + 36
  + 39
  + 78
  + 30

6. 执行完下面的代码后，输出是（#slot）。

  ```cpp
  int a = 1;
  void test() {
      int a = 2;
      {
          int a = 3;
          a++;
      }
      a++;
      cout << a << " ";
  }
  int main() {
      test();
      cout << a;
      return 0;
  }
  ```
  + 3 1
  + 4 1
  + 3 2第 2 页 / 共 12 页
  + 4 2

7. 执行完下面的代码后，a、b和c的值分别是（#slot）。

  ```cpp
  void byValue(int x) { x = 100; }
  void byRef(int& x) { x = 200; }
  void byPointer(int* x) { *x = 300; }
  int main() {
      int a = 1, b = 2, c = 3;
      byValue(a);
      byRef(b);
      byPointer(&c);
      return 0;
  }
  ```
  + 100 200 300
  + 1 2 3
  + 1 200 300
  + 1 2 300

8. 运行如下代码会输出（#slot）。

  ```cpp
  struct Point {
      int x, y;
  };
  struct Rectangle {
      Point topLeft;
      Point bottomRight;
  };
  int main() {
      Rectangle rect = {{10, 10}, {20, 20}};
      rect.topLeft.x = 5;
      Point* p = &rect.bottomRight;
      p->y = 5;
      cout << rect.topLeft.x + rect.bottomRight.y;
      return 0;
  }
  ```
  + 10
  + 30
  + 15
  + 20

9. 给定函数climbStairs(int n)的定义如下，则climbStairs(5)的返回的值是（#slot）。第 3 页 / 共 12 页

  ```cpp
  int climbStairs(int n) {
      if(n <= 2) return n;
      int a = 1, b = 2;
      for(int i = 3; i <= n; i++) {
          int temp = a + b;
          a = b;
          b = temp;
      }
      return b;
  }
  ```
  + 5
  + 8
  + 13
  + 10

10. 对如下4个扑克牌进行排序，使用某排序算法按value排序后，结果为: {3,'D'}, {3,'B'}, {5,'A'}, {5,'C'}，则这个排序算法是稳定的吗？

  ```cpp
  struct Card {
      int value;
      char suit;  // 花色
  };
  Card cards[4] = {{5,'A'}, {3,'B'}, {5,'C'}, {3,'D'}};
  ```
  + 稳定，因为相同value的元素相对顺序保持不变
  + 不稳定，因为{3,'D'}出现在{3,'B'}之前
  + 无法判断
  + 稳定，因为结果是有序的

11. 下面的函数selectTopK（#slot）实现从n个学生中选出前k名成绩最好的学生颁发奖学金（不需要对所有学生完全排序，只需要找出前k名），则横线上应填写（#slot）。第 4 页 / 共 12 页

  ```cpp
  struct Student {
      string name;
      int score;
  };
  void selectTopK(Student students[], int n, int k) {
      for (int i = 0; i < k; i++) {
          int maxIdx = i;
          for (____________________) {    // 在此处填入代码
              if (students[j].score > students[maxIdx].score) {
                  maxIdx = j;
              }
          }
          if (maxIdx != i) {
              Student temp = students[i];
              students[i] = students[maxIdx];
              students[maxIdx] = temp;
          }
      }
  }
  int j = 0; j < n; j++
  int j = i + 1; j < n; j++
  int j = i; j < n; j++
  int j = 1; j <= n; j++
  ```

12. 某游戏的排行榜系统需要实时更新玩家分数。每次只有一个玩家的分数发生变化，排行榜已经是按分数降序排列的。现在需要将更新后的玩家调整到正确位置。下面的函数updateRanking（#slot）要实现上述功能，则两处横线上应分别填写（#slot）。

  ```cpp
  struct Player {
      string name;
      int score;
  };
  // 玩家索引playerIdx的分数刚刚更新，需要调整位置
  void updateRanking(Player players[], int size, int playerIdx) {
      Player updatedPlayer = players[playerIdx];
      if (playerIdx > 0 && updatedPlayer.score > players[playerIdx - 1].score) {
          int i = playerIdx;
          while (____________________) {  // 在此处填入代码
              players[i] = players[i - 1];
              i--;
          }
          players[i] = updatedPlayer;
      }
      else if (playerIdx < size - 1 && updatedPlayer.score < players[playerIdx + 1].score) {
          int i = playerIdx;
          while (____________________) {  // 在此处填入代码
              players[i] = players[i + 1];
              i++;
          }
          players[i] = updatedPlayer;
      }
  }
  ```
  + ```cpp
    i > 0 && updatedPlayer.score > players[i - 1].score
    i < size - 1 && updatedPlayer.score < players[i + 1].score
    ```
  + ```cpp
    i < size - 1 && updatedPlayer.score < players[i + 1].score
    i > 0 && updatedPlayer.score > players[i - 1].score
    ```
  + ```cpp
    i > 0 && updatedPlayer.score < players[i - 1].score
    i < size - 1 && updatedPlayer.score < players[i + 1].score
    ```
  + ```cpp
    i > 0 && updatedPlayer.score < players[i - 1].score
    i < size - 1 && updatedPlayer.score > players[i + 1].score
    ```

13. 给定如下算法，其时间复杂度为（#slot）。第 5 页 / 共 12 页

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
  + $O(n)$
  + $O(n^2)$
  + $O(n^3)$
  + $O(2^n)$

14. 执行下面 C++ 程序，会输出（#slot）。

  ```cpp
  int main() {
      ofstream fout("test.txt");
      fout << "Happy" << endl;
      fout << "New Year";
      fout.close();
      ifstream fin("test.txt");
      string s1, s2;
      fin >> s1;
      getline(fin, s2);
      fin.close();
      cout << s1 << "|" << s2;
      return 0;
  }
  ```
  + Happy|New Year
  + Happy| New Year
  + HappyNew Year|
  + Happy|

15. 执行下面C++代码，会输出（#slot）。第 6 页 / 共 12 页

  ```cpp
  int divide(int a, int b) {
      if(b == 0) throw "Division by zero";
      return a / b;
  }
  int main() {
      int result = 0;
      try {
          result = divide(10, 0);
          cout << "A";
      }
      catch(const char* msg) {
          cout << "B";
          result = -1;
      }
      cout << result;
      return 0;
  }
  ```
  + A0
  + B-1
  + A10
  + 程序崩溃

= 判断题（每题 2 分，共 20 分）

1. 小杨正在调试他的温度传感器程序，其中变量x保存当前温度。下面这段代码运行后，变量x的值变成了8。

  ```cpp
  int x = 5;
  int *p = &x;
  *p = *p + 3;
  ```

2. 一个结构体不能包含另一个结构体。

3. 在 C++ 中，定义如下二维数组：int a[3][4];，数组a在内存中是按行优先连续存放的，即a[0] [0]、a[0][1]、a[0][2]、a[0][3]在内存中是连续的。

4. 执行下面程序后，变量a的值会变成15。

  ```cpp
  void add(int &x){
      x += 10;
  }
  int a = 5;
  add(a);
  ```

5. 执行下面的C++代码，会输出8，因为两个指针地址相差8个字节（假设int占4字节）。

  ```cpp
  int arr[5] = {1, 2, 3, 4, 5};
  int* p1 = arr;
  int* p2 = arr + 2;
  cout << p2 - p1;  // 输出结果
  第 7 页 / 共 12 页
  ```

6. 考虑用如下递推方式计算斐波那契数列，时间复杂度是$O(n)$。

  ```cpp
  int n = 10;
  int f[20];
  f[0] = 0;
  f[1] = 1;
  for (int i = 2; i <= n; i++)
      f[i] = f[i - 1] + f[i - 2];
  ```

7. 冒泡排序和插入排序都是稳定排序算法。

8. 下面这段代码实现了选择排序算法。

  ```cpp
  void sort(int a[], int n) {
      for (int i = 1; i < n; i++) {
          int x = a[i];
          int j = i - 1;
          while (j >= 0 && a[j] > x) {
              a[j + 1] = a[j];
              j--;
          }
          a[j + 1] = x;
      }
  }
  ```

9. 下面代码可以正常编译并输出10。

  ```cpp
  #include <iostream>
  using namespace std;
  int calculate(int x, int y = 10);
  int main() {
      cout << calculate(5);  // 调用1
      return 0;
  }
  int calculate(int x, int y) {
      return x * y;
  }
  int calculate(int x) {  // 重载函数
      return x * 2;
  }
  ```

10. 执行下面代码会输出100。

  ```cpp
  int main() {
      ofstream fout("data.txt");
      fout << 10 << " " << 20 << endl;
      fout << 30 << " " << 40;
      fout.close();
      ifstream fin("data.txt");
      int a, b, c, d;
      fin >> a >> b >> c >> d;
      fin.close();
      cout << a + b + c + d;
      return 0;
  }
  第 8 页 / 共 12 页
  ```

= 编程题（每题 25 分，共 50 分）

== 编程题 1：建造

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 有一张$M$行$N$列的地形图，其中第$i$行第$j$列的数字a\_ij代表坐标$(i,j)$（#slot） 的海拔高度。停机坪为一个$3 times 3$的区域且内部所有$9$个点的最大高度和最小高度之差不超过$H$。小 A 想请你计算出，在所有适合建造停机坪的区域中，区域内部$9$个点海拔之和最大是多少。3.1.2 输 格式入第一行三个正整数$M,N,H$，含义如题面所示。之后$M$行，第$i$行包含$N$个整数a\_i1, a\_i2, …, a\_iN，代表坐标$(i, j)$（#slot） 的高度。数据保证总存在一个适合建造停机坪的区域。

=== 输出格式

输出一行，代表最大的海拔之和。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
5 5 3
5 5 5 5 5
5 1 5 1 5
5 5 5 5 5
5 2 5 2 5
3 5 5 5 2
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
40
```

=== 数据范围

对于所有测试点，保证1 ≤ M, N ≤ 10^3, 1 ≤ H, a\_ij ≤ 10^5。第 9 页 / 共 12 页

=== 参考程序

```cpp
#include <iostream>
using namespace std;
int a[1010][1010];
int main(){
    int M, N, H;
    cin >> M >> N >> H;
    for (int i = 1; i <= M; ++i) {
        for (int j = 1; j <= N; ++j) {
            cin >> a[i][j];
        }
    }
    int max_sum = 0;
    for (int i = 1; i <= M - 2; ++i) {
        for (int j = 1; j <= N - 2; ++j) {
            int local_max = a[i][j], local_min = a[i][j], local_sum = 0;
            for (int x = 0; x < 3; ++x) {
                for (int y = 0; y < 3; ++y) {
                    int height = a[i + x][j + y];
                    local_sum += height;
                    if (height > local_max) local_max = height;
                    if (height < local_min) local_min = height;
                }
            }
            if (local_max - local_min <= H) {
                if (local_sum > max_sum) {
                    max_sum = local_sum;
                }
            }
        }
    }
    cout << max_sum;
    return 0;
}
```

== 编程题 2：优先购买

#limits(time: "1.0 s", memory: "512.0 MB")

=== 题目描述

小 A 有$M$元预算。商店有$N$个商品，每个商品有商品名$S$、价格$P$和优先级$V$三种属性，其中$V$为正整数，且越小代表商品的优先级越高。小 A 的购物策略为：总是优先买优先级最高的东西；如果有多个最高优先级商品，购买价格最低的；如果有多个优先级最高且价格最低的商品，购买商品名字典序最小的。小 A 想知道能购买哪些商品。第 10 页 / 共 12 页

=== 输入格式

第一行两个正整数$M, N$，代表预算和商品数。之后$N$行，每行一个商品，依次为$S_i P_i V_i$，代表第$i$个商品的商品名、价格、优先级。数据保证不存在两个名字相同的商品。

=== 输出格式

按照字典序从小到大的顺序，输出所有购买商品的商品名。

=== 样例

#text(size: 12pt, weight: "bold")[输入样例 1]

```text
20 4
apple 6 8
bus 15 1
cab 1 10
water 4 8
```

#text(size: 12pt, weight: "bold")[输出样例 1]

```text
bus
cab
water
```

=== 数据范围

对于所有测试点，保证$1 <= |S_i| <= 10, 1 <= M, P_i <= 10^5, 1 <= N <= 10^3, 1 <= V_i <= 10$。商品名仅由小写字母组成且不存在两个相同的商品名。第 11 页 / 共 12 页

=== 参考程序

```cpp
#include <iostream>
#include <algorithm>
#include <string>
#include <map>
#include <assert.h>
using namespace std;
struct Item {
    string name;
    int price;
    int priority;
};
bool cmp(const Item &a, const Item &b) {
    if (a.priority != b.priority) return a.priority < b.priority;
    if(a.price != b.price) return a.price < b.price;
    return a.name < b.name;
}
string s[1005];
std::map<string, int> mp;
int main(){
    int M, N;
    cin >> M >> N;
    Item items[N];
    for (int i = 0; i < N; ++i) {
        cin >> items[i].name >> items[i].price >> items[i].priority;
        assert(mp.find(items[i].name) == mp.end());
        mp[items[i].name] = items[i].priority;
    }
    sort(items, items + N, cmp);
    int budget = M;
    int count = 0;
    for (int i = 0; i < N; ++i) {
        if (items[i].price <= budget) {
            budget -= items[i].price;
            s[count++] = items[i].name;
        }
    }
    sort(s, s + count);
    for (int i = 0; i < count; ++i) {
        cout << s[i] << endl;
    }
    return 0;
}第 12 页 / 共 12 页
```

#source-note[来源：CCF GESP 官网「真题及解析」栏目。公式由版面识别回填，个别处若有出入以官方 PDF 为准。]
