#### 智能合约的编译与ABI

    与智能合约交互，我们要先生成相应智能合约的应用二进制接口ABI(application binary interface)，并把ABI编译成我们可以在Go应用中调用的格式。
    
    第一步是安装 Solidity编译器 (solc).
    
    Solc 在Ubuntu上有snapcraft包。
    
    sudo snap install solc --edge
    Solc在macOS上有Homebrew的包。
    
    brew update
    brew tap ethereum/ethereum
    brew install solidity
    其他的平台或者从源码编译的教程请查阅官方solidity文档install guide.
    
    我们还得安装一个叫abigen的工具，来从solidity智能合约生成ABI。

#### 假设您已经在计算机上设置了Go，只需运行以下命令即可安装abigen工具。

    go get -u github.com/ethereum/go-ethereum
    cd $GOPATH/src/github.com/ethereum/go-ethereum/
    make
    make devtools