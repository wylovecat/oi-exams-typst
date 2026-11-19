// ===========================================================================
// 2021J1 —— 2021 CCF 非专业级别软件能力认证第一轮
// 由 _build/md2typ_csp.py 从 /home/wyao/Nutstore Files/aisichuang/0x0c00_真题整理/CSP-J_S/Round1/2021/2021初赛普及组C++试题.pdf 生成，人工补丁见 _build/patch_manual.py
// 编译：typst compile --root . CSP-J_S/Round1/2021/2021J1.typ
// ===========================================================================
#import "/_typst/exam.typ": *

#show: doc => exam(
  serial: "2021J1",
  course: "2021 CCF 非专业级别软件能力认证第一轮",
  title: "（CSP-J1）入门级 C++语言试题",
  date: "2021 年 9 月 19 日 14:30~16:30",
  doc,
)

= 单项选择题（共 15 题，每题 2 分，共计 30 分；每题有且仅有一个正确选项）

1. 以下不属于面向对象程序设计语言的是（#h(2.6em)）。
  + C \`
  + C++ \`
  + Python  \`
  + Java  \`
2. 以下奖项与计算机领域相关的是（#h(2.6em)）。
  + 普利策奖
  + 奥斯卡奖
  + 图灵奖
  + 诺贝尔奖
3. 目前主流的计算机存储数据最终都是转换成（#h(2.6em)）数据进行储存。
  + 十六进制
  + 二进制
  + 十进制
  + 八进制
4. 以比较作为基本运算，在` N` 个数中找出最大数，最坏情况下所需要的最少的比较次数为（#h(2.6em)）。
  + N+1 \`
  + N\`
  + N  \`
  + N-1 \`
5. 对于入栈顺序为` a,b,c,d,e` 的序列，下列（#h(2.6em)）不是合法的出栈序列。
  + c,d,a,e,b \`
  + a,b,c,d,e  \`
  + e,d,c,b,a  \`
  + b,a,c,d,e  \`
6. 对于有` n` 个顶点、`m` 条边的无向连通图（`m>n`），需要删掉（#h(2.6em)）条边才能使其成为一棵树。
  + m-n+1 \`
  + n-1 \`
  + m-n \`
  + m-n-1 \`
7. 二进制数 101.11 对应的十进制数是（#h(2.6em)）。
  + 5.25 \`
  + 6.5 \`
  + 5.5 \`
  + 5.75 \`
8. 如果一棵二叉树只有根结点，那么这棵二叉树高度为 1。请问高度为 5 的完全二叉树有（#h(2.6em)）种不同的形态？
  + 32 \`
  + 16 \`
  + 15 \`
  + 17 \`
9. 表达式` a*(b+c)*d` 的后缀表达式为（#h(2.6em)），其中“#"*" ”和“+”是运算符。
  + #"*" a#"*" +bcd \`
  + #"*" #"*" a+bcd \`
  + abc+#"*" d#"*"  \`
  + abc+d#"*" #"*"  \`
10. 6 个人，两个人组一队，总共组成三队，不区分队伍的编号。不同的组队情况有（#h(2.6em)）种。
  + 20 \`
  + 10 \`
  + 15 \`
  + 30 \`
11. 在数据压缩编码中的哈夫曼编码方法，在本质上是一种（#h(2.6em)）的策略。
  + 动态规划
  + 枚举
  + 贪心
  + 递归
12. 由 1,1,2,2,3 这五个数字组成不同的三位数有（#h(2.6em)）种。
  + 24 \`
  + 18 \`
  + 15 \`
  + 12 \`
13. 考虑如下递归算法`solve(n) `

  ```cpp
  if n<=1 return 1
      else if n>=5 return n*solve(n-2)
          else return n*solve(n-1)
  ```

  则调用` solve(7)`得到的返回结果为（#h(2.6em)）。
  + 420 \`
  + 105 \`
  + 840 \`
  + 210 \`
14. 以` a` 为起点，对右边的无向图进行深度优先遍历，则` b`、`c`、`d`、`e` 四个点中有可能作为最后一个遍历到的点的个数为（#h(2.6em)）。
  + 4 \`
  + 1 \`
  + 2 \`
  + 3 \`
15. 有四个人要从` A` 点坐一条船过河到` B` 点，船一开始在` A` 点。该船一次最多可坐两个人。已知这四个人中每个人独自坐船的过河时间分别为 1,2,4,8，且两个人坐船的过河时间为两人独自过河时间的较大者。则最短（#h(2.6em)）时间可以让四个人都过河到` B`点（包括从` B` 点把船开回` A` 点的时间）。
  + 17 \`
  + 14 \`
  + 15 \`
  + 16 \`
= 阅读程序（程序输入不超过数组或字符串定义的范围；判断题正确填，错误填；除特殊说明外，判断题 1.5 分，选择题 3 分，共计 40 分）

#heading(level: 2)[]


```cpp
#include <iostream>
using namespace std;

int n;
int a[1000];

int f(int x)
{
    int ret = 0;
    for (; x; x &= x-1) ret++;
    return ret;
}

int g(int x)
{
    return x & -x;
}


int main()
{
    cin >> n;
    for (int i = 0; i < n; i++)  cin >> a[i];
    for (int i = 0; i < n; i++)
        cout << f(a[i]) + g(a[i]) << ' ';
    cout << endl;
    return 0;
}
```

⚫    判断题

16. 输入的` n` 等于 1001 时，程序不会发生下标越界。（#h(2.6em)）
17. 输入的` a[i]`必须全为正整数，否则程序将陷入死循环。（#h(2.6em)）
18. 当输入为“5 2 11 9 16 10”时，输出为“3 4 3 17 5”。（#h(2.6em)）
19. 当输入为“1 511998”时，输出为“18”。（#h(2.6em)）
20. 将源代码中` g` 函数的定义（14-17 行）移到` main` 函数的后面，程序可以正常编译运行。（#h(2.6em)）⚫    单选题
21. 当输入为“2 -65536 2147483647”时，输出为（#h(2.6em)）。
  + “65554 33”
  + “65532 33”
  + “65552 32”
  + “65535 34”
#heading(level: 2)[]


```cpp
#include <iostream>
#include <string>
using namespace std;

char base[64];
char table[256];


void init()
{
    for (int i = 0; i < 26; i++)  base[i] = 'A' + i;
    for (int i = 0; i < 26; i++)  base[26+i] = 'a' + i;
    for (int i = 0; i < 10; i++)  base[52+i] = '0' + i;
    base[62] = '+', base[63] = '/';

    for (int i = 0; i < 256; i++) table[i] = 0xff;
    for (int i = 0; i < 64; i++)  table[base[i]] = i;
    table['='] = 0;
}

string decode(string str)
{
    string ret;
    int i;
    for (i = 0; i < str.size(); i += 4){
        ret += table[str[i]] << 2 | table[str[i+1]] >> 4;
        if (str[i+2] != '=')
            ret += (table[str[i+1]] & 0x0f) << 4 |
        table[str[i+2]] >> 2;
        if (str[i+3] != '=')
            ret += table[str[i+2]] << 6 | table[str[i+3]];
    }
    return ret;
}

int main()
{
    init();
    cout << int(table[0]) << endl;

    string str;
    cin >> str;
    cout << decode(str) << endl;
    return 0;
}
```

⚫    判断题

22. 输出的第二行一定是由小写字母、大写字母、数字和“+”、“/”、“=”构成的字符串。（#h(2.6em)）
23. 可能存在输入不同，但输出的第二行相同的情形。（#h(2.6em)）
24. 输出的第一行为“-1”。（#h(2.6em)）⚫    单选题
25. 设输入字符串长度为`n`，`decode`函数的时间复杂度为（#h(2.6em)）。
  + Θ$(n^(2))$
  + Θ$(sqrt(n))$
  + Θ$(n)$
  + Θ$(n log n)$
26. 当输入为“`Y3Nx`”时，输出的第二行为（#h(2.6em)）。
  + “`Csp`”
  + “`csp`”
  + “`csq`”
  + “`CSP`”
27. （3.5分）当输入为“`Y2NmIDIwMjE=`”时，输出的第二行为（#h(2.6em)）。
  + “`ccf 2022`”
  + “`ccf2021`”
  + “`ccf2022`”
  + “`ccf 2021`”
#heading(level: 2)[]


```cpp
#include <iostream>
using namespace std;

const int n = 100000;
const int N = n+1;

int m;
int a[N], b[N], c[N], d[N];
int f[N], g[N];


void init()
{
    f[1] = g[1] =1;
    for(int i=2; i<=n; i++){
        if (!a[i]){
            b[m++] = i;
            c[i] = 1, f[i] = 2;
            d[i] = 1, g[i] = i+1;
        }
        for(int j=0; j<m && b[j]*i<=n; j++){
            int k = b[j];
            a[i*k] = 1;
            if (i%k == 0){
                c[i*k] = c[i]+1;
                f[i*k] = f[i]/c[i*k]*(c[i*k]+1);
                d[i*k] = d[i];
                g[i*k] = g[i]*k + d[i];
                break;
            }
            else{
                c[i*k] = 1;
                f[i*k] = 2*f[i];
                d[i*k] = g[i];
                g[i*k] = g[i]*(k+1);
            }
        }
    }
}

int main()
{
    init();

    int x;
    cin >> x;
    cout << f[x] << ' ' << g[x] << endl;
    return 0;
}
```

假设输入的` x` 是不超过 1000 的自然数，完成下面的判断题和单选题：

⚫    判断题

28. 若输入不为“1”，把第 13 行删去不会影响输出的结果。（#h(2.6em)）
29. （2 分）第 25 行的“`f[i]/c[i*k]`”可能存在无法整除而向下取整的情况。（#h(2.6em)）
30. （2 分）在执行完` init()`后，`f` 数组不是单调递增的，但` g` 数组是单调递增的。（#h(2.6em)）⚫    单选题
31. init\` 函数的时间复杂度为（#h(2.6em)）。
  + Θ$(n^(2))$
  + Θ$(n)$
  + Θ$(n l o n g n)$
  + Θ$(n sqrt(n))$
32. 在执行完`init()`后，`f[1],f[2],f[3] …… f[100] `中有（#h(2.6em)）个等于2。
  + 26 \`
  + 23 \`
  + 24 \`
  + 25 \`
33. （4分）当输入为“1000”时，输出为（#h(2.6em)）。
  + “16 1340”
  + “15 1340”
  + “15 2340”
  + “16 2340”
= 完善程序（单选题，每小时 3 分，共计 30 分）

#h(0pt) 1. （`Josephus` 问题）有` n` 个人围成一圈，依次标号 0 至` n-1`。从 0 号开始，依次0`,1,0,1,… `交替报数，报到 1 的人会离开，直至圈中只剩下一个人。求最后剩下人的编号。试补全模拟程序。


```cpp
#include <iostream>


using namespace std;

const int MAXN = 1000000;
int F[MAXN];

int main(){
    int n;
    cin >> n;
    int i = 0, p = 0, c = 0;
    while( ① ){
        if (F[i] == 0){
            if ( ② ){
                F[i] = 1;
                ③ ;
            }
            ④ ;
        }
        ⑤ ;
    }
    int ans = -1;
    for (i = 0; i < n; i++)
        if (F[i] == 0)
            ans = i;
    cout << ans << endl;
    return 0;
}
```

34. ①  处应填（#h(2.6em)）
  + c#(sym.lt)n-1 \`
  + i#(sym.lt)n \`
  + c#(sym.lt)n \`
  + i#(sym.lt)n-1 \`
35. ②  处应填（#h(2.6em)）
  + !p \`
  + i%2==0 \`
  + i%2==1 \`
  + p \`
36. ③  处应填（#h(2.6em)）
  + p^=1 \`
  + i++ \`
  + i=(i+1)%n \`
  + c++ \`
37. ④  处应填（#h(2.6em)）
  + p^=1 \`
  + i++ \`
  + i=(i+1)%n \`
  + c++ \`
38. ⑤  处应填（#h(2.6em)）
  + p^=1 \`
  + i++ \`
  + i=(i+1)%n \`
  + c++ \`
  #h(0pt) 2.（矩形计数）平面上有` n` 个关键点，求有多少个四条边都和` x` 轴或者` y` 轴平行的矩形，
  满足四个顶点都是关键点。给出的关键点可能有重复，但完全征重合的矩形只计一次。
  试补全枚举算法。

  ```cpp
  #include <iostream>

  using namespace std;

  struct point {
      int x, y, id;
  };

  bool equals(point a, point b) {
      return a.x == b.x && a.y == b.y;
  }

  bool cmp(point a, point b) {
      return ①;
  }

  void sort(point A[], int n) {
      for (int i = 0; i < n; i++)
          for (int j = 1; j < n; j++)

              if (cmp(A[j], A[j - 1])) {
          point t = A[j];
          A[j] = A[j - 1];
          A[j - 1] = t;
      }
  }

  int unique(point A[], int n) {
      int t = 0;
      for (int i = 0; i < n; i++)
          if (②)
              A[t++] = A[i];
      return t;
  }

  bool binary_search(point A[], int n, int x, int y) {
      point p;
      p.x = x;
      p.y = y;
      p.id = n;
      int a = 0, b = n - 1;
      while (a < b) {
          int mid = ③;
          if (④)
              a = mid + 1;
          else
              b = mid;
      }
      return equals(A[a], p);
  }

  const int MAXN = 1000;
  point A[MAXN];

  int main() {
      int n;
      cin >> n;
      for (int i = 0; i < n; i++) {

          cin >> A[i].x >> A[i].y;
          A[i].id = i;
      }
      sort(A, n);
      n = unique(A, n);
      int ans = 0;
      for (int i = 0; i < n; i++)
          for (int j = 0; j < n; j++)
              if (⑤ && binary_search(A, n, A[i].x, A[j].y) &&
                  binary_search(A, n, A[j].x, A[i].y)) {
          ans++;
      }
      cout << ans << endl;
      return 0;
  }
  ```

39. ①  处应填（#h(2.6em)）
  + equals(a,b) ? a.id #(sym.lt) b.id : (a.x!=b.x ? a.x#(sym.lt)b.x : a.y#(sym.lt)b.y) \`
  + a.x != b.x ? a.x #(sym.lt) b.x : a.id #(sym.lt) b.id \`
  + a.x != b.x ? a.x #(sym.lt) b.x : a.y #(sym.lt) b.y \`
  + equals(a,b) ? a.id #(sym.lt) b.id : a.x #(sym.lt) b.x \`
40. ②  处应填（#h(2.6em)）
  + t == 0 || !equals(A[i], A[t - 1]) \`
  + i == 0 || cmp(A[i], A[i - 1]) \`
  + t == 0 || equals(A[i], A[t - 1]) \`
  + i == 0 || !cmp(A[i], A[i - 1]) \`
41. ③  处应填（#h(2.6em)）
  + a + (b - a + 1) / 2 \`
  + b - (b - a) / 2 + 1  \`
  + (a + b + 1) #(sym.gt)#(sym.gt) 1 \`
  + (a + b) #(sym.gt)#(sym.gt) 1  \`
42. ④  处应填（#h(2.6em)）
  + !cmp(p, A[mid]) \`
  + !cmp(A[mid], p)  \`
  + cmp(A[mid], p) \`
  + cmp(p, A[mid])  \`
43. ⑤  处应填（#h(2.6em)）
  + A[i].x #(sym.lt) A[j].x && A[i].y #(sym.lt) A[j].y \`
  + A[i].x == A[j].x \`
  + A[i].id #(sym.lt) A[j].id \`
  + A[i].x == A[j].x && A[i].id #(sym.lt) A[j].id \`
