#### receive和fallback

- 使用场景：
- 1 接受ETH时候，使用receive
- 2 处理合约中不存在的函数调用时用fallback，或者用语代理合约
- 这两个函数都不需要function关键字，都可以加payable
- 这两者触发的规则有所不同：msg.data不为空的时候，触发fallback，为空的时候触发receive

#### receive
- 