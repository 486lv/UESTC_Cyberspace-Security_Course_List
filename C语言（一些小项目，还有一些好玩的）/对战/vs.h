#pragma once
#include <iostream>
using namespace std;
#include <windows.h>
#include "my_init.h"

class vs
{
public:
	//vs();
	void player_init();
	void start();

	void show_vs(bool j);

	void end();
	int life1;
	int life2;

	bool player = 0;
	int pet_choice;
	int bool_st;
};

