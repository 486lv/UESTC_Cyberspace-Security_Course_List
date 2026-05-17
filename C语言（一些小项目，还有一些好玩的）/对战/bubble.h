#pragma once
#include "pet.h"
#include "my_init.h"
class bubble:public pet
{
public:	
	//bubble(int life, int init_attack, int i);

	void image();
	virtual void commmom_skill();
	//virtual void unique_skill() ;
	virtual void ultimate_skill();

	int life = 10;
	int init_attack = 1;
	int i = 0;

};

