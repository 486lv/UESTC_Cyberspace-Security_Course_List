---
title: 编译原理
date: 2024-11-13 20:45:00
categories:
- 专业课程
tags:
- 编译原理
- 程序设计语言
- 类型系统
toc_number: true
toc: true
cover: /images/bianyiyuanli.png
---




# 绪论

## 程序设计语言的发展
![](/images/Pasted%20image%2020251013104423.png)
翻译汇编语言的程序称为汇编程序（器）
翻译高级语言的程序称为编译程序（器）

## 程序设计语言分类
按设计的理论基础分为**强制式**、**函数式**、**逻辑式**、**对象式**四类语言


##  绑定
一个实体（或对象）与其属性建立联系的过程,称为绑定。
凡是在**编译时/运行时**能确定的属性，称为**静态/动态**属性；若绑定在编译时完成，运行时不改变，称为**静态绑定**/若绑定在运行时完成，称为**动态绑定**。

## 变量
变量除名字外,具有四个属性:**作用域、生存期、值和类型**。
{% note modern %}
变量的作用域是指可以访问该变量的程序范围。
存储区绑定于一个变量的时间区间,称为变量的生存期。
变量的值是变量所对应存储区单元的内容。
变量的类型是与变量相关联的值的类,以及对这些值进行的操作的说明。

C 语言运行时的存储空间
程序代码区
数据静态存储区
       常量数据、全局数据、Static 数据
数据动态存储区
      活动记录（栈空间）：返回地址、CPU 现场、形参、局部变量、临时变量
      堆空间：存储动态内存申请数据
{%endnote%}




#  数据类型

## 类型检查
对数据对象的类型和操作是否匹配的一致性检查称为类型检查。
语言的类型检查分为静态检查和动态检查
	静态检查使程序更正确更有效
	动态检查使编程方便,但影响了可读性,且降低了执行效率
语言按类型可分为无类型语言、弱类型语言和强类型语言。

{% note modern %}
为什么要进行类型检查：
- **例子**：
    - 你不能把一个字符串 `"hello"` 和一个整数 `5` 直接相加（在某些语言中可以，但那属于类型转换，我们后面会讲）。
        
    - 你不能调用一个只为整数设计的 `开平方根` 函数，却传给它一个字符串
所以就会什么时候检查：
静态：
```java
// Java 示例 (静态类型)
String name = "Alice";
int age = 25;
// int result = name + age; // 编译错误！编译器会立即报错：类型不匹配。
```
动态:
```java
// Java 示例 (静态类型)
String name = "Alice";
int age = 25;
// int result = name + age; // 编译错误！编译器会立即报错：类型不匹配。
```

无类型语言:汇编语言。你对一个内存地址进行操作，它到底是整数、字符还是指令，完全由程序员自己心里清楚并负责。
弱类型语言:语言有类型的概念，但它的类型检查非常不严格，允许在不同类型之间进行**隐式转换**。编译器或解释器会“猜测”你的意图并自动进行转换，这有时会导致意想不到的结果。例子：JavaScript, PHP
```javascript
// JavaScript 示例 (弱类型)
var result = "5" - 1; // 4 (字符串 "5" 被隐式转换成了数字 5)
var anotherResult = "5" + 1; // "51" (数字 1 被隐式转换成了字符串 "1"，因为 + 运算符也用于字符串连接)
// 同一个运算符，对同样的数据，产生了完全不同的结果，这就是弱类型可能带来的困惑。
```
强类型语言:
- 语言有严格的类型检查，**不允许**隐式的、可能不安全的类型转换。如果类型不匹配，你必须进行显式转换。
- 核心特征：不允许隐式类型转换（或非常限制）。
**例子**：Python, Java, C#, Go。
```python
# Python 示例 (强类型)
# result = "5" + 1  # 这会抛出 TypeError，不会自动将 1 转换成 "1"
result = "5" + str(1)  # 正确：必须显式地将整数 1 转换为字符串 "1"
print(result) # 输出 "51"
```
{%endnote%}


## 数据类型
是对存储中所存储的数据的抽象。它包含了**值的集合**和**操作的集合**。
可分为三个层次的抽象：**内部类型，用户自定义类型，抽象数据类型**

内部类型：基本位串的抽象（int）
用户自定义类型：内部类型（和其他用户定义类型）的抽象（struct）,内部类型隐蔽了基本表示，不能对它的成分进行操作;用户定义类型的基本表示是可见的，可以对其基本表示的成分进行操作。
抽象类型：
	用户自定义的一种（但满足两个条件）（栈，队列）
	在定义该类型的程序单元中，建立与表示有关的基本操作。对使用该类型的程序单元来说，该类型的表示是隐蔽。

{% note modern %}
理解：
内部类型：
- “基本位串的抽象”：意思是，一个 `int` 类型在计算机底层可能由32个二进制位（位串）表示，但语言将它抽象成了一个整数的概念。你不需要知道它具体是怎么用0和1存储的。
    
- “隐蔽了基本表示，不能对它的成分进行操作”：你无法直接操作一个 `int` 里面的某一个二进制位（在不使用位运算符的情况下）。你对 `int` 的操作是高级的、整体的，比如 `a + b`, `a > b` 等。它就像一个完整的、不可拆卸的积木块。
用户自定义类型：
- 关键点是“表示可见”：使用这个类型的程序员，能够直接看到和访问其内部的每一个成员（成分）。
- 例子：定义一个 `Person` 结构体。
```c
// C语言示例
struct Person {
    char name[50]; // 可见的成员
    int age;       // 可见的成员
};

int main() {
    struct Person p;
    strcpy(p.name, "Alice"); // 直接操作内部成分
    p.age = 25;              // 直接操作内部成分
    // 我可以直接修改 p.name 和 p.age，因为它们是可见的。
}
```

抽象类型：
- 它首先是一种“用户自定义类型”，但它有两个关键条件，使其变得“抽象”：
    
    1. **表示隐蔽**：对于**使用者**来说，他们完全不知道这个类型内部是怎么实现的（是用数组？链表？还是别的结构？）。
        
    2. **操作封装**：语言提供了**一组定义好的操作（函数或方法）** 作为与这个类型交互的唯一方式。
        
- **例子**：`栈 (Stack)`
    
    - **对使用者（黑箱视角）**：我只知道有一个叫 `Stack` 的类型，我能对它进行 `push(放入元素)`、`pop(弹出元素)`、`is_empty(判断是否为空)` 等操作。但我完全不知道这个栈是用数组实现的还是用链表实现的。
        
    - **对定义者（白箱视角）**：在实现 `Stack` 的代码文件内部，我知道它的具体表示（比如用一个数组和一个指向栈顶的索引），并且我在这里实现了 `push`, `pop` 等所有基本操作。
 ```c
      // C++ 抽象数据类型示例 (使用类)
      class Stack {
      private: // 对使用者隐蔽！
          int data[100]; // 内部表示：用数组实现
          int top_index; // 内部表示：栈顶指针
          
      public: // 对使用者公开的操作接口
          void push(int value) { ... } // 封装了操作细节
          int pop() { ... }
          bool is_empty() { ... }
      };
      
      int main() {
          Stack s;
          s.push(10); // 正确：通过公开接口操作
          // s.data[0] = 20; // 错误！data是私有的，表示被隐蔽，不能直接操作。
      }
      ```


{%endnote%}

## 六种数据类型聚合方式和举例
笛卡尔积：记录、结构
例如：
```c++
struct student {
     string name;
     char sex;
     int age;
  }
```
有限映射：数组
```c++
int intarr[5];
```
序列：字符串、顺序文件
- 例子：字符串 "abc" 是字符 'a', 'b', 'c' 的序列。顺序文件则是一行一行读取的数据，每行是一个记录。
递归：树
判定或：联合(unino)、变体记录
幂集：集合
- 例子：集合 `{1, 2}` 的幂集包括 `{}`, `{1}`, `{2}`, `{1,2}`。在Python中，可以使用 `set` 类型来存储唯一元素，如 `s = {1, 2, 3}`。


## 类型转换
语言提供转换机制：某种类型的值转换为另一种类型的值
- **隐式**（自动）转换
- **显式** （强制）转换
转换方式：类型转换分为**拓展**和**收缩**
- 拓展整型变实型
- 收缩实型变整型
一般来说，语言对基本类型提供适当的类型转换，而对复合类型或用户自定义类型不提供转换。

# 控制结构

## 语句级控制结构

分为三种：
- 顺序（sequencing）
- 选择（selection）
- 重复（repetition）

| 控制结构               | 英文名称       | 作用描述                                         | 常用关键词/示例                                        |
| ------------------ | ---------- | -------------------------------------------- | ----------------------------------------------- |
| 1. 顺序 (Sequencing) | Sequencing | 程序中的指令按照它们在代码中出现的先后顺序，逐条、依次执行。这是所有程序默认的执行流程。 | 无特定关键词，即代码的默认执行流。                               |
| 2. 选择 (Selection)  | Selection  | 也称作“分支”。根据某个条件的真假，程序选择执行多条路径中的其中一条。          | `if`, `else`, `elif` (Python), `switch`, `case` |
| 3. 重复 (Repetition) | Repetition | 也称作“循环”。程序根据某个条件，重复执行某一段代码多次，直到条件不满足为止。      | `for`, `while`, `do-while`                      |
## 单元级控制结构
- 显式调用
- 异常处理
- 协同程序
- 并发单元

| 控制结构    | 英文名称               | 作用描述                                                                   | 常用关键词/机制                                                        |
| :------ | :----------------- | :--------------------------------------------------------------------- | :-------------------------------------------------------------- |
| 1. 显式调用 | Explicit Call      | 一个程序单元（如函数、过程、方法）主动挂起自身，并将控制权转移给另一个单元。这是最基本的单元间控制转移。                   | 函数调用、方法调用、CALL、return                                           |
| 2. 异常处理 | Exception Handling | 一种特殊的控制转移机制，用于处理程序运行时的错误或非正常情况。它将控制权从发生异常的位置转移到一个预定的处理程序（捕获块）。         | try, catch (Java/C#), try, except (Python), throw               |
| 3. 协同程序 | Coroutines         | 允许一个程序单元在执行过程中暂停并将控制权交给另一个协同程序，而暂停时的状态（包括局部变量）会被保存。特点是程序单元之间互相协作、非抢占式。 | yield (Python/C#), go (Lua), 异步/等待机制（部分语言）                      |
| 4. 并发单元 | Concurrency Units  | 涉及多个控制流同时执行。这些单元可以是操作系统进程、线程或任务，它们可以在时间上交错执行（并发）或真正同时执行（并行）。           | 线程 (Thread), 进程 (Process), 任务 (Task), 锁 (Lock), 信号量 (Semaphore) |
# 文法

## 常用术语

- 字符的有限集合，称为字母表，一般用$∑$表示，其中的元素称为字母
- $ε$表示空串，{$ε$}是仅包含空串的集合
- 如果$α$和$β$是两个字符串，则$αβ$表示$α$和$β$的连接.
 例如：
 假设$\alpha=a_{1}a_{2}\ldots a_{n}$，$\beta=b_{1}b_{2}\ldots b_{m}$
则$\alpha\beta=a_{1}a_{2}\ldots a_{n}b_{1}b_{2}\ldots b_{m}$
$\alpha\epsilon=\epsilon\alpha=\alpha$
$\alpha^{0}=\epsilon$，$\alpha^{1}=\alpha$，$\alpha^{2}=\alpha\alpha$，$\ldots$，$\alpha^{n}=\alpha^{n-1}\alpha$
- 如果A和B是两个字符串的集合，则AB表示的A和B的连接，即A和B中所有字符串的连接的集合(遍历A与B（类似于双层循环）)
假设A=$\{ \alpha _1, \alpha _2, \ldots , \alpha _\text{ n}\}$, B=$\{\beta_1,\beta_2,\ldots,\beta_\text{m}\}$
$$AB = \{\alpha_1\beta_1, \alpha_1\beta_2, \dots, \alpha_1\beta_m, \dots, \alpha_n\beta_1, \alpha_n\beta_2, \dots, \alpha_n\beta_m\}$$ ^9fa702
- 闭包,$A^*$ 称为 $A$ 的闭包
$$\mathrm{A^0=\{\varepsilon\},A^1=A,A^2=AA,\ldots,A^n=A^{n-1}A}$$
$$A^* = A^0 \cup A^1 \cup \dots \cup A^n \cup \dots$$

文法是描述语言语法结构的形式规则。$G=(V_T,V_N,S,P)$
- $V_t$是终结符的非空有限集
- $V_N$是非终结符的非空有限集
- $S_\text{ 是文法的开始符号，}S\in V_N$
-  $P$是产生式$\alpha\Rightarrow\beta$的非空有限集合
$\alpha$和$\beta$是由终结符、非终结符组成的串，且$\alpha$至少应含有一个非终结符。
产生式一般写为α→β，其中$\alpha ∈ V^*V_NV^*,\beta∈V^*,V=V_N∪V_T$

{% note modern %}
终结符号（Terminals）：语言中的基本符号，无法再分解。终结符号是语言中的基本构成单元，例如字母、数字和标点符号。在编程语言中，终结符号可以是关键字、操作符和标识符等。在英语语言的文法中，终结符号可以是字母表中的字母，例如 ‘a’, ‘b’, ‘c’, 等。在编程语言中，终结符号可以是具体的字符或字符串，如 `if`, `else`, `+`, `-` 等。
非终结符号（Non-terminals）：可以进一步分解为其他符号的符号。非终结符号用于表示语法结构，它们是语法规则中的中间符号，例如表达式、语句和程序块等。

---
示例解析
假设我们有一个简单的文法 G：
非终结符号集合 N = {S, A}
终结符号集合 Σ = {a, b}
生成规则集合 P = {S → aA, A → b}
起始符号 S = S
这个文法表示了一种简单的语言，可以生成字符串 ab。其解析过程如下：

从起始符号 S 开始。
应用生成规则 S → aA，将 S 替换为 aA。
应用生成规则 A → b，将 A 替换为 b。
得到字符串 ab。

---

{%endnote%}

## 推导与规约

设文法$G=(V_T,V_N,S,P)$

① 如果$β→δ$是产生式，则$αβγ$称直接推导出$αδγ$，记为$αβγ⇒αδγ$；其逆过程称为归约，也就是$αδγ \stackrel{+}{\Rightarrow} αβγ$；
② 如果$α₁⇒α₂…⇒αₙ$，则称记为$α₁$推导出$αₙ$，记为$α₁\stackrel{+}{\Rightarrow}αₙ$；
③ 如果$α₁\stackrel{0}{\Rightarrow}αₙ$，或$α₁\stackrel{+}{\Rightarrow}αₙ$则记为$α₁\stackrel{*}{\Rightarrow}αₙ$；


{% note modern %}
理解：
v=123<字母>456，w=123a456
$<字母>→a$
则v直接推到w，$v\Rightarrow w$，w直接规约到v，$w\stackrel{+}{\Rightarrow}v$
看这个v推导到w用了一步，推导长度为1，v到v推导长度为0，那么我们就称：
初步推导：$α₁\stackrel{+}{\Rightarrow}αₙ$，n大于1
广义推导：$α₁\stackrel{*}{\Rightarrow}αₙ$，n大于等于0
{%endnote%}

## 文法分类*
![](/images/Pasted%20image%2020251116120455.png)

0型： **规则最宽松，几乎无限制**。左部 $\alpha$ 必须包含至少一个非终结符。
1型： **长度限制**。左部 $\alpha$ 的长度不能大于右部 $\beta$ 的长度。
2型： **左部必须是单个非终结符**。这是编程语言**语法分析**的核心文法。
3型： **格式最严格**。右部要么是终结符串后跟一个非终结符（右线性），要么是纯终结符串。这是编程语言**词法分析**的核心文法。

## 文法产生语言

设文法$G=(V_T,V_N,S,P)$，α,β∈V*，$V=V_T∪V_N$
① 如果$S\stackrel{*}{\Rightarrow}α$，$α∈V^*$，则α为G的一个句型（理解：说明α里面可以有终结符也可以有非终结符）
② 如果$S\stackrel{*}{\Rightarrow}α$，$α∈V_T^*$，则α为G的一个句子（理解：说明α里面只能有终结符，所以句子也算作句型中的一种）
③ 文法G的所有句子的集合称为G产生的语言，记为L(G),即：
$L(G)=\{α|S\stackrel{*}{\Rightarrow}α,α∈V_T^*\}$
文法可以唯一表示一种语言，但是语言不一定唯一表示文法。
文法的等价即两者产生的语言集合相等，如果$L(G)=L(G')$，那么$G\equiv G'$


## 语法树

语法树（或推导树）是一棵用来表示一个句型的推导过程的树，它满足：
①每个结点带有一个唯一的标记，标记是文法G的非终结符或终结符；
②如果标记为非终结符A的内部结点从左到右有子结点X1，X2，…, Xn,则A→X1…Xn是一个产生式;
③如果有结点标记为e，则它必是叶结点；
{%note modern%}
例子：
![](/images/22bfd3f7e90e17526be0021838bbe210_720.jpg)
{%endnote%}
- 二义性

对于文法 $E \to E + E \mid E * E \mid (E) \mid i$ ，句子 $(i + i * i)$
他的语法树会有不同，如果一个文法存在某个句子有多于一个的语法树，则称这个文法是二义文法。
①一个二义文法产生的语言不一定是二义语言；
②二义性的问题是不可判定的
③存在先天二义语言；即，每个产生它的文法都是二义的；
![](/images/Pasted%20image%2020251116120508.png)


- 每个结点都是某一终结/非终结符 
- 树根是文法的开始符
- 简单子树：只含有单层分枝的子树（如下图中红色）
- 最左推导:每步直接推导总是替换最左的非终结符，逆过程是最右规约
- 最右推导（规范推导）（同上，改为最右），逆过程是最左规约
- 规范句型（右句型，规范推导中推导的句型都是）
![](/images/ad2c0fb2070bcdc13c69f16628cf0caa.png)

==子树的末端结支符号串是相对于子树根的**短语**==
==简单子树的末端结点组成的符号串是相对于简单子树根的**简单短语**==
==最左简单子树的末端结点组成的符号串是**句柄**==

补充,见素短语
例子（语法树如上）：
![](/images/7407d0ef3eff22b9ad25911bdbb4991c_720.jpg)

## 语言的设计
- 表达式的设计：
	- 逻辑表达式
	- 关系表达式
	- 算数表达式
- 语句的设计
	- 说明语句：主要包括变量说明和类型说明
	- 控制语句：主要包括赋值语句、控制语句和复合语句



# 编译概述

## 程序处理过程

![](/images/Pasted%20image%2020251116120522.png)

## 编译过程

词法分析：对构成源程序的**字符串**进行扫描和分解，识别出一个个的**单词**；
语法分析：根据语言的语法规则，把**单词符号串**分解成各类**语法单位**；
语义分析与中间代码生成：对各类**语法单位**，分析其含义并进行初步**翻译**；
代码优化：产生更高效的**代码**；
目标代码生成：把**中间代码**变换成特定机器上的**低级语言指令**形式


![](/images/Pasted%20image%2020251116120531.png)

编译步骤
1. 词法分析：从左向右扫描**源程序**，并进行分析，识别出符合**词法规则的单词符号**；如果出错，则给出出错信息；
2. 语法分析：对由词法分析识别出来的**符号流**，按语法规则进行分析，识别出**语法单位**，给出一个**语法树**；如果出错，给出出错信息；
3. 语义分析：按照语义要求对**各种语法单位**进行**翻译**；大多数编译器采用中间语言来描述程序的语义；
4. 优化：对**中间代码**进行一些等价变换，使生成的目标程序效率更高；
5. 目标代码生成：将**中间代码**转换成**目标代码**；
6. 符号表管理：符号表存储程序中各种数据对象和实体的属性，编译程序负责对这些表格进行创立和维护；
7. 出错处理：编译程序会发现很多的程序错误，尤其在语法分析阶段；出错处理将报告错误的性质、发生错误的地方等；

# 词法分析
任务：
1.读取源程序，识别单词
2.过滤注释与空白
3.将编译器生成的错误消息与源程序的位置关联
单词的种类：**标识符、基本字（关键字）、常数、运算符、界符**

{%note modern%}
	1. 基本字：语言预定义的具有特定含义的字符串，也称关键字或保留字；例如begin,if,end等
	2. 标识符：用来作为实体的名字或语句标号，通常是一个以字母开头的字母数字串
	3. 常数：包括各种类型的常数，如整数、实数和字符串等
	4. 运算符：包括算术运算符（+-*/)，关系运算符（>=<）,逻辑运算符（）等
	5. 界符：在程序中起分隔作用的符号，如，;:()等
{%endnote%}

单词的输出形式：`（单词类别，单词的值）`。通常可以使用整数编码来区分单词类别。

# 自上而下的语法分析

自上而下：从开始符号S出发，看能否找到一个最左推导，使得$S\stackrel{*}{\Rightarrow}α$；或从S出发，能否构成一个语法树，使得树的叶结点自左向右构成w;
自下而上：从w开始，看能否找到一个规范归约，逐步向上归约，直到开始符号S。

## 回溯分析法

从文法的开始符号S出发，选取S的候选式进行推导，按最左推导进行下去；如果推导失败，再换用其他的候选式；若穷尽所有的候选式都失败，则表明w不是G的句子，w存在语法错误；
![](/images/Pasted%20image%2020251116121209.png)

产生回溯原因：
1.文法含有公共左因子 A→ab1| ab2，当输入串匹配a时，不能唯一决定使用哪个产生式进行匹配，因此需要采用回溯的方法。
2.文法含有左递归
文法S→Sa|b，一直递归
3.文法含有ε产生式

**低效！**
•若产生式有多个候选式，选择是盲目的
•如果文法存在左递归，存在无限循环的可能性
•回溯会导致空间和时间的大量消耗
•如果输入的语句有错误，算法无法指出确切位置


## 递归下降分析法

### 提取公共左因子
原产生式：
$$A\Rightarrow\alpha\beta_1|\alpha\beta_2|...|\alpha\beta_n|\delta $$
改写为：
$A\Rightarrow\alpha B|\delta$
$B\Rightarrow\beta_1|\beta_2|...|\beta_n$
若在$\beta_1|\beta_2|...|\beta_n$中仍含有公共左因子，可再进行提取。反复进行提取，直到所有产生式均无公共左因子为止。


{%note modern%}
例子：
文法
$S \rightarrow iEtS eS | iEtS | a$
$E \rightarrow b$
对于S而言，最长的前缀是iEtS，因此
$S \rightarrow iEtS S' | a$
$S' \rightarrow eS | ε$
$E \rightarrow b$
![](/images/1ee957decf3972068022ba6a3fa9c0fc_720.jpg)
{%endnote%}


### 消除直接左递归
（变为直接右递归，左递归对于LL（1）文法分析有影响）
对于语言：由 A 生成的串以某个$\beta_i$开头，后面跟上零个或多个$\alpha_j$，原产生式：

$$A\Rightarrow A\alpha_1|...|A\alpha_m|\beta_1|...|\beta_n$$

改写为：

$$\begin{matrix}A\Rightarrow\beta_1A'|...|\beta_nA'\\A'\Rightarrow\alpha_1A'|...|\alpha_mA'|\epsilon\end{matrix}$$
后面的空串一定不要忘记！！！！！
{%note modern%}
例子：
消除左递归（通用公式）

$$
\begin{array}{|c|}
\hline
A \to A\alpha \mid \beta \\
\hline
\end{array}
\implies
\begin{array}{|c|}
\hline
A \to \beta A' \\
A' \to \alpha A' \mid \varepsilon \\
\hline
\end{array}
$$

 表达式文法转换

$$
\begin{array}{ccc}
E \to E + T \mid T \\
T \to T * F \mid F \\
F \to (E) \mid \mathbf{id}
\end{array}
\implies
\begin{array}{ccc}
E \to T E' \\
E' \to + T E' \mid \varepsilon \\
T \to F T' \\
T' \to * F T' \mid \varepsilon \\
F \to (E) \mid \mathbf{id}
\end{array}
$$
![](/images/82bfb83ef2461dd0f85e1786e8781f5e_720.jpg)
{%endnote%}

### 间接左递归消除
其实可以直接变成直接左递归消除
还有一种通用的算法：
```
输入：没有环和ε产生式的文法G
输出：等价的无左递归的文法
步骤
将文法的非终结符号排序为A₁, A₂, …, Aₙ
for i = 1 to n do {
    for j = 1 to i - 1 do {
        将形如Aᵢ → Aⱼγ的产生式替换为Aᵢ → δ₁γ | δ₂γ | … | δₖγ，
        其中Aⱼ → δ₁ | δ₂ | … | δₖ是以Aⱼ为左部的所有产生式
    }
    消除Aᵢ的立即左递归
}
```


{%note modern%}
看这个应该是很难理解的（能理解也是神人了），其实它的想法我个人认为就是用小的非终结符（排序的）去替换，最终转换为直接递归。
例子：
$$
\begin{array}{ccc}
S→Qc|c \\
Q→Rb|b \\
R→Sa|a \\
--- \\
先排序:RQS\\
(算法思路：先用R去看看能不能代换Q，再看能不能代换S；然后再看Q能不能代换S)\\

1.Q→Sab|ab|b \\
2.S→Sabc|abc|bc|c \\
消除左递归：\\
S→abcS^{'}|bcS^{'}|cS^{'} \\
S^{'} \to abcS^{'}|\varepsilon \\
连同：
Q \to Sab|ab|b \\
R \to Sa|a \\
就是消除左递归后的产生式集合（就是消除递归）
\end{array}
$$

{%endnote%}

## 分析法构造

在文法G中，如果：
    没有任何公共左因子
    没有任何左递归
则**有可能**构造出不需要回溯的递归下降分析程序
构造不出的反例： $A\Rightarrow Ba|Cb$
![](/images/Pasted%20image%2020251116133413.png)


## 预测分析法

预测分析（forecasting parse）是一种表驱动方法，由下推栈、预测分析表和控制程序组成。它是下推自动机的实现模型。

预测分析器的执行算法：

预测分析程序总是按照栈顶符号X和当前输入符号a行事。分析开始时，栈底先放一个#，然后放进文法的开始符号。对任何(X,a)，总控程序执行下述动作之一：
①若X=a等于‘#’,分析成功，且分析过程终止；
②若X=a不等于‘#’,把X从栈顶上托，并让a指向下一个输入符号；
③若X是非终结符，则查看分析表M，若M[X,a]中存放着X的一个产生式，则上托X，并把产生式右部符号按逆序推进栈；若M[X,a]是“出错”标志，则调用出错处理程序error;

{%note modern%}

LL(1) 预测分析过程
例：
文法G1’
E→TE’
E’→+TE’|e
T→FT’
T’→*FT’|e
F→(E)|i

**待分析串:** `i+i*i#`

| 步骤  | 下推栈       | 输入串      | 查分析表动作             | 说明                                                  |
| :-: | :-------- | :------- | :----------------- | :-------------------------------------------------- |
|  1  | `#E`      | `i+i*i#` | `E→TE'`            | 栈顶`E`，输入`i`，查得产生式，弹出`E`，逆序入栈`E'、T`，栈变为`#E'T`        |
|  2  | `#E'T`    | `i+i*i#` | `T→FT'`            | 栈顶`T`，输入`i`，查得产生式，弹出`T`，逆序入栈`T'、F`，栈变为`#E'T'F`      |
|  3  | `#E'T'F`  | `i+i*i#` | `F→i`              | 栈顶`F`，输入`i`，查得产生式，弹出`F`，入栈`i`，栈变为`#E'T'i`           |
|  4  | `#E'T'i`  | `i+i*i#` | 弹出`i`，输入串变为`+i*i#` | 栈顶`i`与输入`i`匹配，弹出`i`，输入指针后移                          |
|  5  | `#E'T'`   | `+i*i#`  | `T'→ε`             | 栈顶`T'`，输入`+`，查得`T'→ε`（空产生式），弹出`T'`，栈变为`#E'`         |
|  6  | `#E'`     | `+i*i#`  | `E'→+TE'`          | 栈顶`E'`，输入`+`，查得产生式，弹出`E'`，逆序入栈`E'、T、+`，栈变为`#E'T+`   |
|  7  | `#E'T+`   | `+i*i#`  | 弹出`+`，输入串变为`i*i#`  | 栈顶`+`与输入`+`匹配，弹出`+`，输入指针后移                          |
|  8  | `#E'T`    | `i*i#`   | `T→FT'`            | 栈顶`T`，输入`i`，查得产生式，弹出`T`，逆序入栈`T'、F`，栈变为`#E'T'F`      |
|  9  | `#E'T'F`  | `i*i#`   | `F→i`              | 栈顶`F`，输入`i`，查得产生式，弹出`F`，入栈`i`，栈变为`#E'T'i`           |
| 10  | `#E'T'i`  | `i*i#`   | 弹出`i`，输入串变为`*i#`   | 栈顶`i`与输入`i`匹配，弹出`i`，输入指针后移                          |
| 11  | `#E'T'`   | `*i#`    | `T'→*FT'`          | 栈顶`T'`，输入`*`，查得产生式，弹出`T'`，逆序入栈`T'、F、*`，栈变为`#E'T'F*` |
| 12  | `#E'T'F*` | `*i#`    | 弹出`*`，输入串变为`i#`    | 栈顶`*`与输入`*`匹配，弹出`*`，输入指针后移                          |
| 13  | `#E'T'F`  | `i#`     | `F→i`              | 栈顶`F`，输入`i`，查得产生式，弹出`F`，入栈`i`，栈变为`#E'T'i`           |
| 14  | `#E'T'i`  | `i#`     | 弹出`i`，输入串变为`#`     | 栈顶`i`与输入`i`匹配，弹出`i`，输入指针后移                          |
| 15  | `#E'T'`   | `#`      | `T'→ε`             | 栈顶`T'`，输入`#`，查得`T'→ε`，弹出`T'`，栈变为`#E'`               |
| 16  | `#E'`     | `#`      | `E'→ε`             | 栈顶`E'`，输入`#`，查得`E'→ε`，弹出`E'`，栈变为`#`                 |
| 17  | `#`       | `#`      | 分析成功终止             | 栈顶`#`与输入`#`匹配，分析完成                                  |

{%endnote%}


### FIRST集
**First 集定义**：对于文法符号串 α（可以是终结符、非终结符的组合），`First(α)` 是 “α 能推导出的所有可能的首个终结符的集合”（如果 α 能推导出空串 ε，那么 ε 也包含在 First (α) 中）。

**FIRST集的构造方法**（专业版，后面有人话版）：

**对于每个文法符号 $X \in V_T \cup V_N$，连续使用下规则，直到每个 $FIRST(X)$ 不再增大。**
1.  **$X \in V_T$** (终结符)，则 $FIRST(X)=\{X\}$。
2.  **$X \in V_N$** (非终结符):
    * 且若 $X \to a\ldots$ ($a \in V_T$) 是产生式，则把 $a$ 加入 $FIRST(X)$。
    * 若 $X \to \varepsilon$ 也是产生式，则把 $\{\varepsilon\}$ 加入 $FIRST(X)$。
3.  **若 $X \to Y\ldots$** ($Y \in V_N$)，则把 $FIRST(Y)-\{\varepsilon\}$ 加入 $FIRST(X)$。
4.  **若 $X \to Y_1 Y_2 \ldots Y_k$** 且 $Y_1, Y_2, \ldots Y_{i-1}$ 都是非终结符，并有 $Y_{1} \ldots Y_{i-1} \Rightarrow^* \varepsilon$ (即 $Y_1, \ldots, Y_{i-1}$ 都能推出 $\varepsilon$)：
    * 则把所有 $FIRST(Y_j)-\{\varepsilon\}$ 加入 $FIRST(X)$，其中 $1 \le j \le i$。
    * 若 $Y_1 Y_2 \ldots Y_k \Rightarrow^* \varepsilon$ (整个串都能推出 $\varepsilon$)，则把 $\{\varepsilon\}$ 加入 $FIRST(X)$。



{%note modern%}

**为什么需要 First 集**？
意义：考虑非终结符A的所有产生式A→a1，A→a2... A→am，如果它们对应的First（）集合互不相交，则只需查看当前输入词法单元，即可确定选择哪个产生式（或报错）。

举个例子（表达式文法）：
- 产生式`F→i | (E)`，`First(i) = {i}`，`First((E)) = {(}`，所以`First(F) = {i, (}`。
- 当栈顶是`F`，输入符号是`i`时，因为`i`在`First(i)`中，所以选`F→i`；
- 当输入符号是`(`时，因为`(`在`First((E))`中，所以选`F→(E)`。

**FIRST集的构造方法**（人话版）

重点是：**看→左边**！！！我们知道FIRST集是首个终结符，所以直接看左边是最好的办法。
举个例子：
$$
\begin{array}{ll}
E \to T E' \\
E' \to + T E' \mid \varepsilon \\
T \to F T' \\
T' \to * F T' \mid \varepsilon \\
F \to (E) \mid \mathbf{i}
\end{array}
$$

结果：
$$
\begin{array}{l|l}
\text{First}(E) = \{ (, \mathbf{i} \} & \text{First}(* F T') = \{ * \} \\
\text{First}(T) = \{ (, \mathbf{i} \} & \text{First}((E)) = \{ ( \} \\
\text{First}(F) = \{ (, \mathbf{i} \} & \text{First}(\mathbf{i}) = \{ \mathbf{i} \} \\
\text{First}(E') = \{ +, \varepsilon \} & \text{First}(T E') = \{ (, \mathbf{i} \} \\
\text{First}(T') = \{ *, \varepsilon \} & \text{First}(+ T E') = \{ + \} \\
\text{First}(F T') = \{ (, \mathbf{i} \} &
\end{array}
$$
分析：

我们把先把所有的字符串给挑出来：E,T...\*FT'....

然后我们一个一个看，先看E，有式子：$E \to T E'$，所以看T，T也是非终结符，继续看：$T \to F T'$，所以看F，F也是非终结符，继续看：$F \to (E) \mid \mathbf{i}$，诶！你看这个`(`和`i`就是终结符了，所以$\text{First}(E) = \{ (, \mathbf{i} \}$.

再看一个$E'$，$E' \to + T E' \mid \varepsilon$，不要只写一个`+`！！！，一定要记得：$\varepsilon$

我们再看一个FT'，由于字符串的规则，我们直接看F就好了，F求过了抄一下就可以。
而*FT',左边*直接就是！

{%endnote%}


### FOLLOW集
**Follow 集定义**：对于非终结符`A`，`Follow(A)` 是 “所有可能出现在`A`后面的终结符的集合”。

 **FOLLOW 集的构造方法**（专业版，后面有人话版）：
对于文法 $G$ 的每个文法符号 $A$，连续使用如下规则，直到 $FOLLOW(A)$ 不再增大。
1.  **对于文法的开始符号 $S$**：
    * 把 $\#$ 加入 $FOLLOW(S)$。
2.  **对于产生式 $A \to \alpha B \beta$**：
    * 把 $FIRST(\beta) - \{\varepsilon\}$ 加入 $FOLLOW(B)$。
3.  **对于产生式 $A \to \alpha B$ 或者 $A \to \alpha B \beta$ 且 $\beta \Rightarrow^* \varepsilon$**：
    * 将 $FOLLOW(A)$ 加入 $FOLLOW(B)$。

{%note modern%}

 **为什么需要 FOLLOW 集？**
- **作用：** 确定非终结符 $A$ **后面可能出现的终结符**。
- **应用场景（空串 $\varepsilon$）：** 当 $A$ 的产生式 $A \to \alpha$ 中 $\alpha$ 可以推导出 **epsilon (空串)** 时，分析器需要看 $A$ 后面应该出现什么符号。如果当前输入符号 $a$ 在 $FOLLOW(A)$ 中，说明 $A$ 应该选择推导出 **epsilon (空串)**，让 $a$ 留给后面的文法结构去匹配。


 **FOLLOW 集的构造方法**（人话版）：
 
核心：**看→右边！**

举个例子：（和上面例子一样）
$$
\begin{array}{ll}
E \to T E' \\
E' \to + T E' \mid \varepsilon \\
T \to F T' \\
T' \to * F T' \mid \varepsilon \\
F \to (E) \mid \mathbf{i}
\end{array}
$$
结果：
$$
\begin{array}{l|l}
\text{Follow}(E) = \{ \#, ) \} & \text{Follow}(T') = \{ +, \#, ) \} \\
\text{Follow}(T) = \{ +, \#, ) \} & \text{Follow}(F) = \{ *, +, \#, ) \} \\
\text{Follow}(E') = \{ \#, ) \} &
\end{array}
$$
分析：
FOLLOW集只需要写非终结符就可以，先找出所有的符号（之前已经写完了FIRST集）

然后对于E：这个E是开始符号，直接加上#（规则1）！找所有的规则那个右边有E，$F \to (E) \mid \mathbf{i}$，这里有右侧有E，E右边是),)是终结符，直接写进去（规则2）（FIRST（终结符）=终结符本身），所以$\text{Follow}(E) = \{ \#, ) \}$


对于T：$E \to T E' (1)$出现T，$E' \to + T E'\mid \varepsilon (2)$出现T，先看（1），T后面是E’，所以根据规则2：FOLLOW(T)=FIRST(E')-{$\varepsilon$}，由于之前求过FIRST(E')，所以就是{+}。
但是先别急！看看规则3，里面说：$A \to \alpha B \beta$ 且 $\beta \Rightarrow^* \varepsilon$!，看一下E'，它是可以推出$\varepsilon$的（看看（2）式），所以要把$E \to T E' (1)$中的左部的FOLLOW（E）放到FOLLOW（T）中（规则3），所以目前是{+，#，）}，我们现在就看完了（1）。
但是还是别急！我们还得看（2）式，毕竟这里面也有T，同上的操作，我们发现现在对于$E' \to + T E'\mid \varepsilon (2)$，我们也要把左部FOLLOW（E‘）放到FOLLOW（T），FOLLOW（E‘）还没求，所以先求这个。

FOLLOW（E‘）我们还是找到上面的（1），（2）式，发现E'后面没有跟东西，也就是规则3所说： $A \to \alpha B$ ,所以式子（1）就是把FOLLOW（E）放到FOLLOW（E’），式子（2）发现是一个递归把FOLLOW（E‘）放到FOLLOW（E’），所以不用动，就是自己本身，就是$\text{Follow}(E') = \{ \#, ) \}$

所以，现在可以转回求FOLLOW（T)了，把FOLLOW（E‘）放到FOLLOW（T），所以
$\text{Follow}(T) = \{+, \#, ) \}$！


总结：**就是找右部哪里有这个非终结符，然后看它右边，没有东西规则3，直接把左部FOLLOW放上去；有东西放FIRST(x)减空串（对于终结符就是直接写，对于非终结符就是其FIRST)，然后看看这个是不是能推导出空串，能的话，也把左部FOLLOW放上去。**

{%endnote%}

没有 First 集，无法判断 “产生式开头能匹配什么符号”；没有 Follow 集，无法处理 “产生式推导出空串时的后续匹配”。这两个集合共同保证了每一步产生式的选择都是**唯一且正确**的，最终实现无回溯的高效分析 —— 这就是它们出现的核心原因。

### 预测分析表

分析表 $M[A, a]$ 的意思是：“当**当前非终结符是 $A$**，而**下一个输入符号是 $a$** 时，应该使用哪个产生式？”

对于文法 G 的每个产生式 $A \Rightarrow \alpha$
- ∀$a \in \text{First}(\alpha)$，将产生式加入到 M[A, a] 中。（如果规则 $A \to \alpha$ **一定会**以终结符 $a$ 开始，那么当看到 $a$ 时，我们**就选** $A \to \alpha$。）
- 如果 $ε \in \text{FIRST}(\alpha)$， ∀$b \in \text{FOLLOW}(A)$，将产生式加入到 M[A, b] 中。（如果规则 $A \to \alpha$ 可以推导出**空**（即 $A$ 可以“消失”），那么我们不能看 $A$ 的 $FIRST$ 集了，我们要看 $A$ **后面**应该跟着什么。当输入符号 $b$ 是 $A$ 后面的合法符号时，我们就选择 $A \to \varepsilon$，让 $A$ 消失，这样才能匹配后面的 $b$。）
- 空白项填入 error。
![](/images/Pasted%20image%2020251116174941.png)

## **LL(1)文法**

如果文法G的预测分析表中**不含冲突表项**，则称文法G为**LL(1)文法**。
对于LL(1)文法，在进行预测分析过程中的每一步，都可以根据当前的输入符号，选择唯一的产生式进行推导。
并非所有文法都是LL(1)文法。

{%note modern%}
例子：
$$
\begin{array}{ll}
S \to \mathbf{i} C \mathbf{t} S \mid \mathbf{i} C \mathbf{t} S \mathbf{e} S \mid \mathbf{a} \\
C \to \mathbf{b}
\end{array}
$$
提取左公因子：
$$
\begin{array}{ll}
S \to \mathbf{i} C \mathbf{t} S S' \mid \mathbf{a} \\
S' \to \mathbf{e} S \mid \varepsilon \\
C \to \mathbf{b}
\end{array}
$$

| 非终结符 | FIRST | FOLLOW |
| :---: | :---: | :---: |
| $S$ | $\{\mathbf{i}, \mathbf{a}\}$ | $\{\#, \mathbf{e}\}$ |
| $S'$ | $\{\mathbf{e}, \varepsilon\}$ | $\{\#, \mathbf{e}\}$ |
| $C$ | $\{\mathbf{b}\}$ | $\{\mathbf{t}\}$ |
预测表：

$$
\begin{array}{|c||c|c|c|c|c|c|}
\hline
\text{非终结符} & \mathbf{a} & \mathbf{b} & \mathbf{e} & \mathbf{i} & \mathbf{t} & \# \\
\hline
\hline
S & S \to \mathbf{a} & & & S \to \mathbf{i} C \mathbf{t} S S' & & \\
\hline
S' & & & 
\begin{array}{c}
S' \to \mathbf{e} S \\
S' \to \varepsilon \\
\end{array}
& & & S' \to \varepsilon \\
\hline
C & & C \to \mathbf{b} & & & & \\
\hline
\end{array}
$$
有冲突表项，不是！
结论：该文法不是LL(1)文法。事实上，不必构造预测分析表也可得出该结论，因为S'→eS|ε,同时
$$FIRST(eS){\frown}FOLLOW(S’)=\{e\}\neq\emptyset;$$
补充：
**SELECT集**：
产生式$A{\rightarrow}\boldsymbol{\alpha}$的可选集SELECT
$>如果\varepsilon\not\in FIRST(\alpha)$,那么SELECT$(A\to\alpha)=FIRST(\alpha)$
$>如果\varepsilon\in FIRST(\alpha)$,那么SELECT$(A\to\alpha)=(FIRST(\alpha)-\{\varepsilon\})\cup FOLLOW(A)$
（还是之前FIRST，FOLLOW的例子）
$$
\begin{array}{ll}
E \to T E' \\
E' \to + T E' \mid \varepsilon \\
T \to F T' \\
T' \to * F T' \mid \varepsilon \\
F \to (E) \mid \mathbf{i}
\end{array}
$$
$$
\begin{array}{ll}
SELECT(E' \to + T E') & = \{+\} \\
SELECT(E' \to \varepsilon) & = \{), \#\} \\
SELECT(T' \to * F T') & = \{*\} \\
SELECT(T' \to \varepsilon) & = \{+, ), \#\} \\
SELECT(F \to (E)) & = \{( \} \\
SELECT(F \to \mathbf{i}) & = \{\mathbf{i}\}
\end{array}
$$

(只需要找两个及以上的产生式！因为LL（1）文法判定只需要看两个及以上产生式)

LL（1）文法判定：

一个文法 $G$ 是 LL(1) 文法，当且仅当对于该文法中的**每一个非终结符 $A$** 的所有不同产生式 $A \to \alpha$ 和 $A \to \beta$，它们对应的 **SELECT 集** 满足以下条件：

$$
SELECT(A \to \alpha) \cap SELECT(A \to \beta) = \emptyset
$$

*(附加说明： $\alpha$ 和 $\beta$ 最多只有一个能推导出 $\varepsilon$)*

（也就是相同左部产生式的可选集的交集是空集就是LL（1））

{%endnote%}

{%note modern%}
## 补充习题！
![](/images/Pasted%20image%2020251116184116.png)


![](/images/Pasted%20image%2020251116184143.png)
![](/images/Pasted%20image%2020251116184154.png)
图中i其实是：（可能是打错了）

{%endnote%}


# 自下而上的语法分析


## 算法过程
步骤：
![](/images/Pasted%20image%2020251116215645.png)
## 素短语

接（语法树）的概念：
**素短语 (Simple Phrase)**：
1. **至少包含一个终结符**。
2. 该短语**不包含满足第 1 条条件**的比它更小的短语。
**最左素短语 (Handle)**：
- 一个句型中，**最左边的素短语** 称为 **最左素短语（即句柄）**。

{%note modern%}
例子：
$$
\begin{array}{l}
S \to S ; S \mid G \\
G \to G (T) \mid H \\
H \to \mathbf{a} \mid (S) \\
T \to T + S \mid S
\end{array}
$$
句型 $\mathbf{a}(T+S); \mathbf{i}; S$
语法树：（慢慢推导，先推导再画）
![](/images/f78bdf8b769cc53063701f50391864e5_720.jpg)
短语：
* $\mathbf{a}$ 是句型相对于 $H, G$ 的短语。
    * (即 $H \Rightarrow \mathbf{a}$ 且 $G \Rightarrow^{+} \mathbf{a}$)
* $T+S$ 是句型相对于 $T$ 的短语。
    * (即 $T \Rightarrow T+S$)
* $\mathbf{a}(T+S)$ 是句型相对于 $G, S$ 的短语。
    * (即 $G \Rightarrow^{+} \mathbf{a}(T+S)$ 且 $S \Rightarrow^{+} \mathbf{a}(T+S)$)
* $H$ 是 句型相对于 $G$ 的短语。
    * (即 $G \to H$)
* $\mathbf{a}(T+S); H$ 是 句型相对于 $S$ 的短语。
    * (这是句型 $\mathbf{a}(T+S); \mathbf{i}; S$ 中 $\mathbf{i}$ 归约为 $H$ 后的子串，相对于 $S$ 的短语。)
* $(S)$ 是句型相对于 $H, G$ 的短语。
    * (即 $H \to (S)$ 且 $G \Rightarrow^{+} (S)$)
* $\mathbf{a}(T+S); \mathbf{i}; S$ 是 ... $S$ 的短语。
    * (即 $S$ 是整个句型相对于开始符号 $S$ 的短语。)
素短语先看a，是的！
再看T+S是的！
a(T+S)不是！因为之前有a了！
......
素短语：a,T+S,(S)
最左素短语：a


{%endnote%}











## 算符优先分析法

- **算符文法**：上下文无关文法G，如果没有形如 P→ε 和 P→...QR...(就是说没有两个相连的非终结符) 的产生式，则称G为算符文法。
- **优先级关系：** 对算符文法 $G$ 的任意终结符 $a$、$b$，定义其优先级关系如下：
1.  **等于 ($\doteq$) 关系：**
    如果存在产生式 $P \to \ldots a b \ldots$ 或 $P \to \ldots a Q b \ldots$，则 $a \doteq b$。
    ![](/images/Pasted%20image%2020251116214820.png)
2.  **小于 ($\lessdot$) 关系：**
    如果存在产生式 $P \to \ldots a Q \ldots$，且 $Q \Rightarrow^{+} b \ldots$ 或 $Q \Rightarrow^{+} R b \ldots$，则 $a \lessdot b$。
    ![](/images/Pasted%20image%2020251116214826.png)
3.  **大于 ($\gtrdot$) 关系：**
    如果存在产生式 $P \to \ldots Q b \ldots$，且 $Q \Rightarrow^{+} \ldots a$ 或 $Q \Rightarrow^{+} \ldots a R$，则 $a \gtrdot b$。
    ![](/images/Pasted%20image%2020251116214847.png)
- 算符优先文法：如果算符文法G的任何两个终结符之间的关系至多只有<,=,>中的一个优先关系，则称该文法为算符优先文法。（(a,b)与(b,a)不一样！）相同终结符之间的优先关系未必是“=”。

### FIRSTVT集

定义
对 $P \in V_N$ (非终结符 $P$)，有：
$$
FIRSTVT(P) = \{ a \mid P \Rightarrow^{+} a\ldots \text{ 或 } P \Rightarrow^{+} Q a\ldots, a \in V_T, Q \in V_N \}
$$

构造方法
1. **逐一考察每一个产生式**。
2. **若 $P \to a\ldots$ 或 $P \to Q a\ldots$**：
   * 则将 $a$ 加入 $FIRSTVT(P)$。
3. **若 $P \to Q\ldots$**：
   * 则将 $FIRSTVT(Q)$ 加入 $FIRSTVT(P)$。
**反复执行上述操作**，直到所有非终结符的 $FIRSTVT$ 不再增大。

总结：单独出现，再非终结符
### LASTVT集

定义
对 $P \in V_N$ (非终结符 $P$)，有：
$$
LASTVT(P) = \{ a \mid P \Rightarrow^{+} \ldots a \text{ 或 } P \Rightarrow^{+} \ldots a Q, a \in V_T, Q \in V_N \}
$$

构造方法
1. **逐一考察每一个产生式**。
2. **若 $P \to \ldots a$ 或 $P \to \ldots a Q$**：（a在第一个位置或者第二个位置）
   * 则将 $a$ 加入 $LASTVT(P)$。
3. **若 $P \to \ldots Q$**：
   * 则将 $LASTVT(Q)$ 加入 $LASTVT(P)$。
**反复执行上述操作**，直到所有非终结符的 $LASTVT$ 不再增大。

总结：
- **FIRSTVT 找左边**：
    
    - 看到 $a\dots$ 或 $Qa\dots$，直接拿 $a$。
        
    - 看到 $Q\dots$，把 $Q$ 的东西拿过来。
        
- **LASTVT 找右边**：
    
    - 看到 $\dots a$ 或 $\dots aQ$，直接拿 $a$。
        
    - 看到 $\dots Q$，把 $Q$ 的东西拿过来。
### 算符优先关系计算规则

```

for ( 每条产生式 P→X1X2…Xn )
{
  for ( i=1 to n-1 )
  {
    if ( Xi∈VT，Xi+1∈VT ) { Xi = Xi+1 }
    
    if ( Xi∈VT，Xi+1∈VN，Xi+2∈VT ) { Xi = Xi+2 }
    
    if ( Xi∈VT, Xi+1∈VN ) { "a∈FIRSTVT(Xi+1)，Xi<a }
    
    if ( Xi∈VN, Xi+1∈VT ) { "a∈LASTVT(Xi)，a>Xi+1 }
  }
}
```


{%note modern%}
$$
\begin{array}{l}
E \to E + T \mid T \\
T \to T * F \mid F \\
F \to (E) \mid \mathbf{i}
\end{array}
$$

先来走一遍FIRSTVT：
第一遍先把这个布尔表画一下：

$$
\begin{array}{|c||c|c|c|c|c|}
\hline
\text{FIRSTVT} & + & * & \mathbf{i} & ( & )\\
\hline
\hline
E &  &  &  &  &\\
\hline
T & &  &  &  &\\
\hline
F & & &  &  &\\
\hline
\end{array}
$$
走一个$E \to E + T \mid T$，我们看要把+打钩（构造2），然后再把T的表放给E（构造3）：
$$
\begin{array}{|c||c|c|c|c|c|}
\hline
\text{FIRSTVT} & + & * & \mathbf{i} & ( & )\\
\hline
\hline
E & 1 &  &  &  &\\
\hline
T & &  &  &  &\\
\hline
F & & &  &  &\\
\hline
\end{array}
$$
继续下一个：$T \to T * F \mid F$（同理）
$$
\begin{array}{|c||c|c|c|c|c|}
\hline
\text{FIRSTVT} & + & * & \mathbf{i} & ( & )\\
\hline
\hline
E & 1 &  &  &  &\\
\hline
T & & 1 &  &  &\\
\hline
F & & &  &  &\\
\hline
\end{array}
$$
下一个：$F \to (E) \mid \mathbf{i}$：

$$
\begin{array}{|c||c|c|c|c|c|}
\hline
\text{FIRSTVT} & + & * & \mathbf{i} & ( & )\\
\hline
\hline
E & 1 &  &  &  &\\
\hline
T & & 1 &  &  &\\
\hline
F & & &  1& 1 &\\
\hline
\end{array}
$$
由于这一轮表格发生了变化，因此继续走一轮：

再走一次$E \to E + T \mid T$，我们看要把+打钩，然后再把T的表放给E（这时候刚好是更新后的T）：
$$
\begin{array}{|c||c|c|c|c|c|}
\hline
\text{FIRSTVT} & + & * & \mathbf{i} & ( & )\\
\hline
\hline
E & 1 & 1 &  &  &\\
\hline
T & & 1 &  &  &\\
\hline
F & & &  1& 1 &\\
\hline
\end{array}
$$
下一个：$T \to T * F \mid F$
$$
\begin{array}{|c||c|c|c|c|c|}
\hline
\text{FIRSTVT} & + & * & \mathbf{i} & ( & )\\
\hline
\hline
E & 1 & 1 &  &  &\\
\hline
T & & 1 & 1 &1  &\\
\hline
F & & &  1& 1 &\\
\hline
\end{array}
$$
下一个：$F \to (E) \mid \mathbf{i}$：
$$
\begin{array}{|c||c|c|c|c|c|}
\hline
\text{FIRSTVT} & + & * & \mathbf{i} & ( & )\\
\hline
\hline
E & 1 & 1 &  &  &\\
\hline
T & & 1 & 1 &1  &\\
\hline
F & & &  1& 1 &\\
\hline
\end{array}
$$
由于这一轮表格发生了变化，因此继续走一轮：
再走一次$E \to E + T \mid T$...

所以最终：
$$
\begin{array}{|c||c|c|c|c|c|}
\hline
\text{FIRSTVT} & + & * & \mathbf{i} & ( & )\\
\hline
\hline
E & 1 & 1 & 1 & 1 &\\
\hline
T & & 1 & 1 &1  &\\
\hline
F & & &  1& 1 &\\
\hline
\end{array}
$$
LASTVT同理！
$$ \begin{array}{|c||c|c|c|c|c|} \hline \text{集合} & + & * & \mathbf{i} & ( & ) \\ \hline \hline E & 1 & 1 & 1 & & 1 \\ \hline T & & 1 & 1 & & 1 \\ \hline F & & & 1 & & 1 \\ \hline \end{array} $$
结果：

$$
\begin{array}{|c|c|c|}
\hline
\text{非终结符} & \text{FIRSTVT} & \text{LASTVT} \\
\hline
E & \{ (, \mathbf{i}, *, + \} & \{ ), \mathbf{i}, *, + \} \\
\hline
T & \{ (, \mathbf{i}, * \} & \{ ), \mathbf{i}, * \} \\
\hline
F & \{ (, \mathbf{i} \} & \{ ), \mathbf{i} \} \\
\hline
\end{array}
$$

构造算符优先关系表：
一定要紧扣定义！！！
等于：$P \to \ldots a b \ldots$ 或 $P \to \ldots a Q b \ldots$也就是说要找找看有没有两个相连或者差一个非终结符的终结符！很明显$F \to (E)$ 中（）就是一对等于。
小于：$P \to \ldots a Q \ldots$，且 $Q \Rightarrow^{+} b \ldots$ 或 $Q \Rightarrow^{+} R b \ldots$，其实就是要找这么一对：`终结符非终结符`形式。这里就是：+T,*F,(E，然后**这个终结符小于FIRSTVT(非终结符)**，例如：+<*(T的FIRSTVT中的）！

$$
\begin{array}{|c||c|c|c|c|c|}
\hline
\text{关系} & + & * & ( & ) & \mathbf{i} \\
\hline
\hline
+ &  & \lessdot & \lessdot &  & \lessdot \\
\hline
* &  &  & \lessdot &  & \lessdot \\
\hline
( & \lessdot & \lessdot & \lessdot & \doteq & \lessdot \\
\hline
) & & & &  & \\
\hline
\mathbf{i} & & & & & \\
\hline
\end{array}
$$

大于：$P \to \ldots Q b \ldots$，且 $Q \Rightarrow^{+} \ldots a$ 或 $Q \Rightarrow^{+} \ldots a R$，其实就是要找这么一对：`非终结符终结符`形式。这里就是：E+,T*,E)，然后**这个LASTVT(非终结符)大于终结符**，例如：）(LASTVT中的)>+
⚖️ 算符优先关系表完整：
注意：等号的点应该在两条横线里面（不好打就这样展示了）

$$
\begin{array}{|c||c|c|c|c|c|}
\hline
\text{关系} & + & * & ( & ) & \mathbf{i} \\
\hline
\hline
+ & \gtrdot & \lessdot & \lessdot & \gtrdot & \lessdot \\
\hline
* & \gtrdot & \gtrdot & \lessdot & \gtrdot & \lessdot \\
\hline
( & \lessdot & \lessdot & \lessdot & \doteq & \lessdot \\
\hline
) & \gtrdot & \gtrdot & & \gtrdot & \\
\hline
\mathbf{i} & \gtrdot & \gtrdot & & \gtrdot & \\
\hline
\end{array}
$$
总结：（注意看的顺序！所以在左边的都是左边的列，右边的都是上面的行）
直接相邻，或中间隔一个非终结符。
终结符在左，小 $(<)$ 后面非终结符的 FIRSTVT。终结符在列
**终结符在右，前面非终结符的 LASTVT 大 $(>)$ 它。终结符在行**
**# 小于 开始符号的 FIRSTVT**：
开始符号的 LASTVT 大于 #
\# 等于 \#

例题：

![](/images/Pasted%20image%2020251116214416.png)
![](/images/Pasted%20image%2020251116214424.png)




{%endnote%}








## LR分析法

### LR（0）项目

- 定义：在产生式右部添加一个圆点，用于表示句柄与符号栈之间的三种关系：A→•αβ、A→α•β、A→αβ•。空产生式有且仅有一个项目A->·

- 分类
移进项目：形如A→…•a… ，a是终结符
待约项目：形如A→…•B … ，B是非终结符
归约项目：形如A→…• ，最右端
接受项目：形如S→…• （S为开始符）（归约的特殊）

**移进规约和规约规约冲突**
- 拓广文法
对文法G，增加产生式S'→S，把开始符改为S'，形成文法G'。在文法G'中，S'→S•是唯一的接受项目。
{%note modern%}

例：文法G2经拓广后得到G2'
①S'→S
②S→BB
③B→aB
④B→b
文法G2'的所有LR(0)项目为
①S'→•S
②S'→S•
③S→•BB
④S→B•B
⑤S→BB•
⑥B→•aB
⑦B→a•B
⑧B→aB•
⑨B→•b
10.B→b•
{%endnote%}

- 项目集规范族




# 语义分析

语义检查

一致性检查（数据类型是否一致、操作是否合法）
越界检查（数组维数是否正确、下标是否越界）

语义处理

说明语句的翻译（相关信息登记到符号表中）
执行语句的翻译（生成等价的中间代码）

随着语法分析的进行，语义子程序依次被调用，对各个符号的语义值进行操作，生成相应的中间代码，完成将源程序翻译成中间代码的任务。

在语法分析的过程中，根据每个产生式所对应的语义子程序（语义动作）进行翻译（生成中间代码）的方法称为语法制导翻译。

中间代码是一种介于源程序和目标程序之间的程序，它形式简单，语义明确，且不依赖于任何具体的目标机器。
中间代码有多种不同的形式，如：三地址码、四元式、后缀式、语法树等。
1.  说明类

  var x

  label L

  para x

  arg x

2.  运算类

  x = y

  x = op y

  x = y op z
 
3.  转移类

  goto L

  if x goto L

  ifz x goto L

4.  函数类

  start

  end

  call L

  return x


示例语言的变量说明语句：

  int a , b , c ;

采用下列语法规则：

  T → int

  T → T i ,

  S → T i ;
  




##  局部优化

优化方法：
   合并已知量：常数，能计算的可在编译阶段计算
   删除公共子表达式：删除多余、重复的计算/表达式
   删除无用赋值：被赋值的变量后续没有被引用，则赋值无用，可删除。
   删除死代码：对于分支语句，如果条件一定为真或者假，就可以删除一定不会进入的分支代码

## 全局优化：
  1.  代码外提：循环内的变量如果不变，可以移到循环之外执行
2. 强度削弱：基本归纳变量的乘法变加法
3. 删除归纳变量：用同族归纳变量作为判断条件，如基本归纳别无它用，则可将其删除。










参考资料：
[编译原理 - 飞书云文档](https://g9tvo9xbp6.feishu.cn/wiki/PhaqwXq9Xih3J6kqyNucrvyXn7g)（校园文档）
[第四章：算符优先分析（下）_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1FQ4y1r7ub?spm_id_from=333.788.videopod.episodes&vd_source=a11961ebf6a3ea45f94404bd5d0461d4&p=6)（讲的巨好！！！）
[LR分析_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1wb4y1B7dd?spm_id_from=333.788.videopod.episodes&vd_source=a11961ebf6a3ea45f94404bd5d0461d4)（LR分析讲的很清楚！）
PPT-左志鸿老师
PPT-余盛季老师
