
#include <iostream>
using namespace std;
#include "workerManager.h"
#include <graphics.h>
#include <conio.h>
#include "employee.h"
#include "worker.h"
#include "manager.h"
#include "boss.h"
#include <fstream>

//用链表，迭代一下系统,必须用链表

#include <list>

int main()
{	
	cout << "请从键盘上按任意键进入系统" << endl;
	system("pause");

	
	

	workerManager wm;

	int choice;
	while (1)
	{
		wm.show_menu();
		cout << "请输入你的选择" << endl;
		cin >> choice;

		switch (choice)
		{

		case 0://退出
			wm.Exitsystem();
			break;
		case 1://添加
			wm.Add_Emp();
			system("pause");
			system("cls");
			break;
		case 2://
			wm.workershow();
			system("pause");
			system("cls");
			break;
		case 3://
			wm.del_emp();//最后一个职工删除了的bug
			system("pause");
			system("cls");
			break;
		case 4://
			wm.mod_cmp();
			system("pause");
			system("cls");
			break;
		case 5://查找
			wm.find();
			/*system("pause");
			system("cls");*/
			break;
		case 6://排序
			wm.m_rank();
			system("pause");
			system("cls");
			break;
		case 7://清空
			wm.allclear();
			system("pause");
			system("cls");
			break;
		default:
			system("cls");
		}
	}
//}
	



	return 0;
}


