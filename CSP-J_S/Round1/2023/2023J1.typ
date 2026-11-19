// ===========================================================================
// 2023J1 —— 2023 CCF 非专业级别软件能力认证第一轮
// 由 _build/md2typ_csp.py 从 /home/wyao/Nutstore Files/aisichuang/0x0c00_真题整理/CSP-J_S/Round1/2023/2023J1.pdf 生成，人工补丁见 _build/patch_manual.py
// 编译：typst compile --root . CSP-J_S/Round1/2023/2023J1.typ
// ===========================================================================
#import "/_typst/exam.typ": *

#show: doc => exam(
  serial: "2023J1",
  course: "2023 CCF 非专业级别软件能力认证第一轮",
  title: "(CSP-J1)入门级 C++语言试题",
  date: "2023 年 9 月 16 日 09:30 ~ 11:30",
  doc,
)

= 单项选择题（共 15 题，每题 2 分，共计 30 分；每题有且仅有一个正确选项）

1. 在 C++中，下面哪个关键字用于声明一个变量，其值不能被修改？（#h(2.6em)）。
  + unsigned
  + const
  + static
  + mutable
2. 八进制数$12345670_(8)$和$07654321_(8)$的和为 （#h(2.6em)）。
  + $22222221_(8)$
  + $21111111_(8)$
  + $22111111_(8)$
  + $22222211_(8)$
3. 阅读下述代码，请问修改 data 的 value 成员以存储 3.14，正确的方式是（#h(2.6em)）。

  ```cpp
  union Data{
      int num;
      float value;
      char symbol;
  };
  union Data data;
  ```

  + data.value = 3.14;\`
  + value.data = 3.14;\`
  + data -#(sym.gt) value = 3.14;\`
  + value-#(sym.gt)data=3.14;\`
4. 假设有一个链表的节点定义如下：

  ```cpp
  struct Node { int data; Node* next; }
  ```

  现在有一个指向链表头部的指针：`Node* head`。如果想要在链表中插入一个新
  节点，其成员` data` 的值为$42$ ,并使新节点称为链表的第一个节点，下面哪个
  操作是正确的？（#h(2.6em)）。
  + Node#"*"  newNode = new Node; newNode-#(sym.gt)data = 42; newNode-#(sym.gt)next = head;\`\`head = newNode\`
  + Node#"*"  newNode = new Node; head-#(sym.gt)data = 42; newNode-#(sym.gt)next = head;\`\`head = newNode\`
  + Node#"*"  newNode = new Node; newNode-#(sym.gt)data = 42; head-#(sym.gt)next = newNode;\`
  + Node#"*"  newNode = new Node; newNode-#(sym.gt)data = 42; newNode-#(sym.gt)next = head;\`
5. 根节点的高度为 1，一棵拥有$2023$个节点的三叉树高度至少为（#h(2.6em)）。
  + 6
  + 7
  + 8
  + 9
6. 小明在某一天中一次有七个空闲时间段，他想要选出至少一个空闲时间段来练习唱歌，但他希望任意两个练习的时间段之间都有至少两个空闲的时间段让他休息。则小明一共有（#h(2.6em)）种选择时间段的方案。
  + 31
  + 18
  + 21
  + 33
7. 以下关于高精度运算的说法错误的是 （#h(2.6em)）。
  + 高精度计算主要是用来处理大整数或需要保留多位小数的运算
  + 大整数除以小整数的处理的步骤可以是，将被除数和除数对齐，从左到右逐位尝试将除数乘以某个数，通过减法得到新的被除数，并累加商
  + 高精度乘法的运算时间只与参与运算的两个整数中长度较长者的位数有关
  + 高精度加法运算的关键在于逐位相加并处理进位
8. 后缀表达式  6 2 3 + - 3 8 2 / + #"*"  2 ^ 3 +对应的中缀表达式是？ （#h(2.6em)）。
  + ((6-(2+3))#"*" (3+8/2))^2+3\`
  + 6-2+3#"*" 3+8/$2^2$+3
  + (6-(2+3))#"*" ((3+8/2)^2)+3\`
  + 6-((2+3)#"*" (3+8/2))^2+3\`
9. 数$101010_(2)$和$166_(8)$  的和为 （#h(2.6em)）。
  + $(10110000)_(2)$
  + $(236)_(8)$
  + $(158)_(10)$
  + $(A 0)_(16)$
10. 假设有一组字符 {a,b,c,d,e,f}, 对应频率分别为$5"%"$,$9"%"$,$12"%"$,$13"%"$,$16"%"$,$45"%"$  请问以下哪个选项是字符 abcdef 分别对应的一组哈夫曼编码?（#h(2.6em)）
  + $1111, 1110, 101, 100, 110, 0$
  + $1010, 1001, 1000, 011, 010, 00$
  + $000, 001, 010, 011, 10, 11$
  + $1010, 1011, 110, 111, 00, 01$
11. 给定一棵二叉树，其前序遍历结果为：ABDECFG  中序遍历结果为：DEBACFG。请问这棵树的正确后序遍历结果是什么? （#h(2.6em)）
  + EDBGFCA\`
  + EDGBFCA\`
  + DEBGFCA\`
  + DBEGFCA\`
12. 考虑一个有向无环图，该图包含 4 条有向边：$(1, 2), (1, 3), (2, 4)$和$(3, 4)$。以下哪个选项是这个有向无环图的一个有效的拓扑排序? （#h(2.6em)）
  + 4,2,3,1
  + 1,2,3,4
  + 1,2,4,3
  + 2,1,3,4
13. 在计算机中，以下哪个选项描述的数据存储容量最小? （#h(2.6em)）
  + 字节 (byte)
  + 比特 (bit)
  + 字 (word)
  + 千字节 (kilobyte)
14. 一个班级有 10 个男生和 12 个女生。如果要选出一个 3 人的小组，并且小组中必须至少包含 1 个女生，那么有多少种可能的组合? （#h(2.6em)）。
  + 1420
  + 1770
  + 1540
  + 2200
15. 以下哪个不是操作系统? （#h(2.6em)）。
  + Linux
  + Windows
  + Android
  + HTML
= 阅读程序（程序输入不超过数组或字符串定义的范围；判断题正确填$✓$，错误填  ✗；

除特殊说明外，判断题 1.5 分，选择题 3 分，共计 40 分）。

#heading(level: 2)[]


```cpp
#include<iostream>
#include<cmath>
using namespace std;

double f(double a,double b,double c){
    double s=(a+b+c)/2;
    return sqrt(s*(s-a)*(s-b)*(s-c));
}
int main(){

    cout.flags(ios::fixed);
    cout.precision(4);

    int a,b,c;
    cin>>a>>b>>c;
    cout<<f(a,b,c)<<endl;
    return 0;
}
```

假设输入的所有数都为不超过 1000 的正整数，完成下面的判断题和单选题：

#grouplabel[判断题]

16. (2 分)当输入为 2 2 2 时，输出为 1.7321。（#h(2.6em)）
17. (2 分)将第 7 行的` (s-b)*(s-c)`  改为` (s-c)*(s-b)`  ，不会影响程序运行的结果。（#h(2.6em)）
18. (2 分)程序总是输出四位小数。（#h(2.6em)）
#grouplabel[单选题]

19. 当输入为 3 4 5 时，输出为 （#h(2.6em)）
  + 6.0000
  + 12.0000
  + 24.0000
  + 30.0000
20. 若输入 5 12 13 ，输出为 （#h(2.6em)）。
  + 24.0000
  + 30.0000
  + 60.0000
  + 120.0000
#heading(level: 2)[]


```cpp
#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

int f(string x,string y){
    int m=x.size();
    int n=y.size();
    vector<vector<int>>v(m+1,vector<int>(n+1,0));
    for(int i=1;i<=m;i++){
        for(int j=1;j<=n;j++){
            if(x[i-1]==y[j-1]){
                v[i][j]=v[i-1][j-1]+1;
            }else{
                v[i][j]=max(v[i-1][j],v[i][j-1]);

            }
        }
    }
    return v[m][n];
}
bool g(string x,string y){
    if(x.size() != y.size()){
        return false;
    }
    return f(x+x,y)==y.size();
}
int main(){
    string x,y;
    cin>>x>>y;
    cout<<g(x,y)<<endl;
    return 0;
}
```

#grouplabel[判断题]

21. f 函数的返回值小于等于$min(n, m)$ （#h(2.6em)）。
22. f 函数的返回值等于两个输入字符串的最长公共子串的长度。（#h(2.6em)）
23. 当输入两个完全相同的字符串时，g 函数的返回值总是  true。（#h(2.6em)）
#grouplabel[单选题]

24. 将第 19 行中的$v[m][n]$替换为$v[n][m]$，那么该程序 （#h(2.6em)）
  + 行为不变
  + 只会改变输出
  + 一定非正常退出
  + 可能非正常退出
25. 当输入为  csp-j p-jcs  时，输出为。（#h(2.6em)）。
  + 0
  + 1
  + T
  + F
26. 当输入为  csppsc spsccp  时，输出为（#h(2.6em)）。
  + T
  + F
  + 0
  + 1
#heading(level: 2)[]


```cpp
#include <iostream>
#include <cmath>
using namespace std;

int solve1(int n){
    return n*n;
}
int solve2(int n){
    int sum=0;
    for(int i=1;i<=sqrt(n);i++){
        if(n%i==0){
            if(n/i==i){
                sum+=i*i;
            }else{
                sum+=i*i+(n/i)*(n/i);
            }
        }
    }
    return sum;
}
int main(){
    int n;
    cin>>n;
    cout<<solve2(solve1(n))<<" "<<solve1((solve2(n)))<<endl;
    return 0;
}
```

假设输入的 n 是绝对值不超过 1000 的整数，完成下面的判断题和单选题。

#grouplabel[判断题]

27. 如果输入的 n 为正整数，solve2 函数的作用是计算 n 所有的因子的平方和 （#h(2.6em)）。
28. 第$13 ∼ 4$行的作用是避免 n 的平方根因子 i (或 n/i) 进入第 16 行而被计算两次（#h(2.6em)）。
29. 如果输入的 n 为质数，solve2(n)的返回值为$n^(2) + 1$（#h(2.6em)）
#grouplabel[单选题]

30. (4 分)如果输入的 n 为质数 p 的平方，那么 solve2(n)的返回值为（#h(2.6em)）
  + $p^(2) + p + 1$
  + $n^(2) + n + 1$
  + $n^(2) + 1$
  + $p^(4) + 2 p^(2) + 1$
31. 当输入为正整数时，第一项减去第二项的差值一定（#h(2.6em)）。
  + 大于 0
  + 大于等于 0 且不一定大于 0
  + 小于 0
  + 小于等于 0 且不一定小于 0
32. 当输入为 5 是，输出为 （#h(2.6em)）。
  + 651 625
  + 650 729
  + 651 676
  + 652 625
= 完善程序(单选题，每小题 3 分，共计 30 分)

== 寻找被移除的元素

原有长度为 n+1 公差为 1 等差数列，将数列输到程序的数组时移除了一个元素，

导致长度为 n 的连续数组可能不再连续，除非被移除的是第一个或最后一个元素。

需要在数组不连续时，找出被移除的元素。试补全程序。


```cpp
#include <iostream>
#include <vector>
using namespace std;
int find_missing(vector<int>& nums) {
    int left = 0, right = nums.size() - 1;
    while (left < right){
        int mid = left + (right - left) / 2;
        if (nums[mid] == mid +  __①__  ) {
            __②__ ;
        } else {
            __③__ ;
        }
    }
    return  __④__ ;
}
int main() {
    int n;
    cin >> n;
    vector<int> nums(n);
    for (int i = 0; i < n; i++) cin >> nums[i];
    int missing_number = find_missing(nums);
    if (missing_number ==  __⑤__  ) {
        cout << "Sequence is consecutive" << endl;
    }else{
        cout << "Missing number is " << missing_number << endl;
    }
    return 0;
}
```

33. ①\`  处应填 （#h(2.6em)）
  + 1
  + nums[0]\`
  + right\`
  + left\`
34. ②\`  处应填 （#h(2.6em)）
  + left=mid+1\`
  + right=mid-1\`
  + right=mid\`
  + left=mid\`
35. ③\`  处应填 （#h(2.6em)）
  + left=mid+1\`
  + right=mid-1\`
  + right=mid\`
  + left=mid\`
36. ④\`  处应填 （#h(2.6em)）
  + left+nums[0]\`
  + right+nums[0]\`
  + mid+nums[0]\`
  + right+1\`
37. ⑤\`  处应填 （#h(2.6em)）
  + nums[0]+n\`
  + nums[0]+n-1\`
  + nums[0]+n+1\`
  + nums[n-1]\`
#heading(level: 2)[]

编辑距离

给定两个字符串，每次操作可以选择删除（Delete）、插入（Insert）、替换

（Replace），一个字符，求将第一个字符串转换为第二个字符串所需要的最少操作

次数。

试补全程序。


```cpp
#include <iostream>
#include <string>
#include <vector>
using namespace std;
int min(int x, int y, int z) {
    return min(min(x, y), z);
}
int edit_dist_dp(string str1, string str2) {
    int m = str1.length();
    int n = str2.length();
    vector<vector<int>> dp(m + 1, vector<int>(n + 1));
    for (int i = 0; i <= m; i++) {
        for (int j = 0; j <= n; j++) {
            if (i == 0)
                dp[i][j] =  __①__ ;
            else if (j == 0)
                dp[i][j] =  __②__ ;
            else if (  __③__  )
                dp[i][j] =  __④__ ;
            else
                dp[i][j] = 1 + min(dp[i][j - 1], dp[i - 1][j],  __⑤__ );

        }
    }
    return dp[m][n];
}
int main() {
    string str1, str2;
    cin >> str1 >> str2;
    cout << "Mininum number of operation:" << edit_dist_dp(str1, str2) <<
    endl;
    return 0;
}
```

38. ①\`  处应填 （#h(2.6em)）
  + j\`
  + i\`
  + m\`
  + n\`
39. ②\`  处应填 （#h(2.6em)）
  + j\`
  + i\`
  + m\`
  + n\`
40. ③\`  处应填 （#h(2.6em)）
  + str1[i-1]==str2[j-1]\`
  + str1[i]==str2[j]\`
  + str1[i-1]!=str2[j-1]\`
  + str1[i]!=str2[j]\`
41. ④\`  处应填 （#h(2.6em)）
  + dp[i-1][j-1]+1\`
  + dp[i-1][j-1]\`
  + dp[i-1][j]\`
  + dp[i][j-1]\`
42. ⑤\`  处应填 （#h(2.6em)）
  + dp[i][j] + 1\`
  + dp[i-1][j-1]+1\`
  + dp[i-1][j-1]\`
  + dp[i][j]\`
