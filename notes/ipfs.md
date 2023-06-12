#### 部署项目

- 在安装ipfs的情况下，在桌面上执行如下命令
- ipfs-daemon // 将创建一个节点
- ipfs swarm peers // 让与节点相连的Peers能够共享内容
- ipfs add -r dist/ // 把dist目录加入整个网络，然后返回的hash值是唯一ID
- ipfs name publish hash... // push 到整个网络
- gateway.ipfs.io/ipns/<your hash here> // 访问数据

#### 例子

- [如何上传文件及文件夹到IPFS.pdf](..%2Fstatic%2F%E5%A6%82%E4%BD%95%E4%B8%8A%E4%BC%A0%E6%96%87%E4%BB%B6%E5%8F%8A%E6%96%87%E4%BB%B6%E5%A4%B9%E5%88%B0IPFS.pdf)