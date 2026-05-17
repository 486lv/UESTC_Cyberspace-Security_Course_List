import pandas as pd
from sklearn.tree import DecisionTreeClassifier, plot_tree
from sklearn.metrics import accuracy_score
import matplotlib.pyplot as plt

# ------------------------- 读取数据 -------------------------
def load_data(filepath):
    """加载制表符分隔的数据，最后一列为标签"""
    df = pd.read_csv(
        filepath,
        sep='\t',
        header=None,
        names=['feature1', 'feature2', 'feature3', 'feature4', 'label']
    )
    X = df[['feature1', 'feature2', 'feature3', 'feature4']].values
    y = df['label'].values
    return X, y

# 加载训练集和测试集
X_train, y_train = load_data('traindata.txt')
X_test, y_test = load_data('testdata.txt')

# ------------------------- 训练模型 -------------------------
# 创建决策树分类器（使用基尼系数作为划分标准）
clf = DecisionTreeClassifier(
    criterion='gini',   # 或 'entropy' 使用信息增益
    max_depth=3,        # 控制树深度防止过拟合
    random_state=42
)

# 训练模型
clf.fit(X_train, y_train)

# ------------------------- 评估模型 -------------------------
# 预测测试集
y_pred = clf.predict(X_test)

# 计算准确率
accuracy = accuracy_score(y_test, y_pred)
print(f"测试集准确率: {accuracy:.4f}")

# ------------------------- 可视化决策树（可选） -------------------------
plt.figure(figsize=(20, 12))
plot_tree(
    clf,
    feature_names=['feature1', 'feature2', 'feature3', 'feature4'],
    class_names=['Class1', 'Class2', 'Class3'],  # 根据实际类别名修改
    filled=True,
    rounded=True
)
plt.savefig('decision_tree.png', dpi=300)
plt.show()