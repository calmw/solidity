#### 介绍

- 以太坊gas用来控制交易对资源的使用
- gas是到交易结束后才会扣除

#### gas费预估和计算

- 可以通过gasEstimate预估某个调用所需的gas开销
- 可以通过getGasPrice来gas price,
- gasLimit是固定值21000乘以浮动的gasPrice就是gas

#### gas耗尽

- 在执行过程中gas耗尽会触发如下一系列事件
    - 抛出"out of gas"异常
    - 状态会被恢复到执行之前
    - 所有在这次执行过程中的gas开销都会被作为交易费用，以太坊不会因为交易中止而退还gas或以太币