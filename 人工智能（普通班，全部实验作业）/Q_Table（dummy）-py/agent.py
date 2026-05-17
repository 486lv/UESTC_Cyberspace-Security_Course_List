import numpy as np
from fontTools.misc.bezierTools import epsilon


class QLearning(object):
    def __init__(self, state_dim, action_dim, cfg):
        self.action_dim = action_dim  # dimension of acgtion
        self.lr = cfg.lr   # 学习率
        self.gamma = cfg.gamma # 衰减系数
        self.epsilon =  0.9 # 折扣因子
        self.sample_count = 0 # 采样数，用于ε的衰减
        self.Q_table = np.zeros((state_dim, action_dim))  # Q表格
        self.epsilon_decay = 0.001 # 衰减率（每次采样减少的值）
        self.epsilon_start = 0.9
        self.epsilon_min = 0.01   # 最小探索率

    def choose_action(self, state):
        ####################### 智能体的决策函数，需要完成Q表格方法（需要完成）#######################
        self.sample_count += 1
        # self.epsilon=max(self.epsilon_min,self.epsilon-self.epsilon_decay*self.sample_count)
        self.epsilon = self.epsilon_min + (self.epsilon_start - self.epsilon_min) * \
                       np.exp(-self.epsilon_decay * self.sample_count)

        if np.random.rand() > self.epsilon:
            action = np.argmax(self.Q_table[state])
        else:
            action = np.random.randint(self.action_dim)  # 随机探索选取一个动作
        return action

    def update(self, state, action, reward, next_state, done):
        ############################ Q表格的更新方法（需要完成）##################################
        Q_predict = self.Q_table[state][action]
        if done:
            Q_target = reward
        else:
            Q_target = reward + self.gamma * np.max(self.Q_table[next_state])
        self.Q_table[state][action] += self.lr * (Q_target - Q_predict)

    def predict(self, state):
        ############################ 可根据自己需求更改##################################
        if type(state) != int:
            state = state[0]
        action = np.argmax(self.Q_table[state])
        return action

    def save(self, path):
        np.save(path + "Q_table.npy", self.Q_table)

    def load(self, path):
        self.Q_table = np.load(path + "Q_table.npy")
