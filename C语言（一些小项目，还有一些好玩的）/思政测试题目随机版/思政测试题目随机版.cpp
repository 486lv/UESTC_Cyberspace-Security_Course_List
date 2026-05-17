#include <iostream>
using namespace std;
#include<ctime>
int main()
{
	srand((unsigned int)time(NULL));
	cout << "回车只有1个问题，要两个问题，需要加上1个字符" << endl;
	int x;
	int i = 0;

	while (1)
	{

		x = rand() % 27;
		switch (x)
		{
		case 0:
			cout << "怎么理解中国梦" << endl; i++; getchar(); ;
		case 1:
			cout << "新时代对青年的要求" << endl; i++; getchar();
		case 2:
			cout << "马克思主义认为人的本质" << endl; i++; getchar();
		case 3:
			cout << "人生观的主要内容（包括人生目的作用）" << endl; i++; getchar(); 
		case 4:
			cout << "什么是正确的人生观" << endl; i++; getchar(); 
		case 5:
			cout << "如何创造有意义的人生" << endl; i++; getchar();
		case 6:
			cout << "为什么信仰马克思主义" << endl; i++; getchar(); 
		case 7:
			cout << "个人理想与社会理想结合" << endl; i++; getchar(); 
		case 8:
			cout << "为什么说理想信念是精神之钙" << endl; break;
		case 9:
			cout << "中国精神的丰富内涵" << endl; break;
	case 10:
	cout << "爱国主义基本内涵" << endl; i++; getchar();
case 11:
	cout << "如何做新时代的忠诚爱国者" << endl; i++; getchar();
case 12:
	cout << "如何做改革创新的生力军" << endl; i++; getchar();
case 13:
	cout << "如何把社会主义核心价值观落细落小落实" << endl; i++; getchar();
case 14:
	cout << "道德的起源与本质" << endl; i++; getchar();
case 15:
	cout << "道德的功能" << endl; i++; getchar();
case 16:
	cout << "坚持集体主义为原则" << endl; i++; getchar();
case 17:
	cout << "集体主义的层次" << endl; i++; getchar();
case 18:
	cout << "中华民族传统美德的基本精神" << endl; i++; getchar();
case 19:
	cout << "中国革命道德的主要内容" << endl; i++; getchar();
case 20:
	cout << "中国革命道德的当代价值" << endl; i++; getchar();
case 21:
	cout << "道德规范" << endl; i++; getchar();
case 22:
	cout << "我国法律的本质特征" << endl; i++; getchar();
case 23:
	cout << "我国法律的运行" << endl; i++; getchar();
case 24:
	cout << "为啥要走中国特色社会主义道路" << endl; i++; getchar();
case 25:
	cout << "坚持中国特色社会主义道路的原则" << endl; i++; getchar();
case 26:
	cout << "我国宪法的基本原则" << endl; i++; getchar();
		default:
			break;
		}
		if (i > 10)
		{
			i = 0;
			system("cls");
		}
	}
	return 0;
}