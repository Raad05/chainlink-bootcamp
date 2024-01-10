// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract RegisterAccess {
    string[] private info;
    address public owner;
    mapping (address => bool) public allowList;

    constructor() {
        owner = msg.sender;
        allowList[msg.sender] = true;
    }

    event infoChange(string oldInfo, string newInfo);

    // modifiers
    modifier onlyOwner {
        require(msg.sender == owner, "Only owner.");
        _;
    }

    modifier onlyAllowList {
        require(allowList[msg.sender] == true, "You are not allowed");
        _;
    }

    // functions
    function addMember(address _member) public onlyOwner {
        allowList[_member] = true;
    }

    function deleteMember(address _member) public onlyOwner {
        allowList[_member] = false;
    }

    function infoList() public view returns (string[] memory) {
        return info;
    }

    function getInfo(uint _idx) public view returns (string memory) {
        return info[_idx];
    }

    function changeInfo(uint _idx, string memory _info) public onlyAllowList {
        emit infoChange(info[_idx], _info);
        info[_idx] = _info;
    }

    function addInfo(string memory _info) public onlyAllowList returns (uint _idx) { // specifies which parameter to return
        info.push(_info);
        _idx = info.length - 1;
    }
}