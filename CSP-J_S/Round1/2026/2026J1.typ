// ===========================================================================
// 2026J1 —— 2026 CCF 非专业级别软件能力认证第一轮
// 由 _build/md2typ_csp.py 从 /home/wyao/Nutstore Files/aisichuang/0x0c00_真题整理/CSP-J_S/Round1/2026/CSP-J1-2026.pdf 生成，人工补丁见 _build/patch_manual.py
// 编译：typst compile --root . CSP-J_S/Round1/2026/2026J1.typ
// ===========================================================================
#import "/_typst/exam.typ": *

#show: doc => exam(
  serial: "2026J1",
  course: "2026 CCF 非专业级别软件能力认证第一轮",
  title: "（CSP-J1）入门级 C++ 语言试题",
  date: "2026 年 9 月 19 日 09:30~11:30",
  doc,
)

= 单项选择题（共 15 题，每题 2 分，共计 30 分；每题有且仅有一个正确选项）

1. 下列 C++ 数据类型中，能够精确存储$10^(18) + 1$ 这个整数的是（#h(2.6em)）
  + `float`
  + `long long`
  + `double`
  + `int`
2. 十六进制数 2F5 转换为八进制数是（#h(2.6em)）
  + 1364
  + 1635
  + 1405
  + 1365
3. 执行下列 C++ 代码，输出是（#h(2.6em)）

  ```cpp
  int a = 7, b = 3;
  std::cout << a / b * b + a % b;
  ```

  + 9
  + 10
  + 7
  + 6
4. 初始时栈为空，将 1、2、3、4 依次入栈，入栈过程中允许随时出栈。下列出栈序列中不可能出现的是（#h(2.6em)）
  + 2，4，3，1
  + 1，2，3，4
  + 3，1，2，4
  + 1，4，3，2
5. 一棵有 100 个结点的完全二叉树，其中叶子结点个数是（#h(2.6em)）
  + 49
  + 50
  + 64
  + 51
6. 执行下列代码后 s 的值是（#h(2.6em)）

  ```cpp
  int s = 0;
  for (int i = 1; i <= 100; i++)
      if (i % 3 == 0 || i % 5 == 0)
          s += i;
  ```

  + 3048
  + 2733
  + 2318
  + 2418
7. 上楼梯每步可上 1 级、2 级或 3 级，从地面（可视为第 0 级）走到第 8 级台阶共有多少种不同走法（#h(2.6em)）
  + 44
  + 121
  + 149
  + 81
8. 下图为$5 × 5$ 网格，行号、列号均从 0 开始，`#` 为障碍，. 为可通行格：

  ```cpp
  S . . # .
  . . . # .
  . . . # .
  # # . . E
  . . . # .
  ```

  从 S 出发做广度优先搜索（BFS）：初始时把 S 入队；每次取出队首格子，按“上、下、左、右”（上
  ＝行号减 1，下＝行号加 1，左＝列号减 1，右＝列号加 1）的顺序遍历它的四个相邻格子，越界、障碍
  或已访问的格子跳过，其余格子标记为已访问并入队。当 E 第一次入队时，已经入队过的格子（含 S 和
  E）共有多少个（#h(2.6em)）
  + 15
  + 12
  + 14
  + 13
9. 满足$1 ≤ n ≤ 100$ 且 gcd$(n, 60) = 6$ 的正整数 n 共有多少个（#h(2.6em)）
  + 8
  + 6
  + 4
  + 5
10. 某国硬币面值为 1 元、4 元、6 元且数量不限，凑出 9 元最少需要多少枚（#h(2.6em)）
  + 3
  + 4
  + 5
  + 2
11. 执行下列代码，输出是（#h(2.6em)）

  ```cpp
  int a[5] = {1, 3, 5, 7, 9};
  int *p = a + 2;
  *(p - 1) = p[0] + p[2];
  p[1] = *(a + 1) - a[0];
  cout << a[1] << "," << a[3];
  ```

  + 14,13
  + 8,13
  + 14,7
  + 14,2
12. 在含 1000 个互不相同元素的升序数组中，用二分法查找给定值（返回元素位置或报告不存在），最坏情况下需要与数组元素比较多少次？（#h(2.6em)）
  + 500
  + 9
  + 11
  + 10
13. 数组 a[1..n] 的前缀和数组 s（即$s[i] = a[1] + a[2] + · · · + a[i]$）满足$s[i] = 3 i^(2) + i$。则 a[10] 的值是（#h(2.6em)）
  + 252
  + 310
  + 58
  + 61
14. 数轴上有 7 个点，坐标分别为 1、3、4、7、10、15、20。在数轴上选取一个整数坐标点 P，使 P 到这 7 个点的距离之和最小，这个最小距离和是（#h(2.6em)）
  + 37
  + 42
  + 40
  + 38
15. 一个无向图有 10 个顶点，其中 4 个顶点的度为 3，其余顶点的度均为 4，则该图的边数是（#h(2.6em)）
  + 36
  + 18
  + 17
  + 20
= 阅读程序（程序输入不超过数组或字符串定义的范围；判断题正确填 √，错误填 ×；除特殊说明外，判断题 1.5 分，选择题 3 分，共计 40 分）

#heading(level: 2)[]


```cpp
#include <iostream>
using namespace std;
int main() {
    int n;
    cin >> n;
    int x = 1, y = 1;
    while (n > 0) {
        if (n % 2 == 0) {
            ++x;
        } else {
            ++x;
            ++y;
        }
        n = n / 2;
    }
    cout << x << ' ' << y << endl;
    return 0;
}
```

以下问题均假定输入的 n 为不超过$2^(31) − 1$ 的非负整数。

#grouplabel[判断题]

16. （1 分）当输入为3 时，程序输出为3 3。（#h(2.6em)）
17. 将第 11 行的` ++x;` 删除后，程序输出的两个数一定相等。（#h(2.6em)）
18. 假设输入为非负整数，则程序输出的第一个数一定不小于第二个数。（#h(2.6em)）
#grouplabel[单选题]

19. 将第 7 行的` while (n > 0)` 改为` while (n >= 0)` 后，程序可能出现的问题是（#h(2.6em)）。
  + 陷入死循环
  + 输出结果比原来大
  + 输出结果比原来小
  + 输出结果不受影响
20. 当输入为6 时，输出为（#h(2.6em)）。
  + 3 3
  + 4 2
  + 4 3
  + 5 2
21. 若输入 n 依次取遍$0,1,2, . . . ,2^(31) −1$ 中的所有整数，则程序输出的第二个数恰好为 2 的次数为（#h(2.6em)）。
  + 16
  + 30
  + 31
  + 32
#heading(level: 2)[]


```cpp
#include <algorithm>
#include <iostream>
#include <string>
using namespace std;
int a[100007], b[100007], c[100007], carry[100007];
string input_str;
int a_len, b_len;
int main() {
    cin >> input_str;
    a_len = input_str.size();
    for (int i = 0; i < a_len; i++) {
        a[i] = input_str[a_len - i - 1] - '0';
    }
    cin >> input_str;
    b_len = input_str.size();
    for (int i = 0; i < b_len; i++) {
        b[i] = input_str[b_len - i - 1] - '0';
    }
    carry[0] = 0;
    for (int i = 0; i < max(a_len, b_len) + 1; i++) {
        c[i] = a[i] + b[i] + carry[i];
        if (c[i] >= 10) {
            carry[i + 1] = 1;
            c[i] -= 10;
        } else {
            carry[i + 1] = 0;
        }
    }
    for (int i = max(a_len, b_len); i >= 0; i--) {
        cout << c[i];
    }
    cout << endl;
    return 0;
}
```

本题输入的两个数均为非负整数，位数不超过 100000，可能包含前导零。

#grouplabel[判断题]

22. 当输入为123 456 时，程序输出为0579。（#h(2.6em)）
23. 假设输入的两个数均不含前导零，则程序输出的结果也一定不会含有前导零。（#h(2.6em)）
24. 将第 21 行改为` c[i]=a[i]+b[i];` 后，程序输出的结果一定比原来的结果小。（#h(2.6em)）
#grouplabel[单选题]

25. 当输入为12345 678 时，输出为（#h(2.6em)）。
  + 012923
  + 013023
  + 13023
  + 130230
26. 将第 22 行的` if (c[i]>=10)` 改为` if (c[i]>10)` 后，当输入为95 15 时，输出为（#h(2.6em)）。
  + 01010
  + 110
  + 140
  + 1410
27. 假设输入的两个数均为 n 位正整数（不含前导零），且它们的和小于$10^n$，则程序输出的字符串一定满足（#h(2.6em)）。
  + 第一个字符一定不为` '0'`
  + 长度一定为 n
  + 长度一定为 n ＋ 1，且第一个字符为` '0'`
  + 长度可能为 n ＋ 2
#heading(level: 2)[]


```cpp
#include <iostream>
using namespace std;
bool check_prime(int x) {
    if (x <= 1) return false;
    for (int i = 2; i * i <= x; i++) {
        if (x % i == 0) return false;
    }
    return true;
}
int n;
void search_result(int x) {
    if (!check_prime(x)) return;
    if (x >= n) {
        cout << x << endl;
        return;
    }
    for (int i = 0; i <= 9; i++) {
        search_result(x * 10 + i);
    }

}
int main() {
    cin >> n;
    for (int i = 1; i <= 9; i++) search_result(i);
    return 0;
}
```

#grouplabel[判断题]

28. 当输入为10 时，程序的输出共有 10 行。（#h(2.6em)）
29. 若输入的 n 不大于 5，则程序的输出中一定包含 5。（#h(2.6em)）
30. 若输入的 n 大于 10，将第 17 行的` for (int i=0;i<=9;i++)` 改为` for (int i=1;i<=9;i+=2)`后，程序的输出结果一定不变。（#h(2.6em)）
#grouplabel[单选题]

31. 当输入为24 时，程序输出的第 3 行为（#h(2.6em)）。
  + 23
  + 29
  + 31
  + 239
32. 下列关于该程序输出的说法中，正确的是（#h(2.6em)）。
  + 输出的数一定按照从小到大的顺序排列
  + 随着输入 n 的增大，输出的行数一定不会增加
  + 输出的数的个位数字只可能是 3 或 7
  + 输出的每个大于等于 10 的数，十进制下删去它的末位数字后得到的数一定是质数
33. 当输入为200 时，程序输出的行数为（#h(2.6em)）。
  + 12
  + 13
  + 14
  + 15
= 完善程序（单选题，每小题 3 分，共计 30 分）

#heading(level: 2)[]

（进制减半）给定$n, m$，再给定一个$m n$ 进制下的数 A，其各个数位上的数按照从高位到低位的顺

序给出，请你将其转化为 n 进制，并同样按照从高位到低位的顺序输出。

输入的第一行依次为 n、m 和 A 的位数 d，接下来 d 个数$a_d, a_d−_(1), · · · , a_(1)$ 从高位到低位描述各个数位

上的数。

数据满足$2 ≤ n, m ≤ 10$，$1 ≤ d ≤ 18$，$0 ≤ A lt 2^(63)$，对于所有$1 ≤ i ≤ d$，$0 ≤ a_i lt m n$。

以下程序按“逐位除以 n”的方法完成进制转换。请补全程序。


```cpp
#include <iostream>

constexpr int N = 100005;
long long b[N];


int main() {
    long long n, m, d;
    std::cin >> n >> m >> d;
    int len = 1;
    for (int i = 0; i < d; i++) {
        long long x;
        std::cin >> x;
        for (int j = len; j >= 1; j--)
            b[j] = ① ;
        b[0] = ② ;
        len++;
        for (int j = 0; j < len; j++)
            if (b[j] >= n) {
            b[j + 1] += ③ ;
            b[j] = ④ ;
            if (j + 1 == len) len++;
        }
    }
    while ( ⑤ ) len--;
    for (int i = len - 1; i >= 0; i--)
        std::cout << b[i] << ' ';
    return 0;
}
```

34. ①处应填（#h(2.6em)）
  + `b[j] * n`
  + `b[j] * m`
  + `b[j - 1] * n`
  + `b[j - 1] * m`
35. ②处应填（#h(2.6em)）
  + `x * n`
  + `x`
  + 0
  + `m`
36. ③处应填（#h(2.6em)）
  + `b[j] / m`
  + `b[j] % n`
  + `b[j] % m`
  + `b[j] / n`
37. ④处应填（#h(2.6em)）
  + `b[j] / m`
  + `b[j] % n`
  + `b[j] % m`
  + `b[j] / n`
38. ⑤处应填（#h(2.6em)）
  + len #(sym.gt) 0 && b[len - 1] == 0\`
  + len #(sym.gt) 0 && b[0] == 0\`
  + len #(sym.gt) 1 && b[len - 1] == 0\`
  + len #(sym.gt) 1 && b[0] == 0\`
#heading(level: 2)[]

（平衡分割）给定一个长度为 n 的字符串，其中每个字符都是一个十六进制数位。例如，字符串 016A

表示十进制下的四个数 0、1、6、10。

现在请选择 k 个（k 是你选定的数）切分位置$p_(1), p_(2), . . . , p_k$，其中$1 ≤ k lt n$，且$1 ≤ p_(1) lt p_(2) lt · · · lt$

$p k lt n$。再令$p 0 = 0$，$p k+1 = n$。

对于每个$0 ≤ i ≤ k$，计算第$p_i + 1$ 个数到第$p_i_(+1)$ 个数的平均值，记作$b_i$。你的目标是使$b_(0), b_(1), . . . , b_k$

中最大值与最小值之差尽可能小，并输出这个最小值。

其中$2 ≤ n ≤ 20$。输入字符串中的字符只可能是0～9 或` A`～`F`。本题假定字符采用 ASCII 编码。输出

答案时保留小数点后 6 位。

以下程序通过递归枚举所有可能的连续分段方案。请补全程序。


```cpp
#include <algorithm>
#include <iomanip>
#include <iostream>

using namespace std;

constexpr int N = 25;

int n, a[N];
char s[N];

double ans = 1e100;

int value(char c) { return ① ; }

void split(int l, int cnt, double mnb, double mxb) {
    if (l > n) {
        if (cnt == 0) return;
        ans = min(ans, mxb - mnb);
        return;
    }
    int sum = 0;
    for ( ② ) {
        sum += a[r];
        double nwb = ③ ;
        split( ④ );
    }
}

int main() {
    cin >> n >> s + 1;
    for (int i = 1; i <= n; ++i)
        a[i] = value(s[i]);
    split( ⑤ );
    cout << fixed << setprecision(6) << ans;

    return 0;
}
```

39. ①处应填（#h(2.6em)）
  + c - (c #(sym.lt) '9' ? '0' : 'A' - 10)\`
  + c - (c #(sym.lt) 'A' ? '0' : 'A' - 10)\`
  + c - (c #(sym.lt) 'A' ? 'A' - 10 : '0')\`
  + c - (c #(sym.lt) 'A' ? '0' : 'A' + 10)\`
40. ②处应填（#h(2.6em)）
  + int r = l + 1; r #(sym.lt)= n; ++r\`
  + int r = l; r #(sym.lt) n; ++r\`
  + int r = l; r #(sym.lt)= n; r += 2\`
  + int r = l; r #(sym.lt)= n; ++r\`
41. ③处应填（#h(2.6em)）
  + sum / (r - l + 1) #"*"  1.0\`
  + sum #"*"  1.0 / (r - l) + 1\`
  + sum #"*"  1.0 / (r - l + 1)\`
  + (sum - a[r]) #"*"  1.0 / (r - l + 1)\`
42. ④处应填（#h(2.6em)）
  + r + 1, cnt + (r #(sym.lt) n), min(mnb, nwb), max(mxb, nwb)\`
  + r + 1, cnt + (r #(sym.lt)= n), min(mnb, nwb), max(mxb, nwb)\`
  + r + 1, cnt + (r #(sym.lt) n), max(mnb, nwb), min(mxb, nwb)\`
  + r + 1, cnt + (r #(sym.lt)= n), max(mnb, nwb), min(mxb, nwb)\`
43. ⑤处应填（#h(2.6em)）
  + `0, 0, 1e100, -1e100`
  + `0, 0, -1e100, 1e100`
  + `1, 0, -1e100, 1e100`
  + `1, 0, 1e100, -1e100`
