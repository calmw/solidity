#### Call

- call没有gas限制，可以支持对方合约的fallback或者receive来实现复杂逻辑，比如可以在receive中增加事件来记录ETH转账，同样可以在fallback中写业务逻辑
- call如果转账失败，不会自动回滚
- call有两个返回值，第一个（bool）表示成功或者失败，第二个发挥的data（字节）数据
- call是Solidity官方推荐的触发fallback或者receive回调函数发送ETH的方法

#### 调用合约函数

- 当不知道对方合约源代码或者ABI的情况下，可以使用call调用对方合约的函数
- ```_Address.call{value:_Value,gas:_Gas}(binaryCode)// value和gas可以以省略```
  ,binaryCode数据使用abi.encodeWithSignature来获得，包含方法签名和参数，例如 ``` abi.encodeWithSignature("f(uint256,address)",a,b) // a为uint256数据,b为address数据```
- 调用合约函数，不推荐使用call，但是在不知道源代码和ABI的情况下，有一定的实际用途。

#### 小结

- ![call_delegatecall_staticcall.jpg](..%2Fstatic%2Fcall_delegatecall_staticcall.jpg)
- 