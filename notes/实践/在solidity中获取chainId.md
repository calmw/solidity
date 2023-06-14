#### 在solidity7.0以上版本中怎样获取链的id

- 0.8 及版本以上使用： block.chainid

- 0.8以下：

``` solodity
uint chainId;
    assembly {
    chainId := chainid()
}
```