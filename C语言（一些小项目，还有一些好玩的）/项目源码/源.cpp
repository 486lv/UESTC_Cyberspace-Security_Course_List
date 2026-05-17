#include <iostream>
using namespace std;
#include <windows.h>

void xy(int x, int y)
{
	COORD  coord;
	coord.X = x;
	coord.Y = y;
	HANDLE a = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleCursorPosition(a, coord);
}

void SetColor(int fore, int back)
{
	SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), (back << 4) + fore);
}

int main()
{
	srand((unsigned int)time(NULL));


	xy(2, 10);
	cout << "M(£ÞO£Þ£©M>>";
	xy(80, 10);
	cout << "<<M£¨£ÞO£Þ£©M";
	for (int i = 0; i < 20; i++)
	{
		int m_x = rand() % 50;
		int m_y = rand() % 15;
		int m_color = rand() % 8;
	xy(m_x, m_y);
	SetColor(0, m_color);
	cout << " ";
	Sleep(100);
	}
	
	getchar();
	return 0;
}