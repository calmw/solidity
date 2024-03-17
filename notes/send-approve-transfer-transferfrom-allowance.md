#### send

- send、transfer、all用于转账原生币，transfer、transferfrom用于转代币

#### approve、transfer、transferfrom

- approve、transfer、transferfrom这几个方法都是ERC标准中的方法，也就是说，代币（ERC20、ERC721、ERC1155）必须要实现这几个方法
- approve的额度（owner给spender分配的额度）是可以随便给的，但是转账时候会检查余额（spender在调用transferfrom转账时候会检查from也就是approve那一步owner的余额）
- approve和transferfrom这两个是配合使用的

#### transfer和transferfrom的相同点和区别

- 共同点
    - 两个函数最终都调用_transfer(from, to, amount)进行转账
- 区别：
    - transferfrom比transfer多一个from参数，因为transfer的from参数其实是他自己。引申出以下两点不同
        - 1 transfer是把调用者（调用transfer的账户）的代币转给第三者，也就是把自己的代币转给第三者
        - 2 transferfrom是调用者（调用transferfrom的账户）把其他人（调用approve给调用transferfrom者配额的账户）的代币转给第三者
    - transferfrom，在进行转账的同时会额外调用_spendAllowance进行配额的变更

``` solidity
function transfer(address to, uint256 amount) public virtual override returns (bool) {
    address owner = _msgSender();
    _transfer(owner, to, amount);
    return true;
}

function transferfrom(
    address from, // 资金转出方，不是msg.sender，此时msg.sender是作为调用者的spender
    address to, // 资金转入方 handler
    uint256 amount  // 转账资金金额
) public virtual override returns (bool) {
    // 这里的msgSender赋值给spender，是因为该方法是有spender来调用的，然后把owner（也就是这里的参数from）的代币转给to账户
    // 同理执行allowance查询时候,owner是给spender配额的owner
    address spender = _msgSender();
    _spendAllowance(from, spender, amount);
    _transfer(from, to, amount);
    return true;
}

// owner是给spender配额的owner，spender是调用allowance的账户
function allowance(address owner, address spender) public view virtual override returns (uint256) {
    return _allowances[owner][spender];
}
```