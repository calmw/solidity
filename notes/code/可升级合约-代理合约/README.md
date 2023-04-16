#### 经过测试的代理合约模式的可升级合约

- 使用
    - 首先部署Registry.sol和Logic.sol
    - 向Registry.sol注册部署好的LogicOne的地址。
    - 使用LogicOne ABI在Registry合约里修改Storage里的Val:
        - LogicOne.at(Registry.address).setVal(2)
- 升级
    - 部署LogicTwo合约，同时更新Registry合约，使Registry指向最新的实现：
    - LogicTwo.at(Registry.address).setVal(2)
- 上述指令通过ABI操作，LogicOne和LogicTwo其实都在操作Registry的Storage域（包括其中的Val），但是操作逻辑（这里是setVal）定义在各自的合约里。

LogicOne:   0xaF80c6ac5b188Fc9256f121fDdC5BaB1d65ed4E9

Registry:   0x9EFf24D55c9dB238d8999ADEf25db81beEA441EF

LogicTwo:   0xeb9a4B62645aCF19ad2Fc9C26451d67e00EA7De3