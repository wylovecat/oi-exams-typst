// ===========================================================================
// 2024J1-答案 —— 2024 CCF 非专业级别软件能力认证第一轮
// 由 _build/md2typ_csp.py 从 /home/wyao/Nutstore Files/aisichuang/0x0c00_真题整理/CSP-J_S/Round1/2024/CSP-J2024_Round1.pdf 生成，人工补丁见 _build/patch_manual.py
// 编译：typst compile --root . CSP-J_S/Round1/2024/2024J1-答案.typ
// ===========================================================================
#import "/_typst/exam.typ": *

#show: doc => exam(
  serial: "2024J1-答案",
  course: "2024 CCF 非专业级别软件能力认证第一轮",
  title: "(CSP-J1) 入门级 C++ 语言试题",
  date: "2024 年 9 月 21 日 09：30∼11：30",
  doc,
)

= 单项选择题（共 15 题，每题 2 分，共计 30 分；每题有且仅有一个正确选项）

1. 32 位 int 类型的存储范围是 （#h(2.6em)）
  + −2147483647 ∼ +2147483647
  + −2147483647 ∼ +2147483648
  + −2147483648 ∼ +2147483647
  + −2147483648 ∼ +2147483648
2. 计算 ($14_(8)$ − $1010_(2)$) ∗ D − $1101_(2)$ 的结果，并选择答案的十进制值：（#h(2.6em)）
  + 13
  + 14
  + 15
  + 16
3. 某公司有 10 名员工，分为 3 个部门：A 部门有 4 名员工，B 部门有 3 名员工、C部门有 3 名员工。现需要从这 10 名员工中选出 4 名组成一个工作组，且每个部门至少要有 1 人。问有多少种选择方式？（#h(2.6em)）。
  + 120
  + 126
  + 132
  + 238
4. 以下哪个序列对应数组 0 至 7 的 4 位二进制格雷码 (Gray code)？（#h(2.6em)）
  + 0000, 0001, 0011, 0010, 0110, 0111, 0101, 1000
  + 0000, 0001, 0011, 0010, 0110, 0111, 0100, 0101
  + 0000, 0001, 0011, 0010, 0100, 0101, 0111, 0110
  + 0000, 0001, 0011, 0010, 0110, 0111, 0101, 0100
5. 记 1KB 为 1024 字节（byte）、1MB 为 1024 KB，那么 1MB 是多少二进制位（bit）？（#h(2.6em)）。
  + 1000000
  + 1048576
  + 8000000
  + 8388608
6. 以下哪个不是 C++ 中的基本数据类型？（#h(2.6em)）
  + int
  + float
  + struct
  + char
7. 以下哪个不是 C++ 中的循环语句？（#h(2.6em)）。
  + for
  + while
  + do-while
  + repeat-until
8. 在 C/C++ 中，(char)('a'+13) 与下面哪一个值相等？（#h(2.6em)）
  + 'm'
  + 'n'
  + 'z'
  + '3'
9. 假设有序表中有 1000 个元素，则用二分法查找元素 x 最多需要比较（#h(2.6em)）次。
  + 25
  + 10
  + 7
  + 1
10. 下面的哪一个不是操作系统名字？（#h(2.6em)）。
  + Notepad
  + Linux
  + Windows
  + macOS
11. 在无向图中，所有顶点的度数之和等于 （#h(2.6em)）。
  + 图的边数
  + 图的边数的两倍
  + 图的顶点数
  + 图的顶点数的两倍
12. 已知二叉树的前序遍历为 [A，B，D，E，C，F，G]，中序遍历为 [D，B，E，A，F，C，G]，请问该二叉树的后序遍历结果是？（#h(2.6em)）。
  + [D，E，B，F，G，C，A]
  + [D，E，B，F，G，A，C]
  + [D，B，E，F，G，C，A]
  + [D，B，E，F，G，A，C]
13. 给定一个空栈，支持入栈和出栈操作。若入栈操作的元素依次是 1 2 3 4 5 6，其中 1 最先入栈、6 最后入栈。下图哪种出栈顺序是不可能的？（#h(2.6em)）。
  + 6 5 4 3 2 1
  + 1 6 5 4 3 2
  + 2 4 6 5 3 1
  + 1 3 5 2 4 6
14. 有 5 个男生和 3 个女生站成一排，规定 3 个女生必须相邻。问有多少种不同的排列方式？（#h(2.6em)）
  + 4320 种
  + 5040 种
  + 3600 种
  + 2880 种
15. 编译器的主要作用是什么？（#h(2.6em)）。
  + 直接执行源代码
  + 将源代码转换为机器代码
  + 进行代码调试
  + 管理程序运行时的内存
= 阅读程序（程序输入不超过数组或字符串定义的范围；判断题正确填 4，错误填 8；除特殊说明外，判断题 1.5 分，选择题 3 分，共计 40 分）

#heading(level: 2)[]

1  #"#" include  #(sym.lt)iostream#(sym.gt)

2  using namespace  std;

4  bool  isPrime(int  n) {

5        if  (n  #(sym.lt)= 1){

6              return false;

7        }

8        for  (int  i  = 2;  i  #"*"   i  #(sym.lt)=  n;  i++) {

9              if  (n  %  i  == 0){

10                     return false;

11              }

12        }

13        return true;

14  }

16  int  countPrimes(int  n) {

17        int  count  = 0;

18        for  (int  i  = 2;  i  #(sym.lt)=  n;  i++) {

19              if  (isPrime(i)) {

20                     count++;

21              }

22        }

23        return  count;

24  }

26  int  sumPrimes(int  n) {

27        int  sum  = 0;

28        for  (int  i  = 2;  i  #(sym.lt)=  n;  i++) {

29              if  (isPrime(i)) {

30                     sum  +=  i;

31              }

32        }

33        return  sum;

34  }

36  int  main（#h(2.6em)） {

37        int  x;

38        cin  #(sym.gt)#(sym.gt)  x;

39        cout  #(sym.lt)#(sym.lt)  countPrimes(x) #(sym.lt)#(sym.lt)  " "  #(sym.lt)#(sym.lt)  sumPrimes(x) #(sym.lt)#(sym.lt)  endl;

40        return  0;

41  }

#grouplabel[判断题]

16. 当输入为 "10"  时，程序的第一个输出为 "4"，第二个输出为 "17" 。（#h(2.6em)）
17. 若将 isPrime(i) 函数中的条件改为 i#(sym.lt)=n/2，输入 "20" 时，countPrimes(20) 的输出将变为 "6" 。（#h(2.6em)）
18. sumPrimes 函数计算的是从 2 到 n 之间的所有素数之和。（#h(2.6em)）
#grouplabel[单选题]

19. 当输入为 "50" 时，sumPrimes(50) 的输出为。（#h(2.6em)）
  + 1060
  + 328
  + 381
  + 275
20. 如果将for (int i = 2; i #"*"  i #(sym.lt)= n; i++) 改为 for (int i = 2; i #(sym.lt)= n; i++)，输入”10” 时，程序的输出（#h(2.6em)）。
  + 将不能正确计算 10 以内素数个数及其和
  + 仍然输出”4” 和”17”
  + 输出”3” 和”10”
  + 输出结果不变，但运行时间更短
#heading(level: 2)[]

1  #"#" include  #(sym.lt)iostream#(sym.gt)

2  #"#" include  #(sym.lt)vector#(sym.gt)

3  using namespace  std;

5  int  compute(vector#(sym.lt)int#(sym.gt)&  cost) {

6        int  n  =  cost.size（#h(2.6em)）;

7        vector#(sym.lt)int#(sym.gt)  dp(n  + 1, 0);

8        dp[1] =  cost[0];

9        for  (int  i  = 2;  i  #(sym.lt)=  n;  i++) {

10              dp[i] =  min(dp[i-1],  dp[i-2]) +  cost[i-1];

11        }

12        return  min(dp[n],  dp[n-1]);

13  }

15  int  main（#h(2.6em)） {

16        int  n;

17        cin  #(sym.gt)#(sym.gt)  n;

18        vector#(sym.lt)int#(sym.gt)  cost(n);

19        for  (int  i  = 0;  i  #(sym.lt)  n;  i++) {

20              cin  #(sym.gt)#(sym.gt)  cost[i];

21        }

22        cout  #(sym.lt)#(sym.lt)  compute(cost) #(sym.lt)#(sym.lt)  endl;

23        return  0;

24  }

#grouplabel[判断题]

21. 当输入的 cost 数组为 10，15，20 时，程序的输出为 15 。（#h(2.6em)）
22. 如果将 dp[i−1] 改为 dp[i−3]，程序可能会产生编译错误。（#h(2.6em)）
23. （2 分）程序总是输出 cost 数组中最小的元素。（#h(2.6em)）
#grouplabel[单选题]

24. 当输入的 cost 数组为 {1，100，1，1，1，100，1，1，100，1} 时，程序的输出为（#h(2.6em)）
  + "6"
  + "7"
  + "8"
  + "9"
25. （4 分）如果输入的 cost 数组为 {10，15，30，5，5，10，20}，程序的输出为。（#h(2.6em)）
  + "25"
  + "30"
  + "35"
  + "40"
26. 若将代码中的 min(dp[i-1], dp[i-2]) + cost[i-1] 修改为 dp[i-1]+cost[i-2]，输入cost 数组为 {5，10，15} 时，程序的输出为（#h(2.6em)）。
  + "10"
  + "15"
  + "20"
  + "25"
#heading(level: 2)[]

1  #"#" include  #(sym.lt)iostream#(sym.gt)

2  #"#" include  #(sym.lt)cmath#(sym.gt)

3  using namespace  std;

5  int  customFunction(int  a,  int  b) {

6        if  (b  == 0) {

7              return  a;

8        }

9        return  a  +  customFunction(a,  b  - 1);

10  }

12  int  main（#h(2.6em)） {

13        int  x,  y;

14        cin  #(sym.gt)#(sym.gt)  x  #(sym.gt)#(sym.gt)  y;

15        int  result  =  customFunction(x,  y);

16        cout  #(sym.lt)#(sym.lt)  pow(result, 2) #(sym.lt)#(sym.lt)endl;

17        return  0;

18  }

假设输入的 n 是绝对值不超过 1000 的整数，完成下面的判断题和单选题。

#grouplabel[判断题]

27. 当输入为 "2 3" 时，customFunction(2, 3) 的返回值为 "64" （#h(2.6em)）
28. 当 b 为负数时，customFunction(a, b) 会陷入无限递归。（#h(2.6em)）
29. 当 b 的值越大，程序的运行时间越长。（#h(2.6em)）
#grouplabel[单选题]

30. 当输入为 "5 4" 时，customFunction(5, 4) 的返回值为（#h(2.6em)）
  + 5
  + 25
  + 250
  + 625
31. 如果输入 x=3 和 y=3，则程序的最终输出为（#h(2.6em)）
  + "27"
  + "81"
  + "144"
  + "256"
32. （4 分）若将 customFunction 函数改为 return a + customFunction(a-1, b-1)，并输入 "3 3"，则程序的最终输出为 （#h(2.6em)）
  + 9
  + 16
  + 25
  + 36
= 完善程序 ( 单选题，每小题 3 分，共计 30 分)

#heading(level: 2)[]

(判断平方数) 问题：给定一个正整数 n，判断这个数是不是完全平方数，即存在一

个正整数 x 使得 x 的平方等于 n 。

试补全程序。

1  #"#" include  #(sym.lt)iostream#(sym.gt)

2  #"#" include  #(sym.lt)vector#(sym.gt)

3  using namespace  std;

5  bool  isSquare(int  num){

6     int  i=  ¬   ;

7     int  bound  =  ­   ;

8     for(;i#(sym.lt)=bound;++i){

9        if(  ®   ){

10           return   ¯   ;

11        }

12     }

13     return   °   ;

14  }

15  int  main（#h(2.6em)）{

16     int  n;

17     cin#(sym.gt)#(sym.gt)n;

18     if(isSquare(n)){

19        cout#(sym.lt)#(sym.lt)n#(sym.lt)#(sym.lt)" is a Square number"#(sym.lt)#(sym.lt)endl;

20     }else{

21        cout#(sym.lt)#(sym.lt)n#(sym.lt)#(sym.lt)" is not a Square number"#(sym.lt)#(sym.lt)endl;

22     }

23  }

33. ¬处应填 （#h(2.6em)）
  + 1
  + 2
  + 3
  + 4
34. ­处应填 （#h(2.6em)）
  + `(int)floor(sqrt(num)-1)`
  + `(int)floor(sqrt(num))`
  + `floor(sqrt(num/2))-1`
  + `floor(sqrt(num/2))`
35. ®处应填 （#h(2.6em)）
  + num=2#"*" i
  + num==2#"*" i
  + num=i#"*" i
  + num==i#"*" i
36. ¯处应填 （#h(2.6em)）
  + !(num=2#"*" i)
  + num==2#"*" i
  + true
  + false
37. °处应填 （#h(2.6em)）
  + num = i #"*"  i
  + num != i #"*"  i
  + true
  + false
#heading(level: 2)[]

(汉诺塔问题) 给定三根柱子，分别标记为 A、B 和 C。初始状态下，柱子 A 上有若

干个圆盘，这些圆盘从上到下按从小到大的顺序排列。任务是将这些圆盘全部移到柱子

c 上，且必须保持原有顺序不变。在移动过程中，需要遵守以不规则：

#h(0pt) 1. 只能从一根柱子的顶部取出圆盘，并将其放入另一根柱子的顶部。

#h(0pt) 2. 每次只能移动一个圆盘

#h(0pt) 3. 小圆盘必须始终在大圆盘之上。试补全程序。1  #"#" include  #(sym.lt)bits/stdc++.h#(sym.gt)2  using namespace  std;

4  void  move(char  src,char  tgt){

5     cout#(sym.lt)#(sym.lt)"从柱子"#(sym.lt)#(sym.lt)src#(sym.lt)#(sym.lt)"挪到柱子上"#(sym.lt)#(sym.lt)tgt#(sym.lt)#(sym.lt)end;

6  }

8  void  dfs(int  i,char  src,char  tmp,char  tgt){

9     if(i==  ¬  ){

10        move(  ­   );

11        return  ;

12     }

13     dfs(i-1,   ®   );

14     move(src,tgt);

15     dfs(  °   ,     ¯  );

16  }

18  int  main（#h(2.6em)）{

19     int  n;

20     cin#(sym.gt)#(sym.gt)n;

21     dfs(n,'A','B','C');

22  }

38. ¬处应填 （#h(2.6em)）
  + 0
  + 1
  + 2
  + 3
39. ­处应填 （#h(2.6em)）
  + src, tmp
  + src, tgt
  + tmp, tgt
  + tgt, tmp
40. ®处应填 （#h(2.6em)）
  + src, tmp, tgt
  + src, tgt, tmp
  + tgt, tmp, src
  + tgt, src, tmp
41. ¯处应填 （#h(2.6em)）
  + src, tmp, tgt
  + tmp, src, tgt
  + src, tgt, tmp
  + tgt, src, tmp
42. °处应填 （#h(2.6em)）
  + 0
  + 1
  + i − 1
  + i

#pagebreak()

= 答案与解析

=== 第 1 题　答案：C

答案取自 2024J1 解析（Knowledge）

=== 第 2 题　答案：A

答案取自 2024J1 解析（Knowledge）

=== 第 3 题　答案：B

答案取自 2024J1 解析（Knowledge）

=== 第 4 题　答案：D

答案取自 2024J1 解析（Knowledge）

=== 第 5 题　答案：D

答案取自 2024J1 解析（Knowledge）

=== 第 6 题　答案：C

答案取自 2024J1 解析（Knowledge）

=== 第 7 题　答案：D

答案取自 2024J1 解析（Knowledge）

=== 第 8 题　答案：B

答案取自 2024J1 解析（Knowledge）

=== 第 9 题　答案：B

答案取自 2024J1 解析（Knowledge）

=== 第 10 题　答案：A

答案取自 2024J1 解析（Knowledge）

=== 第 11 题　答案：B

答案取自 2024J1 解析（Knowledge）

=== 第 12 题　答案：A

答案取自 2024J1 解析（Knowledge）

=== 第 13 题　答案：D

答案取自 2024J1 解析（Knowledge）

=== 第 14 题　答案：A

答案取自 2024J1 解析（Knowledge）

=== 第 15 题　答案：B

答案取自 2024J1 解析（Knowledge）

=== 第 16 题　答案：正确

答案取自 2024J1 解析（Knowledge）

=== 第 17 题　答案：错误

答案取自 2024J1 解析（Knowledge）

=== 第 18 题　答案：正确

答案取自 2024J1 解析（Knowledge）

=== 第 19 题　答案：B

答案取自 2024J1 解析（Knowledge）

=== 第 20 题　答案：A

答案取自 2024J1 解析（Knowledge）

=== 第 21 题　答案：正确

答案取自 2024J1 解析（Knowledge）

=== 第 22 题　答案：错误

答案取自 2024J1 解析（Knowledge）

=== 第 23 题　答案：错误

答案取自 2024J1 解析（Knowledge）

=== 第 24 题　答案：A

答案取自 2024J1 解析（Knowledge）

=== 第 25 题　答案：B

答案取自 2024J1 解析（Knowledge）

=== 第 26 题　答案：A

答案取自 2024J1 解析（Knowledge）

=== 第 27 题　答案：错误

答案取自 2024J1 解析（Knowledge）

=== 第 28 题　答案：正确

答案取自 2024J1 解析（Knowledge）

=== 第 29 题　答案：正确

答案取自 2024J1 解析（Knowledge）

=== 第 30 题　答案：B

答案取自 2024J1 解析（Knowledge）

=== 第 31 题　答案：C

答案取自 2024J1 解析（Knowledge）

=== 第 32 题　答案：D

答案取自 2024J1 解析（Knowledge）

=== 第 33 题　答案：A

答案取自 2024J1 解析（Knowledge）

=== 第 34 题　答案：B

答案取自 2024J1 解析（Knowledge）

=== 第 35 题　答案：D

答案取自 2024J1 解析（Knowledge）

=== 第 36 题　答案：C

答案取自 2024J1 解析（Knowledge）

=== 第 37 题　答案：D

答案取自 2024J1 解析（Knowledge）

=== 第 38 题　答案：B

答案取自 2024J1 解析（Knowledge）

=== 第 39 题　答案：B

答案取自 2024J1 解析（Knowledge）

=== 第 40 题　答案：B

答案取自 2024J1 解析（Knowledge）

=== 第 41 题　答案：B

答案取自 2024J1 解析（Knowledge）

=== 第 42 题　答案：C

答案取自 2024J1 解析（Knowledge）

