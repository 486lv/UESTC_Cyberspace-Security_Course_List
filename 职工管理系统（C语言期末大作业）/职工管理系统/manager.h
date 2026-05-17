#pragma once
#include <iostream>
#include <string>
#include "worker.h"
class manager:public worker
{
public:
	manager(int id, string name, int state);
	//显示个人信息
	virtual void showInfo();
	//获取岗位名称
	virtual string getStateName();
};

