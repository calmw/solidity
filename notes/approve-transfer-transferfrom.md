#### approve、transfer、transfer_from(加下划线是为了消除编辑器提示拼写错误)

- approve、transfer、transfer_from这几个方法都是ERC标准中的方法，也就是说，代币（ERC20、ERC721、ERC1155）必须要实现这几个方法
- approve的额度（owner给spender分配的额度）是可以随便给的，但是转账时候会检查余额（spender在调用transfer_from转账时候会检查from的余额，此时from对应前面的owner）

#### transfer和transfer_from的相同点和区别

- 共同点
    - 两个函数最终都调用_transfer(from, to, amount)进行转账
- 区别：
    - transfer_from比transfer多一个from参数，因为transfer的from参数其实是他自己。引申出以下两点不同
        - 1 transfer是把调用者（调用transfer的账户）的代币转给第三者，也就是把自己的代币转给第三者
        - 2 transfer_from是调用者（调用transfer_from的账户）把其他人（调用approve给调用transfer_from者配额的账户）的代币转给第三者
    - transfer_from，在进行转账的同时会额外调用_spendAllowance进行配额的变更

``` solidity
function transfer(address to, uint256 amount) public virtual override returns (bool) {
    address owner = _msgSender();
    _transfer(owner, to, amount);
    return true;
}

function transfer_from(
    address from, // 资金转出方 msg.sender
    address to, // 资金转入方 handler
    uint256 amount  // 转账资金金额
) public virtual override returns (bool) {
    address spender = _msgSender();
    // 这里的msgSender赋值给spender，是因为该方法是有spender来调用的
    _spendAllowance(from, spender, amount);
    _transfer(from, to, amount);
    return true;
}
```