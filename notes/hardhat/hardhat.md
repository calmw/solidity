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

#### Hardhat本地节点

- 启动一个新的 Hardhat Network 内存实例
- npx hardhat node
- RPC : http://127.0.0.1:8545  ， RPC端口，在metamask可以自动获取

#### 部署合约

- 部署合约的脚本文件位于 script文件夹下，执行以下命令用于执行脚本（可以执行部署脚本）
- npx hardhat run scripts/deploy.ts
- npx hardhat run scripts/deploy.ts --network localhost // 部署到本地hardhat实例
