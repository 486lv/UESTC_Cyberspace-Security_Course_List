#include <iostream>
using namespace std;
#include <string>
#include <vector>
vector<string> v;
int n;
int main() {
	cin >> n;
	for (int i = 0; i < n; i++) {
		string c;
		cin >> c;
		v[i] += c;
	}
	int k = 0;
	for (auto i = v.begin(); i != v.end(); i++) {
		cout << v[k];
		k++;
	}

	return 0;
}