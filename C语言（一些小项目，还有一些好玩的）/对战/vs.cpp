#include "vs.h"
#include "bubble.h"
#include "pet.h"
void vs::player_init()
{
	my_init a;
	a.xy(0, 12);
	cout << "请1号玩家选择你要玩的精灵";
	cin >> pet_choice;//1.bubble
	switch (pet_choice)
	{
	case 1:
		//加载生命
		bubble pet1;
		life1 = pet1.life;
		a.xy(2, 2);
		for (int i = 0; i < life1; i++)
		{
			a.SetColor(0, 4);
			cout << " ";
		}
		cout << life1;
		
		//加载图像,buji
		pet1.image();
		break;
	}
	//2号玩家
	a.xy(0, 13);
	a.SetColor(8, 0);
	cout << "请2号玩家选择你要玩的精灵";
	cin >> pet_choice;
	switch (pet_choice)
	{
	case 1:
		//加载生命
		bubble pet2;
		life2 = pet2.life;
		a.xy(80, 2);
		for (int i = 0; i < life2; i++)
		{
			a.SetColor(0, 4);
			cout << " ";
		}
		cout << life2;
		pet2.place = 1;
		//加载图像,buji
		pet2.image();
		break;
	}

	a.xy(0, 14);
	cout << "开始游戏请按1";
	cin >> bool_st;
	if (bool_st == 1)
	{
		a.xy(0, 12);
		cout << "                             ";
		a.xy(0, 13);
		cout << "                             ";
		a.xy(0, 14);
		cout << "                             ";
		return;
	}
	else
	{
		system("cls");
		exit(0);
	}
}
void vs::start()
{
	pet*l;
	my_init a;
	if (player == 0)
	{
		a.xy(0, 12);
		cout << "1号玩家选择技能:";
		cout << "1.普攻，2.大招";
		int k;
		switch (k)
		{
		case 1:
			
		}
	}
}

void vs::show_vs(bool j)
{
	/*my_init a;
	if (j == 1)
	{
		cout << "玩家1选择技能:" << endl;
		cout << "1.冰霜~终结" << endl;
		


		int s;
		cin >> s;
		switch (s)
		{
		case 1: 
			
			
			
			
			break;

		}
	}
	else
	{
		cout << "玩家2选择技能:" << endl;
	}
	
*/

}

void vs::end()
{
	/*my_init a;
	if (score1 == 0 || score2 == 0)
	{
		cout << endl;
		cout << endl;
		cout << endl;
		cout << endl;
		cout << endl;
		cout << endl;
		cout << endl;
		cout << "1号玩家赢";
		exit(0);

	}*/
}
