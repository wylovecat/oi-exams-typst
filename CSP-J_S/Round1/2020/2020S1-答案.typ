// ===========================================================================
// 2020S1 —— 2020 CCF 非专业级别软件能力认证第一轮
// 由 _build/md2typ_csp.py 从 /home/wyao/Nutstore Files/aisichuang/0x0c00_真题整理/_build/raw/2020S1.md 生成，人工补丁见 _build/patch_manual.py
// 编译：typst compile --root . CSP-J_S/Round1/2020/2020S1-答案.typ
// ===========================================================================
#import "/_typst/exam.typ": *

#show: doc => exam(
  serial: "2020S1",
  course: "2020 CCF 非专业级别软件能力认证第一轮",
  title: "（CSP-S）提高级 C++ 语言试题",
  date: "2020 年 10 月 11 日 09:30 ~ 11:30",
  doc,
)

= 单项选择题

1. 请选出以下最大的数（#h(2.6em)）
  + $(550)_10$
  + $(777)_8$
  + $2^(10)$
  + $(22 "F")_16$
2. 操作系统的功能是（#h(2.6em)）。
  + 负责外设与主机之间的信息交换
  + 控制和管理计算机系统的各种硬件和软件资源的使用
  + 负责诊断机器的故障
  + 将源程序编译成目标程序
3. 现有一段 8 分钟的视频文件，它的播放速度是每秒 24 帧图像，每帧图像是一幅分辨率为 $2048 × 1024$ 像素的 32 位真彩色图像。请问要存储这段原始无压缩视频，需要多大的存储空间？（#h(2.6em)）
  + 30G
  + 90G
  + 150G
  + 450G
4. 今有一空栈 S，对下列待进栈的数据元素序列 a, b, c, d, e, f 依次进行：进栈，进栈，出栈，进栈，进栈，出栈的操作，则此操作完成后，栈底元素为（#h(2.6em)）。
  + b
  + a
  + d
  + c
5. 将 $(2, 7, 10, 18)$ 分别存储到某个地址区间为 0～10 的哈希表中，如果哈希函数 $h(x) =$（#h(2.6em)），将不会产生冲突，其中 $a mod b$ 表示 $a$ 除以 $b$ 的余数。
  + $x^2$ mod 11
  + $2 x$ mod 11
  + $x$ mod 11
  + $⌊ x/2 ⌋$ mod 11，其中 $⌊ x/2 ⌋$ 表示 $x/2$ 下取整
6. 下列哪些问题不能用贪心法精确求解？（#h(2.6em)）
  + 霍夫曼编码问题
  + 0-1 背包问题
  + 最小生成树问题
  + 单源最短路径问题
7. 具有 $n$ 个顶点，$e$ 条边的图采用邻接表存储结构，进行深度优先遍历运算的时间复杂度为（#h(2.6em)）。
  + $Θ(n+e)$
  + $Θ(n^2)$
  + $Θ(e^2)$
  + $Θ(n)$
8. 二分图是指能将顶点划分成两个部分，每一部分内的顶点间没有边相连的简单无向图。那么，24 个顶点的二分图至多有（#h(2.6em)）条边。
  + 144
  + 100
  + 48
  + 122
9. 广度优先搜索时，一定需要用到的数据结构是（#h(2.6em)）。
  + 栈
  + 二叉树
  + 队列
  + 哈希表
10. 一个班学生分组做游戏，如果每组三人就多两人，每组五人就多三人，每组七人就多四人，问这个班的学生人数 $n$ 在以下哪个区间？已知 $n lt 60$。（#h(2.6em)）
  + $30 lt n lt 40$
  + $40 lt n lt 50$
  + $50 lt n lt 60$
  + $20 lt n lt 30$
11. 小明想通过走楼梯来锻炼身体，假设从第 1 层走到第 2 层消耗 10 卡热量，接着从第 2 层走到第 3 层消耗 20 卡热量，再从第 3 层走到第 4 层消耗 30 卡热量，依此类推，从第 $k$ 层走到第 $k+1$ 层消耗 $10 k$ 卡热量（$k gt 1$）。如果小明想从 1 层开始，通过连续向上爬楼梯消耗 1000 卡热量，至少要爬到第几层楼？（#h(2.6em)）
  + 14
  + 16
  + 15
  + 13
12. 表达式 a#"*" (b+c)-d 的后缀表达形式为（#h(2.6em)）。
  + abc#"*" +d-
  + -+#"*" abcd
  + abcd#"*" +-
  + abc+#"*" d-
13. 从一个 4×4 的棋盘中选取不在同一行也不在同一列上的两个方格，共有（#h(2.6em)）种方法。
  + 60
  + 72
  + 86
  + 64
14. 对一个 $n$ 个顶点、$m$ 条边的带权有向简单图用 Dijkstra 算法计算单源最短路时，如果不使用堆或其它优先队列进行优化，则其时间复杂度为（#h(2.6em)）。
  + $Θ((m + n^2) log n)$
  + $Θ(m n + n^3)$
  + $Θ((m + n) log n)$
  + $Θ(n^2)$
15. 1948 年，（#h(2.6em)）将热力学中的熵引入信息通信领域，标志着信息论研究的开端。
  + 欧拉（Leonhard Euler）
  + 冯·诺伊曼（John von Neumann）
  + 克劳德·香农（Claude Shannon）
  + 图灵（Alan Turing）
= 阅读程序

（程序输入不超过数组或字符串定义的范围；判断题正确填 √，错误填 ×；除特殊说明外，判断题 1.5 分，选择题 3 分，共计 40 分）

#heading(level: 2)[]


```cpp
#include <iostream>
using namespace std;
int n;
int d[1000];

int main() {
    cin >> n;
    for (int i = 0; i < n; ++i)
        cin >> d[i];
    int ans = -1;
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j)
            if (d[i] < d[j])
                ans = max(ans, d[i] + d[j] - (d[i] & d[j]));
    cout << ans;
    return 0;
}
```

假设输入的 $n$ 和 $d[i]$ 都是不超过 10000 的正整数，完成下面的判断题和单选题：

#grouplabel[判断题]

16. $n$ 必须小于 1000，否则程序可能会发生运行错误。（#h(2.6em)）
17. 输出一定大于等于 0。（#h(2.6em)）
18. 若将第 13 行的“j = 0”改为“j = i + 1”，程序输出可能会改变。（#h(2.6em)）
19. 将第 14 行的“d[i] #(sym.lt) d[j]”改为“d[i] != d[j]”，程序输出不会改变。（#h(2.6em)）
#grouplabel[单选题]

20. 若输入 $n$ 为 100，且输出为 127，则输入的 $d[i]$ 中不可能有（#h(2.6em)）。
  + 127
  + 126
  + 128
  + 125
21. 若输出的数大于 0，则下面说法正确的是（#h(2.6em)）。
  + 若输出为偶数，则输入的 $d[i]$ 中最多有两个偶数
  + 若输出为奇数，则输入的 $d[i]$ 中至少有两个奇数
  + 若输出为偶数，则输入的 $d[i]$ 中至少有两个偶数
  + 若输出为奇数，则输入的 $d[i]$ 中最多有两个奇数
#heading(level: 2)[]


```cpp
#include <iostream>
#include <cstdlib>
using namespace std;
int n;
int d[10000];

int find(int L, int R, int k) {
    int x = rand() % (R - L + 1) + L;
    swap(d[L], d[x]);
    int a = L + 1, b = R;
    while (a < b) {
        while (a < b && d[a] < d[L])
            ++a;
        while (a < b && d[b] >= d[L])
            --b;
        swap(d[a], d[b]);
    }
    if (d[a] < d[L])
        ++a;
    if (a - L == k)
        return d[L];
    if (a - L < k)
        return find(a, R, k - (a - L));
    return find(L + 1, a - 1, k);
}

int main() {
    int k;
    cin >> n;
    cin >> k;
    for (int i = 0; i < n; ++i)
        cin >> d[i];
    cout << find(0, n - 1, k);
    return 0;
}
```

假设输入的 $n$、$k$ 和 $d[i]$ 都是不超过 10000 的正整数，且 $k$ 不超过 $n$，并假设 rand（#h(2.6em)） 函数产生的是均匀的随机数，完成下面的判断题和单选题：

#grouplabel[判断题]

22. 第 9 行的“x”的数值范围是 L+1 到 R，即 $[L+1, R]$。（#h(2.6em)）
23. 将第 19 行的“d[a]”改为“d[b]”，程序不会发生运行错误。（#h(2.6em)）
#grouplabel[单选题]

24. （2.5 分）当输入的 $d[i]$ 是严格单调递增序列时，第 17 行的“swap”平均执行次数是（#h(2.6em)）。
  + $Θ(n log n)$
  + $Θ(n)$
  + $Θ(log n)$
  + $Θ(n^2)$
25. （2.5 分）当输入的 $d[i]$ 是严格单调递减序列时，第 17 行的“swap”平均执行次数是（#h(2.6em)）。
  + $Θ(n^2)$
  + $Θ(n)$
  + $Θ(n log n)$
  + $Θ(log n)$
26. （2.5 分）若输入的 $d[i]$ 为 $i$，此程序①平均的时间复杂度和②最坏情况下的时间复杂度分别是（#h(2.6em)）。
  + $Θ(n)，Θ(n^2)$
  + $Θ(n)，Θ(n log n)$
  + $Θ(n log n)，Θ(n^2)$
  + $Θ(n log n)，Θ(n log n)$
27. （2.5 分）若输入的 $d[i]$ 都为同一个数，此程序平均的时间复杂度是（#h(2.6em)）。
  + $Θ(n)$
  + $Θ(log n)$
  + $Θ(n log n)$
  + $Θ(n^2)$
#heading(level: 2)[]


```cpp
#include <iostream>
#include <queue>
using namespace std;
const int maxl = 20000000;

class Map {
    struct item {
        string key; int value;
    } d[maxl];
    int cnt;
    public:
    int find(string x) {
        for (int i = 0; i < cnt; ++i)
            if (d[i].key == x)
                return d[i].value;
        return -1;
    }
    static int end() { return -1; }
    void insert(string k, int v) {
        d[cnt].key = k; d[cnt++].value = v;
    }
} s[2];

class Queue {
    string q[maxl];
    int head, tail;
    public:
    void pop() { ++head; }
    string front() { return q[head + 1]; }
    bool empty() { return head == tail; }
    void push(string x) { q[++tail] = x; }
} q[2];

string st0, st1;
int m;

string LtoR(string s, int L, int R) {
    string t = s;
    char tmp = t[L];
    for (int i = L; i < R; ++i)
        t[i] = t[i + 1];
    t[R] = tmp;
    return t;
}

string RtoL(string s, int L, int R) {
    string t = s;
    char tmp = t[R];
    for (int i = R; i > L; --i)
        t[i] = t[i - 1];
    t[L] = tmp;
    return t;
}

bool check(string st, int p, int step) {
    if (s[p].find(st) != s[p].end())
        return false;
    ++step;
    if (s[p ^ 1].find(st) == s[p].end()) {
        s[p].insert(st, step);
        q[p].push(st);
        return false;
    }
    cout << s[p ^ 1].find(st) + step << endl;
    return true;
}

int main() {
    cin >> st0 >> st1;
    int len = st0.length();
    if (len != st1.length()) {
        cout << -1 << endl;
        return 0;
    }
    if (st0 == st1) {
        cout << 0 << endl;
        return 0;
    }
    cin >> m;
    s[0].insert(st0, 0); s[1].insert(st1, 0);
    q[0].push(st0); q[1].push(st1);
    for (int p = 0;
    !(q[0].empty() && q[1].empty());
    p ^= 1) {
        string st = q[p].front(); q[p].pop();
        int step = s[p].find(st);
        if ((p == 0 &&
            (check(LtoR(st, m, len - 1), p, step) ||
            check(RtoL(st, 0, m), p, step)))
        ||
        (p == 1 &&
        (check(LtoR(st, 0, m), p, step) ||
        check(RtoL(st, m, len - 1), p, step))))
        return 0;
    }
    cout << -1 << endl;
    return 0;
}
```

#grouplabel[判断题]

28. 输出可能为 0。（#h(2.6em)）
29. 若输入的两个字符串长度均为 101 时，则 m=0 时的输出与 m=100 时的输出是一样的。（#h(2.6em)）
30. 若两个字符串的长度均为 $n$，则最坏情况下，此程序的时间复杂度为 $Θ(n!)$。（#h(2.6em)）
#grouplabel[单选题]

31. （2.5 分）若输入的第一个字符串长度由 100 个不同的字符构成，第二个字符串是第一个字符串的倒序，输入的 m 为 0，则输出为（#h(2.6em)）。
  + 49
  + 50
  + 100
  + -1
32. （4 分）已知当输入为 `0123\n3210\n1` 时输出为 4，当输入为 `012345\n543210\n1` 时输出为 14，当输入为 `01234567\n76543210\n1` 时输出为 28，则当输入为 `0123456789\n9876543210\n1` 时输出为（#h(2.6em)）。其中“\n”为换行符。
  + 56
  + 84
  + 102
  + 68
33. （4 分）若两个字符串的长度均为 $n$，且 $0 lt m lt n-1$，且两个字符串的构成相同（即任何一个字符在两个字符串中出现的次数均相同），则下列说法正确的是（#h(2.6em)）。提示：考虑输入与输出有多少对字符前后顺序不一样。
  + 若 $n$、$m$ 均为奇数，则输出可能小于 0。
  + 若 $n$、$m$ 均为偶数，则输出可能小于 0。
  + 若 $n$ 为奇数、$m$ 为偶数，则输出可能小于 0。
  + 若 $n$ 为偶数、$m$ 为奇数，则输出可能小于 0。
= 完善程序

（单选题，每小题 3 分，共计 30 分）

#heading(level: 2)[]

（分数背包）小 S 有 $n$ 块蛋糕，编号从 1 到 $n$。第 $i$ 块蛋糕的价值是 $w_i$，体积是 $v_i$。他有一个大小为 $B$ 的盒子来装这些蛋糕，也就是说装入盒子的蛋糕的体积总和不能超过 $B$。

他打算选择一些蛋糕装入盒子，他希望盒子里装的蛋糕的价值之和尽量大。

为了使盒子里的蛋糕价值之和更大，他可以任意切割蛋糕。具体来说，他可以选择一个 $α (0 lt α lt 1)$，并将一块价值是 $w$，体积为 $v$ 的蛋糕切割成两块，其中一块的价值是 $α · w$，体积是 $α · v$，另一块的价值是 $(1-α) · w$，体积是 $(1-α) · v$。他可以重复无限次切割操作。

现要求编程输出最大可能的价值，以分数的形式输出。

比如 $n=3$，$B=8$，三块蛋糕的价值分别是 4、4、2，体积分别是 5、3、2。那么最优的方案就是将体积为 5 的蛋糕切成两份，一份体积是 3，价值是 2.4，另一份体积是 2，价值是 1.6，然后把体积是 3 的那部分和后两块蛋糕打包进盒子。最优的价值之和是 8.4，故程序输出 42/5。

输入的数据范围为：$1 ≤ n ≤ 1000$，$1 ≤ B ≤ 10^5$；$1 ≤ w_i, v_i ≤ 100$。

提示：将所有的蛋糕按照性价比 $w_i / v_i$ 从大到小排序后进行贪心选择。

试补全程序。


```cpp
#include <cstdio>
using namespace std;

const int maxn = 1005;

int n, B, w[maxn], v[maxn];

int gcd(int u, int v) {
    if (v == 0)
        return u;
    return gcd(v, u % v);
}

void print(int w, int v) {
    int d = gcd(w, v);
    w = w / d;
    v = v / d;
    if (v == 1)
        printf("%d\n", w);
    else
        printf("%d/%d\n", w, v);
}

void swap(int &x, int &y) {
    int t = x; x = y; y = t;
}

int main() {
    scanf("%d %d", &n, &B);
    for (int i = 1; i <= n; i++) {
        scanf("%d %d", &w[i], &v[i]);
    }
    for (int i = 1; i < n; i++)
        for (int j = 1; j < n; j++)
            if (①) {
        swap(w[j], w[j + 1]);
        swap(v[j], v[j + 1]);
    }
    int curV, curW;
    if (②) {
        ③
    } else {
        print(B * w[1], v[1]);
        return 0;
    }
    for (int i = 2; i <= n; i++)
        if (curV + v[i] <= B) {
        curV += v[i];
        curW += w[i];
    } else {
        print(④);
        return 0;
    }
    print(⑤);
    return 0;
}
```

34. ①处应填（#h(2.6em)）
  + w[j] / v[j] #(sym.lt) w[j + 1] / v[j + 1]
  + `w[j] / v[j] > w[j + 1] / v[j + 1]`
  + v[j] #"*"  w[j + 1] #(sym.lt) v[j + 1] #"*"  w[j]
  + w[j] #"*"  v[j + 1] #(sym.lt) w[j + 1] #"*"  v[j]
35. ②处应填（#h(2.6em)）
  + w[1] #(sym.lt)= B
  + v[1] #(sym.lt)= B
  + `w[1] >= B`
  + `v[1] >= B`
36. ③处应填（#h(2.6em)）
  + `print(v[1], w[1]); return 0;`
  + curV = 0; curW = 0;
  + `print(w[1], v[1]); return 0;`
  + `curV = v[1]; curW = w[1];`
37. ④处应填（#h(2.6em)）
  + `curW * v[i] + curV * w[i], v[i]`
  + `(curW - w[i]) * v[i] + (B - curV) * w[i], v[i]`
  + `curW + v[i], w[i]`
  + `curW * v[i] + (B - curV) * w[i], v[i]`
38. ⑤处应填（#h(2.6em)）
  + curW, curV
  + curW, 1
  + curV, curW
  + curV, 1
#heading(level: 2)[]

（最优子序列）取 $m=16$，给出长度为 $n$ 的整数序列 $a_1, a_2, …, a_n$ $(0 ≤ a_i lt 2^m)$。对于一个二进制数 $x$，定义其分值 $w(x)$ 为 $x$ + popcnt($x$)，其中 popcnt($x$) 表示 $x$ 二进制表示中 1 的个数。对于一个子序列 $b_1, b_2, …, b_k$，定义其子序列分值 $S$ 为 $w(b_1 ⊕ b_2) + w(b_2 ⊕ b_3) + w(b_3 ⊕ b_4) + … + w(b_(k-1) ⊕ b_k)$。其中 ⊕ 表示按位异或。对于空子序列，规定其子序列分值为 0。求一个子序列使得其子序列分值最大，输出这个最大值。

输入第一行包含一个整数 $n$ $(1 ≤ n ≤ 40000)$。接下来一行包含 $n$ 个整数 $a_1, a_2, …, a_n$。

提示：考虑优化朴素的动态规划算法，将前 8 位和后 8 位分开计算。

Max[x][y] 表示当前的子序列下一个位置的高 8 位是 $x$、最后一个位置的低 8 位是 $y$ 时的最大价值。

试补全程序。


```cpp
#include <iostream>

using namespace std;

typedef long long LL;

const int MAXN = 40000, M = 16, B = M >> 1, MS = (1 << B) - 1;
const LL INF = 1000000000000000LL;
LL Max[MS + 4][MS + 4];

int w(int x)
{
    int s = x;
    while (x)
    {
        ①;
        s++;
    }
    return s;
}

void to_max(LL &x, LL y)
{
    if (x < y)
        x = y;
}

int main()
{
    int n;
    LL ans = 0;
    cin >> n;
    for (int x = 0; x <= MS; x++)
        for (int y = 0; y <= MS; y++)
            Max[x][y] = -INF;
    for (int i = 1; i <= n; i++)
    {
        LL a;
        cin >> a;
        int x = ②, y = a & MS;
        LL v = ③;
        for (int z = 0; z <= MS; z++)
            to_max(v, ④);
        for (int z = 0; z <= MS; z++)
            ⑤;
        to_max(ans, v);
    }
    cout << ans << endl;
    return 0;
}
```

39. ①处应填（#h(2.6em)）
  + x #(sym.gt)#(sym.gt)= 1
  + x ^= x & (x ^ (x + 1))
  + x -= x | -x
  + x ^= x & (x ^ (x - 1))
40. ②处应填（#h(2.6em)）
  + (a & MS) #(sym.lt)#(sym.lt) B
  + a #(sym.gt)#(sym.gt) B
  + a & (1 #(sym.lt)#(sym.lt) B)
  + a & (MS #(sym.lt)#(sym.lt) B)
41. ③处应填（#h(2.6em)）
  + -INF
  + `Max[y][x]`
  + 0
  + `Max[x][y]`
42. ④处应填（#h(2.6em)）
  + Max[x][z] + w(y ^ z)
  + Max[x][z] + w(a ^ z)
  + Max[x][z] + w(x ^ (z #(sym.lt)#(sym.lt) B))
  + Max[x][z] + w(x ^ z)
43. ⑤处应填（#h(2.6em)）
  + to_max(Max[y][z], v + w(a ^ (z #(sym.lt)#(sym.lt) B)))
  + to_max(Max[z][y], v + w((x ^ z) #(sym.lt)#(sym.lt) B))
  + to_max(Max[z][y], v + w(a ^ (z #(sym.lt)#(sym.lt) B)))
  + to_max(Max[x][z], v + w(y ^ z))

#pagebreak()

= 答案与解析

=== 第 1 题　答案：C

=== 第 2 题　答案：B

=== 第 3 题　答案：B

=== 第 4 题　答案：B

=== 第 5 题　答案：D

=== 第 6 题　答案：B

=== 第 7 题　答案：A

=== 第 8 题　答案：A

=== 第 9 题　答案：C

=== 第 10 题　答案：C

=== 第 11 题　答案：C

=== 第 12 题　答案：D

=== 第 13 题　答案：B

=== 第 14 题　答案：D

=== 第 15 题　答案：C

=== 第 16 题　答案：错误

=== 第 17 题　答案：错误

=== 第 18 题　答案：正确

=== 第 19 题　答案：正确

=== 第 20 题　答案：C

=== 第 21 题　答案：C

=== 第 22 题　答案：错误

=== 第 23 题　答案：正确

=== 第 24 题　答案：都对

官方判定：本题四个选项均无严格正确项（正确答案应为 $Θ((log n)^2)$），选任意一项均计分。

=== 第 25 题　答案：B

=== 第 26 题　答案：A

=== 第 27 题　答案：D

=== 第 28 题　答案：正确

=== 第 29 题　答案：错误

=== 第 30 题　答案：错误

=== 第 31 题　答案：D

=== 第 32 题　答案：D

=== 第 33 题　答案：C

=== 第 34 题　答案：D

=== 第 35 题　答案：B

=== 第 36 题　答案：D

=== 第 37 题　答案：B

=== 第 38 题　答案：B

=== 第 39 题　答案：D

=== 第 40 题　答案：B

=== 第 41 题　答案：C

=== 第 42 题　答案：A

=== 第 43 题　答案：B

