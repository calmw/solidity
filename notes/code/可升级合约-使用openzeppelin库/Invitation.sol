// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./LargeArray.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

    struct NetWork {
        uint256 id;
        uint level;
        uint time;
        address sender_;
        address super_;
    }

contract Invitation is Initializable {

    uint256 public _autoIds;
    mapping(uint256 => NetWork) public _netWorks;
    mapping(address => uint256)  public _userIds;
    mapping(address => LargeArray)  public _childrens;

    mapping(address => bool) private _readers;
    address private _gate;
    address private _admin;
    address private _owner;

    uint256[50] private __gap;

    event Post(uint256 indexed id, address indexed sender, uint256 level, address super_);

    modifier onlyOwner() {
        require(_owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    modifier onlyReader() {
        require(_readers[msg.sender] == true || _admin == msg.sender || _owner == msg.sender, "Ownable: caller is not the reader");
        _;
    }

    function setReader(address __reader, bool flag) external onlyAdmin
    {
        _readers[__reader] = flag;
    }

    modifier onlyGate() {
        require(_gate == msg.sender || _admin == msg.sender, "Ownable: caller is not the gate");
        _;
    }

    function setGate(address __gate) external onlyAdmin
    {
        _gate = __gate;
    }

    modifier onlyAdmin() {
        require(_admin == msg.sender || _owner == msg.sender, "Ownable: caller is not the admin");
        _;
    }

    function setAdmin(address __admin) external onlyOwner
    {
        _admin = __admin;
    }

    function initialize() public initializer {
        _owner = msg.sender;
        _autoIds = 1;
        _netWorks[_autoIds] = NetWork({
            id: _autoIds,
            level: 0,
            time: block.timestamp,
            sender_: _owner,
            super_: address(0)
        });
        _userIds[_owner] = _autoIds;
    }

    function getAutoIds() external view returns (uint256)
    {
        return _autoIds;
    }

    function getInfoForId(uint256 _id) external onlyReader view returns (NetWork memory)
    {
        return _netWorks[_id];
    }

    function getInfo(address _sender) external onlyReader view returns (NetWork memory)
    {
        return _netWorks[_userIds[_sender]];
    }

    function getSuper(address _sender) external onlyReader view returns (address)
    {
        uint256 id = _userIds[_sender];
        if (id == 0) return address(0);
        return _netWorks[id].super_;
    }

    function getChildrenLength(address _sender) external onlyReader view returns (uint256)
    {
        return _childrens[_sender].length;
    }

    function getChildrenInfos(address _sender, uint256 start, uint256 end) external onlyReader view returns (NetWork[] memory)
    {
        require(end > start, "");
        uint256[] memory ids = LargeArrayHelper.toReverseList(_childrens[_sender], start, end);
        if (ids.length == 0)
            return new NetWork[](0);

        NetWork[] memory list = new NetWork[](end - start);
        for (uint256 i = 0; i < ids.length; i++)
        {
            list[i] = _netWorks[ids[i]];
        }
        return list;
    }

    function getChildrenAddresss(address _sender, uint256 start, uint256 end) external onlyReader view returns (address[] memory)
    {
        require(end > start, "");
        uint256[] memory ids = LargeArrayHelper.toReverseList(_childrens[_sender], start, end);
        if (ids.length == 0)
            return new address[](0);

        address[] memory list = new address[](end - start);
        for (uint256 i = 0; i < ids.length; i++)
        {
            list[i] = _netWorks[ids[i]].sender_;
        }
        return list;
    }

    function post(address _sender, address _super) external onlyGate
    {
        require(_userIds[_super] > 0, "Super invalid!");

        NetWork memory _superNetWork = _netWorks[_userIds[_super]];

        _autoIds++;
        NetWork memory netWork = NetWork({
            id: _autoIds,
            level: _superNetWork.level + 1,
            time: block.timestamp,
            sender_: _sender,
            super_: _super
        });
        _netWorks[_autoIds] = netWork;
        _userIds[_sender] = _autoIds;
        LargeArrayHelper.push(_childrens[_super], _autoIds);

        emit Post(netWork.id, netWork.sender_, netWork.level, netWork.super_);
    }
}