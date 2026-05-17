#include <iostream>
#include "ChessGame.h"
#include "Chess.h"
int main(void)
{
	
	Man man;
	Chess chess(13, 44, 43, 67.4);
	AI ai;
	ChessGame game(&man, &ai, &chess);

	game.play();

	return 0;
}