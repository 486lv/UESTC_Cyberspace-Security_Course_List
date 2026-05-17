#pragma once
#include <graphics.h>
#include <vector>
using namespace std;
//落子位置
struct ChessPos
{
	int row;
	int col;

	ChessPos(int r=0,int c=0):row(r),col(c){}
};
//棋子类型
typedef enum {
	CHESS_WHITE = -1,//white
	CHESS_BLACK = 1//black
}chess_kind_t;

class Chess
{
	
public:
	Chess(int gradeSize, int marginX, int marginY, float chessSize);
	void init();
	bool clickBoard(int x, int y, ChessPos* pos);
	void chessDown(ChessPos* pos, chess_kind_t kind); 
	int getGradeSize();//获取棋盘大小

	int getChessData(ChessPos* pos);
	int getChessData(int row, int col);
	bool checkOver();//有没有结束


	//
private:
	IMAGE chessBlackImg;
	IMAGE chessWhiteImg;
	
	int gradeSize;//size
	int margin_x;//左边界
	int margin_y;//上边界
	float chessSize;//棋子大小=棋盘小方格大小
	//map,0空白，1黑子，-1白子
	vector<vector<int>> chessMap;
	//start 谁落子
	bool playerFlag;//ture:黑子;false:白子.
	void updataGameMap(ChessPos* pos);

	bool checkWin();
	ChessPos lastPos;
};

