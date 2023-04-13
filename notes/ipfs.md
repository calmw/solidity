#### 部署项目

- 在安装ipfs的情况下，在桌面上执行如下命令
- ipfs-daemon // 将创建一个节点
- ipfs swarm peers // 让与节点相连的Peers能够共享内容
- ipfs add -r dist/ // 把dist目录加入整个网络，然后返回的hash值是唯一ID
- ipfs name publish hash... // push 到整个网络
- gateway.ipfs.io/ipns/<your hash here> // 访问数据