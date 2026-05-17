#include "Man.h"

void Man::init(Chess* chess)
{
	this->chess = chess;
}

void Man::go()
{
	MOUSEMSG msg;
	ChessPos pos;
	//获取鼠标点击
	
	while (1)
	{

	msg=GetMouseMsg();
	if (msg.uMsg == WM_LBUTTONDOWN&&chess->clickBoard(msg.x,msg.y,&pos))//左键单击且有效
	{
		break;
	}
	}

	printf("%d,%d\n", pos.row, pos.col);
	chess->chessDown(&pos, CHESS_BLACK);
}

