#import "noteconf.typ": *
#show: doc => conf(
	course: "2025 CCF 非专业级别软件能力认证第一轮",
    title: "(CSP-J1)入门级C++语言试题",
    date: "2025年9月20日 09:30 ~ 11:30",
    doc,
)
#show table.cell.where(y:0):strong
#set enum(numbering:"1.A.")

= 单项选择题（共15题，每题2分，共计30分；每题有且仅有一个正确选项）


1. 一个32位无符号整数可以表示的最大值，最接近下列那个选项？( )
	+ $4 times 10^9$
	+ $3 times 10^(10)$
	+ $2 times 10^9$
	+ $2 times 10^(10)$

2. 在C++中，执行`int x = 255; cout << (x & (x - 1));`后，输出的结果是？( )
	+ 255
	+ 254
	+ 128
	+ 0

3. 函数`calc(n)`的定义如下，则`calc(5)`的返回值是多少?( )
	```cpp
int calc(int n) {
	if (n <= 1) return 1;
	if (n % 2 == 0) return calc(n / 2) +1;
	else return calc(n - 1) + calc(n - 2);
}
	```
	+ 5
	+ 6
	+ 7
	+ 8

4. 用5个权值$10,12,15,20,25$构造哈夫曼树，该树的带权路径长度是多少？( )
	+ 176
	+ 186
	+ 196
	+ 206

5. 在一个有向图中，所有顶点的入度之和等于所有顶点的出度之和，这个总和等于？( )
	+ 顶点数
	+ 边数
	+ 顶点数+边数
	+ 顶点数 `*` 2

6. 从 5 位男生和 4 位女生中选出 4 人组成一个学习小组,要求学习小组中男生和女生都有。有多少种不同的选举方法？(   )
	+ 126
	+ 121
	+ 120
	+ 100

7. 假设 `a`, `b`, `c` 都是布尔变量,逻辑表达式 `(a && b) || (!c && a)` 的值与下列哪个表达式不始终相等？(   )
	+ `a && (b || !c)`
	+ `(a || !c) && (b || !c) && (a || a)`
	+ `a && (!b || c)`
	+ `!(!a || !b) || (a && !c)`

8. 已知 `f[0]=1,f[1]=1`，并且对于所有 $n >= 2$有`f[n]=(f[n-1]+f[n-2])%7`那么`f[2025]`的值是多少?( )
	+ 2
	+ 4
	+ 5
	+ 6

9. 下列关于 `C++ string` 类的说法, 正确的是? (   )
	+ `string` 对象的长度在创建后不能改变。
	+ 可以使用 `+` 运算符直接连接一个 `string` 对象和一个 `char` 类型的字符。
	+ `string` 的 `length( )` 和 `size( )` 方法返回的值可能不同。
	+ `string` 对象必须以 ‘`\0`' 结尾,且这个结尾符计入 `length`(   )。

10. 考虑一下C++函数：
	```cpp
void solve(int &a, int b) {
	a = a + b;
	b = a - b;
	a = a - b;
}
int main() {
	int x = 5, y = 10;
	solve(x, y);
}
	```
	在`main`函数调用`solve`后，`x`和`y`的值分别是?( )
	+ 5,10
	+ 10,5
	+ 10,10
	+ 5,5

11. 一个$8 times 8$的棋盘，左上角坐标为(1,1)，右下角为(8,8)。一个机器人从(1,1)出发，每次只能向右或向下走一格。要到达(4,5)，有多少种不同的路径？( )
	+ 20
	+ 35
	+ 56
	+ 70

12. 某同学用冒泡排序对数组${6，1，5，2，4}$进行升序排序，请问需要进行多少次元素交换？( )
	+ 5
	+ 6
	+ 7
	+ 8

13. 十进制数$720_(10)$和八进制数$270_8$的和用十六进制表示是多少？( )
	+ $388_(16)$
	+ $3 D E_(16)$
	+ $288_(16)$
	+ $990_(16)$

14. 一棵包含1000个结点的完全二叉树，其叶子结点的数量是多少？( )
	+ 499
	+ 512
	+ 500
	+ 501

15. 给定一个初始为空的整数栈s和一个空的队列P。我们按顺序处理输入的整数队列A：7，5，8，3，1，4，2。对于队列A中的每一个数，执行以下规则：如果该数是奇数，则将其压入栈S；如果该数是偶数，且栈s非空，则弹出一个栈顶元素，并加入到队列P的末尾；如果该数是偶数，且栈s为空，则不进行任何操作。当队列A中的所有数都处理完毕后，队列P的内容是什么？( )
	+ 5,1,3
	+ 7,5,3
	+ 3,1,5
	+ 5,1,3,7


= 阅读程序（程序输入不超过数组或字符串定义的范围；判断题正确填 $checkmark$，错误填 $crossmark$；除特殊说明外，判断题1.5分，选择题3分，共计40分）。
== 

```cpp
#include <cstdio>
#include <cstring>
#include <algorithm>
inline int gcd(int a, int b) {
  if (b == 0)
    return a;
  return gcd(b, a % b);
}
int main() {
  int n;
  scanf("%d", &n);
  int ans = 0;
  for (int i = 1; i <= n; ++i) {
    for (int j = i + 1; j <= n; ++j) {
      for (int k = j + 1; k <= n; ++k) {
        if (gcd(i, j) == 1 && gcd(j, k) == 1 && gcd(i, k) == 1) {
          ++ans;
        }
      }
    }
  }
  printf("%d\n", ans);
  return 0;
}
```



$bullet$ 判断题
16. （1分）当输入为2时，程序并不会执行第16行的判断语句。（ ）

17. 将第16行中的“`&& gcd(i, k)==1`”删去不会影响程序运行结果。（ ）

18. 当输入的$n>=3$的时候，程序总是输出一个正整数。（ ）

$bullet$ 单选题

19. 将第7行的“`gcd(b, a%b)`”改为“`gcd(a, a%b)`”后，程序可能出现的问题是( )。
	+ 输出的答案大于原答案。
	+ 输出的答案小于原答案。
	+ 程序有可能陷入死循环。
	+ 可能发生整型溢出问题。

20. 当输入为8的时候，输出为（ ）。
	+ 37
	+ 42
	+ 35
	+ 25

21. 调用`gcd(36, 42)`会返回（ ）。
	+ 6
	+ 252
	+ 3
	+ 2

==
```cpp
#include <algorithm>
#include <cstdio>
#include <cstring>
#define ll long long
int n, k;
int a[20000];
int ans[200007];
int main() {
  scanf("%d%d", &n, &k);
  for (int i = 1; i <= n; ++i) {
    scanf("%d", &a[i]);
  }
  std::sort(a + 1, a + n + 1);
  n = std::unique(a + 1, a + n + 1) - a - 1;
  for (int i = 1, j = 0; i <= n; ++i) {
    for (; j < i && a[i] - a[j + 1] > k; ++j) 
      ;
    ans[i] = ans[j] + 1;
  }
  printf("%d\n", ans[n]);
  return 0;
}
```


$bullet$判断题

22. 当输入为“3 1 3 2 1”时，输出结果为2。（ ）

23. 假设输入的n为正整数，输出的答案一定小于等于n，大于等于1。（ ）

24. 将第14行的“`n = std::unique(a + 1, a + n + 1) - a - 1;`”删去后，有可能出现与原本代码不同的输出结果。（ ）


$bullet$单选题

25. 假设输入的a数组和k均为正整数，执行第18行代码时，一定满足的条件不包括（ ）。
	+ $j<=i$
	+ $a[i]-a[j]>k$
	+ $j<=n$
	+ $a[j]<a[i]$

26. 当输入的$n=100$、$k=2$、$a={1,2,...,100}$时，输出为（ ）。
	+ 34
	+ 100
	+ 50
	+ 33

27. 假设输入的a数组和k均为正整数，但a数组不一定有序，则若误删去第13行的“`std::sort(a + 1, a + n + 1);`”，程序有可能出现的问题有（ ）。
	+ 输出的答案比原本答案更大
	+ 输出的答案比原本答案更小
	+ 出现死循环行为
	+ 以上均可能发生


==
```cpp
#include <algorithm>
#include <cstdio>
#include <cstring>
#define ll long long
int f[5007][5007];
int a[5007], b[5007];
int n;
int main() {
  scanf("%d", &n);
  for (int i = 1; i <= n; ++i) {
    scanf("%d", &a[i]);
  }
  for (int i = 1; i <= n; ++i) {
    scanf("%d", &b[i]);
  }
  for (int i = 1; i <= n; ++i) {
    for (int j = 1; j <= n; ++j) {
      f[i][j] = std::max(f[i][j], std::max(f[i - 1][j], f[i][j - 1]));
      if (a[i] == b[j]) {
        f[i][j] = std::max(f[i][j], f[i - 1][j - 1] + 1);
      }
    }
  }
  printf("%d\n", f[n][n]);
  return 0;
}
```


$bullet$判断题

28. 当输入“4 1 2 3 4 1 3 2 2”时，输出为2。（ ）

29. 当程序运行完毕后，对于所有的$1<=i,j<=n$，都一定有 $f[i][j]<=f[n][n]$ 。（ ）

30. 将第18行的“`f[i][j] = std::max(f[i][j], std::max(f[i - 1][j], f[i][j - 1]));`”删去后，并不影响程序运行结果。（ ）

$bullet$单选题

31. 输出的答案满足的性质有（ ）。
	+ 小于等于n
	+ 大于等于0
	+ 不一定大于等于1
	+ 以上均是

32. 如果在16行的循环前加上以下两行：“`std::sort(a + 1, a + n + 1); std::sort(b + 1, b + n + 1);`”，则答案会（ ）。
	+ 变大或不变
	+ 变小或不变
	+ 一定变大
	+ 不变

33. 如果输入的a数组是{1,2,...,n}，而且b数组中数字均为1~n中的正整数，则上述代码等价于下面哪个问题：（ ）。
	+ 求b数组去重后的长度
	+ 求b数组的最长上升子序列
	+ 求b数组的长度
	+ 求b数组的最大值


= 完善程序(单选题，每小题3分，共计30分)
== 字符串解码
“行程长度编码”（Run-Length Encoding）是一种无损压缩算法，常用于压缩重复字符较多的数据，以减少存储空间。假设原始字符串不包含数字字符。压缩规则如下：

i）如果原始字符串中一个字符连续出现N次（$N>=2$），在压缩字符串中它被表示为“字符+数字N”。例如，编码“A12”代表12个连续的字符A。

ii）如果原始字符串中一个字符只出现1次，在压缩字符串中它就表示为该字符本身。例如，编码“B”代表1个字符B。

以下程序实现读取压缩字符串并输出其原始的、解压后的形式。试补全程序。

```cpp
#include <cctype>
#include <iostream>
#include <string>
using namespace std;

int main() {
  string z;
  cin >> z;
  string s = "";
  for (int i = 0; i < z.length(); ) {
    char ch = z[i];

    if (__①__&& isdigit(z[i+1])) { 
      i++;
      int count = 0;
      while (i < z.length() && isdigit(z[i])) {
        count = __②__; 
        i++;
      }
      for (int j = 0; j < __③__; ++j) { 
        s += ch;
      }
    } else {
      s += __④__; 
      __⑤__;
    }
  }
  cout << s << endl;
  return 0;
}
```
34. ① 处应填 ( )
	+ `i < z.length()`
	+ `i - 1 >= `
	+ `i + 1 < z.length() && isdigit(z[i + 1])`
	+ `isdigit(z[i])`
35. ② 处应填 ( )
	+ `count + (z[i] - '0')`
	+ `count * 10 + (z[i] - '0')`
	+ `z[i] - '0'`
	+ `count + 1`
36. ③ 处应填 ( )
	+ `count - 1`
	+ `count`
	+ `10`
	+ `z[i] - '8'`
37. ④ 处应填 ( )
	+ `z[i + 1]`
	+ `ch`
	+ `z.back()`
	+ `(char)(z[i] + 1)`
38. ⑤ 处应填 ( )
	+ `i--`
	+ `i = i + 2`
	+ `i++`
	+ `//不执行任何操作`

== 精明与糊涂
有N个人，分为两类：

i）精明人：永远能正确判断其他人是精明还是糊涂；

ii）糊涂人：判断不可靠，会给出随机的判断。

已知精明人严格占据多数，即如果精明人有k个，则满足\(k > N/2\)。

你只能通过函数`query(i, j)`让第i个人判断第j个人：返回true表示判断结果为“精明人”；返回false表示判断结果为“糊涂人”。你的目标是，通过这些互相判断，找出至少一个百分之百能确定的精明人。同时，你无需关心`query(i, j)`的内部实现。

以下程序利用“精明人占多数”的优势。设想一个“消除”的过程，让人们互相判断并进行抵消。经过若干轮抵消后，最终留下的候选者必然属于多数派，即精明人。

例如，假设有三个人0、1、2。如果0说1是糊涂人，而1也说0是糊涂人，则0和1至少有一个是糊涂人。程序将同时淘汰0和1。由于三人里至少有两个精明人，我们确定2是精明人。试补全程序。

试补全程序。
```cpp
#include <iostream>
#include <vector>
using namespace std;

int N;
bool query(int i, int j);

int main() {
  cin >> N;

  int candidate = 0;
  int count = __①__; 

  for (int i = 1; i < N; ++i) {
    if (__②__) { 
      candidate = i;
      count = 1;
    } else {
      if (__③__) { 
        __④__
      } else {
        count++;
      }
    }
  }
  cout << __⑤__ << endl; 
  return 0;
}
```
39. ① 处应填 ( )
	+ `0`
	+ `1`
	+ `N`
	+ `-1`
40. ② 处应填 ( )
	+ `count < 0`
	+ `count == 1`
	+ `count == 0`
	+ `query(candidate, i) == false`
41. ③ 处应填 ( )
	+ `query(candidate, i) == false`
	+ `query(i, candidate) == true`
	+ `query(candidate, i) == false && query(i, candidate) == false`
	+ `query(candidate, i) == false || query(i, candidate) == false`
42. ④ 处应填 ( )
	+ `count--`
	+ `break`
	+ `count++`
	+ `candidate = i`
43. ⑤ 处应填 ( )
	+ `N - 1`
	+ `count`
	+ `candidat`
	+ `0`