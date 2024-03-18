#### delegate

- delegatecall和call类似，是solidity中地址类型的底层成员函数。
- Delegatecall 类似于常规函数调用，不同之处在于目标地址处的代码是在调用合约的 context
  中执行的。如果逻辑合约的代码更改了存储变量，这些更改将反映在代理合约的存储变量中——即在代理合约的状态中。参考：[可升级合约及其数据存储.pdf](..%2Fstatic%2F%E5%8F%AF%E5%8D%87%E7%BA%A7%E5%90%88%E7%BA%A6%E5%8F%8A%E5%85%B6%E6%95%B0%E6%8D%AE%E5%AD%98%E5%82%A8.pdf)

#### 小结

- ![delegatecall.jpg](..%2Fstatic%2Fdelegatecall.jpg)
- ![call_delegatecall_staticcall.jpg](..%2Fstatic%2Fcall_delegatecall_staticcall.jpg)