#include <iostream>
using namespace std;
#include <windows.h>
using namespace std;
void xy(int x, int y)
{
	COORD  coord;
	coord.X = x;
	coord.Y = y;
	HANDLE a = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleCursorPosition(a, coord);
}
int main()
{
	xy(2, 10);
	cout << "***********************";

	getchar();
	return 0;
}