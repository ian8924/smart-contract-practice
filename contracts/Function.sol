// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Func {
    function add(uint a, uint b) external pure returns(uint) {
        return a+b;
    }

     function sub(uint a, uint b) external pure returns(uint) {
        return a-b;
    }
}