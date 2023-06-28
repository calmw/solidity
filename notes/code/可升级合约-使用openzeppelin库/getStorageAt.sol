// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract StorageContract {
    uint256 public a = 10;
    string  public name;
    uint256 public c = 1;
    mapping(string => uint256) public userAge;
    uint256 public d = 2;

    constructor(string calldata name_, uint256 age_){
        userAge[name_] = age_;
    }
    function adminSetName(string calldata name_) public {
        name = name_;
    }

    function adminSetUserAge(string calldata name_, uint256 age_) public {
        userAge[name_] = age_;
    }

    function readStorageSlot0() public view returns (bytes32 result) {
        assembly {
            result := sload(0)
        }
    }

    function readStorageSlot1() public view returns (bytes32 result) {
        assembly {
            result := sload(1)
        }
    }

    function readStorageSlot2() public view returns (bytes32 result) {
        assembly {
            result := sload(2)
        }
    }

    function readStorageSlot3() public view returns (bytes32 result) {
        assembly {
            result := sload(3)
        }
    }

    function readStorageSlot4() public view returns (bytes32 result) {
        assembly {
            result := sload(5)
        }
    }
}
