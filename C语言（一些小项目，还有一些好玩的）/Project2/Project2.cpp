#include <iostream>
using namespace std;
#include <vector>
#include <string>
int n;
bool isVaild(vector<string>& st,int row,int col,int n) {
	//col
	for (int i = 0; i < row; i++) {
		if (st[i][col] == 'Q') {
			return false;
		}
	}

	for (int i = row - 1, j = col - 1; i>=0&&j>=0; i--, j--) {
		if (st[i][j] == 'Q') {
			return false;
		}
	}

	for (int i = row - 1, j = col+1;i>=0&&j<n ; i--, j++) {
		if (st[i][j] == 'Q') {
			return false;
		}
	}

	return true;
}
void queen(int n, vector<string>& st, int row) {
	if (row == n) {
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < st[i].size(); j++) {
				cout << st[i][j];
			}
			cout << endl;
		}
		cout << endl;
	}

	for (int col = 0; col < n; col++) {
		if (isVaild(st,row,col,n)) {
			st[row][col] = 'Q';
			queen(n, st, row + 1);
			st[row][col] = '.';
		}
	}
}
void requeen(int n) {
	vector<string> st(n, string(n, '.'));
	queen(n, st, 0);
}


int main() {
	cin >> n;
	requeen(n);
	return 0;
}