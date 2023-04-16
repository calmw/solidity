// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./Storage.sol";

contract LogicOne is Storage {
    constructor(){}

    function setVal(uint _val) public returns (bool){
        // 可以在这里写区别于LogicOne setVal 的逻辑
        val = 2 * _val;
        return true;
    }
}
