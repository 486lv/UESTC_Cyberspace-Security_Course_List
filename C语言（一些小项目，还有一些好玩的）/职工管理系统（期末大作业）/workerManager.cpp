#include "workerManager.h"
#include <list>
workerManager::workerManager()
{
	
	ifstream ifs;
	ifs.open(FILENAME, ios::in);
	//1.文件不存在
	if (!ifs.is_open())
	{
		cout << "文件不存在" << endl;

		//初始化属性
		this->m_num = 0;
		this->m_EmpArray = NULL;
		this->m_fileisempty = true;
		ifs.close();
		return;
	}
	//2.文件存在，且数据为空
	char ch;
	ifs >> ch;
	if (ifs.eof())
	{
		cout << "文件为空" << endl;
		//初始化属性
		this->m_num = 0;
		this->m_EmpArray = NULL;
		this->m_fileisempty = true;
		ifs.close();
		return;
	}
	//3.文件存在
	int num = this->get_member();
	cout << "职工的人数为：" << num << endl;
	this->m_num = num;

	this->m_EmpArray = new worker * [this->m_num];
	this->init_emp();//文件中的数据存到数组中

	/*for (int i = 0; i < this->m_num; i++)
	{
		cout << "职工编号：" << this->m_EmpArray[i]->m_id << "\t职工姓名:" << this->m_EmpArray[i]->m_name << "\t岗位:" << this->m_EmpArray[i]->m_state<< endl;
	}*/
	
}

void workerManager::show_menu()
{
	cout << "*******************************************************" << endl;
	cout << "——————————————————————————————————————————————————————" << endl;
	cout << "——————————————————欢迎使用职工管理系统！————————————————" << endl;
	cout << "*******************************************************" << endl;
	cout << "——————————————————0.退出程序——————————————————————" << endl;
	cout << "——————————————————1.增加职工信息——————————————————" << endl;
	cout << "——————————————————2.显示职工信息——————————————————" << endl;
	cout << "——————————————————3.删除职工信息——————————————————" << endl;
	cout << "——————————————————4.修改职工信息——————————————————" << endl;
	cout << "——————————————————5.查找职工信息——————————————————" << endl;
	cout << "——————————————————6.排序职工信息——————————————————" << endl;
	cout << "——————————————————7.清空文档——————————————————————" << endl;
	cout << "——————————————————————————————————————————————————————" << endl;
	cout << "——————————————————————————————————————————————————————" << endl;
	cout << "*******************************************************" << endl;
	cout << endl;
}

void workerManager::Exitsystem()
{
	cout << "欢迎下次使用" << endl;
	
	exit(0);
}

int workerManager::get_member()
{
	ifstream ifs;
	ifs.open(FILENAME, ios::in);//读文件

	int id;
	string name;
	int state;
	int num = 0;
	
	while (ifs >> id && ifs >> name && ifs >> state)
	{
		num++;
	}

	return num;
}


void workerManager::init_emp()
{
	ifstream ifs;
	ifs.open(FILENAME, ios::in);
	int id;
	string name;
	int state;

	int index = 0;
	while (ifs >> id && ifs >> name && ifs >> state)
	{
		worker* Worker = NULL;

		if (state == 1)
		{
			Worker = new employee(id, name, state);
		}
		else if (state == 2)
		{
			Worker = new manager(id, name, state);
		}
		else if(state==3)
		{		
			Worker = new boss(id, name, state);
		}
		this->m_EmpArray[index] = Worker;
		index++;
	}

	ifs.close();
}




void workerManager::Add_Emp()
{
	cout << "请输入职工的数量：" << endl;
	int addnum = 0;
	cin >> addnum;
	if (addnum > 0)
	{
		int newsize = this->m_num + addnum;

		//开辟新空间
		worker** newspace = new worker * [newsize];
		//如果原来空间有数据，就先把原来空间数据复制到新空间里面
		if (this->m_EmpArray != NULL)
		{
			for (int i = 0; i < this->m_num; i++)
			{
				newspace[i] = this->m_EmpArray[i];//
			}
		}
		//添加新数据
		for (int i =0; i < addnum; i++)
		{
			int id;
			string name;
			int state;
			cout << "请输入第" << i + 1 << "个新职工的编号：" << endl;
			cin >> id;
			cout << "请输入第" << i + 1 << "个新职工的姓名：" << endl;
			cin >> name;
			cout << "请输入第" << i + 1 << "个新职工的岗位：" << endl;
			cout << "请选择该职工的岗位：" << endl;
			cout << "1.职工" << endl;
			cout << "2.经理" << endl;
			cout << "3.老板" << endl;
			cin >> state;
		
			worker* Worker = NULL;
			switch (state)
			{
			case 1:
				Worker = new employee(id, name, state);
				break;
			case 2:
				Worker = new manager(id, name, state);
				break;
			case 3:
				Worker = new boss(id, name, state);
				break;
			default:
					system("cls");
			}
			//新空间
			newspace[this->m_num + i] = Worker;

		}
		
		delete[]this->m_EmpArray;
		//更新
		this->m_EmpArray = newspace;
		this->m_num = newsize;
		//不为空
		this->m_fileisempty = false;

		cout << "成功添加" << addnum <<"名成员"<< endl;
		
	}
	else
	{
		cout << "输入有误" << endl;
	}
	
	//保存到文件
	this->save();
	

}


void workerManager::save()
{
	ofstream ofs;
	ofs.open(FILENAME, ios::out);//写文件
	for (int i = 0; i < this->m_num; i++)
	{
		ofs << this->m_EmpArray[i]->m_id << " " << m_EmpArray[i]->m_name << " " << m_EmpArray[i]->m_state << endl;
	}

	ofs.close();
}

void workerManager::workershow()
{
	//文件为空
	if (this->m_fileisempty)
	{
		cout << "文件不存在或为空" << endl;
	}
	else
	{
		for (int i = 0; i < m_num; i++)
		{
			//多态
			this->m_EmpArray[i]->showInfo();//我用数组已经保存好了你的数据，new了employee，boss等类型，所以show_info是通用的
		}
	}
}

void workerManager::del_emp()
{
	if (this->m_fileisempty)
	{
		cout << "文件不存在或为空" << endl;
	}
	else
	{
		cout << "请输入要删除职工的id：" << endl;
		int id;
		cin >> id;

		int index=this->isexist(id);
		if (index != -1)//存在
		{
		/*	if (index == 0)
			{
				delete this->m_EmpArray[0];
				this->m_num--;
				this->save();
				cout << "职工已经删空" << endl;
			}*/
			if (index == this->m_num - 1)
			{
				m_EmpArray[index]=NULL;
				this->m_num--;
				this->save();
				this->m_fileisempty = true;
				cout << "删除成功" << endl;
			}
			for (int i = index; i < this->m_num - 1; i++)
			{
				this->m_EmpArray[i] = this->m_EmpArray[i + 1];
				this->m_num--;

				//同步更新到文件当中
				this->save();
				cout << "删除成功" << endl;
			}
		}
		else
		{
			cout << "该职工不存在，删除失败" << endl;
		}
	}
	
}

int workerManager::isexist(int id)
{
	int index = -1;
	for (int i = 0; i < this->m_num; i++)
	{
	if (this->m_EmpArray[i]->m_id == id)
	{
		index = i;//得到位置
	}
	}
	return index;
}



void workerManager::mod_cmp()
{
	if (this->m_fileisempty)
	{
		cout << "文件不存在或为空" << endl;
	}
	else
	{
		cout << "请输入修改职工的编号" << endl;
		int id;
		cin >> id;

		int ret = this->isexist(id);
		if (ret != -1)
		{
			delete this->m_EmpArray[ret];
			int newid;
			string newname = "";
			int newstate;

			cout << "已经查找到了编号为：" << id << "的员工" << endl;
			cout << "请输入新的职工号：" << endl;
			cin >> newid;
			cout << "请输入新的姓名：" << endl;
			cin >> newname;
			cout << "请输入新的职位：" << endl;
			cout << "1.职工" << endl;
			cout << "2.经理" << endl;
			cout << "3.老板" << endl;

			cin >> newstate;

			worker* Worker = NULL;
			switch (newstate)
			{
			case 1:
				Worker = new employee(newid, newname, newstate);
				break;
			case 2:
				Worker = new manager(newid, newname, newstate);
				break;
			case 3:
				Worker = new boss(newid, newname, newstate);
				break;
			default:
				system("cls");
			}
			//更新
			this->m_EmpArray[ret] = Worker;
			cout << "修改成功" << endl;
			//保存到文件中
			this->save();
		}
		else
		{
			cout << "修改失败，查无此人" << endl;
		}

	}
}

void workerManager::find_id(int id)
{
	if (id > 0)
	{
		int flag = 0;
		for (int i = 0; i < m_num; i++)
		{
			if (this->m_EmpArray[i]->m_id == id)
			{
				cout << "查找成功" << endl;
				cout << "职工编号：" << this->m_EmpArray[i]->m_id << "\t职工姓名:" << this->m_EmpArray[i]->m_name << "\t岗位:" << this->m_EmpArray[i]->getStateName()<< endl;
				flag = 1;
				break;
			}
		}
		if (flag == 0)
		{
			cout << "查无此人" << endl;
		}
		
	}
	else
	{
		cout << "输入错误" << endl;
	}
}
void workerManager::find_name(string name)
{
	int flag = 0;
	for (int i = 0; i < m_num; i++)
	{
		if (this->m_EmpArray[i]->m_name == name)
		{
			cout << "查找成功" << endl;
			cout << "职工编号：" << this->m_EmpArray[i]->m_id << "\t职工姓名:" << this->m_EmpArray[i]->m_name << "\t岗位:" << this->m_EmpArray[i]->getStateName() << endl;
			flag = 1;
			break;
		}
	}
	if (flag == 0)
	{
		cout << "查无此人" << endl;
	}
}

void workerManager::find()
{
	if (this->m_fileisempty)
	{
		cout << "文件不存在或为空" << endl;
	}
	else
	{
		cout << "选择您要查找的方式:" << endl;
		cout << "1.用职工号查找,请输入1" << "  " << "用姓名查找，请输入2" << endl;
		int cs;
		cin >> cs;
		if (cs == 1)
		{
			cout << "请输入职工号:" << endl;
			int findid;
			cin >> findid;
			find_id(findid);
		}
		else if (cs == 2)
		{
			cout << "请输入职工姓名:" << endl;
			string findname;
			cin >> findname;
			find_name(findname);
		}
	}
	system("pause");
	system("cls");
}



void workerManager::m_rank()
{
	if (this->m_fileisempty)
	{
		cout << "文件不存在或为空" << endl;
		
	}
	else
	{

		cout << "选择排序方式：" << endl;
		cout << "1.以升序排序,请输入1" << "\t2.以降序排序，请输入2" << endl;
		int ol;
		cin >> ol;

		if (ol == 1)
		{
			int flag = 0;
			for (int i = 0; i <this->m_num - 1; i++)
			{
				for (int j = 0; j <this->m_num - i - 1; j++)
				{
					if (this->m_EmpArray[j]->m_id > this->m_EmpArray[j + 1]->m_id)
					{
						worker* tmp = this->m_EmpArray[j];
						this->m_EmpArray[j] = this->m_EmpArray[j + 1];
						this->m_EmpArray[j + 1] = tmp;
						flag = 1;
					}
				}
				if (flag == 0)
				{
					break;
				}
				
			}
			cout << "排序成功" << endl;
			this->save();
			this->workershow();
		}
		else if (ol == 2)
		{
			int flag = 0;
			for (int i = 0; i < this->m_num - 1; i++)
			{
				for (int j = 0; j < this->m_num - i - 1; j++)
				{
					if (this->m_EmpArray[j]->m_id < this->m_EmpArray[j + 1]->m_id)
					{
						worker* tmp = this->m_EmpArray[j];
						this->m_EmpArray[j] = this->m_EmpArray[j + 1];
						this->m_EmpArray[j + 1] = tmp;
						flag = 1;
					}
				}
				if (flag == 0)
				{
					break;
				}

			}
			cout << "排序成功" << endl;
			this->save();
			this->workershow();
		}

	}
}

void workerManager::allclear()
{
	cout << "确认清空？" << endl;
	cout << "1.清空,请输入1" << "  "<<"2.返回,输入任意数字" << endl;
	int op;
	cin >> op;

	if (op == 1)
	{
		ofstream ofs(FILENAME, ios::trunc);
		ofs.close();

		if (this->m_EmpArray != NULL)
		{
			for (int i = 0; i < this->m_num; i++)
			{
				delete this->m_EmpArray[i];
				this->m_EmpArray[i] = NULL;

				//删除指针
				delete[] this->m_EmpArray;
				this->m_EmpArray = 0;
				this->m_fileisempty = true;

				cout << "清空成功" << endl;
			}
		}
	}
	
}


workerManager::~workerManager()
{

}
