#pragma once
#include "Chess.h"
class AI
{
public:
	void init(Chess*chess);
	void go();
ChessPos think();
	void calculateScore();

private:
	Chess* chess;
	vector<vector<int>> scoreMap;
};

