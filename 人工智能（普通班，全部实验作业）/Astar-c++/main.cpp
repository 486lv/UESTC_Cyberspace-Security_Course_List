#include <iostream>
#include <vector>
#include <string>
#include <unordered_map>
#include <queue>
#include <algorithm>
#include <sstream>
#include <iomanip>
using namespace std;

vector<vector<int>> start_state, goal_state;
int n;

// 方向数组
int dx[4] = {0, 0, -1, 1};
int dy[4] = {1, -1, 0, 0};

// 目标位置映射
unordered_map<int, pair<int, int>> target_pos;

// 辅助函数声明
vector<int> flatten(const vector<vector<int>>& state);
int count_inversions(const vector<int>& arr);
pair<int, int> find_zero(const vector<vector<int>>& state);
int get_parity(const vector<vector<int>>& state, int n);

// 将二维状态转换为字符串
string vec_to_str(const vector<vector<int>>& vec) {
    stringstream ss;
    for (const auto& row : vec) {
        for (int num : row) {
            ss << setw(2) << setfill('0') << num << ",";
        }
    }
    return ss.str();
}

// 将字符串转换为二维状态
vector<vector<int>> str_to_vec(const string& s) {
    vector<vector<int>> vec(n, vector<int>(n));
    stringstream ss(s);
    string token;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            getline(ss, token, ',');
            vec[i][j] = stoi(token);
        }
    }
    return vec;
}

// 展平状态（排除0）
vector<int> flatten(const vector<vector<int>>& state) {
    vector<int> flat;
    for (const auto& row : state) {
        for (int num : row) {
            if (num != 0) flat.push_back(num);
        }
    }
    return flat;
}

// 计算逆序数
int count_inversions(const vector<int>& arr) {
    int inv = 0;
    for (int i = 0; i < arr.size(); ++i) {
        for (int j = i + 1; j < arr.size(); ++j) {
            if (arr[i] > arr[j]) inv++;
        }
    }
    return inv;
}

// 查找空格位置
pair<int, int> find_zero(const vector<vector<int>>& state) {
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j)
            if (state[i][j] == 0) return {i, j};
    return {-1, -1};
}

// 计算可解性奇偶性
int get_parity(const vector<vector<int>>& state, int n) {
    vector<int> flat = flatten(state);
    int inv = count_inversions(flat);
    auto [row, _] = find_zero(state);

    if (n % 2 == 1) return inv % 2;
    int row_from_bottom = n - row;
    return (inv + row_from_bottom) % 2;
}

// 启发式函数：曼哈顿距离
int h(const vector<vector<int>>& state) {
    int res = 0;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            int num = state[i][j];
            if (num == 0) continue;
            auto [gx, gy] = target_pos[num];
            res += abs(i - gx) + abs(j - gy);
        }
    }
    return res;
}

// A* 算法核心
unordered_map<string, int> d;
priority_queue<pair<int, string>, vector<pair<int, string>>, greater<>> q;
unordered_map<string, string> parent;

int Astar(const string& start) {
    d[start] = 0;
    q.push({h(str_to_vec(start)), start});
    parent[start] = "";
    string goal_str = vec_to_str(goal_state);

    while (!q.empty()) {
        auto [_, s] = q.top(); q.pop();
        if (s == goal_str) return d[s];

        vector<vector<int>> vec = str_to_vec(s);
        auto [x, y] = find_zero(vec);

        for (int dir = 0; dir < 4; ++dir) {
            int nx = x + dx[dir], ny = y + dy[dir];
            if (nx < 0 || nx >= n || ny < 0 || ny >= n) continue;

            auto new_vec = vec;
            swap(new_vec[x][y], new_vec[nx][ny]);
            string new_s = vec_to_str(new_vec);

            if (!d.count(new_s) || d[new_s] > d[s] + 1) {
                d[new_s] = d[s] + 1;
                parent[new_s] = s;
                q.push({d[new_s] + h(new_vec), new_s});
            }
        }
    }
    return -1;
}

// 获取路径
vector<vector<vector<int>>> get_path() {
    vector<vector<vector<int>>> path;
    string current = vec_to_str(goal_state);
    while (!current.empty()) {
        path.push_back(str_to_vec(current));
        current = parent[current];
    }
    reverse(path.begin(), path.end());
    return path;
}

// 打印状态
void print_state(const vector<vector<int>>& state) {
    for (const auto& row : state) {
        for (int num : row) {
            cout << setw(2) << num << " ";
        }
        cout << "\n";
    }
}

int main() {
    // 输入处理
    cout << "拼图大小（如4表示4x4）: ";
    cin >> n;

    cout << "初始状态（逐行输入，空格用0）:\n";
    start_state.resize(n, vector<int>(n));
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j)
            cin >> start_state[i][j];

    cout << "目标状态（逐行输入，空格用0）:\n";
    goal_state.resize(n, vector<int>(n));
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j) {
            cin >> goal_state[i][j];
            target_pos[goal_state[i][j]] = {i, j};
        }

    // 可解性校验
    int start_parity = get_parity(start_state, n);
    int goal_parity = get_parity(goal_state, n);
    if (start_parity != goal_parity) {
        cout << "无解：奇偶性不一致（初始:" << start_parity
             << " 目标:" << goal_parity << "）\n";
        return 0;
    }

    // 运行A*
    string start_str = vec_to_str(start_state);
    int steps = Astar(start_str);

    // 结果输出
    if (steps == -1) {
        cout << "无解！\n";
        return 0;
    }

    auto path = get_path();
    cout << "共需 " << steps << " 步:\n";
    for (size_t i = 0; i < path.size(); ++i) {
        cout << "--- 第 " << i << " 步 ---\n";
        print_state(path[i]);
    }

    return 0;
}