#### 介绍

- constant（常量）和 immutable（不变量），让不应该变的变量保持不变

- 状态变量声明这个两个关键字之后，不能在合约后更改数值；并且还可以节省 gas。另外，只有数值变量可以声明 constant 和
  immutable；String 和 bytes 可以声明为 constant，但不能为 immutable。

#### constant 和 immutable constant

- constant
    - 变量必须在声明的时候初始化，之后再也不能改变。尝试改变的话，编译不通过。
- immutable
    - immutable 变量可以在声明时或构造函数中初始化，因此更加灵活。
    - 你可以使用全局变量例如 address(this)，block.number ，或者自定义的函数给 immutable 变量初始化。 例如给
      IMMUTABLE_TEST 初始化为 9：

#### 总结

- constant（常量）和 immutable（不变量），让不应该变的变量保持不变。
