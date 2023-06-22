// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract AbiEncode {

    function getEncode(
        address _logic,
        address admin_,
        bytes memory _data
    ) public pure returns (bytes memory payload) {
        payload = abi.encode(_logic, admin_, _data);
    }

    function getDecode(
        bytes memory payload
    ) public pure returns (
        address _logic,
        address admin_,
        bytes memory _data
    )
    {
        (_logic, admin_,_data) = abi.decode(
            payload,
            (address, address, bytes)
        );
    }
}