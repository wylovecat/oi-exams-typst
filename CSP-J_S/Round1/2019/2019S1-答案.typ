// ===========================================================================
// 2019S1 —— 2019S1 CCF 非专业级别软件能力认证第一轮
// 由 _build/md2typ_csp.py 从 /home/wyao/Nutstore Files/aisichuang/0x0c00_真题整理/_build/raw/2019S1.md 生成，人工补丁见 _build/patch_manual.py
// 编译：typst compile --root . CSP-J_S/Round1/2019/2019S1-答案.typ
// ===========================================================================
#import "/_typst/exam.typ": *
#import "/_typst/figs.typ": fig-csp-2019s1-q15

#show: doc => exam(
  serial: "2019S1",
  course: "2019 CCF 非专业级别软件能力认证第一轮",
  title: "（CSP-S1）提高级 C++ 语言试题",
  date: "2019 年 10 月 19 日 14:30 ~ 16:30",
  doc,
)

= 单项选择

1. 若有定义:` int a=7; float x=2.5, y=4.7;`则表达式`x+a%3*(int)(x+y)%2`的值是:（#h(2.6em)）
  + 0.000000
  + 2.750000
  + 3.500000
  + 2.500000
2. 下列属于图像文件格式的有（#h(2.6em)）
  + MPEG
  + WMV
  + AVI
  + JPEG
3. 二进制数 11 1011 1001 0111 和 01 0110 11101011 进行逻辑或运算的结果是（#h(2.6em)）
  + 11 1111 1111 1101
  + 11 1111 1111 1111
  + 11 1111 1101 1111
  + 10 1111 1111 1111
4. 编译器的功能是（#h(2.6em)）
  + 将低级语言翻译成高级语言
  + 将源程序重新组合
  + 将一种编程语言翻译成自然语言
  + 将一种语言(通常是高级语言)翻译成另一种语言(通常是低级语言)
5. 设变量 x 为 float 型且已赋值,则以下语句中能将 x 中的数值保留到小数点后两位,并将第三位四舍五入的是（#h(2.6em)）
  + `x=(x*100+0.5)/100.0;`
  + `x=(x/100+0.5)*100.0;`
  + `x=x*100+0.5/100.0;`
  + `x=(int)(x*100+0.5)/100.0;`
6. 由数字 1,1, 2, 4, 8, 8所组成的不同的4位数的个数是（#h(2.6em)）
  + 98
  + 104
  + 102
  + 100
7. 排序的算法很多,若按排序的稳定性和不稳定性分类, 则（#h(2.6em)）是不稳定排序。
  + 快速排序
  + 直接插入排序
  + 归并排序
  + 冒泡排序
8. G 是一个非连通无向图(没有重边和自环),共有 28 条边,则该图至少有（#h(2.6em)）个顶点。
  + 9
  + 8
  + 10
  + 11
9. 一些数字可以颠倒过来看,例如 0、1、8 颠倒过来还是本身,6颠倒过来是9,9颠倒过来看还是6,其他数字颠倒过来都不构成数字。类似的,一些多位数也可以颠倒过来看,比如 106 颠倒过来是 901。假设某个城市的车牌只有 5位数字,每一位都可以取 0 到9。请问这个城市有多少个车牌倒过来恰好还是原来的车牌,并且车牌上的5位数能被3整除?（#h(2.6em)）
  + 20
  + 25
  + 30
  + 40
10. 一次期末考试,某班有15人数学得满分,有12人语文得满分,并且有 4人语、数都是满分,那么这个班至少有一门得满分的同学有多少人?（#h(2.6em)）。
  + 21
  + 23
  + 22
  + 20
11. 设 A 和B 是两个长为n的有序数组,现在需要将A 和B 合并成一个排好序的数组,请问任何以元素比较作为基本运算的归并算法,在最坏情况下至少要做多少次比较?（#h(2.6em)）。
  + $n^2$
  + $n log n$
  + $2 n-1$
  + $2 n$
12. 以下哪个结构可以用来存储图（#h(2.6em)）
  + 二叉树
  + 队列
  + 邻接矩阵
  + 栈
13. 以下哪些算法不属于贪心算法? （#h(2.6em)）
  + Dijkstra算法
  + Prim 算法
  + Kruskal 算法
  + Floyd算法
14. 有一个等比数列,共有奇数项,其中第一项和最后一项分别是 2 和 118098,中间一项是 486,请问以下哪个数是可能的公比?（#h(2.6em)）
  + 2
  + 5
  + 4
  + 3
15. 有正实数构成的数字三角形排列形式如图所示。第一行的数为$a_(1,1)$;第二行的数从左到右依次为$a_(2,1),a_(2,2)$,第n行的数为$a_(n,1),a_(n,2),⋯,a_(n,n)$ 从$a_(1,1)$开始,每一行的数$a_(i,j)$只有两条边可以分别通向下一行的两个数$a_(i+1,j)$和$a_(i+1,j+1)$。用动态规划算法找出一条从$a_(1,1)$,向下通到$a_(n,1),a_(n,2),⋯,a_(n,n)$中某个数的路径,使得该路径上的数之和最大。
  #fig-csp-2019s1-q15()
  令 `C[i][j]`是从$a_(1,1)$到$a_(i,j)$的路径上的数的最大和,并且`C[i][0]=C[0][j]=0`, 则`C[i][j]` = （#h(2.6em)）.
  + `max(C[i - 1][j − 1],C[i - 1][j])` + $a_(i,j)$
  + `max(C[i-1][j − 1],C[i − 1][j]) +1`
  + `C[i - 1][j-1] + C[i − 1][j]`
  + `max(C[i][j-1],C[i − 1][j])` + $a_(i,j)$​
= 阅读程序

#heading(level: 2)[]


```cpp
#include <cstdio>
using namespace std;
int n;
int a[100];

int main() {
    scanf("%d", &n);
    for (int i = 1; i <= n; ++i)
        scanf("%d", &a[i]);
    int ans = 1;
    for (int i = 1; i <= n; ++i) {
        if (i > 1 && a[i] < a[i - 1])
            ans = i;
        while (ans < n && a[i] >= a[ans + 1])
            ++ans;
        printf("%d\n", ans);
    }
    return 0;
}
```

#grouplabel[判断题]

16. 第16行输出ans时, ans 的值一定大于i。 （#h(2.6em)）
17. 程序输出的ans 小于等于n。 （#h(2.6em)）
18. 若将第 12 行的“#(sym.lt)”改为“!=”,程序输出的结果不会改变。 （#h(2.6em)）
19. 当程序执行到第16行时,若ans-i#(sym.gt)2,则a[i+1]≤a[i]。 （#h(2.6em)）
#grouplabel[选择题]

20. 若输入的数组是一个严格单调递增的数列,此程序的时间复杂度是（#h(2.6em)）
  + $O(n)$
  + $O(log n)$
  + $O(n^2)$
  + $O(n log n)$​
21. 最坏情况下,此程序的时间复杂度是（#h(2.6em)）
  + $O(log n)$
  + $O(n^2)$
  + $O(n log n)$
  + $O(n)$​
#heading(level: 2)[]


```cpp
#include <iostream>
using namespace std;

const int maxn = 1000;
int n;
int fa[maxn], cnt[maxn];

int getRoot(int v) {
    if (fa[v] == v) return v;
    return getRoot(fa[v]);
}

int main() {
    cin >> n;
    for (int i = 0; i < n; i++) {
        fa[i] = i;
        cnt[i] = 1;
    }
    int ans = 0;
    for (int i = 0; i < n - 1; ++i) {
        int a, b, x, y;
        cin >> a >> b;
        x = getRoot(a);
        y = getRoot(b);
        ans += cnt[x] * cnt[y];
        fa[x] = y;
        cnt[y] += cnt[x];
    }
    cout << ans << endl;
    return 0;
}
```

#grouplabel[判断题]

22. 输入的a和b的值应在$[0,n-1]$​的范围内。（#h(2.6em)）
23. 第16行改成"fa[i]=0;"不影响程序运行结果。（#h(2.6em)）
24. 若输入的a和b值决战$[0,n-1]$的范围内，则对于任意$0 ≤ i lt n$,都有$0 ≤ f a[i] lt n$​。（#h(2.6em)）
25. 若输入的a和b值均在$[0,n-1]$ 的范围内，则对于任意$0 ≤ i lt n$，都有$1 ≤ c n t[i] ≤ n$​。（#h(2.6em)）
#grouplabel[选择题]

26. 当n=50时，若a,b的值都在$[0,49]$范围内，且在第25行时x总是不等于y，那么输出为（#h(2.6em)）
  + 1276
  + 1176
  + 1225
  + 1250
27. 此程序的时间复杂度是 （#h(2.6em)）
  + $O(n)$
  + $O(log n)$
  + $O(n^2)$
  + $O(italic("n log") n)$​
#heading(level: 2)[]

本题t是s的子序列的意思是：从s中删去若干个字符，可以得到 t；特别地，如果 s=t，那么t也是s的子序列；空串是任何串的子序列。例如"acd"是“abcd”的子序列，"acd"时"acd"的子序列，但"adc"不是"abcde"的子序列。$s[x d o t s y]$表示$s[x]dots s[y]$共$y-x+1$个字符构成的字符串，若$x gt y$则$s[x d o t s y]$是空串。$t[x d o t s y]$​ 同理。


```cpp
#include <iostream>
#include <string>
using namespace std;
const int maxl = 202;
string s, t;
int pre[maxl], suf[maxl];

int main() {
    cin >> s >> t;
    int slen = s.length(), tlen = t.length();
    for (int i = 0, j = 0; i < slen; ++i) {
        if (j < tlen && s[i] == t[j]) ++j;
        pre[i] = j;  // t[0..j-1]是s[0..i]的子序列
    }
    for (int i = slen - 1, j = tlen - 1; i >= 0; --i) {
        if (j >= 0 && s[i] == t[j]) --j;
        suf[i] = j;  // t[j+1..tlen-1]是s[i..slen-1]的子序列
    }
    suf[slen] = tlen - 1;
    int ans = 0;
    for (int i = 0, j = 0, tmp = 0; i <= slen; ++i) {
        while (j <= slen && tmp >= suf[j] + 1) ++j;
        ans = max(ans, j - i - 1);
        tmp = pre[i];
    }
    cout << ans << endl;
    return 0;
}
```

提示：$t[0..p r e[i]-1]$是$s[0..i]$的子序列；$t[s u f[i]+1..t l e n-1]$是$s[i..s l e n-1]$的子序列

#grouplabel[判断题]

28. 程序输出时，suf数组满足：对任意$0 ≤ i lt s l e n,s u f[i] ≤ s u f[i+1]$​ （#h(2.6em)）
29. 当t时s的子序列时，输出一定不为0（#h(2.6em)）
30. 程序运行到第23行时，“j-i-1”一定不小于 0 （#h(2.6em)）
31. 当t是s的子序列时，对任意$0 ≤ i lt s l e n$满足 $p r e[i] gt s u f[i+1]+1$​（#h(2.6em)）
#grouplabel[选择题]

32. 若$t l e n = 10$，输出为0，则 $s l e n$最小为（#h(2.6em)）
  + 10
  + 12
  + 0
  + 1
33. 若 tlen = 10，输出为2 ，则slen最小为（#h(2.6em)）
  + 0
  + 10
  + 12
  + 1
= 完善程序

#heading(level: 2)[]

一个匠人决定要学习 n 个新技术。要想成功学习一个新技术，他不仅要拥有一定的经验值，而且还必须要先学会若干个相关的技术。学会一个新技术之后，他的经验值会增加一个对应的值。给定每个技术的学习条件和习得后获得的经验值，给定他已有的经验值，请问他最多能学会多少个新技术。输入第一行有两个数，分别为新技术个数 n($1 ≤ n ≤ 10^3$),以及己有经验值($≤ 10^7$)。接下来 n 行。第 i 行的两个正整数，分别表示学习第 i 个技术所需的最低经验值($≤ 10^7$),以及学会第i个技术后可获得的经验值($≤ 10^7$)接下来 n 行。第 i 行的第一个数$m_i(0 ≤ m_i lt n)$，表示第 i 个技术的相关技术数量。紧跟着 m 个两两不同的数，表示第 i 个技术的相关技术编号。输出最多能学会的新技术个数。下面的程序以 $O(n^2)$的时间复杂度完成这个问题，试补全程序。


```cpp
#include<cstdio>
using namespace std;
const int maxn = 1001;

int n;
int cnt[maxn];
int child [maxn][maxn];
int unlock[maxn];
int threshold[maxn], bonus[maxn];
int points;
bool find(){
    int target = -1;
    for (int i = 1; i <= n; ++i)
        if(① && ②){
        target = i;
        break;
    }
    if(target == -1)
        return false;
    unlock[target] = -1;
    ③
    for (int i = 0; i < cnt[target]; ++i)
        ④
    return true;
}

int main(){
    scanf("%d%d", &n, &points);
    for (int i = 1; i <= n; ++i){
        cnt[i] = 0;
        scanf("%d%d", &threshold[i], &bonus[i]);
    }
    for (int i = 1; i <= n; ++i){
        int m;
        scanf("%d", &m);
        ⑤
        for (int j = 0; j < m; ++j){
            int fa;
            scanf("%d", &fa);
            child[fa][cnt[fa]] = i;
            ++cnt[fa];
        }
    }

    int ans = 0;
    while(find())
        ++ans;

    printf("%d\n", ans);
    return 0;
}
```

34. ①处应填（#h(2.6em)）
  + `unlock[i] <= 0`
  + `unlock[i] >= 0`
  + `unlock[i] == 0`
  + `unlock[i] == -1`
35. ②处应填（#h(2.6em)）
  + `threshold[i] > points`
  + `threshold[i] >= points`
  + `points > threshold[i]`
  + `points >= threshold[i]`
36. ③处应填（#h(2.6em)）
  + `target = -1`
  + `--cnt[target]`
  + `bonus[target] = 0`
  + `points += bonus[target]`
37. ④处应填（#h(2.6em)）
  + `cnt[child[target][i]] -= 1`
  + `cnt[child[target][i]] = 0`
  + `unlock[child[target][i]] -= 1`
  + `unlock[child[target][i]] = 0`
38. ⑤处应填（#h(2.6em)）
  + `unlock[i] = cnt[i]`
  + `unlock[i] = m`
  + `unlock[i] = 0`
  + `unlock[i] = -1`
#heading(level: 2)[]

Alice 和 Bob 两个人在玩取石子游戏。他们制定了 n 条取石子的规则，第 i 条规则为：如果剩余石子的个数大于等于 a[i] 且大于等于 b[i]，那么他们可以取走 b[i] 个石子。他们轮流取石子。如果轮到某个人取石子，而他无法按照任何规则取走石子，那么他就输了。一开始石子有 m 个。请问先取石子的人是否有必胜的方法？输入第一行有两个正整数，分别为规则个数 n(1#(sym.lt)n#(sym.lt)64), 以及石子个数 m ($≤ 10^7$)。接下来 n 行。第 i 行有两个正整数 a[i] 和 b[i]。$(1 ≤ a[i] ≤ 10^7,1 ≤ b[i] ≤ 64)$如果先取石子的人必胜，那么输出 Win，否则输出 Loss。提示：可以使用动态规划解决这个问题。由于 b[i] 不超过 64 ,所以可以使用 64 位无符号整数去压缩必要的状态。status 是胜负状态的二进制压缩，trans 是状态转移的二进制压缩。试补全程序。代码说明：`~` 表示二进制补码运算符，它将每个二进制位的 0 变为 1、1 变为 0;而` ^` 表示二进制异或运算符，它将两个参与运算的数中的每个对应的二进制位一一进行比较，若两个二进制位相同，则运算结果的对应二进制位为 0 ,反之为 1。ull 标识符表示它前面的数字是 unsigned long long 类型。


```cpp
#include <cstdio>
#include<algorithm>
using namespace std;
const int maxn = 64;
int n, m;
int a[maxn], b[maxn];
unsigned long long status, trans;
bool win;
int main(){
    scanf("%d%d", &n, &m);
    for (int i = 0; i < n; ++i)
        scanf("%d%d", &a[i], &b[i]);
    for(int i = 0; i < n; ++i)
        for(int j = i + 1; j < n; ++j)
            if (a[i] > a[j]){
        swap(a[i], a[j]);
        swap(b[i], b[j]);
    }
    status = ①;
    trans = 0;
    for(int i = 1, j = 0; i <= m; ++i){
        while (j < n && ②){
            ③;
            ++j;
        }
        win = ④;
        ⑤;
    }

    puts(win ? "Win" : "Loss");

    return 0;
}
```

39. ①处应填（#h(2.6em)）
  + `0`
  + `~0ull`
  + `~0ull^1`
  + `1`
40. ②处应填（#h(2.6em)）
  + `a[j] < i`
  + `a[j] == i`
  + `a[j] !=i`
  + `a[j]>1`
41. ③处应填（#h(2.6em)）
  + `trans |=1ull << (b[j] - 1)`
  + `status |=1ull << (b[j] - 1)`
  + `status +=1ull << (b[j] - 1)`
  + `trans +=1ull << (b[j] - 1)`
42. ④处应填（#h(2.6em)）
  + `~status| trans`
  + `status & trans`
  + `status | trans`
  + `~status & trans`
43. ⑤处应填（#h(2.6em)）
  + `trans =status | trans ^ win`
  + `status = trans >> 1 ^ win`
  + `trans =status ^ trans | win`
  + `status = status << 1 ^ win`

#pagebreak()

= 答案与解析

=== 第 1 题　答案：C

=== 第 2 题　答案：D

=== 第 3 题　答案：C

=== 第 4 题　答案：D

=== 第 5 题　答案：D

=== 第 6 题　答案：C

=== 第 7 题　答案：A

=== 第 8 题　答案：A

=== 第 9 题　答案：B

=== 第 10 题　答案：B

=== 第 11 题　答案：C

=== 第 12 题　答案：C

=== 第 13 题　答案：D

=== 第 14 题　答案：D

=== 第 15 题　答案：A

=== 第 16 题　答案：错误

=== 第 17 题　答案：正确

=== 第 18 题　答案：正确

=== 第 19 题　答案：正确

=== 第 20 题　答案：A

=== 第 21 题　答案：B

=== 第 22 题　答案：正确

=== 第 23 题　答案：错误

=== 第 24 题　答案：正确

=== 第 25 题　答案：错误

=== 第 26 题　答案：C

=== 第 27 题　答案：A

=== 第 28 题　答案：正确

=== 第 29 题　答案：错误

=== 第 30 题　答案：错误

=== 第 31 题　答案：错误

=== 第 32 题　答案：C

=== 第 33 题　答案：D

=== 第 34 题　答案：A

=== 第 35 题　答案：B

=== 第 36 题　答案：C

=== 第 37 题　答案：D

=== 第 38 题　答案：C

=== 第 39 题　答案：D

=== 第 40 题　答案：C

=== 第 41 题　答案：B

=== 第 42 题　答案：A

=== 第 43 题　答案：D

