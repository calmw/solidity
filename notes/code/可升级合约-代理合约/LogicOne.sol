// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./Storage.sol";

contract LogicOne is Storage {
    constructor(){}

    function setVal(uint _val) public returns (bool){
        val = 2 * _val;
        return true;
    }
}
