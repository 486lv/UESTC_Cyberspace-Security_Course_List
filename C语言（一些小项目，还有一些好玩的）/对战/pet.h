#pragma once
#include "my_init.h"
class pet
{
public:
	virtual void image() = 0;
	virtual void commmom_skill()=0;
	//virtual void unique_skill() = 0;
	virtual void ultimate_skill() = 0;

	//属性
	int life;
	int init_attack;
	int i;//记录积攒点
	my_init a;
	bool place = 0;
};

