#include <stdio.h>
#include <easyx.h>
#include <Windows.h>
#include <list>
#include <time.h>
#define MaxAIFishNum 10
enum Aspect { ToLeft = 0, ToRight = 1};
enum FishType {zero,one,two,three,four};


void InitGame();
void DrawGame();
void UpdateGame();
struct Fish
{
	int x, y;
	int width, height;
	Aspect aspect;
	FishType fishtype;
};

//图片
IMAGE Background;

IMAGE FishImg[5][2];

//鱼
Fish MyFish;
//ai
std::list<Fish> AIFishList;
int main()
{
	srand(time(NULL));
	initgraph(1280, 720);
	InitGame();
	
	
	while (1)
	{
DrawGame();
	UpdateGame();
	
	}
	return 0;
}





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

	//初始化自己的鱼
	{
		MyFish.x = 0;
		MyFish.y = 0;
		MyFish.fishtype = FishType::zero;
		MyFish.width = FishImg[MyFish.fishtype][0].getwidth();
		MyFish.height = FishImg[MyFish.fishtype][0].getheight();
		MyFish.aspect = Aspect::ToRight;
	}
	//初始化ai鱼
	{
		for (int i=0; i < MaxAIFishNum; i++)
		{
			Fish fish;
			fish.fishtype = (FishType)(rand() % 5);
			fish.aspect = rand() % 10 < 5?Aspect::ToLeft:Aspect::ToRight;
			fish.width = FishImg[fish.fishtype][0].getwidth();
			fish.height = FishImg[fish.fishtype][0].getheight();

			if (fish.aspect == Aspect::ToRight)
			{
				fish.x = -fish.width;
			}
			else
			{
				fish.x = 1280;
			}

			fish.y = rand() % (720 - fish.height);

			AIFishList.push_back(fish);
		}
	}
};

void DrawGame()
{
	putimage(0, 0, &Background);
	//输出鱼
	MyFish.fishtype = FishType::zero;
	//显示自己的鱼
	putimage(MyFish.x, MyFish.y, &FishImg[MyFish.fishtype][MyFish.aspect]);

	putimage(MyFish.x, MyFish.y, &FishImg[MyFish.fishtype][MyFish.aspect]);

	for (Fish fish : AIFishList)
	{
		putimage(fish.x, fish.y, &FishImg[fish.fishtype][fish.aspect]);

		putimage(fish.x, fish.y, &FishImg[fish.fishtype][fish.aspect]);
	}



};


void UpdateGame()
{
	//修改数据
	//控制自己的fishaaaa
	{
		if (GetAsyncKeyState('W'))
		{
			if (MyFish.y > 0)
			{
				MyFish.y--;
			}
			
		}
		if (GetAsyncKeyState('S'))
		{
			if (MyFish.y < 720-MyFish.height)
			{
				MyFish.y++;
			}
			
		}
		if (GetAsyncKeyState('A'))
		{
			if (MyFish.x > 0)
			{
				MyFish.aspect = Aspect::ToLeft;
				MyFish.x--;
			}
		}
		if (GetAsyncKeyState('D'))
		{
			if (MyFish.x < 1280 - MyFish.width)
			{
			MyFish.aspect = Aspect::ToRight;
			MyFish.x++;
			}
		}

	}

	//移动ai鱼
	for (Fish& fish : AIFishList)
	{
	if (fish.aspect == Aspect::ToRight)
	{
		fish.x++;
	}
	else
	{
		fish.x--;
	}


	}
	////ai鱼越界判断,迭代器
	//{
	//	std::list<Fish>::iterator Iterator;//using namespace std;
	//	for (Iterator = AIFishList.begin(); Iterator != AIFishList.end(); Iterator++)
	//	{

	//	}
	//}

};