//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract MappingIterator {
    mapping(string => address)elements;
    string[] keys;

    // 给map添加键值对（key不存在添加键值对，存在更新值）
    function put(string key, address addr)returns (bool)  {
        bool exists = elements[key] != address(0);
        if (!exists) {//不存在
            keys.push(key);
        }
        elements[key] = addr;
        return true;
    }

    function getKeyCount() constant returns (uint) {
        return keys.length;
    }
}