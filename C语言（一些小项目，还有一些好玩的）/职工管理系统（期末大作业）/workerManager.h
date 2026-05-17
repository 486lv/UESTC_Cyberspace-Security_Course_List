#pragma once
#include <iostream>
#include "worker.h"
#include "boss.h"
#include "manager.h"
#include "employee.h"
#include <fstream>

#define FILENAME "xx集团职工.txt"
using namespace std;
class workerManager
{
public:
	//构造函数
	workerManager();
	//菜单
	void show_menu();
	//退出
	void Exitsystem();
	//统计人数
	int get_member();
	//初始化人数
	void init_emp();
	
	//添加职工
	void Add_Emp();
	//保存到文件
	void save();
	//显示职工
	void workershow();
	//删除职工
	void del_emp();
	//判断职工是否存在
	int isexist(int id);
//修改职工
	void mod_cmp();
	//查找
	void find_id(int id);
	void find_name(string name);

	void find();
	//排序
	
	void m_rank();



	//清空
	void allclear();
	
//人数
	int m_num;
	//职工数组指针
	worker** m_EmpArray;
//employee and boss will back the different pointer,various system will unite the pointer
	//use the father pointer toward son pointer,so worker* point to different system
	//and,use the double pointer to set up a space,it is the essence of double pointer.

	//文件是否为空的标志
	bool m_fileisempty;
	
	//析构
	~workerManager();


};



