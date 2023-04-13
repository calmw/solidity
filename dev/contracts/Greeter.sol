//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract MappingIterator {
    mapping(string => address)elements;
    string[] keys;

    // 给map添加键值对（key不存在添加键值对，存在更新值）
    function put(string calldata key, address addr) public returns (bool)  {
        bool exists = elements[key] != address(0);
        if (!exists) {//不存在
            keys.push(key);
        }
        elements[key] = addr;
        return true;
    }

    function getKeyCount() public view returns (uint) {
        return keys.length;
    }

    // 使用时，防止索引越界
    function getElementAtIndex(uint index) public view returns (address)  {
        return elements[keys[index]];
    }

    function getElement(string calldata key) public view returns (address)  {
        return elements[key];
    }

    function delElement(string calldata key) public {
        for (uint i; i < keys.length; i++) {
            string memory ki = keys[i];
            if (keccak256(abi.encodePacked(key)) == keccak256(abi.encodePacked(ki))) {
                delete elements[key];
                delete keys[i];
                return;
            }
        }
    }
}