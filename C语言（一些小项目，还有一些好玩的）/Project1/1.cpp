#include<stdio.h>
int c_num[21]={0};
int C_num(int n);
int main()
{
   int N,n[21];
   scanf("%d",&N);
   c_num[0]=1;
   c_num[1]=1;
   for(int i=0;i<N;i++)
   {
      scanf("%d",&n[i]);
      printf("%d\n",C_num(n[i]));
   }
   return 0;
}

int C_num(int n)
{
	if(n==0||n==1)  return 1;
	else
	{
		if(c_num[n]==0)
		{
			int count=n;
			do
			{
				count--;
			}while(c_num[count]==0);
			for(int i=count+1;i<n;i++)
			{
				c_num[i]+=C_num(i)*C_num(n-1-i);
			}
		
		}
		else
		{
			return c_num[n];
		}
	}
}