





# Readme

# **第3组区块链投票系统**



> 简易的可以投票，并统计票数，输出winner的系统，基于remix,Ganache。语言：Solidity,Html,Javascript。

## 使用说明

### 1.[下载Geneche](https://trufflesuite.com/ganache/ )直接DOWNLOAD到电脑上，下载完成后，打开 Ganache，并将 PORT NUMBER 修改为 8545，配置完成。

### 2.Google Chrome、Edge 浏览器安装插件MetaMask，直接在插件市场安装就行。显示测试网络之后，将网络设置为 <u>Localhost 8545</u>。

### 3.将Ganeche的第一个最右边那个私钥复制到Metamask，建立Account，选择导入账户，粘贴刚刚复制的<font color=Red>私钥</font>font>。

### 4.打开[remix]([Remix - Ethereum IDE](https://remix.ethereum.org/#lang=en&optimize=false&runs=200&evmVersion=null&version=soljson-v0.5.17+commit.d19bba13.js&language=Solidity)),将压缩包中的Voting.sol复制到新建的文件上，然后点击左上角绿色运行箭头，开始运行。

ENVIRONMENT用Metamask，然后将以下文本复制到deploy旁：

```
[0x63616e6469646174653100000000000000000000000000000000000000000000,0x63616e6469646174653200000000000000000000000000000000000000000000,0x63616e6469646174653300000000000000000000000000000000000000000000]
```

然后点击deploy运行。

### 5.使用vscode或者其他软件打开html与js文件。然后获取如下数据：、

#### 1.Geneche中的初始界面的：RPC SERVER

将其放在js文件中的：server = "HTTP://127.0.0.1:8545"处，替换“”中的元素

#### 2.获取remix中Solidity Complier的abi,将其放置在js中的abi后面

#### 3.remix中deploy后获得的区块，在其右边获得address将其放置在js的address处

## 6.打开压缩包中的helloDapp.html文件，见到界面

#### 1.在输入框中输入要投票人的名字，<font color=Red>点击投票</font>即可，票数便会刷新。**你只有3次机会**

#### 2.重置可以<u>重置</u>你的次数

#### 3.result可以看到党倩投票结果<u>最大值</u>。