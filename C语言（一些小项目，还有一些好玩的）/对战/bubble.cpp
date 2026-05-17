#include "bubble.h"
//
//bubble::bubble(int life, int init_attack, int i)
//{
//	
//}
void bubble::image()
{
	if (place == 0)
	{
	a.xy(2, 10);
	a.SetColor(3, 0);
	cout << "M(£ÞO£Þ£©M>>";
	}
	else
	{
	a.xy(80, 10);
	a.SetColor(3, 0);
	cout << "<<M£¨£ÞO£Þ£©M";
	}
}

void bubble::commmom_skill()
{
	if (place == 0)
	{
		for (int i = 15; i < 70; i++)
		{
			a.xy(i, 10);
			cout << "-o-";
			Sleep(100);
			a.xy(i, 10);
			cout << "       ";
		}
	}
	else
	{
		for (int i = 70; i > 15; i--)
		{
			a.xy(i, 10);
			cout << "-o-";
			Sleep(100);
			a.xy(i, 10);
			cout << "         ";
		}
	}
}

void bubble::ultimate_skill()
{
	if (place == 0)
	{
		srand((unsigned int)time(NULL));


		a.xy(2, 10);
		cout << "M(£ÞO£Þ£©M>>";
		a.xy(80, 10);
		cout << "<<M£¨£ÞO£Þ£©M";
		for (int i = 0; i < 20; i++)
		{
			int m_x = rand() % 81 + 50;
			int m_y = rand() % 15;
			int m_color = rand() % 8;
			a.xy(m_x, m_y);
			a.SetColor(0, m_color);
			cout << " ";
			Sleep(100);
		}
	}
	else
	{
		srand((unsigned int)time(NULL));
		a.xy(2, 10);
		cout << "M(£ÞO£Þ£©M>>";
		a.xy(80, 10);
		cout << "<<M£¨£ÞO£Þ£©M";
		for (int i = 0; i < 20; i++)
		{
			int m_x = rand() %50;
			int m_y = rand() % 15;
			int m_color = rand() % 8;
			a.xy(m_x, m_y);
			a.SetColor(0, m_color);
			cout << " ";
			Sleep(100);
		}
	}
}
