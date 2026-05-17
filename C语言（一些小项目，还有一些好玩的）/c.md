





c

## 基础

```
a!=0;  a不等于0

！a, 非

b&&a  与

a ||b   或

类型转换

#include <stdio.h>

  

int main(){

    显式转换

    float x;

    int i=0;

    x=3.6f;

  

    i=(int)x;

    printf("x=%f,i=%d\n",x,i);

  

    隐式转换

    int a;

    a=10;

    float c=3.14f;

    printf("a/3=%d\n",a/3);

    printf("c=%.1f\n",c);

    return 0;

}

  

三目运算符

int main(){

  

int a=10;

int b=20;

int c;

c=(a>b?a:b);

printf("%d",a);

return 0;

}

  

找出3个数的最大值

int main(){

    int a,b,c,max;

    printf("请输入a,b,c");

    scanf("%d  %d  %d",&a,&b,&c);

    max=(a>b)?(a>c?a:c):(b>c?b:c);

    printf("%d\n %d\n %d\n %d",a,b,c,max);

    return 0;

    if(a>b){

        max=a;

    }

    else

    {

        max=b;

    }

}

  

#include <stdio.h>

  

1.switch

int main(){

    char c;

    c=getchar();

    switch(c)//整形数据

    {

    case'1':

        printf("OK\n");

        break;

    case'2':

        printf("NOT OK\n");

        break;      

    default:

    printf("无");

    break;

    }

  

    return 0;

}

  

2.while

int main(){

    int i=0;

    while (i<10)

    {

        printf("%d\n",i);

        i++;

    }

    return 0;

}

  

3.do

int main()

{

    int a;

    do

    {

        a++;

        printf("%d\n",a);

    }while(a<10);

    return 0;

}

  
  
  
  
  
  
  
  

4.for

int main(){

    for(int i=0;i<10;i++)

    {

        printf("%d\n",i);

    }

    return 0;

}

  
  
  
  

5.break,跳出一层·

int main(){

    int i=0;

    while(1){

        printf("i=%d\n",i);

        i++;

        if(i==10)

        {

            break;

        }

    }

    return 0;

}

  
  
  

6.continue,这个循环之后的代码不会继续运行

int main(){

    for(int a=0;a<11;a++)

    {

        if(a%2==1)

        {

            continue;

        }

        printf("%d\n",a);

    }

    return 0;

}
```



## 数组

- 376!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  ```
  #include <stdio.h>
  
  #include <string.h>
  
  int main(){
  
      //1.一维数组的定义，使用
  
      int a[10];//下标0-9
  
      a[0]=0;//赋值
  
      for(int i=0;i<10;i++)
  
      {
  
          a[i]=i;
  
      }
  
      for(int j=0;j<10;j++)
  
      {
  
          printf("a[%d]=%d\n",j,a[j]);
  
      }
  
      //2.初始化
  
      int a1[10]={0,1,2,3,4,5,6,7,8,9};
  
      int b[10]={0,1};//只有前两个是0，1
  
      int c[10]=([4]=0);
  
      int d[]={0,1,2,3};
  
      //3。数组名代表第一个元素的首字母
  
      //4。得到元素的个数
  
    
    
  
      printf("%d",sizeof(a));
  
      printf("%d",sizeof(a[0]));
  
    
  
      int numb=sizeof(a)/sizeof(a[0]);
  
      printf("%d",numb);
  
      //5.求出一维数组最大值||遍历+if
  
      int a[]={234,24,5,54,4,23,324};
  
      int max=a[0];
  
      for(int i=0;i<sizeof(a)/sizeof(a[0]);i++)
  
      {
  
          if(a[i]>max)
  
          {
  
              max=a[i];
  
          }
  
      }
  
      printf("%d",max);
  
    
  
  //6.一维数组逆置
  
  int a[]={21,24,324,545,23,42};
  
      for(int k=0;k<6;k++)
  
      {
  
          printf("a[%d]=%d\n",k,a[k]);
  
      }
  
    
  
  int t;
  
  int s;
  
  s= (sizeof(a)/sizeof(a[0]))-1;//1 2 3 4 5
  
  int i=0;
  
  while(i<s)//key
  
  {
  
      t=a[i];//交换
  
      a[i]=a[s];
  
      a[s]=t;
  
      i++;
  
      s--;
  
  }
  
    
    
    
  
      for(int u=0;u<6;u++)
  
      {
  
          printf("a[%d]=%d\n",u,a[u]);
  
      }
  
      //7.二维数组定义与使用
  
  int a[3][4];
  
  int i,j;
  
  int n=0;
  
  for(i=0;i<3;i++)
  
  {
  
      for(j=0;j<4;j++)
  
      {
  
          a[i][j]=n;
  
          n++;
  
          printf("a[%d][%d]=%d\n",i,j,a[i][j]);
  
      }
  
  }
  
    
  
  //8.二维数组初始化
  
  int a[3][4]={{1,2,3,4},{5,6,7,8},{9,10,11,12}}or{1,2,3,4.........}or{0}or{1,2,3,4}
  
    
  
  9.求出平均成绩和不及格人数
  
      语文  数学  英语
  
  1      80    75    56
  
  2      59    65    71
  
  3      59    63    70
  
  4      85    45     90
  
  5      55    45     45
  
  to discover thr way to attain the asummary
  
  int stu[5][3]={{80,75,56},{59,65,71},{59,63,70},{85,45,90},{55,45,45}};
  
  int i,j,k;
  
  float sum[3],aver[3];
  
  int notpass[3];
  
  for(i=0;i<5;i++)
  
  {
  
      for(j=0;j<3;j++)
  
      {
  
          sum[j]+=stu[i][j];
  
      }
  
  }
  
    
  
  for(k=0;k<3;k++)
  
  {
  
      printf("%.2f\n",sum[k]);
  
  }
  
    
  
  to find the amount of the people who doesn't pass  
  
  for(i=0;i<5;i++)
  
  {
  
      for(j=0;j<3;j++)
  
      {
  
          if(stu[i][j]<60)
  
          {
  
              notpass[j]+=1;
  
          }
  
      }
  
  }
  
      for(int y=0;y<3;y++)
  
  {
  
      printf("%d\n",notpass[y]);//Q:第二个数据出现异常，原因不详   、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、
  
  }
  
      10.字符数组
  
  char a[]={'w','a','t','\0','9'};//\0，停止
  
  printf("%s",a);
  
    
  
  //11.字符串的输入
  
  1.scanf
  
  char str[100];
  
  scanf("%s",str);
  
  2.gets
  
  gets(str);
  
  printf("%s\n",str);
  
  3.fgets
  
  fgets(str,100,stdin);//从标准输入中输入
  
  printf("%s\n",str);
  
    
    
    
    
  
  12.输出
  
  1.printf
  
  2.puts
  
  puts("safsdvsd");//结尾自动换行
  
  3.fputs
  
  fputs("bbhsda\n",stdout);//标准输出，不加换行
  
    
  
  14.strlen--求出字符串的长度
  
  char str[]={"svsvvdsvsdv"};
  
  int a=strlen(str);
  
  printf("%d",a);
  
  头文件：#include <string.h>
  
    
  
  15.fgets ----strlen去除结尾\n   ////////////////////////////////////////////////////////////////////////////////////////////////////////////目前用不到
  
  char strl[20]={0};
  
  fgets(strl,20,stdin);
  
  printf("[%s]\n",strl);
  
  printf("%d",strlen(strl));
  
  strl[strlen(strl)-1]=0;
  
  printf("[%s]\n",strl);
  
  16.字符串追加效果
  
  char str1[]="abcd";
  
  char str2[]="123";
  
  char dst[100]={0};//赋值0结束
  
    
  
  int i=0;//定义0
  
  while(str1[i]!=0)
  
  {
  
      dst[i]=str1[i];
  
      i++;
  
  }
  
    
  
  int j=0;
  
  while(str2[j]!=0)
  
  {
  
      dst[i]=str2[j];
  
      i++;
  
      j++;
  
  }
  
  printf("%s",dst);
  
    
  
  补充字符串追加函数：strcat
  
      char str1[]="abcd";
  
  char str2[]="123";
  
  strcat(str1,str2);
  
  printf("%s",str1);  
  
    
  
  17.px-mp法
  
  #include <stdio.h>
  
    
    1111111111111111111111111111 
  
  void bubble_lz(int arr[], int size)
  
  {
  
      int i, j, tem;
  
      for (i = 0; i < size - 1; i++)
  
      {
  
          int con = 0;
  
          for (j = 0; j < size-1-i; j++)
  
          {
  
              if (arr[j] > arr[j + 1])
  
              {
  
                  tem = arr[j];
  
                  arr[j] = arr[j + 1];
  
                  arr[j + 1] = tem;
  
                  con = 1;
  
              }
  
    
  
          }
  
          if (con == 0)
  
          {
  
              break;
  
          }
  
      }
  
  }
  
    
  
  int main() {
  
    
    
  
      int y;
  
      int ap[10] = { 1,2,3,3,43,5,34,345,7,65};
  
      printf("please put ten number:");
  
      for (y = 0; y < 10; y++)
  
      {
  
          scanf("%d", &ap[y]);
  
      }
  
      printf("before\n");
  
      for(y=0;y<10;y++)
  
  {
  
      printf("%d\n",ap[y]);
  
  }
  
    
  
      bubble_lz(ap, 10);
  
      printf("after\n");
  
      for (y = 0; y < 10; y++)
  
      {
  
          printf("%d,", ap[y]);
  
      }
  
      return 0;
  
  }
  ```


## 指针

```
inner will

#define _CRT_SECURE_NO_WARNINGS//不要报警告

#include <stdio.h>

#include <stdlib.h>

int main(){

    1.地址printf

    int a=0;

    char b=100;

    printf("%p\n%p\n",&a,&b);

    2.基本

    int*p;

    p=&a;

    printf("%d\n",*p);

    char*p1=&b;

    printf("%c\n",*p1);//*p打印指针所指向的内存空间中的值，p为地址

    3.通过指针改变量的值

    int a=0;

    int b=11;

    int*p=&a;

    *p=100;//*p 相当于访问了地址a的内容

    printf("%d",a);

    4.指针大小：不论如何得到的总是4（32bit），8（64bit)

  

    5.y野指针

    int a;

    int*p;

    p=a;//野指针指向的任意地址是不可访问的，操作系统不允许操作

    p=0x12345678;//非有效内存

  

    6.空指针*

int*p=NULL;//p=0

ps：#define NULL((void*)0)

    7.void 万能指针,指向任意类型   ps:void类型不可赋值————*p=12.342 不行

    void*p=NULL;

    int a=10;

    double b=10.98;

    p=&a;//ok

    p=&b;//ok

    *((double*)p)=12.345435;//强制转换

    printf("%lf",b);

  

    8.const指针

  

int main(){

  

char buff[]="jsadfnfjladsn";

const char*p=buff;         //1.*p不可改，p可以改  const char*p

p[1]='m';//不可以

p="csjdb";

printf("%s\n",p);

  

char*const p1=buff;//          2.*p可改，p不可以改  char*const p

p1="abhskb";//no

*p1='s';

printf("%s\n",buff);

return 0;

  

const char*const p2=buff;  //3.*p不可改，p不可以改const char*const p

}

    9.通过指针访问数组元素

    int a[]={1,2,3,4,5,6};

    int*p=a;

  

        for(int u=0;u<sizeof(a)/sizeof(a[0]);u++)

    {

        printf("p[%d]=%d\n",u,p[u]);//核心：p[u]等价于*（p+u）//wowoowowowowooowowwo

        printf("p[%d]=%d\n",u,*(p+u));

    }

    10.指针的加减运算

    int*+1,相当于增加一个int的大小（4）

    int k=10;

    int*p=&k;

    printf("p=%d\n",p);

    p+=2;

        printf("p=%d\n",p);

  

        int a[]={1,2,3,4};

        int*p1=a;

        int i;

        for(i=0;i<4;i++)

        {

            printf("*p1=%d\n",*p1);//用指针输出数组中的值

            p1++;

        }

        两个指针相减

int a[]={1,2,3,4};

int*p1=&a[2];

int*p2=&a[3];

int n=p2-p1;//之间元素个数————1

printf("%d %d",n);

  

    11.指针数组,每个元素都是数组

    int*p[3];

    int a=1;

    int b='s';

int c=3;

p[0]=&a;

p[1]=&b;

p[2]=&c;

  

    for(int i=0;i<3;i++)

    {

        printf("%d\n",*(p[i]) );

    }

  

    补充：数组指针

    int(*p1)[3];

    int arr[3]={0};

    p1=&arr;

    printf("%d\n",p1);

    p1++;

        printf("%d",p1);//地址相差12，加了一个数组

    12.多级指针

    int a=10;

    int*p=&a;

    printf("%p\n",p);//a的地址

    printf("%d\n",*p);//a的值————10  *p=a

    int **q=&p;

        printf("%p\n",q);//p的地址

    printf("%p\n",*q);//p的值————即a的地址*q=p

    printf("%d\n",**q);//a的值    ——**q=*p=a

  

    int***t=&q;

    printf("%p\n",t);//q的地址

    printf("%p\n",*t);//q的值————即p的地址

    printf("%p\n",**t);//*（*t）=*q=p的值=a的地址

    printf("%d\n",***t);//*（*（*t））=*（*q）=*（p）=a——10

13.值,地址传递

void swap1(int x,int y)

    {

        int tep1;

        tep1=x;

        x=y;

        y=tep1;

    }

    void swap2(int*x,int*y)

    {

        int tep;//!!!

        tep=*x;

        *x=*y;

        *y=tep;

    }  

  
  

    int main(){

        int a=10;

        int b=9;

        swap1(a,b);

        printf("%d %d\n",a,b);//值传递,x,y交换a，b不交换

        swap2(&a,&b);

        printf("%d %d",a,b);//地址传递，a，b可交换

            return 0;

    }

    14.数组名作为函数的参数

    void pa(int*a,int n)//(int a[]与其等效

    {

        int i;

        for(i=0;i<n;i++)

        {

            printf("%d\n",a[i]);

        }

    }

    int main(){

  

    int c[]={1,2,3,4,5};

    int n=5;

    pa(c,n);

    return 0;

    }

  

15。指针作为函数返回值（全局变量）

int g=10;

int*gtA()

{

    return &g;//把一个全局变量的地址返回，局部，临时变量不可以（不安全）

}

  
  

int main(){

  

int*p=gtA();

*p=123;

printf("%d",*p);

  

return 0;

}

  
  
  
  
  

16.字符指针___1.更改字符串中任意一个字符

char str[]="hello world";

printf("%s\n",str);

char*p=str;

*p='w';

p++;

*p='o';

printf("%s\n",str);

printf("%s\n",p);//这时只有ollo world（指针走到这里）

  

p="njsa";

*p=tsdh;//此时p指向字符串常量地址，不可修改

printf("%s\n",p);

  
  
  
  
  
  

int main(){

    return 0;

}

  
  

17.字符指针作为函数的参数___字符串追加了

void mystrcat(char*dest,const char*src)

{

    int len1=0;

    int len2=0;

  

    while(dest[len1])

    {

        len1++;

    }

    while(src[len2])

    {

        dest[len1+len2]=src[len2];

        len2++;

    }

}

int main(){

    char a[]="sdajkfjksd";

    char b[]="097";

    mystrcat(a,b);

    printf("%s",a);

    return 0;

}

  

18.const修饰的字符指针变量

  

同8.

  

19.字符指针数组

  
  

int main(){

    int a[]={1,2,3};

    char*num[3]={"hhjhj","dsdf","sd"};

    for(int i=0;i<3;i++)

    {

        printf("%s\n",num[i]);

    }

    printf("%c\n",*(num[0]));//[hhjhj 中的h，地址是数组的第一个值的地址，访问的数组的第一个元素

    printf("%c\n",num[0][0]);//同上，更好

    printf("%c\n",num[0][2]);//同上，

    printf("%c\n",(*(num+0))[2]);//同上，注意优先级，记得带括号

    return 0;

}

  
  
  
  

20。指针数组作为main函数的形参 ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————无法解决

argc:命令行参数个数

argv:命令行参数用空格隔开

int main(int argc, char* argv[]) {//or **argv

    printf("%d\n", argc);//属性  命令参数

    printf("%s\n", argv[0]);//第一个 exe.

    C:\Users\Lenovo>cd C:\Users\Lenovo\Desktop\C语言\Project1\

    C:\Users\Lenovo\Desktop\C语言\Project1 > dir

    /*驱动器 C 中的卷是 Windows - SSD

        卷的序列号是 5698 - 54E5

  

        C:\Users\Lenovo\Desktop\C语言\Project1 的目录

  

        2023 / 09 / 20  20:42 < DIR > .

        2023 / 09 / 20  20:14 < DIR > ..

        2023 / 09 / 20  20:14             1, 436 Project1.sln

        2023 / 09 / 20  20:33             6, 740 Project1.vcxproj

        2023 / 09 / 20  20:33             1, 235 Project1.vcxproj.filters

        2023 / 09 / 20  20:40               376 Project1.vcxproj.user

        2023 / 09 / 20  20:33 < DIR > x64

        2023 / 09 / 20  20:42             5, 752 指针.c//   找到目标

        2023 / 09 / 20  20:35             4, 601 数组.c

        2023 / 09 / 20  20:33               778 运算符·.c

        2023 / 09 / 20  20:33             1, 035 逻辑.c

        8 个文件         21, 953 字节

        3 个目录 117, 807, 542, 272 可用字节*/

  

    printf("%s\n", argv[1]);//

  
  

    return 0;

}

  

#include <string.h>//字符函数头文件

21.字符串处理函数——字符串拷贝——————strcpy

int main(int argc,char*argv[])

int main()

{

main的标准写法

    strcpy

    char dest[20] = "hello world";

    char src[] = "12345306";

    strcpy(dest, src);//把src复制，粘贴到dest

    printf("%s\n %s\n",dest,src);

    strncpy(dest, src, 5);//只复制前5个字符，空格也算

    printf("%s\n %s\n", dest, src);

    22.字符串处理函数——字符串追加----strcat--'\0'也会追加过去

char dest[100] = "hello world";

char src[] = "12345306";

char* p = strcat(dest, src);

char* p = strncat(dest,src, 5);//同上

printf("%s\n %s\n%s\n", dest, src,p);

  

23.字符串处理函数——字符串比较————strcmp--比较，字符相同，就去比较下一个，直到有不同字符，才会去比较,全部相同=；b比较ASCLL

  

    char* str1= "hello world";

    char* str2= "hello mike";

    if (strcmp(str1, str2) == 0)//strncmp同上，比较前n个

    {

        printf("=");d

    }

    else if (strcmp(str1, str2) > 0)

    {

        printf(">");

    }

    else if(strcmp(str1,str2)<0)

    {

        printf("<");

    }

    24.字符串处理函数——字符串格式化输入输出——sprintf，sscanf....知道遇到\0为止

    char dest[100] = { 0 };

    int a = 10;

    int b = 20;

    int len;

    len = printf("a=%d b=%d\n", a, b);//a=10 b=20,printf也会输出

    printf("%d", len);//b=10;(10个位,加上空格和结尾的\0;

    len = sprintf(dest, "a=%d b=%d\n", a, b);//向数组中输出

    printf("%s\n %d", dest,len);

    char* str = "a=100,b=200";//question:why??????

    sscanf(str, "a=%d,b=%d", &a, &b);//从str中输入-

    printf("a=%d b=%d\n", a, b);

25.字符串处理函数——字符串查找--strchr,strstr

    char* str = "abcd123dafdas";

    char* p = strchr(str, 'c');

    printf("%s\n", p);//找到了第一个字符并打印第一个字符和之后所有的字符

    p = strstr(str, "123");

    printf("%s\n", p);//找到了第一个字符串并打印第一个字符和之后所有的字符

  

    26.字符串处理函数——字符串分隔———strtok,stotok用于分割字符

    char a[] = "abc*jji*uiashdf*absfj*vaib";

    char* s = strtok(a, "*");//传递首地址

    while (s != 0)

    {

        printf("s=%s\n", s);

        s = strtok(NULL, "*");//传递NULL地址

    }

    printf("a=%s", a);//原数组变为了abc，注意：1.原数组必须是可更改数组 e.g.char*a="saf*js",不可更改，会报错

  

    27.字符串处理函数——字符串转换其他类型atoi,atof,atol

    头文件:#include <stdlib.h>

    char* str = "-10";

    int a = atoi(str);//

    printf("%d", a);

    char* str = "3.14";

    double d = atof(str);

    printf("%d", d);

    28.案例：查找子串出现的次数模型

    char* p = "11abcd1112121abcd2311041abcd21432432qqq";

    int n = 0;

    while((p = strstr(p, "abcd"))!=NULL)

    {

        n++;

        p += strlen("abcd");

  
  

        if (*p==0)//p == NULL

  

        {

            break;//到了结尾直接跳出，代码运行更好

        }

    }

    printf("%d", n);

    do

    {

        p = strstr(p, "ab");

        if (p == NULL)

  

                {

                    break;//到了结尾直接跳出，代码运行更好

                }

        else

        {

            n++;

            p += strlen("abcd");

        }

    } while (*p!= 0);

  

    printf("%d", n);

  
  

29.两头堵模型--非空字符串的个数

int foo(char* p, int* n)

{

    if (p == NULL || n == NULL)

    {

        return -1;

    }

    int begin = 0;

    int end = strlen(p) - 1;

    while (p[begin] == ' ' && p[begin] != 0)

    {

        begin++;

    }

    while (p[end] == ' ' && p[end] > 0)

    {

        end--;

    }

    if (end == 0)

    {

        return -2;

    }

    *n = end - begin+ 1;

    return 0;

}

  

int main()

  

{

  
  

char* p = "    efregreg      ";

int ret;

int n = 0;

ret = foo(p, &n);

if (ret != 0)

{

    return -1;//wrong

}

printf("%d\n", n);//字符的个数

}

  
  

30.字符串逆置

  

#include <stdio.h>

#include <stdlib.h>

#include <string.h>

  
  
  

int foo2(char* p)

{

    if (p == NULL)

    {

        return -1;

    }

    int begin = 0;

    int end = strlen(p)-1;

    char tmp;

    while (end > begin)

    {

        tmp = p[begin];

        p[begin] = p[end];

        p[end] = tmp;

        begin++;

        end--;

    }

    return 0;

}

  
  

int main()

{

    char str[]= "abcdefd";

    int ret=foo2(str);

    if (ret != 0)

        {

            return -1;//wrong

        }

    printf("%s", str);

    return 0;

}

  

    return 0;

}

return 0;

}
```

## 内存

```
#define _CRT_SECURE_NO_WARNINGS//不要报警告

#include <stdio.h>

#include <stdlib.h>

int main()

{

  

    1。局部变量

    在{}内，auto int（局部），离开局部，不存在

    2.静态变量//生命周期是整个程序

    static，/默认初始值为0，初始化只有一次

    e.g.void fun（）{int a=9，a++}；void fun（）{static int a=9，a++}；

    第一个运行后销毁，第二个运行后下次访问继续

    3.全局变量在{}外。，本文件和其他文件都可以使用

     文件1：int ggggg=100；

    文件2：extern int ggggg;

    4.静态全局变量，相对于3.（全局变量）范围缩小，只在其所定义的文件里，不赋值默认是0

    5.全局函数

     可以被全局使用

  

    6.静态函数

     只能在本文件中使用

     7.register函数（寄存器变量）（运行时在CPU内部寄存器）

     只能在{}中，不能当成全局变量

    8.内存分区

     1.test代码区   2.data数据区（全局常量数据，初始化数据，静态变量） 3.bss（全局未初始化） 4.堆（向上）（malloc申请），5.栈（函数内局部变量）（向下）（动态变量）

     低————> 高                                                                                 ———> <————

    int a[1024]//内存并没有增加很多，因为局部变量是栈区，运行起来之后才会开辟空间

    9.memset使用    算是一种替换

    int a[10];

    memset(a, 0, sizeof(a));

    int i;

    for (i = 0; i < 10; i++)

    {

        printf("%d\n", a[i]);

    }

    memset(a, 97, sizeof(a));//ASCLL码的a（97）

    for (i = 0; i < 10; i++)

    {

        printf("%c\n", a[i]);//

    }

  

    10.memcpy————内存的拷贝

    int a[10] = {1,2,3,4,5,6,7,8,9,10};

    int b[10];

    memcpy(b, a, sizeof(a));

    int i;

    for (i = 0; i < 10; i++)

        {

            printf("%d\n", b[i]);

        }

    int y = sizeof(a);

    printf("%d\n", y);//40,40个字节

    11.memmove————和上面的差不多

    int c[10];

    memmove(c, a, sizeof(a));

    for (i = 0; i < 10; i++)

    {

        printf("%d\n", c[i]);

    }

    memcpy与memmove的重叠问题，会倒着拷贝

    int a[10] = {1,2,3,4,5,6,7,8,9,10};

    int b[10];

    memcpy(&a[3], a, 5 * sizeof(int));

    int i;

    for (i = 0; i < 10; i++)

        {

            printf("%d", a[i]);//1,2,3,1,2,3,4,5,9,10(倒着考，从5开始)

        }

    12.memcmp

    int a[] = { 1,3};

    int b[] = { 1,2 };

    int ret;

    ret= memcmp(a, b, sizeof(a));

    printf("%d", ret);//0

    相等：0；    >正数；      <负数

    13.堆区内存分配,malloc//不使用时候一定要释放

    头文件：#include <stdlib.h>

    int n;

    int* p=NULL;

    printf("请输入需要分配的内存大小：");

    scanf("%d", &n);

  

    p =(int*) malloc(n * sizeof(int));//malloc返回结果是void

    memset(p, 0, n * sizeof(int));

    for (int i = 0; i < 10; i++)

    {

        printf("%d\n", p[i]);//分配的内容都是随机的

    }

    释放空间

    free(10);

    14.data区地址

    1.返回局部变量地址，即返回栈区地址

    int*foo() //foo(第一个 func2()

    {

        int a = 10;

        return &a;

    }

    int main()

    {

        int* p = foo();//返回局部变量地址了，p是野指针

        *p = 100;//不能对野指针进行赋值

    }

    2.返回data区地址

    int* foo() //foo(第一个 func2()

    {

        static int a = 10;//data区，生命周期是整个程序

        return &a;

    }

    int main()

  

    {

        int* p = func2();

        *p = 100;//可以访问

    }

  

15.,返回堆区地址空间(不是很理解)

 #include <stdio.h>

#include <stdlib.h>

 #include <string.h>

 值传递1（error）:

void* func3(int* tmp)

{

    tmp = (int*)malloc(sizeof(int));

    *tmp = 100;

}

int main()

{

    int* p = NULL;

    func3(p);

    *p = 100;

}

 /*值传递2（right）

void* func3(int* tmp)

{

    *tmp = 100;

}

  

int main()

{

    int* p = NULL;

    p = (int*)malloc(sizeof(int));

    func3(p);*/

  
  

 返回堆区地址（best）————有个函数帮我分配空间

int* func5()

{

    int* tmp = (int*)malloc(sizeof(int));

    *tmp = 100;

    return 100;

}

int main()

{

    int* p = func5();

    if (p != 0)

    {

        freee(p);//释放空间

        p = NULL;

    }

  

}

    16.补充内存泄露和内存污染

内存泄漏:不释放,占用太多了

内存污染:对没有申请的内容,进行操作

  
  

    return 0;

}
```

## 复合结构

```
==1.结构体==

#define _CRT_SECURE_NO_WARNINGS//不要报警告

#include <stdio.h>

#include <string.h>

#include <stdlib.h>

int main() {

  
  

    定义方式1  0

        struct stu1

        {

            char name[60];

            int age;

        };

        struct stu1 s1 = { "lily",20 };//写在外面是全局变量

        定义方式2

        struct stu2

    {

        char name[60];

        int age;

    } s2 = { "rose",23 };

    定义方式3

    struct

    {

        char name[60];

        int age;

    } s3 = { "jack",23 };

  
  
  

    2.结构体成员的使用

    struct stu1

    {

        char name[60];

        int age;

    };

    struct stu1 s1 = { "lily",20 };

    int main()

    {  

        通过点运算符直接访问成员

        strcpy(s1.name, "yoyo");

        s1.age = 22;

        printf("%s %d", s1.name, s1.age);

        指针要用箭头运算符

        printf("%s %d", (&s1)->name, (&s1)->age);

        strcpy((&s1)->name, "sadbh");

        (&s1)->age = 25;

        printf("%s %d", (&s1)->name, (&s1)->age);

        return 0;

    }

  
  

    3。结构体数组

    struct stu {

  

        int num;

        char name[20];

        int sex;

        float score;

    };

    struct stu boy[5] = {

    {1,"asjnif",'M',45},

    {2,"avsd",'F',23},

    {3, "sdf", 'F', 12},

    {4,"dasv",'M',54},

    {5,"asd",'F',89}

    };

    int i;

    for (i = 0; i < 5; i++)

    {

        printf("%d\n %s\n %c\n %f\n", boy[i].num, boy[i].name, boy[i].sex, boy[i].score);//boy[i]=(*(boy+i))=(boy+i)->num

    }

    float s=0, avg;

    int c=0;

    分数综合

    for (i = 0; i < 5; i++)

    {

        s += boy[i].score;

        if (boy[i].score < 60)

        {

            c++;

        }

    }

    avg = s / 5;

    printf("%f\n %f\n %d\n", s, avg,c);

    4.结构体套结构体

    struct person

    {

        char name[20];

        char sex;

    };

    struct stu

    {

        int id;

        struct person info;//套用

    };

    int main()

    {

        struct stu s[2] = { 1,"sdf",'M',2,"saffd",'F' };//直接定义

        for (int i = 0; i < 2; i++)

            {

                printf("%s",s[i].info.name);

            }

        return 0;

    }

  
  
  

        5.结构体赋值

struct stu

{

    char name[50];

    int age;

};

  

int main()

{

    1.strcpy赋值，直接赋值

    struct stu s1;

    strcpy(s1.name, "rose");

    s1.age = 21;

    struct stu s2 = s1;//这样也可以赋值

  

    memcpy不关心类型，内存拷贝

    struct stu s2;

    memcpy(&s2, &s1, sizeof(s1));

  

    return 0;

        }

  

        6.结构体和指针

        struct stu

    {

        char name[50];

        int age;

    };

    struct stu2

    {

        char* name;

        int age;

    };

    int main(){

    普通指针(栈)

        /*struct stu s1 = { "mike",23 };*/

        struct stu* p = &s1;

    堆中指针

        struct stu* p = (struct stu*)malloc(sizeof(struct stu));

        strcpy(p->name, "rose");

        p->age = 27;

        printf("%s", p->name);//(*p).name

        if (p != NULL)//释放

        {

            free(p);

            p = NULL;

        }

        结构体中套一级指针

        struct stu2*p= (struct stu2*)malloc(sizeof(struct stu2));

        p->name = (char*)malloc(strlen("jack") + 1);//节省空间，要多少开辟多少,加1即为结尾符\0

        strcpy(p->name, "jack");

        释放,先后不能够改

        if (p->name!=NULL)

        {

            free(p->name);

            p->name = NULL;

        }

        if (p != NULL)

        {

            free(p);

            p = NULL;

        }

        return 0;

        }

  

  

        7.结构体作为函数参数

struct stu

    {

        char name[50];

        int age;

    };

void foo(struct stu*tmp)

{

    strcpy(tmp->name, "mkfs");

    tmp->age = 24;

}

    值传递和指针传递(同之前）

int main()

{

  

    struct stu s = { 0 };

    foo(&s);

    printf("%s %d", s.name, s.age);

    return 0;

}

  

        8.结构体数组名传参,形参自动降级为指针

        struct stu

    {

        char name[50];

        int age;

    };

        void foo(struct stu* tmp, int n)//stu tmp[]//stu tmp[100],大小均为4个字节，降级

        {

            for (int i = 0; i < n; i++)

            {

                sprintf(tmp->name, "name%d", i);//详见数组的格式化输入

                tmp->age = 20 + i;

                tmp++;

            }

        }

        int main() {

            struct stu s[5] = {0};

            int n = 5;

            foo(s, 5);

            for (int i = 0; i < n; i++)

            {

                printf("%s %d", s[i].name, s[i].age);

            }

        }

        9.const修饰的结构体做参数

        struct stu*const p：p无法修改

         struct stu const* p:p指向的空间不可以修改

         const struct stu* p：同上

         const struct stu *const p： p及其p指向空间均无法修改

        10.共用体————共用一个地址空间，给一个赋值，其他不能用，空间取得是最大的空间地址，

地位放低地址，高位放高地址、、int b=0x44332211，char a=11，short=2211

union test

{

    unsigned char a;

    unsigned int b;

    unsigned short c;

  

        };

int main()

{

    union test tmp;

    printf("%p\n%p\n%p\n", &(tmp.a), &(tmp.b), &(tmp.c));//空间一致,

    0x44332211

    tmp.b = 0x44332211;

    printf("%x %x %x", tmp.a, tmp.b, tmp.c); //11 44332211 2211

    tmp.a = 0x00;//44332200

    tmp.c = 0x0000;//44330000

    return 0;

}

        11.补充结构体大小————字节对齐

   struct test

{

    unsigned char a;

    unsigned int b;

    unsigned short c;

  

        };//占用字节12，字节对齐，全是一次拿4个字节//

        12.枚举类型__有限个数,初始值默认是0，后面依次赋值

enum weeekday

{

    sun = 1, mon, tue, wed, thu, fri, sat

};

int main()

{

    enum weekday a, b, c;

    a = sun;//1

    b = mon;//2

    c = tue;//3

        printf("%d%d%d", a, b, c);

    return 0;

}

13。typedef使用——为把数据类型起个别名，define都可以，在预处理处理，typedef是在编译阶段

#define TRUE 1//宏定义

typedef int S32;

typedef char S8;

  
  

}
```

## 文件

### fwrite

```c
C 库函数 size_t fwrite(const void *ptr, size_t size, size_t nmemb, FILE *stream) 
 把 ptr 所指向的数组中的数据写入到给定流 stream 中。
#include <stdio.h>
 
int main ()
{
   FILE *fp;
   char str[] = "This is runoob.com";
 
   fp = fopen( "file.txt" , "w" );
   fwrite(str, sizeof(str) , 1, fp );
 
   fclose(fp);
  
   return(0);
}

```

### fseek

```c
 int fseek(FILE *stream, long int offset, int whence) 
 设置流 stream 的文件位置为给定的偏移 offset，参数 offset 意味着从给定的 whence 位置查找的字节数。
     
     #include <stdio.h>

int main ()
{
   FILE *fp;

   fp = fopen("file.txt","w+");
   fputs("This is runoob.com", fp);
  
   fseek( fp, 7, SEEK_SET );
   fputs(" C Programming Langauge", fp);
   fclose(fp);
   
   return(0);
}

```

| 常量     | 描述               |
| :------- | :----------------- |
| SEEK_SET | 文件的开头         |
| SEEK_CUR | 文件指针的当前位置 |
| SEEK_END | 文件的末尾         |



让我们编译并运行上面的程序，这将创建文件 **file.txt**，它的内容如下。最初程序创建文件和写入 *This is runoob.com*，但是之后我们在第七个位置重置了写指针，并使用 puts() 语句来重写文件，内容如下：

```
This is C Programming Langauge

```

### fread

```
#include <stdio.h>
#include <string.h>
 
int main()
{
   FILE *fp;
   char c[] = "This is runoob";
   char buffer[20];
 
   /* 打开文件用于读写 */
   fp = fopen("file.txt", "w+");
 
   /* 写入数据到文件 */
   fwrite(c, strlen(c) + 1, 1, fp);
 
   /* 查找文件的开头 */
   fseek(fp, 0, SEEK_SET);
 
   /* 读取并显示数据 */
   fread(buffer, strlen(c)+1, 1, fp);
   printf("%s\n", buffer);
   fclose(fp);
   
   return(0);
}
```













```
#include <stdio.h>
#include <string.h>
void fileread()
{
	FILE* fp = fopen("lvlebin.txt", "r");
	if (fp == NULL)
	{
		perror("error:");
		return;
	}
	
	while (!feof(fp))
	{
		char ch = fgetc(fp);
		printf("%c", ch);
	}
	fclose(fp);
}

void filewrite()
{
	FILE* fp = fopen("lvlebin.txt", "w");
	if (fp == NULL)
	{
		perror("error:");
		return;
	}
	char str[] = "askjdnffkl";
	for (int i = 0; i < strlen(str); i++)
	{
		fputc(str[i], fp);//返回值是char
	}

	fclose(fp);
}
void filereadwrite()
{
	FILE* fp = fopen("lvlebin.txt", "w");
	if (fp == NULL)
	{
		perror("error:");
		return;
	}
	//字符串写入
	fputs("aaaaaaaaaaaa",fp);
	//将文件位置指针移动到文件开头
	rewind(fp);
	//读取文件
	char buf[128] = { 0 };
	
	fgets(buf, sizeof(buf), fp);
	printf("%s", buf);

	
}
int main()
{
	filewrite();//写
	fileread();//读
	filereadwrite();
	return 0;
}
```

![图片](https://img-blog.csdnimg.cn/3c2eb7e7adac429481381f3aed638bfe.png?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBA5Y2B5LiJ5YWI55SfcG8=,size_15,color_FFFFFF,t_70,g_se,x_16)

```
#define _CRT_SECURE_NO_WARNINGS//不要报警告

1.文件概述

 磁盘文件

   二进制

   以字节为单位

   文本·文件：基于编码（ASCII），基于值（（二进制），，中文字会有字库中的编号

   二进制文件：基于值

 设备文件

2.文件指针

 以下会自动打开

stdin:标准输入，默认当前终端（键盘）

stdout标准输出，默认当前终端（屏幕）

stderr标准出错，默认当前终端（屏幕）

 FILE*p

 当使用fopen它会返回一个指向该文件所有信息的指针

3.文件打开

  
  

#include <stdio.h>

int main()

{

    FILE* fp=NULL;

    fopen("test.txt","r");//r以只读方式打开，文件不存在会报错

    fopen("test.txt", "w");//以只写方式，文件不存在会新建，存在会清空

    fopen("../test.txt", "w");//打开上一级目录

    fopen("C:\\Users\\Lenovo\\Desktop\\C语言\\Project1\\Project1.sln", "w");//复制路径后要改为两个斜杠

    if (fp == NULL)

    {

        perror("fopen");

        return -1;

    }

    return 0;

}

4.文件关闭

fclose(fp);

打开后，需要关闭文件

  
  

int main()

{

    5.fputc使用-1个字符

按照字符形式写文件--转换拿成无符号字符类型，再转入

    FILE* fp = NULL;

    fp = fopen("test.txt", "w");

    char buf[] = "vasfvbf";

    int n = 7;

    int ch,i;

    for (i = 0; i < n; i++)

    {

        ch=fputc(buf[i], fp);

    }

  

    fclose(fp);

6.fgetc和feof使用--

    字符方式读文件

    FILE* fp = NULL;

    fp = fopen("test.txt", "r");

  
  

    char ch;

  

    while (1)

    {

        ch = fgetc(fp);

  

        if (ch == EOF)//EOF判断文本文件结束符号，对二进制不能这么做

        {

            break;

        }

        if（feop(fp) != 0)

        {

            break;//判断文本和二进制文件结束符号（更好

            }  

        putchar(ch);

    }

    fclose(fp);

  

return 0;

}

  

7.强化练习————vi和cat命令实现(不理解）

int main(int argc,char*argv[])

    {

        if (argc != 2)

        {

            printf("no");

            return -1;

        }

  

        char*file_name = argv[1];

        char ch;

        FILE* fp=NULL;

        fp=fopen(file_name, "r");

        if (fp == NULL)

        {

            perror("error");

            return -2;

        }

        while (feof(fp)==NULL)

        {

  

            fgetc(fp);

            putchar(ch);

        }

  
  

fclose(fp);

        return 0;

    }

  

8.fputs使用--行读写

int main()

{

    char* buf[] = { "HMN\n","afnvsd\n","anvibrefea\n" };

    int n = sizeof(buf) / sizeof(buf[0]);

    FILE* fp = NULL;

    fp = fopen("test.txt", "w");

    if (fp == NULL)

    {

        perror("fopen");

        return -1;

    }

    for (int i = 0; i < n; i++)

    {

        fputs(buf[i], fp);

    }

  
  

    fclose(fp);

  

    return 0;

}

9.fgets使用

int main()

{

    char buf[100] = { 0 };

    FILE* fp = NULL;

    fp = fopen("test.txt", "r");

        if (fp == NULL)

    {

        perror("fopen");

        return -1;

    }

        while (feof(fp) == 0)

        {

            memset(buf, 0, sizeof(buf));//清空，最后一个就会是空的了，某一位置后清空

            fgets(buf, sizeof(buf), fp);

            printf("buf=%s", buf);

        }

  
  
  
  
  
  
  
  
  

        fclose(fp);

  

    return 0;

}

10.强化练习————四则运算表达式

#include <stdlib.h>

#include <string.h>

#include <search.h>

int main()

{

    1.生成文件

    FILE* fp = NULL;

    fp = fopen("a.txt", "w");

    if (fp == NULL)

    {

        perror("fopen");

        return -1;

    }

    生成表达式

    srand(time(NULL));//设置随机数总值

    int n=rand() % 100;

    char buf[100] = { 0 };

    char ch;

    int a, b;

    char opt[4] = { '+','-','*','/' };

    for (int i = 0; i < n; i++)

    {

        a = rand() % 100;

        b= rand() % 100;

        ch = opt[rand() % 4];

        sprintf(buf, " % d% c% d=\n", a, ch, b);

        puts(buf);

        写入文件

        fputs(buf, fp);

    }

    打开

    char buff[100] = { 0 };

    FILE* fp = NULL;

    fp = fopen("a.txt", "r");

    int a, b;

    char ch;

    if (fp == NULL)

    {

        perror("fopen");

        return -1;

    }

    int s;

    char sbuf[100][100] = { 0 };

    int n= 0;

    while (feof(fp) == 0)

    {

        memset(buff, 0, sizeof(buff));

        fgets(buff, sizeof(buff), fp);

        if (strlen(buff) == 0) break;

        sscanf(buff, "%d%c%d=", &a, &ch, &b);//指定格式提取数组数据

        switch (ch)

        {

        case '+':s = a + b; break;

        case '-':s = a - b; break;

        case '*':s = a * b; break;

        case '/':s = a / b; break;

        }

        sprintf(sbuf[n],"%d%c%d=%d\n", a, ch, b, s);

        n++;

    }

    fclose(fp);

    写入文件

    fp = fopen("a.txt", "w");

    if (fp == NULL)

    {

        perror("fopen");

        return -2;

    }

    for (int i = 0; i < n; i++)

    {

        fputs(sbuf[i], fp);

    }

    fclose(fp);

    return 0;

  

}

  
  

12.格式化方式读写文件

FILE* fp = NULL;

fp = fopen("b.txt", "w");

if (fp == NULL)

{

    perror("fopen");

    return -1;

}

fprintf(fp, % d % d % d, 10, 20, 30);

int a, b, c;

fscanf(fp,%d %d %d, &a, &b, &c);

fclose(fp);

13.强化练习————文件版排序

void get_file()//生成

{

  

    FILE* fp = NULL;

    fp = fopen("c.txt", "w");

    if (fp == NULL)

    {

        perror("fopen");

  

        return -1;

    }

    srand(time(NULL));

    for (int i = 0; i < 10; i++)

    {

        int num = rand() % 200;

        fprintf(fp, "%d\n", num);

    }

    fclose(fp);

  

}

排序

qsort前置函数

int cmpfunc(const void* a, const void* b)

{

    return (*(int*)a - *(int*)b);

}

  

void sort()

{

    FILE* fp = NULL;

    fp = fopen("c.txt", "r");

    if (fp == NULL)

    {

        perror("fopen");

  

        return -1;

    }

    int num;

    int buf[10];

    int n=0;

    while (feof(fp) == 0)

    {

        fscanf(fp, "%d\n", &num);

        buf[n] = num;

        n++;

    }

    fclose(fp);

    排序

    qsort(buf, 10, sizeof(int), cmpfunc);//快速排序

  
  

    int i;

    fp = fopen("c.txt", "w");

    if (fp == NULL)

    {

        perror("fopen");

  

        return -1;

    }

    for (i = 0; i < n; i++)

    {

        fprintf(fp, "%d\n", buf[i]);

    }

    fclose(fp);

}

  
  
  
  

int main()

{

    1.获取文件数据，存储到数组

    get_file();

    sort();

return 0;

}

  
  

14.文件块读写操作————fread和fwrite（有问题、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、

typedef struct stu

{

    char name;

    int id;

}STU;

  

int main()

{

    STU s[3] = { 0 };

    for (int i=0; i < 3; i++)

    {

        sprintf(s[i].name, "stu%d%d%d\n", i, i, i);、、？？？

        s[i].id = i + 1;

    }

    FILE*fp = NULL;

        fp = fopen("d.txt", "w");

        if (fp == NULL)

        {

            perror("fopen");

  

            return -1;

        }

        块操作

        int ret;

        ret=fwrite(s, sizeof(STU), 3, fp);//？？？

        printf("%d\n", ret);

        fclose(fp);

    return 0;

}

        打出

    /*  int ret;

        STU s2[3];

        fread(s2, sizeof(STU),3,fp);*/

#include <time.h>

15.强化练习————大文件拷贝

int main(int argc,char*argv[])

{

    if (argc != 3)

    {

        printf("no");

        return -1;

    }

    char* src_file = argv[1];//yuan

    char* dest_argv[2];//mubiao

    FILE* fpr=NULL, * fpw=NULL;

    fpr = fopen(src_file, "rb");//视屏文件二进制，不用r

    if (fpr== NULL)

                {

                    perror("fopen");

                    return -2;

                }

    fpw = fopen("dest_file", "wb");

    if (fpr == NULL)

    {

        perror("fopen");

        fclose(fpr);

        return -2;

    }

    char* str = (char*)malloc(1024 * 1024);//kongjian

    while (feof(fpr) == 0)

    {

        int ret;

        memset(str, 0, 1024 * 1024);

        ret=fread(str, 1024, 1024, fpr);//返回值为读成的块数

        fwrite(str, 1024, ret, fpw);//成功多少写多少

    }

  

    free(str);

    fclose(fpw);

    fclose(fpr);

    return 0;

}

  
  

16.文件随机读写(放弃了，太难了）

int main()

{

    FILE* fp = NULL;

    \

  

    return 0;

}

  
  

17.windows和linux文本文件区别

18.获取文件状态stat

19.删除文件、重命名文件名

20.文件缓冲区
```

## 贪吃蛇

```
#include <stdio.h>

#include <string.h>

int main(){

    //1.一维数组的定义，使用

    int a[10];//下标0-9

    a[0]=0;//赋值

    for(int i=0;i<10;i++)

    {

        a[i]=i;

    }

    for(int j=0;j<10;j++)

    {

        printf("a[%d]=%d\n",j,a[j]);

    }

    //2.初始化

    int a1[10]={0,1,2,3,4,5,6,7,8,9};

    int b[10]={0,1};//只有前两个是0，1

    int c[10]=([4]=0);

    int d[]={0,1,2,3};

    //3。数组名代表第一个元素的首字母

    //4。得到元素的个数

  
  

    printf("%d",sizeof(a));

    printf("%d",sizeof(a[0]));

  

    int numb=sizeof(a)/sizeof(a[0]);

    printf("%d",numb);

    //5.求出一维数组最大值||遍历+if

    int a[]={234,24,5,54,4,23,324};

    int max=a[0];

    for(int i=0;i<sizeof(a)/sizeof(a[0]);i++)

    {

        if(a[i]>max)

        {

            max=a[i];

        }

    }

    printf("%d",max);

  

//6.一维数组逆置

int a[]={21,24,324,545,23,42};

    for(int k=0;k<6;k++)

    {

        printf("a[%d]=%d\n",k,a[k]);

    }

  

int t;

int s;

s= (sizeof(a)/sizeof(a[0]))-1;//1 2 3 4 5

int i=0;

while(i<s)//key

{

    t=a[i];//交换

    a[i]=a[s];

    a[s]=t;

    i++;

    s--;

}

  
  
  

    for(int u=0;u<6;u++)

    {

        printf("a[%d]=%d\n",u,a[u]);

    }

    //7.二维数组定义与使用

int a[3][4];

int i,j;

int n=0;

for(i=0;i<3;i++)

{

    for(j=0;j<4;j++)

    {

        a[i][j]=n;

        n++;

        printf("a[%d][%d]=%d\n",i,j,a[i][j]);

    }

}

  

//8.二维数组初始化

int a[3][4]={{1,2,3,4},{5,6,7,8},{9,10,11,12}}or{1,2,3,4.........}or{0}or{1,2,3,4}

  

9.求出平均成绩和不及格人数

    语文  数学  英语

1      80    75    56

2      59    65    71

3      59    63    70

4      85    45     90

5      55    45     45

to discover thr way to attain the asummary

int stu[5][3]={{80,75,56},{59,65,71},{59,63,70},{85,45,90},{55,45,45}};

int i,j,k;

float sum[3],aver[3];

int notpass[3];

for(i=0;i<5;i++)

{

    for(j=0;j<3;j++)

    {

        sum[j]+=stu[i][j];

    }

}

  

for(k=0;k<3;k++)

{

    printf("%.2f\n",sum[k]);

}

  

to find the amount of the people who doesn't pass  

for(i=0;i<5;i++)

{

    for(j=0;j<3;j++)

    {

        if(stu[i][j]<60)

        {

            notpass[j]+=1;

        }

    }

}

    for(int y=0;y<3;y++)

{

    printf("%d\n",notpass[y]);//Q:第二个数据出现异常，原因不详   、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、

}

    10.字符数组

char a[]={'w','a','t','\0','9'};//\0，停止

printf("%s",a);

  

//11.字符串的输入

1.scanf

char str[100];

scanf("%s",str);

2.gets

gets(str);

printf("%s\n",str);

3.fgets

fgets(str,100,stdin);//从标准输入中输入

printf("%s\n",str);

  
  
  
  

12.输出

1.printf

2.puts

puts("safsdvsd");//结尾自动换行

3.fputs

fputs("bbhsda\n",stdout);//标准输出，不加换行

  

14.strlen--求出字符串的长度

char str[]={"svsvvdsvsdv"};

int a=strlen(str);

printf("%d",a);

头文件：#include <string.h>

  

15.fgets ----strlen去除结尾\n   ////////////////////////////////////////////////////////////////////////////////////////////////////////////目前用不到

char strl[20]={0};

fgets(strl,20,stdin);

printf("[%s]\n",strl);

printf("%d",strlen(strl));

strl[strlen(strl)-1]=0;

printf("[%s]\n",strl);

16.字符串追加效果

char str1[]="abcd";

char str2[]="123";

char dst[100]={0};//赋值0结束

  

int i=0;//定义0

while(str1[i]!=0)

{

    dst[i]=str1[i];

    i++;

}

  

int j=0;

while(str2[j]!=0)

{

    dst[i]=str2[j];

    i++;

    j++;

}

printf("%s",dst);

  

补充字符串追加函数：strcat

    char str1[]="abcd";

char str2[]="123";

strcat(str1,str2);

printf("%s",str1);  

  

17.px-mp法

#include <stdio.h>

  
  

void bubble_lz(int arr[], int size)

{

    int i, j, tem;

    for (i = 0; i < size - 1; i++)

    {

        int con = 0;

        for (j = 0; j < size-1-i; j++)

        {

            if (arr[j] > arr[j + 1])

            {

                tem = arr[j];

                arr[j] = arr[j + 1];

                arr[j + 1] = tem;

                con = 1;

            }

  

        }

        if (con == 0)

        {

            break;

        }

    }

}

  

int main() {

  
  

    int y;

    int ap[10] = { 1,2,3,3,43,5,34,345,7,65};

    printf("please put ten number:");

    for (y = 0; y < 10; y++)

    {

        scanf("%d", &ap[y]);

    }

    printf("before\n");

    for(y=0;y<10;y++)

{

    printf("%d\n",ap[y]);

}

  

    bubble_lz(ap, 10);

    printf("after\n");

    for (y = 0; y < 10; y++)

    {

        printf("%d,", ap[y]);

    }

    return 0;

}
```

## matu

#include <stdio.h>
#include <stdlib.h>
struct node
{
	int data;
	struct node* next;
};

int main(int data[], int n)
{
	if (n <= 0)
	{
		printf("error");
		return NULL;
	}
	struct node* header = (struct node*)malloc(sizeof(struct node));
	header->data = -1;
	header->next = NULL;
	struct node* tail = header;
	int i;
	for (i = 0; i < n; i++)
	{
		struct node* newnode = (struct node*)malloc(sizeof(struct node));
		newnode->data = data[i];
		newnode->next = NULL;
		if (newnode == NULL)
		{
			printf("error");
			return NULL;
		}
		tail->next = newnode;
		tail= newnode;
	}

	return (int)header;

}



```c
#include<stdio.h>
#include<stdlib.h>
#include <string.h>
#include <iostream>
using namespace std;
typedef struct student
{
	int id;
	char name[50];
	float chinese;
	float math;
	float english;
	float sum;
}student;


int ReadStuInfoFromFile(char* name, student** stu)
{
	if (name)
	{
		FILE* fp = fopen("name", "rb");
		if (fp == NULL)
		{
			perror("error is:");
			return 0;
		}
		int num;
		fread(&num,sizeof(int), 1, fp);//人数
		*stu = (student*)malloc(sizeof(student)*num);
		
		for (int i = 0; i < num; i++)
		{
			fread(&(*stu[i]), sizeof(student), num, fp);
			(*stu)[i].sum = (*stu)[i].chinese + (*stu)[i].math + (*stu)[i].english;
		}

		return num;
	}
	else
	{
		return 0;
	}
}
/*输入参数：stu是全班学生信息，n是人数。输出参数：3科平均成绩不及格人名单noPassStudent,不及格人数m.操作成功返回0，失败返回-1*/
int NoPass(student stu[], int n, student** noPassStudent, int* m)
{
	if (stu && n > 0)
	{
		*noPassStudent = (student*)malloc(sizeof(student) * n);
		float tmp;
		for (int i = 0; i < n; i++)
		{
			tmp += stu[i].sum;
		}
		float pass = tmp / n;
		for (int i = 0; i < n; i++)
		{
			if (stu[i].sum < pass)
			{
				**noPassStudent = stu[i];
				(*noPassStudent)++;
				*m++;
			}
		}
		return 0;
	}
	else
	{
		return -1;
	}
}


int Pass(student stu[], int n, student** PassStudent, int* m) {

	/*输入参数：stu是全班学生信息，n是人数。输出参数：3科平均成绩及格人名单PassStudent,及格人数m.操作成功返回0，失败返回-1*/
	if (stu && n > 0)
	{
		*PassStudent = (student*)malloc(sizeof(student) * n);
		float tmp;
		for (int i = 0; i < n; i++)
		{
			tmp += stu[i].sum;
		}
		float pass = tmp / n;
		for (int i = 0; i < n; i++)
		{
			if (stu[i].sum >pass)
			{
				**PassStudent = stu[i];
				(*PassStudent)++;
				*m++;
			}
		}
		return 0;
	}
	else
	{
		return -1;
	}








}	


void swap(student&a,student&b)
{
	student tmp = a;
	a = b;
	b = tmp;
}
/*输入参数：stu是全班学生信息，n是人数。输出参数：按照总分排序后的结果也存储在stu中.操作成功返回0，失败返回-1*/
int SortStudents(student stu[], int n)
{
	if (stu && n > 0)
	{

		for (int i = 0; i < n-1; i++)
		{
			int flag= 0;
			for (int j = 0; j < n - i - 1; j++)
			{
				if (stu[j].sum > stu[j + 1].sum)
				{
					swap(stu[j], stu[j + 1]);
					flag = 1;
				}
			}
			if (flag == 0)
			{
				break;
			}
		}
		return 0;
	}
	else
	{
		return -1;
	}
}

/*输入参数：stu是全班学生信息，n是人数。操作成功返回0，失败返回-1。本函数在码图上不会进行检测，只是供同学们调试使用。*/

int PrintStudents(student stu[], int n)
{
	if (stu && n != 0)
	{
		for (int i = 0; i < n; i++)
		{
			cout << stu[i].id << "\t" << stu[i].chinese << "\t" << stu[i].english << "\t" << stu[i].math << "\t" << stu[i].sum << "\t" << stu[i].sum / 3 << endl;
		}
		return 0;
	}
	else return -1;
};

/*输入参数：stu是全班学生信息，n是人数,id是待查找的学号。输出参数：rank是在班上的排名；stu是这个学生的详细信息。返回值：查找成功返回0，失败返回-1*/
int SearchStudent(student stu[], int n, int id, int* rank, student* rstu)
{
	if (stu && id != NULL && n > 0)
	{
		rank = (int*)malloc(sizeof(int));
		SortStudents(stu, n);
		for (int i = 0; i < n; i++) {
			if (id == stu[i].id) {
				*rank = i + 1;
				*rstu = stu[i];
				return 0;
			}
		}
		return -1;
	}
	else
	{
		return -1;
	}
}
```

```c
//输出由*组成的三角形。指定底边长度。第一排输出*，第二排输出***，每行中间需对齐，每行的最后一个*后输出回车。
//输入边长(1-80中的奇数)，错误边长，输出error。
//例如，
//输入1，输出*回车
//输入2，输出error
//输入3，输出
//  *    //5
// ***回车
//*****
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void ling(int num)
{
		int wh;
		for(int j=1;j<=num;j+=2)
		{
			//计算空白
			
			for(wh=0;wh<=num;wh++)
			{
				if(num==j+2*wh)
				{
					break;
				}
			}
			
			for(int l=0;l<wh;l++)
			{
					printf(" ");
			}
			for(int l=0;l<j;l++)
			{
				printf("*");
			}
			
			printf("\n");
		}	
		
		
		
	
}

int main()
{
	int len;
	scanf("%d",&len);
	if(len<1||len>80||len%2==0)
	{
		printf("error");
		return -1;
	}
	
	ling(len);
	
	return 0;
}



```



## 动态内存和冒泡排序练习

```c++
#include  <stdio.h>

#include <stdlib.h>
void bubble(int arr[], int n)
{
	if (n > 0)
	{
		for (int i = 0; i < n - 1; i++)
		{
			int flag = 0;
			for (int j = 0; j < n - i - 1; j++)
			{
				if (arr[j] > arr[j + 1])
				{
					int tmp = arr[j];
					arr[j] = arr[j + 1];
					arr[j + 1] = tmp;
					flag = 1;
				}
			}
			if (flag == 0)
			{
				break;
			}
		}
	}
	else
	{
		printf("error");
	}

}

int main()
{
	int n;
	printf("plesae input n");
	scanf_s("%d", &n);
	int* p = (int*)malloc(n * sizeof(int));
	printf("plesae input n");
	if (p == NULL) {
		return 0;
	}
	for (int i = 0; i < n; i++)
	{
		scanf_s("%d", &p[i]);
	}

	bubble(p, n);

	for (int i = 0; i < n; i++)
	{
		printf("%d\n", p[i]);
	}

	free(p);
	return 0;
}
```

#### 折半查找

```c++
#include <stdio.h>

int BinarySearch(int a[], int n, int x)//5组数,找到3
{
    int left = 0;
    int right = n - 1;

    while (left <= right)
    {
        int mid = (left + right) / 2;
        if (a[mid] == x)
        {
            return mid;
        }
        else if (a[mid] > x)
        {
            right = mid - 1;//1 2 3 4 5
        }
        else
        {
            left = mid + 1;
        }
    }
    return -1;
}
int main()
{
    int n;
    int a[100];
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
    {
        scanf("%d,", &a[i]);
    }
    int flag;
    scanf("%d", &flag);
    int result = BinarySearch(a, n, flag);
    printf("%d\n", result + 1);
    return 0;
}



```





## 链表

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
struct LinkNode
{
	int data;
	struct LinkNode* next;
};


//init初始化链表
struct LinkNode* Init_LinkNode()
{
	struct LinkNode* header = (struct LinkNode*)malloc(sizeof(struct LinkNode));
	header->data = -1;
	header->next = NULL;
	//尾部指针
	struct LinkNode* pRear = header;
	int val = -1;
	while (1)
	{
		printf("请输入插入的数据：\n");
		scanf_s("%d", &val);
		if (val == -1)
		{
			break;
		}
		//创建新节点
		struct LinkNode* newnode = (struct LinkNode*)malloc(sizeof(struct LinkNode));
		newnode->data = val;
		newnode->next = NULL;
		//new节点插入到链表中
		pRear->next = newnode;
		pRear = newnode;

	}
	return header;

}
//在oldval前面插入一个新的数据newval;
void InsertByValue_LinkList(struct LinkNode* header, int oldval, int newval)
{
	//判断参数
	if (header == NULL)//插到数据尾部也可以
	{

		return;//+
	}
	//双指针，一个pPrev,一个pCurrent	
	struct LinkNode* pPrev = header;
	struct LinkNode* pPcurrent = pPrev->next;
	while (pPcurrent != NULL)//赵到oldval
	{
		if (pPcurrent->data == oldval)
		{
			break;
		}
		pPrev = pPcurrent;
		pPcurrent = pPcurrent->next;
	}
	if (pPcurrent==NULL)//pCurrent为空，则不存在
	{
		return;
	}
	//创建新结点
	struct LinkNode* newnode = (struct LinkNode*)malloc(sizeof(struct LinkNode));
	newnode->data = newval;
	newnode->next = NULL;
	//新结点插入
	newnode->next = pPcurrent;
	pPrev->next = newnode;
}
//删除值为val的节点
void RemoveByValue_LinkList(struct LinkNode* header,int(delvalue))
{
	if (header == NULL)
	{
		return;
	}
	//两个辅助指针
	struct LinkNode* pPrev = header;
	struct LinkNode* pCurrent = pPrev->next;
	while (pCurrent != NULL)
	{
		if (pCurrent->data== delvalue)
		{
			return;
		}
		pPrev= pCurrent;
		pCurrent = pCurrent->next;
	}
	if (pCurrent == NULL)
	{
		return;
	}
	//重新建立带删除节点的前端和后端
	pPrev->next = pCurrent->next;//就是跳过中间的那个区域，把前后两个节点相连，就相当于删除
	free(pCurrent);
	pCurrent = NULL;


}
//遍历
void Foreach_LinkList(struct LinkNode* header)
{
	if (header == NULL)
	{
		return;
	}
	//辅助指针变量
	struct LinkNode* pCurrent = header->next;
	while (pCurrent != NULL)
	{
		printf("%d\n", pCurrent->data);
		pCurrent = pCurrent->next;
	}
}
//销毁
void Destroy_LinkList(struct LinkNode* header)
{
	if (header == NULL)
	{
		return;
	}
	struct LinkNode* pCurrent = header->next;
	while (pCurrent != NULL)
	{
		struct LinkNode* pNext = pCurrent->next;
		free(pCurrent);

		pCurrent = pNext;
	} 
}
//清空
void Clear_LinkList(struct LinkNode* header)
{
	if (header == NULL)
	{
		return 0;
	}
	struct LinkNode* pCurrent = header->next;
	while (pCurrent != NULL)
	{
		//先保存下一个节点的地址
		struct LinkNode* pNext = pCurrent->next;
		//释放当前内存
		free(pCurrent);
		pCurrent = pNext;
	}
	header->next = NULL;

}





int main()
{

	struct LinkNode* header = Init_LinkNode();
	Foreach_LinkList(header);
	void InsertByValue_LinkList(struct LinkNode* header, int oldval, int newval);
	return 0;
}

```







## 栈与队列

stack:

push

pop

### 栈：数组

```c
/*
栈：数组
 顺序栈：栈的顺序存储结构是利用一组地址连续的存储单元依次存放自栈底到栈顶的数据元素，同时附设指针top指示栈顶元素在顺序栈中的位置
*/

#include<stdio.h>
#include<stdlib.h>
#include<assert.h>

 
#define Stack_Init_Size 10
#define Stack_Add_Size 5
 
//定义顺序栈的结构体
typedef int ElemType;
typedef struct Stack
{
	ElemType* base;	//定义栈底指针
	ElemType* top;	//定义栈顶指针
	int capacity;	//指明当前栈的容量
}Stack;
 
 
//栈的初始化操作
int StackInit(Stack* ps)
{
	ps->base = (ElemType*)malloc(sizeof(ElemType) * Stack_Init_Size);
	if (NULL == ps->base) //空间申请失败处理
	{
		printf("空间申请失败\n");
		return -1;	}
	ps->top = ps->base;
	ps->capacity = Stack_Init_Size;

	return 0;
}
//栈的判空操作
int StackIsEmpty(Stack* ps)
{
	return ps->base == ps->top ? 1 : 0;
}
//当前栈内元素数量
int StackNum(Stack* ps)
{
	return ps->top - ps->base;
}
//获取栈顶元素
int GetTop(Stack* ps, ElemType* e)
{
	if(!ps) 
		return -1;
	if (ps->base == ps->top)
	{
		printf("当前栈中无元素\n");
		return -1;
	}
	*e = *(ps->top);

	return 0;
}



//出栈
int StackPop(Stack* ps, ElemType* e)
{
	if(!ps) 
		return -1;
		
	if (ps->base == ps->top)
	{
		printf("当前栈中无元素\n");
		return -1;
	}
	*e = *(ps->top);//?
	--(ps->top);
	
	return 0;
}
//检查栈是否需要扩容
int StackCheckCapacity(Stack* ps)
{
	if(!ps) 
		return -1;
		
	if (ps->top - ps->base >= ps->capacity-1)//注意要-1
	{
		ps->base = (ElemType*)realloc(ps->base, sizeof(ElemType) * (ps->capacity + Stack_Add_Size));
		if (NULL == ps->base)
		{
			printf("空间申请失败\n");
			return -1;
		}
		ps->top = ps->base + ps->capacity;
		ps->capacity += Stack_Add_Size;
	}
	
	return 0;
}
//入栈
int StackPush(Stack* ps, ElemType e)
{
	if(!ps) 
		return -1;
		
	StackCheckCapacity(ps);
	
	ps->top++;
	*(ps->top) = e;
	
	return 0;
}

// 销毁栈 
int StackDestroy(Stack* ps)
{
	if(!ps) 
		return -1;
		
	if (ps->base)
	{
		free(ps->base);
		ps->base = NULL;
		ps->top = NULL;
		ps->capacity = 0;
	}
}

int main()
{
	Stack ss;
	
	StackInit(&ss);		

	for (int i=0;i<5;i++){
		ElemType e=i*5;
		StackPush(&ss,e);
	}

	for (int i=0;i<5;i++){
		ElemType e;
		StackPop(&ss,&e);
		printf("%d ",e);
	}

	StackDestroy(&ss);

	return 0;
}

队列（链表）
```



### 栈（链表）

```c
/*
本例采用带有头节点的链表来实现栈。 
*/
#include<stdio.h>
#include<stdlib.h>
 
//定义栈的结构体
typedef int ElemType;

typedef struct StackNode
{
	ElemType data;
	struct StackNode* next;
}StackNode;

typedef struct
{
	StackNode* top;
	int count;
}Stack;
 
//创建栈的结点
StackNode* CreateNewNode(ElemType e)
{
	StackNode* newNode = (StackNode*)malloc(sizeof(StackNode));
	if ( newNode== NULL)
	{
		printf("空间申请失败\n");
		return NULL;
	}
	newNode->next = NULL;
	newNode->data = e;
	return newNode;
}
// 初始化栈 
void StackInit(Stack* s)
{
	//定义具有头结点的栈
	if(!s) 
	{
		printf("空指针\n");
		return;
	}

	s->top = (StackNode*)malloc(sizeof(StackNode));
	if (NULL == s->top)
	{
		printf("空间申请失败\n");
		return;
	}
	s->top->next = NULL;
	s->count =0;
}
// 入栈 
void StackPush(Stack* s, ElemType data)
{

	if(!s) 
	{
		printf("空指针\n");
		return;
	}

	StackNode* newNode = CreateNewNode(data);

	newNode->next=s->top->next;
	s->top->next = newNode;//类似于循环链表

	s->count++;
}

//出栈 
void StackPop(Stack* s,ElemType *datap)
{

	if(!s) 
	{
		printf("空指针\n");
		return;
	}

	if (s->count==0) //当前栈无元素
	{
		printf("当前栈中为空\n");
		return;
	}

	StackNode* outNode = s->top->next;
	*datap=outNode->data;

	if (s->count==1) //当前栈仅有一个元素
	{
		s->top->next = NULL;
	}
	else //当前栈有多个元素
	{
		s->top->next = outNode->next;//
	}
	free(outNode);
	s->count--;
}

// 获取栈顶素 
void StackTop(Stack* s,ElemType* e)
{
	
		if(!s) 
	{
		printf("空指针\n");
		return;
	}

	if (s->count == 0) //当前栈无元素
	{
		printf("当前栈中为空\n");
		return ;
	}
	*e= s->top->next->data;
}

// 获取栈尾元素 
void StackBase(Stack* s,ElemType* e)
{
	
		if(!s) 
	{
		printf("空指针\n");
		return;
	}

	if (s->count == 0) //当前栈无元素
	{
		printf("当前栈中为空\n");
		return ;
	}

	StackNode* cur = s->top->next;
	while (cur->next)
	{
		cur = cur->next;
	}

	*e= cur->data;
}



// 获取栈中有效元素个数 
int StackSize(Stack* s)
{
	if(!s) 
	{
		printf("空指针\n");
		return -1;
	}

	return s->count;
}
// 检测栈是否为空，如果为空返回非零结果，如果非空返回0 
int StackEmpty(Stack* s)
{
	if(!s) 
	{
		printf("空指针\n");
		return -1;
	}

	return !s->count;
}
// 销毁栈 
void StackDestroy(Stack* s)
{
	if (StackEmpty(s))
	{
		free(s->top);
		s->top = NULL;
	}
	else{
		StackNode* cur = s->top->next;
		while (cur)
		{
			StackNode* temp = cur->next;
			free(cur);
			cur = temp;
		}
		free(s->top);
		s->top = NULL;
	}
}

int main()
{
	Stack s;
	ElemType e;

	StackInit(&s);
	
	for(int i=0;i<5;i++) {
		ElemType e=i*5;
		StackPush(&s,e);
	}


	for(int i=0;i<5;i++) {
		ElemType e;
		StackPop(&s,&e);
		printf("%d ",e); 
	}
	
	StackDestroy(&s);
}	


```

### 队列：链表

```c
/*
用链表表示的队列称为链队列。一个链队列需要两个分别指示队头与队尾的指针才能唯一确定。
本例采用带有头节点的链表来实现。 
*/
#include<stdio.h>
#include<stdlib.h>
 
//定义队列的结构体
typedef int ElemType;

typedef struct QueueNode
{
	ElemType data;
	struct QueueNode* next;
}QueueNode;

typedef struct
{
	QueueNode* front;
	QueueNode* rear;
}Queue;/
 
//创建队列的结点
QueueNode* CreateNewNode(ElemType e)
{
	QueueNode* newNode = (QueueNode*)malloc(sizeof(QueueNode));
	if (NULL == newNode)
	{
		printf("空间申请失败\n");
		return NULL;
	}
	newNode->next = NULL;
	newNode->data = e;
	return newNode;
}
// 初始化队列 
void QueueInit(Queue* q)
{
	//定义具有头结点的队列
	q->front = (QueueNode*)malloc(sizeof(QueueNode));
	if (NULL == q->front)
	{
		printf("空间申请失败\n");
		return;
	}
	q->front->next = NULL;
	q->rear = q->front;
}
// 队尾入队列 
void QueueIn(Queue* q, ElemType data)
{
	QueueNode* newNode = CreateNewNode(data);
	q->rear->next = newNode;//指向移动
	q->rear = newNode;//指针移动
}

// 队头出队列 
void QueueOut(Queue* q,ElemType *datap)
{
    //少了1个判定空
	if (q->rear == q->front) //当前队列无元素
	{
		printf("当前队列中为空\n");
		return;
	}

	QueueNode* newNode = q->front->next;
	*datap=newNode->data;

	if (q->front->next == q->rear) //当前队列仅有一个元素
	{
		q->front->next = NULL;
		q->rear = q->front;
	}
	else //当前队列有多个元素
	{
		q->front->next = newNode->next;
	}
	free(newNode);
}
// 获取队列头部元素 
void QueueFront(Queue* q,ElemType* e)
{
	if (q->rear == q->front) //当前队列无元素
	{
		printf("当前队列中为空\n");
		return ;
	}
	*e= q->front->next->data;
}

// 获取队列队尾元素 
void QueueBack(Queue* q,ElemType* e)
{
	if (q->rear == q->front) //当前队列无元素
	{
		printf("当前队列中为空\n");
		return;
	}
	*e= q->rear->data;
}

// 获取队列中有效元素个数 
int QueueSize(Queue* q)
{
	if (q->rear == q->front) //当前队列无元素
	{
		printf("当前队列中为空\n");
		return 0;
	}
 
	int count = 0;
	QueueNode* cur = q->front->next;
	while (cur)
	{
		count++;
		cur = cur->next;
	}
	return count;
}
// 检测队列是否为空，如果为空返回非零结果，如果非空返回0 
int QueueEmpty(Queue* q)
{
	return q->front == q->rear;
}
// 销毁队列 
void QueueDestroy(Queue* q)
{
	if (QueueEmpty(q))
	{
		free(q->front);
		q->front = NULL;
		q->rear = NULL;
	}
	else{
		QueueNode* cur = q->front->next;
		while (cur)
		{
			QueueNode* temp = cur->next;
			free(cur);
			cur = temp;
		}
		free(q->front);
		q->front = NULL;
		q->rear = NULL;
	}
}

int main()
{
	Queue q;

	QueueInit(&q);
	
	for(int i=0;i<5;i++) {
		ElemType e=i*5;
		QueueIn(&q,e);
	}


	for(int i=0;i<5;i++) {
		ElemType e;
		QueueOut(&q,&e);
		printf("%d ",e); 
	}
	QueueDestroy(&q);
}	

```

## 一些技巧

### 1.ascll码从文本变成数字：

```c
num[str[0]-'0']
str[0]是字符串数组的第一个元素
后面的'0'是一个char
这样的写法是用Ascii做减法处理
比如 str[0]如果 = '8'
char'8'= int 38 '0' = int 30
得到的结果就是 8
```

### 2.在控制台指定位置打印

```c
#include <stdio.h>
#include <stdlib.h>
#include <Windows.h>

int main()
{
	//定义句柄变量,在指定位置打印出东西
	HANDLE g_ConsoleOutPut;
	//pos位置
	COORD pos = { 5, 15 };
	//获取句柄
	g_ConsoleOutPut = GetStdHandle(STD_OUTPUT_HANDLE);
	//移动光标到pos位置
	SetConsoleCursorPosition(g_ConsoleOutPut, pos);
	printf("welcome");
	//关闭
	CloseHandle(g_ConsoleOutPut);


	return 0;
}
```

### 3.SetConsoleTitle

```c
#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

int main()
{
	SetConsoleTitle("My World!");


	return 0;
}
```

### 4.控制台改变字体颜色

```c
#include <stdio.h>
#include <stdlib.h>
#include <Windows.h>

int main(){

	HANDLE g_ConsoleOutPut;
	
	//获取句柄
	g_ConsoleOutPut = GetStdHandle(STD_OUTPUT_HANDLE);
	//设置句柄颜色
	SetConsoleTextAttribute(g_ConsoleOutPut, FOREGROUND_BLUE);

	printf("hello");
	

	return 0;
}
```

### 5.记录时间

```c
#include <stdio.h>
#include <stdlib.h>
#include <Windows.h>
#include <conio.h>
#include <time.h>//这个是主要的
int main(){
	clock_t time_now,time_end;
	int j;
	double temp;
	time_now = clock();//记录第一次使用时间

	
		time_end = clock();//记录结束时间
		temp = (double)(time_end - time_now) / CLOCKS_PER_SEC;
		printf("hello use time:%f s\n",temp);
	//太快了可以用循环
	return 0;
}
```

### 6.rand函数获取随机数的基础用法为：

rand()%a;
1
a是一个整数，返回值为0到a的随机数，包含0，但不包含a。

如果想要产生一个0-99之间的随机数，那么用法如下：

int num = rand() % 100;
1
如果想要产生一个1-100之间的随机数，那么用法如下:

int num = rand() % 100 + 1;
1
同理，如果想要产生一个1-60之间的随机数，那么用法如下:

 int num = rand() % 60 + 1;//产生一个1-60之间的数
1
从上面的例子中我们可以推理出m-----n的随机数:

rand()%(n-m+1) + m;
1
比如获取15~43的随机数：

rand()%29+15;



### 7.窗口

```
void GameOver()
{
	HWND wnd = GetHWnd();
	if (MessageBox(wnd, _T("游戏结束。\n您想重新来一局吗？"), _T("游戏结束"), MB_YESNO | MB_ICONQUESTION) == IDYES)
		//NewGame();
	else
		Quit();
}

void Quit()
{
	//closegraph();
	exit(0);
}
```

```c
HWND hWnd=0;
if (MessageBox(hWnd, _T("张涵是帅哥！"), _T("张涵"), MB_YESNO | MB_ICONQUESTION)==IDYES)
{
	cout << "你说的对" << endl;
}
else
{
	cout << "sb" << endl;
}
```

### 8.清空

```c
system("cls");
```



## easyx

### easyx初始化窗口

```c++
#include <iostream>
using namespace std;
#include <graphics.h>


int main()
{

	
	initgraph(1280, 720);
	getchar();
    closegraph();

	return 0;
}
```



### easy图片

```c
#include <stdio.h>
#include <easyx.h>
void InitGame();
void DrawGame();
void UpdateGame();
IMAGE Background;
int main()
{
	initgraph(1280, 720);
	InitGame();
	DrawGame();
	while (1)
	{
	}
	return 0;
}
void InitGame()
{
	//加载图片
	//background，记得在调试窗口更改unicode
	loadimage(&Background, "./back.jpg", 1280, 720);//加载
};
void DrawGame()
{
	putimage(0, 0, &Background);
};
```

多张图片：

```c
void InitGame()
{
	//加载图片
	//background
	loadimage(&Background, "./back.jpg", 1280, 720);//加载
	//fish
	for (int i = 0; i < 5; i++)//type
	{
		for (int j = 0; j < 2; j++)
		{
			char buff[16] = { 0 };
			sprintf(buff, "./%d%d.png", i, j);
			loadimage(&FishImg[i][j], buff);
		}
	}
};
```

### easy基础：

```c++
#include <iostream>
using namespace std;
#include <graphics.h>


int main()
{

	
	initgraph(1280, 720,SHOWCONSOLE);//初始化

	setbkcolor(WHITE);//背景改颜色，后面必须加上刷新屏，不然显示不出来
	cleardevice();//清屏


	setfillcolor(YELLOW);//填充颜色
	setlinecolor(BLUE);//边框颜色
	setlinestyle(PS_SOLID,5);//边框格式//#define PS_SOLID            
	
	
//#define PS_DASH             1       /* -------  */
//#define PS_DOT              2       /* .......  */
//#define PS_DASHDOT          3       /* _._._._  */
//#define PS_DASHDOTDOT       4       /* _.._.._  */
	circle(50,50,50);//
	fillcircle(150, 50, 50);//
	solidcircle(250, 50, 50);//
	getchar();
	
	closegraph();


	
		return 0;
}
```

```c
#include<iostream>
#include<graphics.h>//包含图形库头文件
#include<easyx.h>//包含图形库头文件
#include<conio.h>//使用_getch()
using namespace std;

//绘制按钮  x，y为左上角坐标  w为按钮宽度，h为按钮高度
void button(int x, int y, int w, int h, const char* text)
{
	setfillcolor(RGB(0, 162, 232));//圆角矩形填充颜色
	fillroundrect(x, y, x + w, y + h, 10, 10);//绘制圆角矩形

	char arr[50];
	strcpy_s(arr, text);//将text中的字符拷贝到arr里

	setbkmode(TRANSPARENT);//文字背景透明
	settextstyle(30, 0, "楷体");//文字样式
	outtextxy(x + ((w - textwidth(arr)) / 2), y + (h - textheight(arr)) / 2, arr);//居中绘制文字
}

//绘制图片
void image()
{
	IMAGE img;
	loadimage(&img, "./图片1.png", 200, 150);
	putimage(0, 0, &img);
}


int main()
{
	//创建一个窗口,确定窗口大小
	initgraph(640, 480, EW_SHOWCONSOLE);


	ExMessage msg;//结构体 用于保存鼠标消息

	int x = 0, y = 0;

	//控制球移动
	while (1)
	{
		//绘制操作前加上BeginBatchDraw();
		BeginBatchDraw();

		setbkcolor(RGB(225, 127, 39));//设置背景颜色
		cleardevice();//清屏 设置背景颜色后要清屏才能将背景颜色设置好
		button(200, 200, 150, 100, "button");//绘制按钮  用于测试
		image();//绘制图片	用于引出BeginBatchDraw()	EndBatchDraw()	FlushBatchDraw()三个函数

		setfillcolor(BROWN);
		fillcircle(x, y, 50);//绘制圆

		//绘制完成后加上  EndBatchDraw();或者FlushBatchDraw();
		EndBatchDraw();//或者FlushBatchDraw();


		//上键
		if (GetAsyncKeyState(VK_UP))
		{
			cout << "上" << endl;
			y -= 1;//如果按上键 y坐标向上移动5	因为向下为正所以是-5
		}
		//下键
		if (GetAsyncKeyState(VK_DOWN))
		{
			cout << "下" << endl;
			y += 1;
		}
		//左键
		if (GetAsyncKeyState(VK_LEFT))
		{
			cout << "左" << endl;
			x -= 1;
		}
		//右键
		if (GetAsyncKeyState(VK_RIGHT))
		{
			cout << "右" << endl;
			x += 1;
		}
		if (peekmessage(&msg, EM_MOUSE))
		{
			switch (msg.message)
			{
				//如果左键按下
			case WM_LBUTTONDOWN:
				if (msg.x >= 200 && msg.x <= 200 + 150 && msg.y >= 200 && msg.y <= 200 + 100)//判断鼠标点击是否在按钮内
				{
					cout << "点击了左键" << endl;
				}
				break;
			case WM_RBUTTONDOWN:
				if (msg.x >= 200 && msg.x <= 200 + 150 && msg.y >= 200 && msg.y <= 200 + 100)//判断鼠标点击是否在按钮内
				{
					cout << "点击了右键" << endl;
				}
				break;
			}
		}

	}


	//防止闪退
	getchar();

	//关闭窗口
	closegraph();

	return 0;
}
```

### easyx制作按钮：

```c
#include <graphics.h>       // 引用图形库头文件
#include <conio.h>
#include<stdio.h>
#include<easyx.h>
void button(int x, int y, int w, int h, TCHAR* text)
{
    setbkmode(TRANSPARENT);
    setfillcolor(GREEN);
    fillroundrect(x, y, x + w, y + h, 10, 10);
    // 输出字符串（MBCS 字符集）
    TCHAR s1[] = L"黑体";
    settextstyle(30, 0, s1);
    TCHAR s[50] = L"hello";

    int tx = x + (w - textwidth(text)) / 2;
    int ty = y + (h - textheight(text)) / 2;

    outtextxy(tx, ty, text);

}
int main()
{
    initgraph(640, 480);    // 创建绘图窗口，大小为 640x480 像素
    setbkcolor(BLUE);
    cleardevice();
    TCHAR s[50] = L"1.读取点云";
    TCHAR s1[50] = L"2.分割点云";
    TCHAR s2[50] = L"3.单个树木";
    TCHAR s3[50] = L"4.树木重建";
    button(220, 50, 170, 50, s);
    button(220, 150, 170, 50, s1);
    button(220, 250, 170, 50, s2);
    button(220, 350, 170, 50, s3);
    ExMessage msg;
    while (true) {
        if (peekmessage(&msg, EM_MOUSE)) {

            switch (msg.message)
            {
            case WM_LBUTTONDOWN:
                if (msg.x >= 220 && msg.x <= 220 + 170 && msg.y >= 50 && msg.y <= 50 + 50)
                {

                    outtextxy(200, 200, s);	//写了一个展示文字的效果，相当于是测试,实际使用时可以删除
                    //在此处写下按钮点击时要执行的函数，实现相应的功能
                }
                if (msg.x >= 220 && msg.x <= 220 + 170 && msg.y >= 150 && msg.y <= 150 + 50)
                {

                    outtextxy(200, 200, s1);
                    //在此处写下按钮点击时要执行的函数，实现相应的功能  
                }
                if (msg.x >= 220 && msg.x <= 220 + 170 && msg.y >= 250 && msg.y <= 250 + 50)
                {

                    outtextxy(200, 200, s2);
                    //在此处写下按钮点击时要执行的函数，实现相应的功能
                }
                if (msg.x >= 220 && msg.x <= 220 + 170 && msg.y >= 350 && msg.y <= 350 + 50)
                {

                    outtextxy(200, 200, s3);
                    //在此处写下按钮点击时要执行的函数，实现相应的功能
                }
                break;
            default:
                break;
            }
        }

    }


    return 0;
}
```

### easyx获取鼠标信息：

```c
int main()
{	
	/*cout << "lv`s的职工管理系统" << endl;
	
	system("pause");
	workerManager p;
	p.show_menu();*/
	initgraph(640, 480, SHOWCONSOLE);
	setbkcolor(RGB(164, 225, 202));
	cleardevice();
	MOUSEMSG m;		// 定义鼠标消息
workerManager ps;
	while (1) {
		ExMessage m;//定义一个消息变量
		m = getmessage(EM_MOUSE);//获取鼠标消息
		switch (m.message)
		{
		case WM_MOUSEMOVE:
			// 鼠标移动的时候画红色的小点
			putpixel(m.x, m.y, RED);
			break;

		case WM_LBUTTONDOWN:
			// 鼠标左击后，画一个小方块
			rectangle(m.x - 5, m.y - 5, m.x + 5, m.y + 5);
			
			//ps.show_menu();
			//system("pause");
			break;

		case WM_RBUTTONUP:
			return 0;	// 鼠标右击退出程序
		}
	}

	// 关闭图形窗口
	closegraph();



	return 0;
}
```



## c++

### 1.重载递减

```c++
#include <iostream>
using namespace std;

class myint
{
public:

	friend ostream& operator<<(ostream& cout, myint& as);
	void seta(int a)
	{
		this->a=a;
	}

	int geta()
	{
		return a;
	}

	myint& operator--()
	{
		a--;
		return *this;
	}//--a,先减后打印

	myint operator--(int)
	{
		myint tmp = *this;
		a--;
		return tmp;
	}//a--先打印后减

private:

	int a;
};





class herint
{

public:
	
	void setb(int b)
	{
		this->b = b;
	}
	int getb()
	{
		return b;
	}
	
private:
	int b;
};
ostream& operator<<(ostream& cout, myint &as)
{
	cout << "a=" << as.a;
	return cout;
}
void test()
{
	//必须是全局函数
	myint u;
	u.seta(10);
	u--;
	cout << --u << endl;;
}


int main()
{
	test();

	return 0;
}
```

### 2.暂存12.6

#### 所有私有内容都不可以访问，但是继承了，只是被隐藏了

**公有继承：分公、保**

保护继承：全保护

私有继承：全私有



#### 继承中的对象模型：

构造：先调用父亲，再调用儿子

析构：白发人送黑发人，儿子先死，父亲后死



#### 同名属性：

\* 访问子类同名成员 直接访问即可
\* 访问父类同名成员 需要加作用域

```c++
Son s;
cout << "Son下的m_A = " << s.m_A << endl;
cout << "Base下的m_A = " << s.Base::m_A << endl;
```

#### **同名**函数：

```c++
s.func();
s.Base::func();
```

//如果子类和父类同名，子类同名会隐藏掉父类所以同名

```c++
func(10);//不会重载
s.Base::func(10);
```

#### 同名静态成员：

\- 访问子类同名成员 直接访问即可
\- 访问父类同名成员 需要加作用域

```c

//通过对象访问
cout << "通过对象访问： " << endl;
Son s;
cout << "Son 下 m_A = " << s.m_A << endl;
cout << "Base 下 m_A = " << s.Base::m_A << endl;
```

```c

 cout << "通过类名访问： " << endl;
cout << "Son 下 m_A = " << Son::m_A << endl;
 //第一个通过类名，第二个是访问父类
cout << "Base 下 m_A = " << Son::Base::m_A << endl;
```

重载同上



#### 菱形继承：（用虚继承解决）

```c
class Animal
{
public:
int m_Age;
};
//继承前加virtual关键字后，变为虚继承
//此时公共的父类Animal称为虚基类
class Sheep : virtual public Animal {};
class Tuo : virtual public Animal {};
class SheepTuo : public Sheep, public Tuo {};
```

虚继承：vbptr->vbable表，所以数据只有一个

```c
cout << "st.Sheep::m_Age = " << st.Sheep::m_Age << endl;
cout << "st.Tuo::m_Age = " << st.Tuo::m_Age << endl;
cout << "st.m_Age = " << st.m_Age << endl;
```

结果是一样的

#### 多态

### 文件操作

```c
头文件：<fstream>
```

文本文件,二进制文件

操作文件：

```
ofsteam:写
ifsteam:读
fstream:读写
```

#### 写文件步骤如下：

1. 包含头文件#include <fstream\>

2. 创建流对象ofstream ofs;

3. 打开文件ofs.open("文件路径",打开方式);

4. 写数据ofs << "写入的数据"<<endl;

5. 关闭文件ofs.close();

| 打开方式    | 解释                       |
| ----------- | -------------------------- |
| ios::in     | 为读文件而打开文件         |
| ios::out    | 为写文件而打开文件         |
| ios::ate    | 初始位置：文件尾           |
| ios::app    | 追加方式写文件             |
| ios::trunc  | 如果文件存在先删除，再创建 |
| ios::binary | 二进制方式                 |

**注意：** 文件打开方式可以配合使用，利用|操作符
**例如：**用二进制方式写文件 `ios::binary | ios:: out`

e.g.

```c
#include <iostream>
#include <fstream>
using namespace std;
void test01()
{
	ofstream ofs;
	ofs.open("test.txt", ios::out);
	ofs << "姓名：张三" << endl;
	ofs << "性别：男" << endl;
	ofs << "年龄：18" << endl;
	ofs.close();
}
int main() {
	test01();
	system("pause");
	return 0;
}
```

#### 读文件：

1. 包含头文件
    \#include <fstream\>
2. 创建流对象
    ifstream ifs;
3. 打开文件并判断文件是否打开成功
    ifs.open("文件路径",打开方式);

**ifs.is_open()**;判断是否打开成功，成功返回真

4.读数据
四种方式读取

```c
//第一种方式
//char buf[1024] = { 0 };
//while (**ifs >> buf**)
//{
// cout << buf << endl;
//}

//第二种
//char buf[1024] = { 0 };
//while (**ifs.getline**(buf,sizeof(buf)))//字符的空间
//{
// cout << buf << endl;
//}

//第三种
//string buf;

//while (**getline**(ifs, buf)) 
//{
// cout << buf << endl;
//}

第四种：不建议

char c;
while ((c = ifs.get()) != EOF)//EOF文件尾部
{
cout << c;
}



5.关闭文件
ifs.close();
```





#### 二进制文件

##### 写

```c
#include <fstream>
#include <string>

class Person
{
public:
char m_Name[64];
int m_Age;
};
//二进制文件 写文件
void test01()
{
//1、包含头文件
    
//2、创建输出流对象
ofstream ofs("person.txt", ios::out | ios::binary);//2.3都可以,建议2

//3、打开文件
//ofs.open("person.txt", ios::out | ios::binary);

Person p = {"张三" , 18};
//4、写文件，重点
ofs.write((const char *)&p, sizeof(p));
    //二进制会有乱码
//5、关闭文件
ofs.close();
}

int main() {
test01();
system("pause");
return 0;
}
```

读

```c
#include <fstream>
#include <string>
class Person
{
public:
char m_Name[64];
int m_Age;
};

void test01()
{
    
ifstream ifs("person.txt", ios::in | ios::binary);
if (!ifs.is_open())
{
cout << "文件打开失败" << endl;
}
Person p;
//重要(读二进制文件)
ifs.read((char *)&p, sizeof(p));
cout << "姓名： " << p.m_Name << " 年龄： " << p.m_Age << endl;
    
ifs.close();
}
int main() {
test01();
system("pause");
return 0;
}

```

##### 小练习：

```c
#include <iostream>
#include <fstream>
#include <string>
using namespace std;
class person
{
public:
	
	long long id;
	string name;
};
void test01()
{
	ofstream ofs("text.txt", ios::out|ios::binary);
	
	person p = {202380904019,"张涵"};
	ofs.write((const char*)&p, sizeof(p));

	ifstream ifs("text.txt", ios::in | ios::binary);
	if (!ifs.is_open())
	{
		cout << "error" << endl;
	}
	ifs.read((char*)&p, sizeof(p));

	cout << p.id << "\n" << p.name << endl;


	ofs.close();

}

int main() {
	test01();
	system("pause");
	return 0;
}

```



## 模板

泛型编程：

都是相同的逻辑：引入模板

<img src="C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210111937326.png" alt="image-20231210111937326" style="zoom:200%;" />

### 标准：

```c++
template<class T>//class更好
```

e.g.	

```c++
#include <iostream>
using namespace std;

template<typename T>
void test(T &a,T&b) {
	T tmp = a;
	a = b;
	b = tmp;
}
int main()
{
	float a =20, b = 90;
	cout << a << b << endl;
	//1.
	test(a, b);
	//2.
	test<float>(a, b);
	cout << a<<b<< endl;
	return 0;
}
```

注意：

![image-20231210113301708](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210113301708.png)

![image-20231210113346303](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210113346303.png)

2.解决：func<int>()



### 3.案例：

```c++
#include <iostream>
using namespace std;

template<class T>
void mysort(T arr[], int len)
{//选择排序
	for (int i = 0; i < len; i++)
	{
		int min = i;
		for (int j = 1 + i; j < len; j++)
		{
			if (arr[j] < arr[min])
			{
				min = j;
			}
		}
		if (min != i)
		{
			T tmp;
			tmp = arr[i];
			arr[i] = arr[min];
			arr[min] = tmp;
		}
	}
}

template<class T>
void printarr(T arr[],int len)
{
	for (int i=0; i < len; i++)
	{
		cout << arr[i] << " ";
	}
	cout << endl;
}

template<class T>
void test(T arr,int len)
{
	mysort(arr, len);
	printarr(arr, len);
}
int main()
{
	char arr[] = "fahsdkg";
	int len = (sizeof(arr) / sizeof(arr[0])) - 1;
	test(arr, len);

	int buf[20] = { 2,324,54,6,54,3,2,56,43 };
	int lens = (sizeof(arr) / sizeof(arr[0]));
	test(buf, lens);
	return 0;
}
```

### 注意1：

![image-20231210120158439](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210120158439.png)

普通函数：

![image-20231210120215679](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210120215679.png)

 模板：

![image-20231210120405747](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210120405747.png)

不可以发生隐式类型转换

![image-20231210120419794](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210120419794.png)

但是这样：可以发生隐式类型转换：（更好）

![image-20231210120521712](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210120521712.png)

### 调用规则

![image-20231210120824308](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210120824308.png)

2.![image-20231210121116198](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210121116198.png)

3.![image-20231210121158680](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210121158680.png)



4.![image-20231210121232171](C:\Users\Lenovo\Desktop\image-20231210121232171.png)

![image-20231210121309508](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210121309508.png)



### 模板的局限性

![image-20231210133958426](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210133958426.png)

![image-20231210134006609](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210134006609.png)

解决：

1.1运算符重载

**1.2**利用具体化

![image-20231210134616477](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210134616477.png)

**目的：用stl固定的模板，而不是自己写模板目的**

### 类模板

![image-20231210135455579](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210135455579.png)

![image-20231210135701243](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210135701243.png)

![image-20231210135804840](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210135804840.png)

只有类模板才能有默认参数

1.

![image-20231210140122026](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210140122026.png)



2.

![image-20231210140205948](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210140205948.png)

![image-20231210140219560](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210140219560.png)



类模板中，创建时机：

![image-20231210140441154](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210140441154.png)

![image-20231210140748321](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210140748321.png)

1。常用：

 ![image-20231210141018119](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210141018119.png)

2

![image-20231210141145337](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210141145337.png)

注：typeid，可以看到模板中类型名字

3

![image-20231210141332019](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210141332019.png)



类模板与继承

![image-20231210141504580](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210141504580.png)

1.![image-20231210141947941](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210141947941.png)

2.灵活指定：

![image-20231210142218842](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210142218842.png)

构造函数类外实现：

![image-20231210211048670](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210211048670.png)

![image-20231210211403899](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210211403899.png)

类模板分文件：模板链接不到

1.改为：.h->.cpp

2.更好）：.h和.cpp中的内容写在一起，后缀名改为hpp



类模板与友元

1.类内实现

![image-20231210212325141](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210212325141.png)

2.类外实现（很麻烦）

![image-20231210212728010](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210212728010.png)

要在它前面：

![image-20231210212742248](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210212742248.png)



类模板的项目：数组（懒得做了，放着）

## STL（标准模板库）

![image-20231210213900513](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210213900513.png)

![image-20231210213912545](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210213912545.png)

![image-20231210214207361](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210214207361.png)

可以把迭代器当做指针使用

![image-20231210215143419](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210215143419.png)

注意：都要注意头文件

### vector

![image-20231210215822776](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210215822776.png)

![image-20231210215837971](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210215837971.png)

![image-20231210220030405](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210220030405.png)

更好用：

![image-20231210220141225](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210220141225.png)

还有一种利用遍历算法：

```c++
头文件：#include  <algorithm>
void myPrint(int val)
{
cout<<val<<endl;
}
·······
for_each(v.begin(),v.end(),myPrint);

```

![image-20231210220523203](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231210220523203.png)

底层原理|||||||

vector存放自定义数据类型

vector<person> v：：：：

![image-20231212155755003](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212155755003.png)

vector<person*> v：：：

![image-20231212155845024](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212155845024.png)



tip:*it的数据类型等于<>中的类型。



vector容器嵌套容器(类似于二维数组)

![image-20231212161027528](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212161027528.png)

![image-20231212161042825](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212161042825.png)

ps：复杂



### string 容器：

![image-20231212161634632](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212161634632.png)

#### 构造函数：

```c++
string构造:
1.string s1;
2.
const char*str="hello world";
string s2(str);
3.
string(s2);
4.string s4(10,'a');

```

#### 赋值(建议=)

![image-20231212161747454](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212161747454.png)

![image-20231212161928725](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212161928725.png)

![image-20231212162100137](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212162100137.png)

#### 拼接（建议+=）

![image-20231212162151741](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212162151741.png)

![image-20231212162412208](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212162412208.png)

![image-20231212162716407](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212162716407.png)

#### 查找和替换

![image-20231212162743369](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212162743369.png)

常用：

注：rfind和find,一个从右往左，一个从左往右

![image-20231212163245404](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212163245404.png)



![image-20231212163432585](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212163432585.png)

注：指定多少，加入代替多少

#### 比较

![image-20231212163643380](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212163643380.png)



![image-20231212163619091](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212163619091.png)



#### 字符存取

![image-20231212163740123](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212163740123.png)

读：

![image-20231212163856872](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212163856872.png)

写：

![image-20231212163938627](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212163938627.png)

#### 插入和删除

![image-20231212164006080](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212164006080.png)

![image-20231212164117043](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212164117043.png)

![image-20231212164137342](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212164137342.png)

![image-20231212164152374](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212164152374.png)

#### 截取子串

![image-20231212164239724](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212164239724.png)

![image-20231212165710033](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212165710033.png)

bcd

实用性：

![image-20231212165830162](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212165830162.png)



### vector容器

![image-20231212170022329](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212170022329.png)

![image-20231212170110043](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212170110043.png)

#### 构造函数：

![image-20231212170135734](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212170135734.png)

![image-20231212170527282](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212170527282.png)

拷贝好用

![image-20231212170644741](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212170644741.png)



#### 赋值

![image-20231212170726614](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212170726614.png)

![image-20231212171201621](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212171201621.png)

#### 容量和大小

![image-20231212171227958](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212171227958.png)

#### 插入和删除

![image-20231212171547611](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212171547611.png)

尾插和尾删

插入，删除第一个参数是迭代器

![image-20231212171724544](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212171724544.png)

![image-20231212171854768](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212171854768.png)

#### 数据存取

![image-20231212171938864](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212171938864.png)

![image-20231212172017300](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212172017300.png)

![image-20231212172036450](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212172036450.png)

#### 互换容器

![image-20231212172102670](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212172102670.png)

![image-20231212172142766](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212172142766.png)

实际用途：

swap可以收缩空间：
![image-20231212172303623](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212172303623.png)

上面，resize后，大小改变，但容量还是很大

![image-20231212172400905](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212172400905.png)

![image-20231212173130090](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212173130090.png)

匿名对象本行运行完成后就会被回收



预留空间：大数据

![image-20231212173709961](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212173709961.png)

### deque

双端数组



![image-20231212222357062](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212222357062.png)

原理：

![image-20231212222502099](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231212222502099.png)

**![image-20231213173614643](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213173614643.png)**

![image-20231213173712369](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213173712369.png)

可以不可以修改容器内数据：

![image-20231213173802487](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213173802487.png)

d.push_back（）；

iterator



#### 赋值

![image-20231213173922069](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213173922069.png)

deque<int> d1;

d2=d1;

![image-20231213174556955](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213174556955.png)

![image-20231213174613114](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213174613114.png)

#### 大小操作

![image-20231213174633699](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213174633699.png)

没有容量

#### 插入和删除

![image-20231213174751392](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213174751392.png)

#### 数据存取

![image-20231213174829358](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213174829358.png)

#### 排序

#<algorithm>

![image-20231213174926380](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213174926380.png)

sort(d.begin(),d.end())

升序

对于支持随机访问的都可以用sort去排序

### 案例：评委打分

![image-20231213175157734](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213175157734.png)



```c++
#include <iostream>
using namespace std;
#include <vector>
#include <string>
#include <deque>
#include <ctime>
#include <algorithm>
class player {
public:
	player(string name, int score)
	{
		this->name = name;
		this->score = score;
	}

	string name;
	int score;
};

void create(vector<player>& v)
{
	string add = "ABCDE";
	for (int i = 0; i < 5; i++)
	{
		string name = "选手";
		name += add[i];
		int sco = 0;
		player p(name, sco);
		v.push_back(p);
	}
}



void judgescore(vector<player>& v)
{
	
	for (vector<player>::iterator it = v.begin(); it != v.end(); it++)
	{
		cout << it->name;
		//将评委的评分放到容器中去
		deque<int> d;
		for (int i = 0; i < 10; i++)
		{
			int score = rand() % 61 + 40;
			d.push_back(score);
			cout << score << " ";
		}

		sort(d.begin(), d.end());


		d.pop_back();
		d.pop_front();
		int sum = 0;
		for (int i = 0; i < d.size(); i++)
		{
			sum += d.at(i);
		}//应该是8
	/*	for (deque<int>::iterator dit = d.begin(); dit != d.end(); dit++)
		{
			sum += *dit;
		}*/
		int avg = sum / d.size();
		it->score = avg;
		cout <<"平均分"<< it->score << endl;
	}
	
}

int main()
{
	srand((unsigned int)time(NULL));
	vector<player> v;

	create(v);
	judgescore(v);
	
	return 0;
}
```



### stack



![image-20231213211956927](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213211956927.png)

栈不允许有遍历行为

empty（）空

size个数

![image-20231213212301549](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213212301549.png)



### queue

![image-20231213212437278](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213212437278.png)

只有队头和队尾有操作，

不允许遍历

![image-20231213212638445](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213212638445.png)

### list

![image-20231213213024625](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213213024625.png)



双向迭代器

list和vector非常重要



#### 构造

![image-20231213213253753](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213213253753.png)

![image-20231213213414160](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213213414160.png)

![image-20231213213444561](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213213444561.png)

![image-20231213213525792](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213213525792.png)

与其他几乎相同

#### 赋值和交换

![image-20231213213609270](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213213609270.png)

![image-20231213214108782](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213214108782.png)

![image-20231213214133113](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213214133113.png)



#### 大小

![image-20231213214202224](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213214202224.png)

#### 插入删除

![image-20231213214241235](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213214241235.png)



![image-20231213214457128](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213214457128.png)



#### 数据存取

![image-20231213214538407](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213214538407.png)

没有at和【i】。迭代器不支持跳跃存取

it=it+1；如果支持就是可随机访问，不支持就不行

it++可以。

#### list反转与排序

![image-20231213214806939](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213214806939.png)





用sort，不支持随机访问，不可以用标准算法

不支持随机访问的迭代器会内部自己提供排序

![image-20231213214954241](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213214954241.png)



#### list排序案例

自定义的排序要自己知道规则

![image-20231213220458851](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213220458851.png)

![image-20231213220549351](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231213220549351.png)

### set/multiset：直接排序

![image-20231217113601264](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217113601264.png)

![image-20231217113626926](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217113626926.png)

![image-20231217113646593](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217113646593.png)\

![image-20231217113658294](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217113658294.png)

第5个比较高级

![image-20231217113801243](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217113801243.png)

第1个返回迭代器

第2个是查找某个元素有几个，对于set而言统计结果只能是0，1，但multiset而言，是可以重复的

![image-20231217114053760](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217114053760.png)

pair，set.insert的返回值 

![image-20231217115835524](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217115835524.png)

![image-20231217120023194](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217120023194.png)

![image-20231217124244016](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217124244016.png)



改变set容器的排序：

利用仿函数：、

```c++
class mycompare()
{
	bool operator()(int v1,int v2)
    {
		return v1>v2;
    }
}
set<int,mycompare>s1;

```



set自定义数据排序、

```
class person()
{
	person(string name,int name){};
	string name;
    int age;
}

class compareperson(const person&p1,const person&p2)
{
	return p1.age>p2.age;
}

set<person,compareperson>p;
```

### map与multimap

![image-20231217135143002](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217135143002.png)

![image-20231217135331149](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217135331149.png)

```c++
map<int,int> m;
m.insert(pair<int,int>(1,10));//索引与数值
```

![image-20231217135538399](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217135538399.png)

![image-20231217135615212](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217135615212.png)

![image-20231217135631184](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217135631184.png)

![image-20231217135702595](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217135702595.png)

![image-20231217135907832](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217135907832.png)

![image-20231217135919021](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217135919021.png)

![image-20231217140837594](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217140837594.png)

![image-20231217140902287](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217140902287.png)

第四种不建议插入，但可以方便用于访问。

![image-20231217141213599](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217141213599.png)

![image-20231217141323109](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217141323109.png)

返回的是迭代器

注意：**map**不允许插入重复key

![image-20231217141457197](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217141457197.png)

```>
map<int,int,mycompare> m;

class mycompare()
{
	bool operator()(int v1,int v2)
    {
		return v1>v2;
    }
}
```

## 函数对象，仿函数（类）

![image-20231217152931449](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217152931449.png)

![image-20231217153039479](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217153039479.png)

![image-20231217153237757](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217153237757.png)

![image-20231217153255993](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217153255993.png)

![image-20231217153357744](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217153357744.png)

## 谓词

![image-20231217153437193](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217153437193.png)



pred谓词

![image-20231217153909786](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217153909786.png)



![image-20231217172428578](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217172428578.png)

![image-20231217172547300](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217172547300.png)

![image-20231217172606826](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217172606826.png)



## 内嵌仿函数

![image-20231217190819157](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217190819157.png)



#<functional>记得包含

negate取反

![image-20231217191129175](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217191129175.png)

![image-20231217191144063](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217191144063.png)

注：有用，降序

![image-20231217191357863](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217191357863.png)

从大到小

![image-20231217191506233](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217191506233.png)

![image-20231217191627485](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217191627485.png)









## 常见算法<algorithm>

### 遍历

#### 1.for_each()

```c++

#include <algorithm>
#include <vector>
//普通函数
void print01(int val)
{
cout << val << " ";
}
//函数对象
class print02
{
public:
void operator()(int val)
{
cout << val << " ";
}
};
//for_each算法基本用法
void test01() {
vector<int> v;
for (int i = 0; i < 10; i++)
{
v.push_back(i);
}
//遍历算法
for_each(v.begin(), v.end(), print01);
cout << endl;

for_each(v.begin(), v.end(), print02());
cout << endl;
}
int main() {
test01();
system("pause");
return 0;
}

```

#### transform

函数原型：
transform(iterator beg1, iterator end1, iterator beg2, _func);
//beg1 源容器开始迭代器
//end1 源容器结束迭代器
//beg2 目标容器开始迭代器
//_func 函数或者函数对象

```c++

#include<vector>
#include<algorithm>
//常用遍历算法 搬运 transform
class TransForm
{
public:
int operator()(int val)
{
return val;
}
};
class MyPrint
{
public:
void operator()(int val)
{
cout << val << " ";
}
};
void test01()
{
vector<int>v;
for (int i = 0; i < 10; i++)
{
v.push_back(i);
}
vector<int>vTarget; //目标容器
vTarget.resize(v.size()); // 目标容器需要提前开辟空间
transform(v.begin(), v.end(), vTarget.begin(), TransForm());
for_each(vTarget.begin(), vTarget.end(), MyPrint());
}
int main() {
test01();
system("pause");
return 0;
}

```

![image-20231217192756182](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217192756182.png)

![image-20231217192827702](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217192827702.png)

类似于：return v+100;逻辑运算

### 查找

#### find

![image-20231217151459509](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217151459509.png)

![image-20231217151525600](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217151525600.png)

![image-20231217152415690](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217152415690.png)

自定义数据类型：

![image-20231217152746081](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217152746081.png)

#### find_if

![image-20231217173054897](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217173054897.png)

![image-20231217173358896](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217173358896.png)



自定义：

![image-20231217173439094](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217173439094.png)

#### adjacent_find

![image-20231217193208287](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217193208287.png)

![image-20231217193351509](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217193351509.png)



#### binary_search

![image-20231217193435890](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217193435890.png)

![image-20231217193441784](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217193441784.png)

#### count

![image-20231217193532954](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217193532954.png)

类：

![image-20231217193718739](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217193718739.png)

![image-20231217193733796](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217193733796.png)



#### count_if

![image-20231217193801783](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217193801783.png)



谓词可以理解为条件。

![image-20231217193942830](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217193942830.png)

![image-20231217193951411](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217193951411.png)

### 排序

#### sort

![image-20231217194903314](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217194903314.png)

![image-20231217194920667](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217194920667.png)

#### random_shuffle

![image-20231217194946457](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217194946457.png)

#### merge

![image-20231217195012159](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195012159.png)

注意：提前给目标容器分配空间

![image-20231217195109016](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195109016.png)

#### reverse

![image-20231217195137160](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195137160.png)



### 拷贝和替换

#### copy

![image-20231217195212993](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195212993.png)

注意：提前给目标容器分配空间

![image-20231217195304496](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195304496.png)

#### replace

![image-20231217195323348](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195323348.png)

![image-20231217195402335](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195402335.png)

所有替换

#### replace_if

![image-20231217195425694](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195425694.png)

![image-20231217195509294](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195509294.png)

![image-20231217195517239](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195517239.png)

#### swap

![image-20231217195528543](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195528543.png)

![image-20231217195550376](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195550376.png)

## 算数生成算法

![image-20231217195632526](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195632526.png)

### accumulate

![image-20231217195703105](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195703105.png)



fill

![image-20231217195747276](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195747276.png)

## 常用集合算法



![image-20231217195851599](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217195851599.png)



min：最小算法，algo。。。头文件

![image-20231217200034430](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217200034430.png)

![image-20231217200057259](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217200057259.png)

要从itend；

![image-20231217200206887](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217200206887.png)

![image-20231217200222261](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231217200222261.png)









## 职工管理系统：



![image-20231207164021052](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231207164021052.png)

the difficult:

![image-20231207203618921](C:\Users\Lenovo\AppData\Roaming\Typora\typora-user-images\image-20231207203618921.png)





# tip

**isalnum**：
判断字符变量c是否为字母或数字，若是则返回非零，否则返回零。

#include <ctype.h>







```cpp
#include<bits/stdc++.h>
using namespace std;
struct pt{
	int l,r;
}; 
pt a[(int)2e5+5];
int n,f[(int)2e5+5],p=0;//f[i]=长度为i的IS最小最后一个数 

bool cmp(pt x,pt y) {
	return x.l<y.l;
}

int main() {
	cin>>n;
	for(int i=1; i<=n; i++) scanf("%d%d", &a[i].l, &a[i].r);
	sort(a+1,a+1+n,cmp);	
	for(int i=1; i<=n; i++) {
		if(a[i].r > f[p]) p++,f[p]=a[i].r;
		else f[lower_bound(f+1,f+p+1,a[i].r)-f]=a[i].r;
	}
	cout<<p<<endl;
	return 0;
}
```
