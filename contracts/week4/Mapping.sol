// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Mapping {
    mapping(address => uint) public balances;
    mapping(address => mapping(address => bool)) public isFriend;

    function example () external {
        balances[msg.sender] = 456;
        uint bal = balances[msg.sender];
        uint bal2 = balances[address(1)]; // 0
        balances[msg.sender] += 123;  // 456 + 123 = 579

        delete balances[msg.sender]; // 0
        
        isFriend[msg.sender][address(this)] = true;

    }

    // 測試取得此合約地址
    function getAddr() public view returns(address) {
        return address(this);
    }
}