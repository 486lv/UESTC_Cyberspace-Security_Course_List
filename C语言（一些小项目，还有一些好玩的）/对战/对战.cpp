#include <iostream>
using namespace std;
#include <windows.h>
#include "my_init.h"
#include "vs.h"


int main()
{


	vs a;
	a.player_init();
	while (1)
	{
		
	a.start();
	/*a.show_vs(1);
	a.end();
	system("cls");*/

}
	getchar();
	return 0;
}
