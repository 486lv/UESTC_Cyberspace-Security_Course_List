#pragma once
#include <iostream>
#include <string>
#include "worker.h"
class employee:public worker
{
	public:
	employee(int id,string name,int state);
	//显示个人信息
	void showInfo();
	//获取岗位名称
	string getStateName();
};

