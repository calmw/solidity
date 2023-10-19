#### Call

- call没有gas限制，可以支持对方合约的fallback或者receive来实现复杂逻辑，比如可以在receive中增加事件来记录ETH转账，同样可以在fallback中写业务逻辑
- call如果转账失败，不会自动回滚
- call有两个返回值，第一个（bool）表示成功或者失败，第二个发挥的data（字节）数据