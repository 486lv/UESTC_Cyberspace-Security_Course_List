
#include <iostream>
#include <string>
using namespace std;


void guji(int arr[])
{
	if (arr[0] == 0 && arr[1] == 0 && arr[2] == 0)
	{
		cout << "乾" << endl;
	}
	else if (arr[0] == 1 && arr[1] == 0 && arr[2] == 1)
	{
		cout << "坎" << endl;
	}
	else if (arr[0] == 0 && arr[1] == 1 && arr[2] == 1)
	{
		cout << "艮" << endl;
	}
	else if (arr[0] == 1 && arr[1] == 1 && arr[2] == 0)
	{
		cout << "震" << endl;
	}
	else if (arr[0] == 0 && arr[1] == 0 && arr[2] == 1)
	{
		cout << "巽" << endl;
	}
	else if (arr[0] == 0 && arr[1] == 1 && arr[2] == 0)
	{
		cout << "离" << endl;
	}
	else if (arr[0] == 1 && arr[1] == 1 && arr[2] == 1)
	{
		cout << "坤" << endl;
	}
	else if (arr[0] == 1 && arr[1] == 0 && arr[2] == 0)
	{
		cout << "兑" << endl;
	}
}





void estimateside(int x0[])//x0是正面，x1是反面
{
	int flag = 0;
	for (int i = 0; i < 6; i++)
{
	if (x0[i] > 3 || x0[i] < 0)
	{
		cout << "error" << endl;
	}
	else
	{
		
		switch (x0[i])
		{
		case 0:cout << "———— ·" << endl; flag++; break;
		case 1:cout << "—— ——" << endl; break;
		case 2:cout << "————" << endl; break;
		case 3:cout << "—— —— ·" << endl; flag++; break;
		}
	}
}
	for (int i = 0; i < 6; i++)
	{
		if (x0[i] == 2)
		{
			x0[i] = 0;
		}
		else if (x0[i] == 3)
		{
			x0[i] = 1;
		}
	}
	int sum[3];
	for (int i = 0; i < 3; i++)
	{
		sum[i] = x0[3 + i];
	}

	guji(x0);
	guji(sum);
	cout << "动爻卜卦：" << endl;
	cout << "\n" << endl;
	
	if (flag == 0)
	{
		cout << "无动爻直接使用本卦卦辞" << endl;
		
	}
	else if (flag == 1)
	{
		cout << "一个动爻：根据动爻的爻辞来断" << endl;
	}
	else if (flag == 2)
	{
		cout << "两个动爻" << endl;
		cout << " 如果两个动爻都是阳爻或都是阴爻，就取最上面动爻的爻辞断" << endl;
		cout << " 如果是一阴一阳两个动爻，就取阴爻的爻辞来断" << endl;
	}
	else if (flag == 3)
	{
		cout << "取三条动爻中间的这一爻来断，不分阴阳。" << endl;
	}
	else if (flag == 4)
	{
		cout << "看其余的两个非动爻，哪个非动爻的位置在最下方，就取最下爻的爻辞来断。" << endl;
	}
	else if (flag == 5)
	{
		cout << "直接取那个不是动爻的那一爻的爻辞来断" << endl;
	}
	else if (flag == 6)
	{
		cout << "在下无能为力，请另请高明" << endl;
	}

}

void reverse(int arr[], int n = 6)
{
	int p = 0;//p q 表示两个下标，p 指向头， q 指向尾
	int q = n - p - 1;// q 是怎么来的？ p + q = n - 1,首元素下标 加 尾元素下标 等于元素个数 -1
	while (p < q)
	{
		int tmp = arr[p];
		arr[p++] = arr[q];//优先级不同 “[]”优先级 高于 “++”的优先级
		arr[q--] = tmp;//所以先使用arr[p] 再 p++。 q--同理
	}
}


int main()
{
	int sidefount[6] = { 0 };
	cout << "请拿出3枚硬币，虔诚的投掷6次，并记录在显示屏上" << endl;
	cout << "请输入正面的个数(0-3,输入其他数字会记录为error)：" << endl;
	cout << "注意：硬币数字面为反面，印画面为正面,生成卦象是从下向上（机器自动生成）" << endl;
	cout << "卦象后面打点的即动爻" << endl;
	for (int i = 0; i < 6; i++)
	{
		cin >> sidefount[i];
	}
	reverse(sidefount);



	estimateside(sidefount);

	cout << "上述卦象请参考《周易》解读" << endl;
	cout << "\n" << endl;
	cout << "\n" << endl;
	cout << "\n" << endl;
	cout << "本六爻未涉及变爻，之后会加上,敬请谅解" << endl;
	
	return 0;
}
























