#### 介绍

- 模拟区块链工具可以用于测试(合约部署调用等)，以下为示例代码：

``` golang
package main

import (
	"fmt"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/accounts/abi/bind/backends"
	"github.com/ethereum/go-ethereum/core"
	"github.com/ethereum/go-ethereum/crypto"
	"math/big"
	"testing"
)

func main() {
	key, _ := crypto.GenerateKey()
	auth, _ := bind.NewKeyedTransactorWithChainID(key, big.NewInt(1))
	alloc := make(core.GenesisAlloc)
	alloc[auth.From] = core.GenesisAccount{Balance: big.NewInt(10000000000)}
	blockchain := backends.NewSimulatedBackend(alloc, 21000) // 模拟区块链工具，后面可以把这个当做对象进行合约部署，合约调用等测试操作
	fmt.Println(blockchain)
}

func TestSetMessage(t *testing.T) {
	key, _ := crypto.GenerateKey()
	auth, _ := bind.NewKeyedTransactorWithChainID(key, big.NewInt(1))
	alloc := make(core.GenesisAlloc)
	alloc[auth.From] = core.GenesisAccount{Balance: big.NewInt(10000000000)}
	blockchain := backends.NewSimulatedBackend(alloc, 21000) // 模拟区块链工具，后面可以把这个当做对象进行合约部署，合约调用等测试操作
	fmt.Println(blockchain)
}
```