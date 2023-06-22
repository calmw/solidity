// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

struct LargeArray {
    uint256 length;
    mapping(uint256 => uint256) data;
}

library LargeArrayHelper {

    function push(LargeArray storage arr, uint256 v) internal
    {
        require(v > 0, "push 0 is prohibited");

        arr.data[arr.length] = v;
        arr.length++;
    }

    function toReverseList(LargeArray storage arr, uint256 start, uint256 end) internal view returns (uint256[] memory)
    {
        uint256[] memory list;
        if (arr.length > 0 && end > start)
        {
            uint256 length = (end < arr.length) ? (end-start) : (arr.length-start);
            list = new uint256[](length);
            uint index = 0;
            for (uint256 i=0; i<length; i++)
            {
                uint256 j = arr.length - 1 - i - start;
                list[index] = arr.data[j];
                index++;
            }
        }
        return list;
    }
}
