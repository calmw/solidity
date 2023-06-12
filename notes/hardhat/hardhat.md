#### hardhat 安装

- npm install --save-dev hardhat

#### hardhat 初始化项目

- npx npx hardhat

#### 编译项目

- npx hardhat compile

#### 合并压缩合约

- npx hardhat flatten

#### 测试合约

- 测试脚本位于 test文件夹下，执行一下命令进行测试
- npx hardhat test
- 测量代码覆盖率 solidity-coverage ，用于测量项目中测试覆盖率的插件。只需运行coverage任务，您就会得到一份报告：

npx hardhat coverage

#### Hardhat本地节点

- 启动一个新的 Hardhat Network 内存实例
- npx hardhat node
- RPC : http://127.0.0.1:8545  ， RPC端口，在metamask可以自动获取

#### 部署合约

- 部署合约的脚本文件位于 script文件夹下，执行以下命令用于执行脚本（可以执行部署脚本）
- npx hardhat run scripts/deploy.ts
- npx hardhat run scripts/deploy.ts --network localhost // 部署到本地hardhat实例
- 注意：在部署合约的脚本中，获取合约的时候，填写合约名字，而不是合约文件名字

#### 验证合约

- 首先从Etherscan获取API密钥
- 配置API KEY和网络等信息
- npx hardhat verify --network sepolia <address> <unlock time>  // 其中sepolia为配置文件中的网络名称，address为合约地址，unlock
  time 为constructor方法的参数。如果constructor没有参数，在命令行省去就行
- 配置文件的例子（具体可参考官方文档）：

```solidity
module.exports = {
  // ...rest of your config...
  networks: {
    sepolia: {
      url: `https://sepolia.infura.io/v3/${INFURA_API_KEY}`,
      accounts: [SEPOLIA_PRIVATE_KEY],
    },
  },
}; 
```
