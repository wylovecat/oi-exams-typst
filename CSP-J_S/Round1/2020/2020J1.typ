// ===========================================================================
// 2020J1 —— 2020 CCF 非专业级别软件能力认证第一轮
// 由 _build/md2typ_csp.py 从 /home/wyao/Nutstore Files/aisichuang/0x0c00_真题整理/_build/raw/2020J1.txt 生成，人工补丁见 _build/patch_manual.py
// 编译：typst compile --root . CSP-J_S/Round1/2020/2020J1.typ
// ===========================================================================
#import "/_typst/exam.typ": *
#import "/_typst/figs.typ": fig-csp-2020j1-q11

#show: doc => exam(
  serial: "2020J1",
  course: "2020 CCF 非专业级别软件能力认证第一轮",
  title: "（CSP-J）入门级 C++语言试题",
  date: "2020 年 10 月 11 日 14:30~16:30",
  doc,
)

= 单项选择题（共 15 题，每题 2 分，共计 30 分；每题有且仅有一个正确选项）

1. 在内存储器中每个存储单元都被赋予一个唯一的序号，称为（#h(2.6em)）。
  + 下标
  + 地址
  + 序号
  + 编号
2. 编译器的主要功能是（#h(2.6em)）。
  + 将源程序翻译成机器指令代码
  + 将一种高级语言翻译成另一种高级语言
  + 将源程序重新组合
  + 将低级语言翻译成高级语言
3. 设 x=true, y=true, z=false，以下逻辑运算表达式值为真的是（#h(2.6em)）。
  + (x∧y) ∧z
  + x∧(z∨y) ∧z
  + (x∧y)∨(z∨x)
  + (y∨z)∧x∧z
4. 现有一张分辨率为 2048×1024 像素的 32 位真彩色图像。请问要存储这张图像，需要多大的存储空间？（#h(2.6em)）。
  + 4MB
  + 8MB
  + 32MB
  + 16MB
5. 冒泡排序算法的伪代码如下：输入：数组L, n ≥ k。输出：按非递减顺序排序的 L。算法 BubbleSort：

  ```cpp
  1. FLAG ← n          //标记被交换的最后元素位置
  2. while FLAG > 1 do
  3.    k ← FLAG -1
  4.    FLAG ← 1
  5.    for j=1 to k do
  6.       if L(j) > L(j+1) then do
  7.             L(j) ↔ L(j+1)
  8.             FLAG ← j
  ```

  对 n 个数用以上冒泡排序算法进行排序，最少需要比较多少次（#h(2.6em)）。
  + n
  + n-2
  + n2
  + n-1
6. 设A是n个实数的数组，考虑下面的递归算法：XYZ (A[1..n])

  ```cpp
  1. if n=1 then return A[1]
  2.      else temp ← XYZ (A[l..n-1])
  3.        if temp < A[n]
  4.        then return temp
  5.        else return A[n]
  ```

  请问算法 XYZ 的输出是什么？（#h(2.6em)）。
  + A 数组的平均
  + A 数组的最小值
  + A 数组的最大值
  + A 数组的中值
7. 链表不具有的特点是（#h(2.6em)）。
  + 插入删除不需要移动元素
  + 可随机访问任一元素
  + 不必事先估计存储空间
  + 所需空间与线性表长度成正比
8. 有 10 个顶点的无向图至少应该有（#h(2.6em)）条边才能确保是一个连通图。
  + 10
  + 12
  + 9
  + 11
9. 二进制数 1011 转换成十进制数是（#h(2.6em)）。
  + 10
  + 13
  + 11
  + 12
10. 5 个小朋友并排站成一列，其中有两个小朋友是双胞胎，如果要求这两个双胞胎必须相邻，则有（#h(2.6em)）种不同排列方法?
  + 24
  + 36
  + 72
  + 48
11. 下图中所使用的数据结构是（#h(2.6em)）。

  #fig-csp-2020j1-q11()
  + 哈希表
  + 二叉树
  + 栈
  + 队列
12. 独根树的高度为 1。具有 61 个结点的完全二叉树的高度为（#h(2.6em)）。
  + 7
  + 5
  + 8
  + 6
13. 干支纪年法是中国传统的纪年方法，由10个天干和12个地支组合成60个天干地支。由公历年份可以根据以下公式和表格换算出对应的天干地支。天干 =（公历年份）除以10所得余数地支 =（公历年份）除以 12 所得余数例如，今年是 2020 年，2020 除以 10 余数为 0，查表为"庚”；2020 除以 12，余数为 4，查表为“子” 所以今年是庚子年。请问 1949 年的天干地支是（#h(2.6em)）。
  + 己亥
  + 己丑
  + 己卯
  + 己酉
14. 10 个三好学生名额分配到 7 个班级，每个班级至少有一个名额，一共有（#h(2.6em)）种不同的分配方案。
  + 56
  + 84
  + 72
  + 504
15. 有五副不同颜色的手套（共 10 只手套，每副手套左右手各 1 只），一次性从中取 6 只手套，请问恰好能配成两副手套的不同取法有（#h(2.6em)）种。
  + 30
  + 150
  + 180
  + 120
= 阅读程序（程序输入不超过数组或字符串定义的范围；判断题正确填 √，错误填 ×。除特殊说

明外，判断题 1.5 分，选择题 3 分，共计 40 分）

#heading(level: 2)[]


```cpp
#include <cstdlib>
#include <iostream>
using namespace std;

char encoder[26] = {'C','S','P',0};
char decoder[26];

string st;

int main() {
    int k = 0;
    for (int i = 0; i < 26; ++i)
        if (encoder[i] != 0) ++k;
    for (char x ='A'; x <= 'Z'; ++x) {
        bool flag = true;
        for (int i = 0; i < 26; ++i)
            if (encoder[i] ==x) {
            flag = false;
            break;
        }
        if (flag) {
            encoder[k]= x;
            ++k;
        }
    }
    for (int i = 0; i < 26; ++i)
        decoder[encoder[i]- 'A'] = i + 'A';
    cin >> st;
    for (int i = 0; i < st.length( ); ++i)
        st[i] = decoder[st[i] -'A'];
    cout << st;
    return 0;
}
```

#grouplabel[判断题]

16. 输入的字符串应当只由大写字母组成，否则在访问数组时可能越界。（#h(2.6em)）
17. 若输入的字符串不是空串，则输入的字符串与输出的字符串一定不一样。（#h(2.6em)）
18. 将第 12 行的“i #(sym.lt) 26”改为“i #(sym.lt) 16”，程序运行结果不会改变。（#h(2.6em)）
19. 将第 26 行的"i #(sym.lt) 26”改为“i #(sym.lt) 16”，程序运行结果不会改变。（#h(2.6em)）
#grouplabel[单选题]

20. 若输出的字符串为“ABCABCABCA”，则下列说法正确的是（#h(2.6em)）。
  + 输入的字符串中既有 A 又有 P
  + 输入的字符串中既有 S 又有 B
  + 输入的字符串中既有 S 又有 P
  + 输入的字符串中既有 A 又有 B
21. 若输出的字符串为“CSPCSPCSPCSP”，则下列说法正确的是（#h(2.6em)）。
  + 输入的字符串中既有 J 又有 R
  + 输入的字符串中既有 P 又有 K
  + 输入的字符串中既有 J 又有 K
  + 输入的字符串中既有 P 又有 R
#heading(level: 2)[]


```cpp
#include <iostream>
using namespace std;

long long n, ans;
int k, len;
long long d[1000000];

int main() {
    cin >> n >> k;
    d[0] = 0;
    len= 1;
    ans = 0;
    for (long long i = 0; i <n; ++i) {
        ++d[0];
        for (int j = 0; j + 1<len; ++j) {
            if (d[j] == k) {
                d[j] = 0;
                d[j + 1] += 1;
                ++ans;
            }
        }
        if (d[len- 1] == k) {
            d[len - 1] = 0;
            d[len] =1;
            ++len;
            ++ans;
        }
    }
    cout << ans << endl;
    return 0;
}
```

#grouplabel[判断题]

22. 若 k=l，则输出 ans 时，len=n。（#h(2.6em)）
23. 若 k#(sym.gt)l，则输出 ans 时，len —定小于 n。（#h(2.6em)）
24. 若 k#(sym.gt)l，则输出 ans 时，klen —定大于 n。（#h(2.6em)）
#grouplabel[单选题]

25. 若输入的 n 等于：1015 ，输入的 k 为 1，则输出等于（#h(2.6em)）。
  + (1030−1015)/2
  + (1030−1015)/2
  + 1
  + 1015
26. 若输入的 n 等于 205,891,132,094,649（即 330 ），输入的 k 为 3，则输出等于（#h(2.6em)）。
  + (330−1)/2
  + 330
  + 330-1
  + (330+1)/2
27. 若输入的 n 等于 100,010,002,000,090，输入的 k 为 10，则输出等于（#h(2.6em)）。
  + 11,112,222,444,543
  + 11,122,222,444,453
  + 11,122,222,444,543
  + 11,112,222,444,453
#heading(level: 2)[]


```cpp
#include <algorithm>
#include <iostream>
using namespace std;

int n;
int d[50][2];
int ans;

void dfs(int n, int sum) {
    if (n == 1) {
        ans = max(sum, ans);
        return;
    }
    for (int i = 1; i < n; ++i) {
        int a = d[i - 1][0], b = d[i - 1][1];
        int x = d[i][0], y = d[i][1];
        d[i - 1][0] = a + x;
        d[i - 1][1] = b + y;
        for (int j = i; j < n - 1; ++j)
            d[j][0] = d[j + 1][0], d[j][1] = d[j + 1][1];
        int s = a + x + abs(b - y);
        dfs(n - 1, sum + s);
        for (int j = n - 1; j > i; --j)
            d[j][0] = d[j - 1][0], d[j][1] = d[j - 1][1];
        d[i - 1][0] = a, d[i - 1][1] = b;
        d[i][0] = x, d[i][1] = y;
    }
}

int main() {
    cin >> n;
    for (int i = 0; i < n; ++i)
        cin >> d[i][0];
    for (int i = 0; i < n; ++i)
        cin >> d[i][1];
    ans = 0;
    dfs(n, 0);
    cout << ans << endl;
    return 0;
}
```

#grouplabel[判断题]

28. 若输入 n 为 0,此程序可能会死循环或发生运行错误。（#h(2.6em)）
29. 若输入 n 为 20,接下来的输入全为 0，则输出为 0。（#h(2.6em)）
30. 输出的数一定不小于输入的 d[i][0] 和 d[i][l] 的任意一个。（#h(2.6em)）1 15 5输出：
#grouplabel[单选题]

31. 若输入的 n 为 20,接下来的输入是 20 个 9 和 20 个 0,则输出为（#h(2.6em)）。
  + 1917
  + 1908
  + 1881
  + 1890
32. 若输入的 n 为 30,接下来的输入是 30 个 0 和 30 个 5,则输出为（#h(2.6em)）。
  + 2020
  + 2030
  + 2010
  + 2000
33. （4 分）若输入的 n 为 15，接下来的输入是 15 到 1，以及 15 到 1，则输出为（#h(2.6em)）。
  + 2420
  + 2220
  + 2440
  + 2240
= 完善程序（单选题，每小题 3 分，共计 30 分）

#heading(level: 2)[]

（质因数分解）给出正整数 n，请输出将 n 质因数分解的结果，结果从小到大输出。例如：输入n=120，程序应该输出 2 2 2 3 5，表示：120 = 2 × 2 × 2 × 3 × 5。输入保证 $2 ≤ n ≤ 10^9$。提示：先从小到大枚举变量 i，然后用 i 不停试除 n 来寻找所有的质因子。试补全程序。


```cpp
#include <cstdio>
using namespace std;
int n, i;

int main() {
    scanf("%d", &n);
    for(i = ①; ② <=n; i ++) {
        ③ {
            printf("%d ", i);
            n = n / i;
        }
    }
    if(④)
        printf("%d ", ⑤);
    return 0;
}
```

34. ①处应填（#h(2.6em)）
  + n-1
  + 0
  + 1
  + 2
35. ②处应填（#h(2.6em)）
  + n/i
  + n/(i#"*" i)
  + i#"*" i#"*" i
  + i#"*" i
36. ③处应填（#h(2.6em)）
  + if(i#"*" i#(sym.lt)=n)
  + if(n%i==0)
  + while(i#"*" i#(sym.lt)=n)
  + while(n%i==0)
37. ④处应填（#h(2.6em)）
  + n#(sym.gt)1
  + n#(sym.lt)=1
  + i+i#(sym.lt)=n
  + i#(sym.lt)n/i
38. ⑤处应填（#h(2.6em)）
  + 2
  + i
  + n/i
  + n
#heading(level: 2)[]

（最小区间覆盖）给出 n 个区间，第 i 个区间的左右端点是 [ai,bi]。现在要在这些区间中选出若干个，使得区间 [0, m] 被所选区间的并覆盖（即每一个 0≤i≤m 都在某个所选的区间中）。保证答案存在，求所选区间个数的最小值。输入第一行包含两个整数 n 和 m （1≤n≤5000,1≤m≤109）接下来 n 行，每行两个整数 ai，bi（0≤ai,bi≤m）。提示：使用贪心法解决这个问题。先用 O(n2) 的时间复杂度排序，然后贪心选择这些区间。试补全程序。


```cpp
#include <iostream>

using namespace std;

const int MAXN = 5000;
int n, m;
struct segment { int a, b; } A[MAXN];

void sort() // 排序
{
    for (int i = 0; i < n; i++)
        for (int j = 1; j < n; j++)
            if (①)
    {
        segment t = A[j];
        ②
    }
}

int main()
{
    cin >> n >> m;
    for (int i = 0; i < n; i++)
        cin >> A[i].a >> A[i].b;
    sort();
    int p = 1;
    for (int i = 1; i < n; i++)
        if (③)
            A[p++] = A[i];
    n = p;
    int ans =0, r = 0;
    int q = 0;
    while (r < m)
    {
        while (④)
            q++;
        ⑤;
        ans++;
    }
    cout << ans << endl;
    return 0;
}
```

39. ①处应填（#h(2.6em)）
  + A[j].b#(sym.lt)A[j-1].b
  + `A[j].b>A[j-1].b`
  + A[j].a#(sym.lt)A[j-1].a
  + `A[j].a>A[j-1].a`
40. ②处应填（#h(2.6em)）
  + `A[j-1]=A[j];A[j]=t;`
  + `A[j+1]=A[j];A[j]=t;`
  + `A[j]=A[j-1];A[j-1]=t;`
  + `A[j]=A[j+1];A[j+1]=t;`
41. ③处应填（#h(2.6em)）
  + A[i].b#(sym.lt)A[p-1].b
  + `A[i].b>A[i-1].b`
  + `A[i].b>A[p-1].b`
  + A[i].b#(sym.lt)A[i-1].b
42. ④处应填（#h(2.6em)）
  + q+1#(sym.lt)n&&A[q+1].b#(sym.lt)=r
  + q+1#(sym.lt)n&&A[q+1].a#(sym.lt)=r
  + q#(sym.lt)n&&A[q].a#(sym.lt)=r
  + q#(sym.lt)n&&A[q].b#(sym.lt)=r
43. ⑤处应填（#h(2.6em)）
  + `r=max(r,A[q+1].a)`
  + `r=max(r,A[q].b)`
  + `r=max(r,A[q+1].b)`
  + q++
