#### 介绍

- 最多3个indexed参数，每个indexed被存储为一个32B的topic
- 如果一个indexed的参数类型大于32B（如string、bytes），则不存储实际数据，而是存储数据的keccak摘要
- topics: 最多4个topics，其中一个为事件，剩余的为indexed参数
- data： data是Event的Payload，可以是任意长度的字节数组，所有non-indexed参数都被存储为data。