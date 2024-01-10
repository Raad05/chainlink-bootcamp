// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Register {
    string private info;

    function getInfo() public view returns (string memory) {
        return info;
    }

    function updateInfo(string memory _info) public {
        info = _info;
    }
}