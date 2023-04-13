//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract MappingIterator {
    //1 uint8 可以直接用uint256类型，如果在结构体里，优先考虑是否可以和其他变量内存对齐
    // 2
    uint256 val = storageData;
    uint256 memoryData = storageData;
    // 此处省略memoryData参与的各种逻辑，最后将memoryData再赋值给val（storage data）
    uint256 val = memoryData;
}