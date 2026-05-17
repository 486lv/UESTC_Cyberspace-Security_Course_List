#include <iostream>
using namespace std;
const int N = 100010;
class lv_stack {

private:
	int t = 0;
	int a[N] = { 0 };
public:
	void push(int x) {
		a[++t] = x;
	}
	int top() {
		return a[t];
	}
	void pop() {
		t--;
	}
	bool isempty() {
		if (t == 0) return true;
		else return false;
	}
	int size() {
		return t;
	}
	void query_all() {
		for (int i = 1; i <= t; i++) {
			cout << a[i] << " ";
		}
	}

};
int main() {
	lv_stack s;
	s.push(1);
	s.query_all();
	return 0;
}