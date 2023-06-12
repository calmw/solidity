#### 介绍

- Ganache是一个运行在个人电脑桌面上的以太坊开发者的个人区块链。支持图形界面和命令行。

#### 使用

Using Ganache CLI

- #### Command Line

- ganache-cli <options>

- 选项：
    - -a or --accounts: 指定在启动时要生成的帐户数量。
    - -e or --defaultBalanceEther: 分配每个测试帐户的以太币数量。默认值是100。
    - -b or --blockTime: 为自动挖矿指定blockTime（以秒为单位）。默认值为0，不进行自动挖矿。
    - -d or --deterministic: 基于预先定义的助记符生成确定性地址。
    - -n or --secure: 默认锁定可用帐户（适用于第三方交易签名）
    - -m or --mnemonic: 使用特定的HD钱包助记符来生成初始地址。
    - -p or --port: 要监听的端口号。默认为8545。
    - -h or --hostname: 监听的主机名。默认为127.0.0.1。
    - -s or --seed: 使用任意数据生成要使用的HD钱包助记符。
    - -g or --gasPrice: 使用自定义的燃料价格（默认为20000000000）
    - -l or --gasLimit: 使用自定义燃料限制（默认为90000）
    - -f or --fork: 从另一个当前在给定块上运行的以太坊客户端分叉。 输入应该是另一个客户端的HTTP位置和端口，
      e.g. http://localhost:8545. 您可以选择使用@ 符号：http：// localhost：8545 @ 1599200 指定要分叉的块。
    - -i or --networkId: 指定ganache-cli用于标识自身的网络ID （如果已配置，默认为当前时间或分叉区块链的网络ID）
    - --db: 指定目录的路径以保存链式数据库。如果数据库已经存在，ganache-cli会初始化该链，而不是创建一个新链。
    - --debug: 输出VM操作码以进行调试。
    - --mem: 输出ganache-cli内存使用情况统计信息。这取代了传统的输出。
    - --noVMErrorsOnRPCResponse: 不要将交易发送失败作为RPC错误传输。为与其他客户端（如geth和Parity）兼容的错误报告行为启用此标志。
- 特殊选项：
    - --account: 指定--account = ...（no's'）任意多次传递任意私钥及其相关余额以生成初始地址。
    - ganache-cli --account="<privatekey>,balance" [--account="<privatekey>,balance"]
    - 请注意，私钥长度为64个字符，并且必须以0x前缀的十六进制字符串形式输入。余额可以输入为一个整数或0x前缀的十六进制值，指定该帐户中wei的数量。
    - 使用--account时，不会为您创建HD钱包。
    - -u or --unlock: 指定 - unlock...多次传递地址或帐户索引以解锁特定帐户。当与 -- secure一起使用时，--unlock将覆盖指定帐户的锁定状态。

#### 解决没有events

- 关联truffle项目，将配置文件在Ganache配置好，重启后就可以了
- 


