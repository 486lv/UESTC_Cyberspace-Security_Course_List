---
title: 信息安全数学基础实验
date: 2025-10-22 19:29:30
categories:
- 专业课程
tags:
- 信息安全
- 数学基础
- Linux
- Vim
- Shell
toc_number: true
toc: true
cover: /images/xinxianquanshuxuejichu.png
---




---


# Linux 环境配置

Vmware 配置 linux 环境：
[搭建一套属于自己的Linux环境（手把手保姆级教程）本文准备从0开始，一步步搭建一套属于自己的Linux系统环境，这将是 - 掘金](https://juejin.cn/post/6844904147670532109)

Wsl 配置：
[Windows Subsystem for Linux (WSL, Ubuntu) 最新安装教程（2025.10 更新）-CSDN博客](https://blog.csdn.net/wangtcCSDN/article/details/137950545)


C/C++代码运行
```Plain
gcc/g++ -o hello hello.c  // 编译
./hello               // 运行
```

# Vim 常用
![](/images/Pasted%20image%2020251029102716.png)

**三种操作模式**
普通模式：“ESC”切换，用于移动光标，复制粘贴，查找替换等
插入模式：普通模式下 i或 a切换，用于文字编辑
命令模式：普通模式下：切换，用于执行命令

以下是普通模式常用的几个命令：

- **i -- 切换到输入模式，在光标当前位置前开始输入文本。**
- **x -- 删除当前光标所在处的字符。**
- **: -- 切换到命令模式，以在最底一行输入命令。**
- **a -- 进入插入模式，在光标下一个位置开始输入文本。**
- **o：在当前行的下方插入一个新行，并进入插入模式。**
- O -- 在当前行的上方插入一个新行，并进入插入模式。
- **dd -- 剪切（删除）当前行。**
- yy -- 复制当前行。
- p（小写） -- 粘贴剪贴板内容到光标下方。
- P（大写）-- 粘贴剪贴板内容到光标上方。
- u -- 撤销上一次操作。
- Ctrl + r -- 重做上一次撤销的操作。
- :w -- 保存文件。
- :q -- 退出 Vim 编辑器。
- :q! -- 强制退出Vim 编辑器，不保存修改。

# shell常用
- 举例
无参数指令示例：date
![](/images/Pasted%20image%2020251221205635.png)
带参数指令示例：echo
**echo**：这个单词是“回声”的意思。它的功能是：**你给它什么，它就复读什么**，并打印在屏幕上。
![](/images/Pasted%20image%2020251221205704.png)


- 路径
/ 代表系统根目录
 . 表示当前目录， .. 表示上一级目录
```bash
cd /          # 去根目录 (绝对路径)
cd home       # 进入 home 目录 (相对路径)
cd ..         # 返回上一级 (回到根目录)
cd ~          # 一键回家 (回到用户主目录)
```
绝对路径：以 / 开头，相对路径是相对于当前工作目录（可以通过pwd显示）的路径
`cd /home/xiaoming/Downloads`
 相对路径：不以 `/` 开头，假设你现在已经在 `/home/xiaoming` 了。 你想去 `Downloads`，只需要输入：`cd Downloads`
 
 - 导航
 ls:
通过 ls 显示指定目录下的所有文件
`ls -l` 
`-h` 和 `--help`: 显示长列表格式
`ls --help`就是告诉你怎么使用ls这个指令

- 其他指令
`mv 移动文件/目录`:
**用法 A（搬家）**：把文件从 A 拿去 B。
- _命令_：`mv photo.jpg ./Photos/`
- _解释_：把 `photo.jpg` 搬进 `Photos` 文件夹里。
**用法 B（改名）**：原地移动 = 改名。
- _命令_：`mv old.txt new.txt`
- _解释_：把 `old.txt` 这个名字改成 `new.txt`


`cp 拷贝文件` ... `拷贝目录须增加 -r 参数`:
- **普通拷贝**：
    - _命令_：`cp homework.c homework_backup.c`
    - _解释_：复制一份作业备份，现在你有两个一模一样的文件。
- **文件夹拷贝**：
    - 如果你直接 `cp MyFolder MyFolder2`，电脑会报错！它会说“这是一个目录，我搬不动”。
    - **必须加 `-r`**（Recursive，递归）：意思是一层层往下拷贝。
    - _正确命令_：`cp -r MyFolder MyFolder2`。

`mkdir 创建文件夹`
`mkdir LoveLetter`（创建了一个叫 LoveLetter 的空文件夹）

`man` (Manual 说明书)
输入 `man ls`。电脑会进入一个专门的阅读界面，给你展示 `ls` 命令的详细说明书，按 `q` 退出。

- 重定向
< file 和 > file 将程序的输入和输出重定向到文件(流)
`>` 会**覆盖**原文件。如果想追加，要用 `>>`
```bash
$ echo hello > hello.txt # 
$ cat hello.txt
hello
$ cat < hello.txt
hello
$ cat < hello.txt > hello2.txt 
$ cat hello2.txt
hello
```


- 编译和运行
编译：g++ -o hello hello.c
 -o：指定产生可执行文件文件名
运行：./hello

- makefile
**TARGET**：规则生成目标文件
• 通常是需要生成的程序名或过程文件
**PREREQUISITE**：规则依赖项
• 通常是依赖的源程序文件
**COMMAND**：规则所需执行的命令行
• 通常是编译命令，每一行命令以TAB字符开头
• 只有PREREQUISITE更新时间晚于TARGET，COMMAND才能执行







# 快速幂


现在存在这么一个问题：
{% note primary modern %}对于 $a^e$，当e很大时，计算 $a$ 的 $n$ 次方表示将 $n$ 个 $a$ 乘在一起 $:a^n=\underbrace{a\times a\cdotp\cdotp\cdotp\times a}_{\text{n个a相乘}}$。然而当 $a,n$ 太大的时侯，这种方法就不太可行。如何更快更有效的解决这种计算呢？{% endnote %}

举个例子：对于$3^{12}$，我们知道：$a^{b+c}=a^b\cdot a^c$, $a^{2b}=a^b\cdot a^b=(a^b)^2$。如果我们知道$3^6$，两个$3^6$相乘$3^6*3^6=3^{12}$，是不是就可以更好的计算出幂。
> 二进制取幂的想法是，我们将取幂的任务按照指数的 二进制表示来**分割成更小的任务**。

所以有如下的方法：
对于$7^{256} \mod 13 = ?$
分拆指数：$256 = 2^8$
分治计算：
- $7^1 \mod 13 = 7$
- $7^2 \mod 13 = [(7^1 \mod 13) * (7^1 \mod 13)] \mod 13 = 10$
- $7^4 \mod 13 = 9, 7^8 \mod 13 = 3, ...$
- $7^{256} \mod 13 = [(7^{128} \mod 13) * (7^{128} \mod 13)] \mod 13 = 9$
归并：$7^{256} \mod 13 = 9$

但是现在又出现一个问题：
{% note primary modern %}分拆规则？怎么去拆分$e${% endnote %}
以**二进制**方式分拆指数：
$e= d_{n- 1}* 2^{n- 1}+ ... + d_1* 2+ d_0= D_{n- 1}+ ... + D_1+ D_0$
$a^{e}=a^{D_{n-1}}*a^{D_{n-2}}*...*a^{D_{1}}*a^{D_{0}}$

举个例子：$3^{13}=3^{(1101)_2}=3^8*3^4*3^1$
如果把$n$写作二进制为$(n_tn_{t-1}\cdotp\cdotp\cdotp n_1n_0)_2$,那么有：
$$n=n_t2^t+n_{t-1}2^{t-1}+n_{t-2}2^{t-2}+\cdotp\cdotp\cdotp+n_12^1+n_02^0$$
其中$n_i\in\{0,1\}$。那么就有
$$\begin{aligned}a^{n}&=(a^{n_t2^t+\cdots+n_02^0})\\&=a^{n_02^0}\times a^{n_12^1}\times\cdots\times a^{n_t2^t}\end{aligned}$$

根据上式我们发现，原问题被我们转化成了形式相同的子问题的乘积，并且我们可以在常数时间内从$2^i$项推出$2^{i+1}$项。这个算法的复杂度是$\Theta(\log n)$的，我们计算了$\Theta(\log n)$个$2^k$次幂的数，然后花费$\Theta(\log n)$的时间选择二进制为 1 对应的幂来相乘。
{% note success modern %}代码实现{% endnote %}
问题：给定三个整数 a,b,p, 求 $a^b\mathrm{~mod~}p$ 
[P1226 【模板】快速幂 - 洛谷](https://www.luogu.com.cn/problem/P1226)
1. 递归实现（过不了，因为递归比较影响时间）
核心想法：
假设有：$3^{10}mod 7$，我们利用分治的思想进行递归计算。
![](/images/Pasted%20image%2020251023104832.png)
```c++
#include <iostream>
#include <cmath>
using namespace std;
long long a, b, p;
//求a^b mod p
long long mod_pow(long long a, long long b, long long p)
{
	//返回条件
	if (b == 0) return 1;
	long long r=mod_pow(a,b/2,p);
	if (b % 2) {
		r = r * r * a %p;
	}
	else {
		r = r * r%p;
	}
	return r;
}

int main()
{
	cin >> a >> b >> p;
	long long result;
	result = mod_pow(a, b, p);
	cout << a << "^" << b << " mod " << p << "=" << result;
	return 0;
}
```

2. 累加实现
还是之前的例子：

| 步骤  | b (二进制) | b & 1 | res (计算过程)        | a (自增前\*res的值) |
| --- | ------- | ----- | ----------------- | -------------- |
| 初始  | 1010    | -     | 1                 | 3              |
| 1   | 1010    | 0     | res               | $3^1$  mod 7   |
| 2   | 101     | 1     | $res*1*3^2$ mod 7 | $3^2$ mod 7    |
| 3   | 10      | 0     | res               | $3^4$ mod 7    |
| 4   | 1       | 1     | $res*1*3^8$ mod 7 | $3^8$ mod 7    |
![](/images/Pasted%20image%2020251023111929.png)
	这个思路就是看b的2进制为是不是1！比上面的递归好理解。
```c++
#include <iostream>
#include <cmath>
using namespace std;
long long a, b, p;
//求a^b mod p
long long pow_mod(long long a, long long b, long long p) {
	long long res = 1;
	//看a^1,a^2,a^4,a^8....
	while (b > 0) {
		if (b & 1) res = res * a % p;
		a = a * a % p;
		b >>= 1;
	}
	return res;
}

int main()
{
	cin >> a >> b >> p;
	long long result;
	result = pow_mod(a, b, p);
	cout << a << "^" << b << " mod " << p << "=" << result;
	return 0;
}
```

---
# 素性测试

{% note primary modern %}问题：给你一个自然数n，判定n是否为素数{% endnote %}

## 筛选法
### 初步想法
我们知道素数的定义是：如果n (n > 1) 是素数，当且仅当n只有因子1和它本身。
所以根据定义我们就能知道最基本的判断方法：
> 判断n是否被i整除（i = 2, 3,…, n-1)

复杂度：$O(n)$
{% note primary modern %}如何减少判断次数{% endnote %}

我们假设有合数n，那么它可以写成，其中i,j都是大于1的整数，且都是n的因子。
至少有一个因子小于等于$\sqrt{n}$：反证法证明，假设i，j都大于$\sqrt{n}$，那么$i*j>\sqrt{n}*\sqrt{n}=n$这与$n=i*j$矛盾。
> 所以我们只需要检查这个2~$\sqrt{n}$的整数

如果都没有整除n的那么n一定是质数。这是因为任何大于 n 的因子 都会对应一个小于的因子，如果这个小的因子不存在，那么大的因子也不存在。
复杂度：$O(\sqrt n)$


{% note primary modern %}我们之前都是顺序去排除，有没有更高效的办法？{% endnote %}

### 三种筛选方法 

#### 朴素筛

![](/images/Pasted%20image%2020251023163304.png)
 
 > 朴素筛就是从2开始一直到n，删去所有的倍数，留下的数就是质数。
 
 
过程：从2开始，删去2的倍数；从3开始，删去3的倍数；从4开始删去4的倍数。
{% note success modern %}代码实现{% endnote %}
```c++
#include <iostream>
using namespace std;
const int N = 1000010;

int primes[N] = { 0 }, cnt = 0;//存质数，与判断无关只是为了展示
bool st[N];//核心筛
int n;
bool is_primes(int n)
{
	if (n <=1) return false;
	for (int i = 2; i <= n; i++)
	{
		if (!st[i]) primes[cnt++] = i;//存储质数

		for (int j = i + i; j <= n; j += i)
		{
			st[j] = 1;
		}
	}
	return !st[n];
}
int main()
{

	cin >> n;
	cout<<is_primes(n);
	return 0;
}
```

#### 埃氏筛
{% note primary modern %}我们从上面的过程来看，我们发现筛去2的倍数后，后面筛去4,6,8等的倍数，出现了重复，如何解决？{% endnote %}

> 我们发现，只需要筛去质数2,3,5,7...的倍数，就可以达到筛出所以质数的目的。

{% note primary modern %}为什么可以这样呢？{% endnote %}


**算术基本定理**：
![](/images/Pasted%20image%2020251023165231.png)

证明：
存在性：
反证法：假设存在大于 1的自然数不能写成素数的乘积，把最小的那个称为 n。
n一定为合数，但每个合数都可以分解成两个严格小于自身而大于 1 的自然数的积。设$n=a*b$，则根据假设，n是最小的不能被写成素数乘积的自然数，$a=p_1p_2..p_i$，$b=q_1q_2..q_i$，都能被写成素数的乘积，而$n=ab=p_1p_2..p_iq_1q_2..q_i$，也可以写成素数的乘积，由此产生矛盾

唯一性：
欧几里得引理：若素数 $p \mid  {ab}$ ,则不是 $p \mid  a$ ,就是 $p \mid  b$ 。
首先 $n$ 不是质数。将 $n$ 用两种方法写出： $n = {p}_{1}{p}_{2}{p}_{3}\cdots {p}_{r} = {q}_{1}{q}_{2}{q}_{3}\cdots {q}_{s}$ 。根据引理,质数 ${p}_{1} \mid  {q}_{1}{q}_{2}{q}_{3}\cdots {q}_{s}$ ,所以${q}_{1},{q}_{2},{q}_{3}\cdots {q}_{s}$ 中有一个能被 ${p}_{1}$ 整除,不妨设为 ${q}_{1}$ 。但 ${q}_{1}$ 也是质数,因此 ${q}_{1} = {p}_{1}$ 。所以,比 $n$ 小的正整数 ${n}^{\prime } = {p}_{2}{p}_{3}\cdots {p}_{r}$ 也可以写成 ${q}_{2}{q}_{3}\cdots {q}_{s}$ 。这与 $n$ 的最小性矛盾！因此唯一性得证。


所以：任何一个合数n都可以分解为质因数的乘积，其中一定有一个最小的质因数（记为 p）。因此，**只需要筛去质数的倍数，就能覆盖所有合数**。剩下的未标记的数就是质数。


{% note success modern %}代码实现{% endnote %}
```c++
#include <iostream>
using namespace std;
const int N = 1000010;

int primes[N] = { 0 }, cnt = 0;//存质数，与判断无关只是为了展示
bool st[N];//核心筛
int n;
bool is_primes(int n)
{
	if (n <=1) return false;
	for (int i = 2; i <= sqrt(n); i++) {
	//如果是1,意味着是合数跳过；如果是质数，然后就循环上述朴素筛
		if (!st[i])
		{
			primes[cnt++] = i;
			for (int j = i + i; j <= n; j += i)
			{
				st[j] = 1;
			}
		}
	}
	return !st[n];

}
int main()
{
	cin >> n;
	cout<<is_primes(n);
	return 0;
}
```


#### 欧拉筛



> 关键在于，每个合数恰好会**被它的最小质因子筛一次**。


![](/images/Pasted%20image%2020251023210842.png)

1. Primes 中存的质数，是升序排列的。

2. 所以当第一个质数能整除 i 时，它便是 i 的一个质因子，而且是最小的一个质因子。（e.g.3\*7，3 一一定是 3\*7 的最小质因子）

3. 所以当第一次 i % primes\[j] == 0 时，primes\[j]是 i 的最小质因子，那么 primes\[j]\*i 的最小质因子一定是 primes\[j]。

4. Primes\[j+1]\*i 的时候，当 i % primes\[j] == 0，primes\[j+1]\*i 的最小质因子不再是 primes\[j+1]，而是 primes\[j]，此时 primes\[j+1]\*i%primes\[j]也一定为 0；不满足我们要说的每个合数恰好会被它的最小质因子筛一次。（举个例子：i=4，prime\[0]=2，prime\[1]=3，因为 4%2=0，也就是 2|4（2 整除以 4），所以对于 4\*2 它的最小质因子一定是 2，对于之后的 4\*3，它的最小质因子不是 3，而是 4 的最小质因子，也就是 2）

![](/images/860e94cba8dbd01f6d5cf757d59d57b2%201.png)

{% note success modern %}代码实现{% endnote %}
```c++
#include <iostream>
using namespace std;
const int N = 1000010;

int primes[N] = { 0 }, cnt = 0;
bool st[N];

bool is_primes(int n)
{
	if (n <=1) return false;
	for (int i = 2; i <= n; i++)
	{
		if (!st[i]) primes[cnt++] = i;
		for (int j = 0; primes[j] <= n / i; j++)//primes[j]*i <= n的时候，意味着筛到n就可以截止了
		{
			st[primes[j] * i] = 1;
			if (i % primes[j] == 0)  break;//之后的最小质因子都是primes[j]，不需要再继续往下筛
		}
	}
	return !st[n];
}

int main()
{
	int n;
	cin >> n;
	cout<<is_primes(n);
	return 0;
}
```

## 威尔逊定理

在初等数论中，威尔逊定理给出了判定一个自然数是否为质数的充分必要条件。即：当且仅当 $p$ 为质数时：
{% note modern %}
$$(p-1)! \equiv -1 \ (\mathrm{mod} \ p)$$
{%endnote%}
证明详见：[威尔逊定理 - 维基百科，自由的百科全书](https://zh.wikipedia.org/wiki/%E5%A8%81%E5%B0%94%E9%80%8A%E5%AE%9A%E7%90%86)

我这里给出一个很有意思的定理**想法来源**（不是标准的证明过程，算是必要性的说明）：

我们知道著名的**欧拉定理**（数论中）：
{% note modern %}
设 $m$ 是正整数，如果 $(r,m) = 1$，则：
$$r^{\phi(m)} \equiv 1 \pmod{m}$$
其中 $\phi(m)$ 为欧拉函数，表示小于或等于 $m$ 的正整数中与 $m$ 互质（即最大公约数为 1）的数的个数。
**欧拉函数的求法**：如果 $m$ 有素数分解 $m = p_1^{k_1} p_2^{k_2} \ldots p_l^{k_l}$，则：
$$\phi(m) = m \left(1 - \frac{1}{p_1}\right) \left(1 - \frac{1}{p_2}\right) \ldots \left(1 - \frac{1}{p_l}\right)$$
{%endnote%}

例如：$\phi(6) = \phi(2 \times 3) = 6 \times (1 - 1/2) \times (1 - 1/3) = 2$

所以当 $m$ 为素数时，$\phi(m) = m-1$，便可以推导出 $r^{m-1} \equiv 1 \pmod{p}$ ，也就是**费马小定理**。

有**素数模同余式**如下：
{% note modern %}
$f\left( x\right)  = {a}_{n}{x}^{n} + {a}_{n - 1}{x}^{n - 1} + \cdots  + {a}_{1}x + {a}_{0} \equiv  0\left( {\;\operatorname{mod}\;p}\right)$，$p$ 是素数, ${a}_{n} \neq  0\left( {\;\operatorname{mod}\;p}\right)$
{%endnote%}
对于素数模同余式有如下**定理** ：
{% note modern %}
设 $x = \beta_i \pmod{p}$ $(i = 1,2,\ldots,k, k \leq n)$ 是素数模同余式的 $k$ 个不同解，则 

$$f(x) \equiv (x - \beta_1)(x - \beta_2) \ldots (x - \beta_k) f_k(x) \pmod{p} \tag{1}$$

其中 $\deg(f_k(x)) = n - k$，$f_k(x)$ 首项系数为 $a_n$。
{%endnote%}

对于素数 $p$，考虑多项式：$f(x) = x^{p-1} - 1$，次数为 $p-1$，根据费马小定理有：$x^{p-1} - 1 \equiv 0 \pmod{p}$，所以 $x$ 的解也有 $p-1$ 个，根据定理 (1)，有如下成立：

$$x^{p-1} - 1 \equiv (x - 1)(x - 2) \ldots (x - (p - 1)) \pmod{p} \tag{2}$$
令 x=0 时：
$$
-1 \equiv (-1)(-2)..(-(p-1)) \equiv (-1)^{p-1}(p-1)! \pmod{p}  \tag{3}

$$

若 p 为奇素数（p>2），则 p-1 为偶数，$(-1)^{p-1}=1$，有：$(p-1)! \equiv -1 \ (\mathrm{mod} \ p)$
P=2，带入：$1\equiv -1 (mod 2)$，成立。

而对于充分性：若 p 不是质数，那么正因数一定在 2,3,4,.. P-1 中，因此 $gcd((p-1)!,p)>1$，所以不可能成立。

## Miller-Rabin算法
{% note primary modern %}虽然这个公式在理论上很完美，但是阶乘计算太过复杂，所以我们想有没有更好的办法？{%endnote%}
我们再回顾以下**费马小定理**：
{% note modern %}
对任意素数p和与其互质的整数 a，${a}^{p - 1} \equiv  1 \pmod{p}$
{%endnote%}

这个定理是否可以反过来使用？答案是否定的，因为存在很多无法筛去的数，例如卡迈克尔数：即便遍历\[2~p-1] 的每一个数字作为底数，也无法筛去。比如：561。

所以我们考虑引入新的定理来提高检测的正确性。
{% note modern %}
**二次探测定理**： 对于质数 $p$ ,若 ${x}^{2} \equiv  1 \pmod{p}$ ,则小于 $p$ 的解只有两个, ${x}_{1} = 1,{x}_{2} = p - 1$
{%endnote%}
  
{% folding 证明 %}  
${x}^{2} - 1 \equiv  0\left( {\;\operatorname{mod}\;p}\right)  - \left( {x + 1}\right) \left( {x - 1}\right)  \equiv  0\left( {\;\operatorname{mod}\;p}\right)$ 。故 $p \mid  \left( {x + 1}\right) \left( {x - 1}\right)$ ,又因为 $p$ 是质数, 故要么 $\left( {x + 1}\right) \left( {x - 1}\right)  = 0$ ,要么 $\left( {x + 1}\right) \left( {x - 1}\right)$ 是 $p$ 的倍数, 可得唯二解。
{% endfolding %}

由费马检测得到 ${a}^{p - 1} \equiv  1\left( {mod\;p}\right)$ ,且 $p - 1$ 为偶数 (否则 $p$ 为偶数直接特判筛掉), 则 ${a}^{p - 1}$ 就相当于 ${x}^{2}$ 。将其拆分为 ${\left( {a}^{\frac{p - 1}{2}}\right) }^{2} \equiv  1$ ,就可以用二次检测定理来判断了。如果 ${a}^{\frac{p - 1}{2}}$ 在 ${mod}\;p$ 情况下的解不是 1 或者 $p - 1$ ,那 $p$ 就不是素数。如果 ${a}^{\frac{p - 1}{2}} \equiv  1\left( {mod\;p}\right)$ ,那可以模仿之前的操作, 再进行一轮检验, 变成判断 ${a}^{\frac{p - 1}{4}}$ ,直到最后变成奇数。

而素数还有一个性质：
{% note modern %}
任意除 2 外的素数 n，可以表示为 $n=q*2^k+1$，$k>=0$, q 为奇数。
{%endnote%}

所以我们令费马检测中的 p-1 写为 $p-1=q*2^t$，再利用二次检测对 $a^u,a^{u*2},a^{u*2^2}...,a^{p-1}$ 进行检验。我们思考一下这一列数应该是什么样的情况：
根据二次探测，也就是说对于 $a^{u*2^i} \equiv 1$，那么 $a^{u*2^{i-1}} \equiv 1$ 或 $a^{u*2^{i-1}} \equiv p-1$（也可以表述为 $a^{u*2^{i-1}} \equiv -1$）, 所以如果第一项 $a^u \equiv 1$ 或 $a^u \equiv -1$ ，那么后续平方之后 $a^{p-1}$ 也应该是 1，所以说明底数 a无法检测，要换一个底数 a；如果 $a^{q*2^i}$ 等于其他数，那么就继续向下求，直到遇到 1 或者-1。如果遇到 1，说明检测到了这个数不是质数，因为假设 $a^{q*2^i}=x(x \ne  1\ or \ x \ne -1)$ ，而 $a^{q*2^{i+1}}=1$ ，根据二次探测，**显然 p 不是质数**！但如果 $a^{q*2^{i+1}}=-1$，那么它之后就一定都是 1，我们也无法判断！

所以我们做出如下总结：
{% note modern %}
 $n=2^kq+1$ (k>0,q为奇数) 是大于 2 的素数，a 是大于 1 且小于等于 n-1 的整数，如下两个条件之一成立：
1. $a^q$ mod $n=1$
2. 存在 $1\leq i\leq k$ ,满足 $a^{2^{i- 1}q}  =n-1 \pmod{n}$
{%endnote%}

判断过程：
1. 确定 k，q
2. 随机选择底数 a，满足，a >1 且 a<=n-1
3. 如果满足 $a^q mod n =1$，换底数 a，再次检测（不确定的情况）。
4. 如果存在 $a^{2^{i- 1}q}  =n-1 \pmod{n}$，换底数 a，再次检测（不确定的情况）。
5. 其他情况都是“合数”。
通过Miller-Rabin素性测试的数不一定是素数；**无法通过MillerRabin素性测试的数一定不是素数**。


{% note success modern %}代码实现{% endnote %}
```c++
#include <iostream>
#include <numeric>

#include <algorithm> // 某些编译器中的gcd
using namespace std;
#define int long long
int a_default[7]= { 2,325,9375,28178,450775,9780504,1795265022 };//好用的底数
int pow_mod(int a, int b, int p) {
    int res = 1;
    while (b > 0) {
        if (b & 1) res = res * a % p;
        a = a * a % p;
        b >>= 1;
    }
    return res;
}
bool millerRabin(int n, bool is_default_a=1,int repeat=1) {
    if (n < 3 || n % 2 == 0) return n == 2;
    if (n % 3 == 0) return n == 3;
    //求q，k
    int q = n - 1, k = 0;
    while (q%2==0) {
        q /= 2;
        k++;
    }
    if (is_default_a) {
        for (int i = 0; i < 7; i++) {
            int a = a_default[i];
            int v = pow_mod(a, q, n);//a^q,(a^a)^2...
            if (v == 1) continue;
            int j;
            for (j = 0; j < k; j++) {
                if (v == n - 1) break;//等于-1情况
                v = v * v % n;
            }
            if (j == k) return 0;//合数
        }
    }51
    else {
        while (repeat--) {
            int a = rand() % (n - 3) + 2;
            int v = pow_mod(a, q, n);//a^q,(a^a)^2...
            if (v == 1) continue;
            int j;
            for (j = 0; j < k; j++) {
                if (v == n - 1) break;//等于-1情况
                v = v * v % n;
            }
            if (j == k) return 0;//合数
        }
    }
    return 1;
}
string miller_rabin_test(int n, bool is_default_a = 1, int repeat = 1) {
    if (millerRabin(n, is_default_a,repeat)) return "uncertain";
    else return "not_prime";
}
signed main()
{
    srand(time(0));
    /*int n; cin >> n;*/
    for (int i = 1; i <= 200; i++)
        if (miller_rabin_test(i, 1) == "uncertain") cout << i << " ";

    return 0;
}
```


---


# 求逆元

{% note primary modern %}定义：对于整数 a 和 m，如果存在整数 b，满足 a\*b mod m=1, 则称b为a关于模m的乘法逆元，记为 $a^{-1}$。已知a和m，求解 $a^{-1}$
{%endnote%}

存在逆元的充要条件：$gcd(a, m) = 1$
{% folding 证明 %}  
a与m互素,则存在整数k1，k2,满足 $k_1*a+k_2*m=1$ 
等式两边同取 modm：$k_1*a=1 \pmod{m}$，即k $_1$ 是a关于模m的乘法逆元。
{%endfolding%}


如何求解： $k_1*a+k_2*m=1$ ，求解 $k_1$，利用扩展欧几里得算法。
{% note modern %}
**欧几里得算法辗转相除**：
给定两个整数 $a$ 和 $b$（假设 $a \geq b > 0$），辗转相除法通过重复除法计算 $\gcd(a, b)$：
$$a = b \cdot q_1 + r_1, \quad 0 \leq r_1 < b,$$
$$
b = r_1 \cdot q_2 + r_2, \quad 0 \leq r_2 < r_1,$$
$$r_1 = r_2 \cdot q_3 + r_3, \quad 0 \leq r_3 < r_2,$$
$$
\vdots$$
$$r_{n-2} = r_{n-1} \cdot q_n + r_n, \quad 0 \leq r_n < r_{n-1},$$
$$
r_{n-1} = r_n \cdot q_{n+1} + 0.$$
当余数 $r_n = 0$ 时，$\gcd(a, b) = r_{n-1}$。该算法基于恒等式：
$$\gcd(a, b) = \gcd(b, r_1) = \gcd(r_1, r_2) = \cdots = \gcd(r_{n-1}, 0) = r_{n-1}.$$

{%endnote%}
{% note success modern %}代码实现{% endnote %}
```c++
//计算两个数的最大公约数
int gcd(int a, int b) {
    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}
```
{% note modern %}

**扩展欧几里得算法**：
问题：求 $ax + by = \gcd(a, b)$ 的一组整数解
扩展欧几里得算法
当 $b = 0$ 时 $ax + by = a$ 故而 $x = 1, y = 0$
当 $b \neq 0$ 时
由欧几里得算法，$\gcd(a, b) = \gcd(b, a\%b)$
由裴蜀定理，
$$\gcd(a, b) = ax + by$$
$$
\gcd(b, a\%b) = bx_1 + (a\%b)y_1$$
$$= bx_1 + (a - \left\lfloor \frac{a}{b} \right\rfloor \times b)y_1$$
$$
= ay_1 + b(x_1 - \frac{a}{b}y_1)$$
所以 $x = y_1, \ y = x_1 - \frac{a}{b}y_1$
可以用递归算法，先求出下一层的 $x_1, y_1$,
再回代到上一层，层层回代，可求特解 $(x_0, y_0)$
构造通解
$$\begin{cases} x = x_0 + \frac{b}{\gcd(a, b)} \times k \\ y = y_0 - \frac{a}{\gcd(a, b)} \times k \end{cases}$$


| 欧几里德除法步骤                      | 余数递推式                          | 线性组合（$r = k_1a + k_2m$）                                |
| :---------------------------- | :----------------------------- | :----------------------------------------------------- |
| $a = q_1 \cdot m + r_1$       | -                              | $1 \cdot a + (-q_1) \cdot m = r_1$                     |
| $m = q_2 \cdot r_1 + r_2$     | $m + (-q_2) \cdot r_1 = r_2$   | $(-q_2) \cdot a + (1+q_1q_2) \cdot m = r_2$            |
| $r_1 = q_3 \cdot r_2 + r_3$   | $r_1 + (-q_3) \cdot r_2 = r_3$ | $(1+q_2q_3) \cdot a + (1-q_1-q_1q_2q_3) \cdot m = r_3$ |
| ...                           | ...                            | ...                                                    |
| $r_{n-1} = q_{n+1} \cdot r_n$ | ...                            | $k_1 \cdot a + k_2 \cdot m = r_n = 1$                  |
|                               |                                |                                                        |

{%endnote%}
{% note success modern %}代码实现{% endnote %}
```c++
// 扩展欧几里得算法
//ax+by=1
void exgcd(int a, int b, int& x, int& y)
{
    if (!b) {
        x = 1;
        y = 0;
    }
    else {
        exgcd(b, a % b, y, x);//类似于欧几里得的过程!可以手推一下
        y -= a / b * x;
    }
}
```

综上：**求逆元**：
{% note success modern %}代码实现{% endnote %}
```c++
int euclid_mod_reverse(int a, int m)
{
    int x = 0, y = 0;
    if (gcd(a, m) != 1) return -1;  
    exgcd(a, m, x, y);//a*x=1 mod m
    x = (x % m + m) % m;  // 确保结果在0到m-1之间
    return x;
}
```

 待更新...... 有一些更好的办法
 
---

# 伪随机数生成器

随机数具有随机性：均匀分布、难以重现
srand(s)：设置种子
rand()：基于种子产生伪随机数
性质：
•  伪随机性：与随机数不可区分
• 可重现：相同种子产生相同序列

因为种子相同会产生相同序列，所以利用time()：返回当前时间相对1970年1月1日0:00经过的秒数，产生不同的种子。（srand(time(NULL))）
其他时间函数：gettimeofday
安全性评价：
评价标准
• 全周期：{0, 1,…, m-1}中任意数都可能被生成
• 不可预测：无法基于 $X_0, X_1,…, X_{i-1}$ 推断 $X_i$
可证明安全性：可以将区分伪随机数和随机数规约为解决数学难题
## 线性同余 LCG

早期rand函数基于线性同余算法实现。
迭代式：$X_{i+1}=aX_{i}+c \pmod{m}$
参数：乘数：a，增量 c，模数 m，种子 $X_0$

安全性：不满足全周期，不具备可证明安全


{% note success modern %}代码实现{% endnote %}

```c++
#include <iostream>
using namespace std;
int s;
void lcg_srand(unsigned int seed)
{
	cout << "Seeding with " << seed << endl;
    s = seed;
}

unsigned int lcg_rand()
{
    unsigned int a = 1103515245, c = 12345, m = 2147483648;
    return s = (a * s + c) % m;
    //        return s=(1103515245*s+12345)%2147483648;
}

int main()
{
    lcg_srand(time(NULL));
    for (int i = 0; i < 10; i++)
    {
        cout << lcg_rand() << endl;
	}
    return 0;
}
```

# BBS

参数选择：
选择素数 $p,q$ ,满足: $p mod 4= q mod 4=3$, $N=p\times q$
选择种子 $s$, 满足 $s$ 和 $N$ 互素

迭代运算：
$$
X_0= s   
$$
$$
X_i= X_{i- 1}^2 mod N
$$
选择重要比特位 (如最低位，奇校验位，偶校验位等)

安全性：**基于大数难分解困难问题**：给定n，无法确定n的因子
原理解析：
1.为什么需要Blum质数？（（形如`4k+3`的质数））
确保二次剩余的循环性质。Blum质数保证了BBS的状态机在一个大的、结构良好的集合中循环，不会提前陷入短周期或死循环。
**a) 二次剩余的封闭性**
- 当`p`和`q`都是Blum质数时，模`n`的二次剩余（平方数模n）构成一个**循环群**
- 这意味着：从任何二次剩余开始，反复进行平方运算 `x → x² mod n`，我们永远不会"掉出二次剩余的集合。

**b) 最大周期保证**
- 对于Blum质数，二次剩余的群大小是 `λ(n) = lcm(p-1, q-1)/4`
- 这确保了状态序列 `X₀, X₁, X₂, ...` 会有**很长的周期**
- 如果选择随意的质数，周期可能很短，导致随机序列很快重复

**c) 单根性质**
- 对于Blum整数`n=pq`，每个二次剩余恰好有**一个**平方根也是二次剩余
- 这确保了状态转移函数 `x → x² mod n` 是**单射**的 - 每个状态有唯一的下一个状态


可证明安全：（待更新，需要复习一下）

{% note success modern %}代码实现{% endnote %}

```c++
#include <iostream>
#include <bitset>
#include <ctime>
using namespace std;

unsigned int s;

void bbs_srand(unsigned int seed) {
    s = seed;
}

unsigned int bbs_rand(int flag = 0) {
   
    unsigned int p = 11, q = 19;
    unsigned int N = p * q;
    unsigned int res = 0, bit = 0;
    unsigned int x = s;  // 使用当前状态
	s = s * s % N; // 更新状态
    for (int i = 0; i < 32; i++) {

        x = x * x % N;  // BBS核心：平方取模

        if (flag == 0) {
            bit = x & 1;  // 最低位
        }
        //将整数 x 转换为32位的二进制表示
        // .count返回该位集合中值为1的位的个数（即汉明重量)
        // 计算上一步结果的奇偶性
        else if (flag == 1) {
            bit = bitset<32>(x).count() % 2;  // 奇校验
        }
        else if (flag == 2) {
            bit = (bitset<32>(x).count() % 2) ^ 1;  // 偶校验
        }
        res = (res << 1) | bit;
    }

    return res;
}

int main() {
    bbs_srand(time(NULL));
    cout << "模式0 (最低位):" << endl;
    for (int i = 0; i < 5; i++) {
        cout << bbs_rand(0) << endl;
    }
    cout << "\n模式1 (奇校验):" << endl;
    for (int i = 0; i < 5; i++) {
        cout << bbs_rand(1) << endl;
    }
    cout << "\n模式2 (偶校验):" << endl;
    for (int i = 0; i < 5; i++) {
        cout << bbs_rand(2) << endl;
    }

    return 0;
}
```

---

# 函数库与 OpenSSL


编译过程：预处理→编译→汇编→链接

`gcc/g++ [-o filename] source.c/cpp`
将源程序文件转化为可执行文件
`gcc -E demo.c –o demo.i`
处理宏定义指令
处理条件编译指令
扩展头文件包含指令
`gcc -S demo.i –o demo.s`
将预处理代码转化为汇编代码
`gcc -c demo.s –o demo.o`
将汇编代码转化为目标代码（Linux下为ELF文件； Windows下为PE文件）
`gcc demo.o –o demo`
纳入函数/变量定义实现
静态链接：将实现一起打包生成可执行文件
动态链接：运行时动态加载

静态库:
一组目标文件（.o/.obj文件）的集合,与汇编生成的目标文件.o一起链接打包到可执行文件中
特点：
• 链接是在编译阶段完成
• 程序运行时与函数库再无瓜葛，移植方便
• 可执行文件巨大，包含所有相关目标文件与涉及函数库
动态库:
编译时不会链接到目标代码，在程序运行时动态加载

OpenSSL
Linux安装：` sudo apt-get install libssl-dev`、
Windows 安装：[Windows下给Visual Studio添加OpenSSL_如何在vs上添加openssl库-CSDN博客](https://blog.csdn.net/2201_75357739/article/details/143174153)
编译指令： ``gcc/g++ <源文件> -o <可执行文件> -lcrypto`
头文件： `#include<openssl/bn.h>`
初始化：`BN_init ()` or `BNnew()`
回收：`BN_free()`
操作：`BN_mod_exp()`, `BN_mod_inverse()`...

OpenSSL模指数运算与乘法逆元运算:
```c++
#include<bits/stdc++.h>
#include<openssl/bn.h>
using namespace std;


string mod_exp(string a, string e, string m)
{
    BIGNUM* base = BN_new();
    BIGNUM* exp = BN_new();
    BIGNUM* md = BN_new();
    BIGNUM* res = BN_new();
    if (!base || !exp || !md || !res)
    {
        cerr << "Failed to create BIGNUMS\n";
        return "";
    }
    BN_dec2bn(&base, a.c_str());
    BN_dec2bn(&exp, e.c_str());
    BN_dec2bn(&md, m.c_str());
    BN_mod_exp(res, base, exp, md, BN_CTX_new());
    char* res_str = BN_bn2dec(res);
    string res_val(res_str);
    OPENSSL_free(res_str);
    BN_free(base);
    BN_free(exp);
    BN_free(md);
    BN_free(res);
    return res_val;
}

string mod_inverse(string a, string m)
{
    BIGNUM* base = BN_new();
    BIGNUM* md = BN_new();
    BIGNUM* inverse = BN_new();
    if (!base || !md || !inverse)
    {
        cerr << "Failed to create BIGNUMS\n";
        return "";
    }
    BN_dec2bn(&base, a.c_str());
    BN_dec2bn(&md, m.c_str());
    if (BN_mod_inverse(inverse, base, md, BN_CTX_new()) == nullptr)
    {
        std::cerr << "Inverse not exist\n";
        BN_free(base);
        BN_free(md);
        BN_free(inverse);
        return "";
    }
    char* inverse_str = BN_bn2dec(inverse);
    string res_val(inverse_str);
    OPENSSL_free(inverse_str);
    BN_free(base);
    BN_free(md);
    BN_free(inverse);
    return res_val;
}

int main()
{

    string a = "10";
    string e = "9";
    string m = "998244353";
    cout << mod_exp(a, e, m) << endl;
    string ans = mod_inverse(a, m);
    if (!ans.empty()) cout << ans << endl;
    return 0;
}
```



# 一些备考代码

## 实现⼆进制与⼗进制转换函数

⼆进制数以字符串（std::string）表⽰；⼗进制数以⽆符号整数 （unsigned int）表⽰
```c++
#include <iostream>
#include<cmath>
#include <algorithm>
using namespace std;
unsigned int btod(string input) {

	unsigned int res = 0;
	for (int i = 0; i < input.size(); i++) {
		/*res += pow(2, input.size() - 1 - i);*/
		res <<= 1;
		if (input[i] == '1') res |= 1; /*if (input[i] == '1') res += 1;*/
		
	}
	return res;
}

string dtob(unsigned int input) {
	string res = "";
	while (input > 0) {
		if (input % 2 == 0) {
			res += "0";
		}
		else {
			res+= "1";
		}
		input >>= 1;//input /= 2;
		
	}
	reverse(res.begin(), res.end());
	return res;
}

int main() {
	string a = "1001";
	unsigned int b = 21;
	cout << btod(a) << endl;
	cout << dtob(b) << endl;


	return 0;
}
```

## 实现模指数运算的⼆进制算法

![](/images/Pasted%20image%2020251228220256.png)

```c++
#include <iostream>
#include<cmath>
#include <algorithm>
using namespace std;

unsigned int mod_exp(unsigned int a, unsigned int e, unsigned int p) {
	unsigned int res = 1;
	while (e > 0) {
		if (e & 1) res = res * a % p;
		a = a * a % p;
		e >>= 1;
	}
	return res;
}
int main() {

	cout << mod_exp(3, 200, 50) << endl;
	return 0;
}
```


## 埃氏筛

```c++
#include <iostream>
#include<cmath>
#include <algorithm>
#include <vector>
using namespace std;
// a: 输⼊测试正整数 // 返回: true如果a为素数；false如果a不为素数
bool prime_test(unsigned int a) {
	vector<int> nt(a+1, 0);

	for (int i = 2; i <= sqrt(a); i++) {
		if (!nt[i]) {
			for (int j = i+i; j <= a; j += i) {
				nt[j] = 1;
			}
		}
	}
	return !nt[a];
}

int main() {

	cout << prime_test(100000);
	return 0;
}
```

## miller-rabin

基于Miller-Rabin算法进⾏素性判定

string miller_rabin_multiple_test(int n,int repeat_times)

int a=rand()%(n-3)+2;

```c++
#include <iostream>
#include<cmath>
#include <algorithm>
#include <vector>
using namespace std;
int qp(int a, int e, int p) {
	int res = 1;
	while (e > 0) {
		if (e & 1) res = a * res % p;
		a = a * a % p;
		e>>= 1;
	}
	return res;
}
bool miller_rabin_multiple_test(int n, int repeat) {
	
	if (n < 2||n%2==0 )	return 0;
	if (n == 2 || n == 3) return 1;

	int q, k = 0,nn=n-1;
	while (nn%2==0) {
		k++;
		nn >>= 1;
	}
	q = nn;

	while (repeat--) {
		int a = rand() % (n - 3) + 2;
		int v = qp(a, q, n);
		if (v == 1) continue;
		int j = 0;
		for (; j < k; j++) {
			if (v == n - 1) break;
			v = v * v % n;
		}
		if (j == k) return 0;
	}
	return 1;
}

int main() {
	cout<<miller_rabin_multiple_test(7, 5);
	return 0;
}
```
## 逆元

```c++
#include <iostream>
#include<cmath>
#include <algorithm>
#include <vector>
#include <numeric>

using namespace std;

void exgcd(int a, int b, int& x, int& y) {
	if (b == 0) {
		x = 1;
		y = 0;
	}
	else {
		exgcd(b, a % b, y, x);
		y -= (a / b) * x;
	}
} 
bool gcd(int a, int b) {
	if (b == 0) return a;
	return gcd(b, a % b);
}
int reverse_mod(int a, int m) {
	int x = 0, y = 0;
	if (gcd(a, m) != 1) return -1;
	exgcd(a, m, x, y);
	return (x % m + m) % m;
}	
int main() {
	cout << reverse_mod(3, 11) << endl;
	return 0;
}
```
## 伪随机数

void lcg_srand(unsigned int seed);
unsigned int lcg_rand();
![](/images/Pasted%20image%2020251229005542.png)
unsigned int bbs_rand(int flag);
unsigned int bbs_srand(int seeds);
![](/images/Pasted%20image%2020251229005945.png)

```c++
#include <iostream>
#include<cmath>
#include <algorithm>
#include <vector>
#include <numeric>
#include <bitset>

using namespace std;
int s;
void lbsrand(unsigned int seed);
unsigned int lcg_rand();


unsigned int bbs_rand(int flag);


void lbsrand(unsigned int seed) {
	s = seed;
}

unsigned int lcg_rand() {
	unsigned int a = 1103515245, c = 12345, m = 2147483648;
	return s = (a * s + c) % m;
}
unsigned int bbs_rand(int flag) {
	int p = 11, q = 19;
	int n = p * q;
	int x = s, bit = 0, res = 0;
	//更新种子
	s = (s * s) % n;
	//取最低位，奇校验位，偶校验位,循环32次生成一个随机数
	if (flag == 0) {
		for (int i = 1; i <= 32; i++) {
			x = x * x % n;
			bit = x & 1;
			res = (res << 1) | bit;
		}
	}
	else if (flag == 1) {
		for (int i = 1; i <= 32; i++) {
			x = x * x % n;
			bit = bitset<32>(x).count() % 2;
			res = (res << 1) | bit;
		}
	}
	else if(flag==2) {
		for (int i = 1; i <= 32; i++) {
			x = x * x % n;
			bit =(bitset<32>(x).count() % 2)^1;
			res = (res << 1) | bit;
		}
	}
	else {

	}
	return res;
}
int main() {
	lbsrand(42);

	for(int i=0;i<5;i++) cout << lcg_rand() << endl;
	for (int i = 0; i < 5; i++) cout << bbs_rand(1) << endl;
	return 0;
}
```

## openssl基本

大数运算库

- 头文件：#include<openssl/bn.h>
    
- 初始化：BN_init() or BN_new()
    
- 回收：BN_free()
    
- 操作：BN_mod_exp(), BN_mod_inverse(), ...
    
- 应用：基于 OpenSSL 实现数论基础实验和伪随机数生成器实验
## openssl大数模运算、 openssl乘法逆元

```c++
#include<openssl/bn.h>
#include <iostream>
using namespace std;

string mod_exp(string a, string e, string m)//a^e mod m
{
    BIGNUM* base = BN_new();
    BIGNUM* exp = BN_new();
    BIGNUM* md = BN_new();
    BIGNUM* res = BN_new();
    if (!base || !exp || !md || !res) {
		cerr << "Failed to create BIGNUM" << endl;
        return "";
    }
    BN_dec2bn(&base,a.c_str());
    BN_dec2bn(&exp, e.c_str());
    BN_dec2bn(&md, m.c_str());

    BN_mod_exp(res, base, exp, md, BN_CTX_new());
    char* r = BN_bn2dec(res);
    string result(r);

    OPENSSL_free(r);
    BN_free(base);
	BN_free(exp);
	BN_free(md);
	BN_free(res);
	return result;
}

string mod_inverse(string a, string m)
{
    BIGNUM* num = BN_new();
    BIGNUM* mod = BN_new();
	BIGNUM* res = BN_new();
    if (!num || !mod || !res) {
		cerr << "Failed to create BIGNUM" << endl;
		return "";
    }

	BN_dec2bn(&num, a.c_str());
	BN_dec2bn(&mod, m.c_str());

    if (BN_mod_inverse(res, num, mod, BN_CTX_new()) == NULL) {
        cerr << "Modular inverse does not exist.";
		BN_free(num);
        BN_free(mod);
        BN_free(res);
        return "";
	}
    char* r = BN_bn2dec(res);
    string result(r);
    OPENSSL_free(r);
    BN_free(num);
    BN_free(mod);
    BN_free(res);
    return result;
}

int main()
{

    string a = "10";
    string e = "9";
    string m = "998244353";
    cout << mod_exp(a, e, m) << endl;
    string ans = mod_inverse(a, m);
    if (!ans.empty()) cout << ans << endl;
    return 0;
}
```
## RSA

数字签名特征：完整性，不可伪造性，不可抵赖性

OpenSSL 实现：RSA_sign & RSA_verify 或RSA_private_encrypt & RSA_public_decrypt


```c++
#include<iostream>
#define OPENSSL_API_COMPAT 0x10100000L
#define OPENSSL_NO_DEPRECATED 1
#include<openssl/rc4.h>
#include<openssl/des.h>
#include<openssl/sha.h>
#include<openssl/evp.h>
#include<openssl/rand.h>
#include<vector>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <openssl/bio.h>
#include <openssl/buffer.h>
#include <openssl/applink.c>
using namespace std;

#define RSA_private_path "private.pem"
#define RSA_public_path "public.pem"
RSA* rsa_private=NULL;
RSA* rsa_public = NULL;

bool load_RSA_keys() {
	if(rsa_private!= NULL && rsa_public != NULL) {
		return true; // Keys already loaded
	}
	FILE* fp = fopen(RSA_private_path, "r");
	if (fp == NULL) {
		cout<< "Failed to open private key file." << endl;
		return false;
	}
	rsa_private = PEM_read_RSAPrivateKey(fp, NULL, NULL, NULL);
	fclose(fp);
	if(rsa_private == NULL) {
		cout<< "Failed to read private key." << endl;
		return false;
	}

	fp = fopen(RSA_public_path, "r");
	if (fp == NULL) {
		cout<< "Failed to open public key file." << endl;
		return false;
	}
	rsa_public = PEM_read_RSA_PUBKEY(fp, NULL, NULL, NULL);
	fclose(fp);
	if (rsa_public == NULL) {
		cout << "Failed to open public key file." << endl;
		return false;
	}
	return true;
}
string RSA_encrypt(string m) {

	int rsa_len = RSA_size(rsa_public);
	unsigned char* encrypted = new unsigned char[rsa_len];
	int result = RSA_public_encrypt(
		(int)m.size(),
		(unsigned char*)m.c_str(),
		encrypted,
		rsa_public,
		RSA_PKCS1_PADDING
	);
	if(result== -1) {
		cout << "RSA encryption failed." << endl;
		delete[] encrypted;
		return "";
	}

	string c((char*)encrypted, result);//result是加密后数据的长度
	delete[] encrypted;
	return c;
}

string RSA_decrypt(string c) {
	int rsa_len = RSA_size(rsa_private);
	unsigned char* decrypted = new unsigned char[rsa_len];
	if(decrypted == NULL) {
		cout << "Memory allocation failed." << endl;
		return "";
	}
	int result = RSA_private_decrypt(
		(int)c.size(),
		(unsigned char*)c.c_str(),
		decrypted,
		rsa_private,
		RSA_PKCS1_PADDING
	);
	if (result == -1) {
		cout << "RSA decryption failed." << endl;
		delete[] decrypted;
		return "";
	}
	
	string m((char*)decrypted, result);
	delete[] decrypted;
	return m;
}
string RSA_sign(string m) {
	unsigned char hash[SHA256_DIGEST_LENGTH];
	SHA256((unsigned char*)m.c_str(), m.size(), hash);
	int rsa_len = RSA_size(rsa_private);
	unsigned char* sig = (unsigned char*)malloc(rsa_len);
	if (sig == NULL) {
		cout << "Memory allocation failed." << endl;
		return "";
	}
	unsigned int sig_len;
	if (RSA_sign(NID_sha256, hash, SHA256_DIGEST_LENGTH, sig, &sig_len, rsa_private) != 1){
		cout << "RSA signing failed." << endl;
		free(sig);
		return "";
	}
	string signature((char*)sig, sig_len);
	free(sig);
	return signature;
}

bool RSA_verify(string m, string sig) {
	unsigned char hash[SHA256_DIGEST_LENGTH];
	SHA256((unsigned char*)m.c_str(), m.size(), hash);

	size_t sig_len = sig.size();
	unsigned char* ver = (unsigned char*)malloc(sig_len);
	if (ver == NULL) {
		cout << "Memory allocation failed." << endl;
		return false;
	}
	if (RSA_verify(NID_sha256, hash, SHA256_DIGEST_LENGTH, ver, sig_len, rsa_public) != 1){
		free(ver); 
		return false; 
	}
	free(ver); 
	return true; 
}

signed main(){
	load_RSA_keys();

    return 0;
}
```

## RC4，DES，SHA1

```c++
#include<iostream>
#define OPENSSL_API_COMPAT 0x10100000L
#define OPENSSL_NO_DEPRECATED 1
#include<openssl/rc4.h>
#include<openssl/des.h>
#include<openssl/sha.h>
#include<openssl/evp.h>
#include<openssl/rand.h>
#include<vector>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <openssl/bio.h>
#include <openssl/buffer.h>
#include <openssl/applink.c>
using namespace std;
typedef unsigned char des_cblock[8];


string rc4_encrypt(string data, string secert_key)
{
    if (data.empty() || secert_key.empty()) return "";

    RC4_KEY key;
	unsigned char* data_data = (unsigned char*)data.c_str();
	unsigned char* key_data = (unsigned char*)secert_key.c_str();

    RC4_set_key(&key, secert_key.size(), key_data);
	unsigned char* output = (unsigned char*)malloc(data.size());
    RC4(&key, data.size(), data_data, output);
    return string((char*)output, data.size());
}

string rc4_decrypt(string data, string secret_key) {
	return rc4_encrypt(data, secret_key);
}


void convert_string_to_des_block(const string& str, DES_cblock* des_block)
{
    size_t len = str.size();
    memset(des_block, 0, sizeof(DES_cblock));
    for (size_t i = 0; i < len; i++)
    {
        (*des_block)[i] = str[i];
    }
}

string des_encrypt(string plain, string secret_key)
{
    DES_cblock key, plaintext, ciphertext;
    DES_key_schedule schedule;

    convert_string_to_des_block(secret_key, &key);
    convert_string_to_des_block(plain, &plaintext);

    DES_set_key_checked(&key, &schedule);
    DES_ecb_encrypt(&plaintext, &ciphertext, &schedule, DES_ENCRYPT);

    string result((char*)ciphertext, 8);
    return result;
}

string des_decrypt(string cipher, string secret_key)
{
    DES_cblock key, ciphertext, plaintext;
    DES_key_schedule schedule;

    convert_string_to_des_block(secret_key, &key);
    convert_string_to_des_block(cipher, &ciphertext);

    DES_set_key_checked(&key, &schedule);
    DES_ecb_encrypt(&ciphertext, &plaintext, &schedule, DES_DECRYPT);
   
    string result((char*)plaintext, 8);
    return result;
}

string sha1_digest(string msg)
{
    unsigned char hash[SHA_DIGEST_LENGTH];
    SHA1((unsigned char*)msg.c_str(), msg.size(), hash);
    return string((char*)hash, SHA_DIGEST_LENGTH);
}

void testRC4()
{
    cout << "RC4" << endl;
    string plaintext = "Hello world!";
    string key = "passwor";
    string encryptedtext = rc4_encrypt(plaintext, key);
    string decryptedtext = rc4_decrypt(encryptedtext, key);
    cout << "Plaintext = " << plaintext << endl;
    cout << "Encrytext = " << encryptedtext << endl;
    cout << "Decrytext = " << decryptedtext << endl;
}

void testDES()
{
    cout << "DES" << endl;
    string plaintext = "textword";
    string key = "passw0rd";
    string encryptedtext = des_encrypt(plaintext, key);
    string decryptedtext = des_decrypt(encryptedtext, key);
    cout << "Plaintext = " << plaintext << endl;
    cout << "Encrytext = " << encryptedtext << endl;
    cout << "Decrytext = " << decryptedtext << endl;
}

void testSHA1()
{
    cout << "SHA1" << endl;
    string input = "Hello world!";
    string output = sha1_digest(input);
    cout << "Input = " << input << endl;
    cout << "Result = " << output << endl;
}

signed main()
{
    testRC4();
    testDES();
    testSHA1();
    return 0;
}
```



---


参考资料：
[快速幂 - OI Wiki](https://oi-wiki.org/math/binary-exponentiation/)
[算法学习笔记(4)：快速幂 - 知乎](https://zhuanlan.zhihu.com/p/95902286)
[(2 封私信 / 80 条消息) 【朝夕的ACM笔记】数论-Miller Rabin素数判定 - 知乎](https://zhuanlan.zhihu.com/p/349360074)
[素数 - OI Wiki](https://oi-wiki.org/math/number-theory/prime/#__tabbed_4_1)
[miller-rabin和polard's rho算法学习笔记 - tkj's Blog](https://tkj666.github.io/138/index.html)
[Miller-Rabin-素数检测法_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1T44y1Z7Gx/?spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=a11961ebf6a3ea45f94404bd5d0461d4)
[0x11分钟学会 Miller Rabin 质数判定算法_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV14K411e7aT/?spm_id_from=333.788.top_right_bar_window_history.content.click)
[素数筛—朴素筛，埃氏筛，线性筛（详细）-CSDN博客](https://blog.csdn.net/2302_79366101/article/details/136018813)
[模逆元 - OI Wiki](https://oi-wiki.org/math/number-theory/inverse/)
[G17 不定方程 扩展欧几里得算法_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1rD4y1C7qg/?spm_id_from=333.788.top_right_bar_window_history.content.click&vd_source=a11961ebf6a3ea45f94404bd5d0461d4)
[伪随机数生成算法（1）线性同余法_伪随机数 同余-CSDN博客](https://blog.csdn.net/mariofei/article/details/24690103)
[Windows下给Visual Studio添加OpenSSL_如何在vs上添加openssl库-CSDN博客](https://blog.csdn.net/2201_75357739/article/details/143174153)
[Shell 教程 | 菜鸟教程](https://www.runoob.com/linux/linux-shell.html)