// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract LocalVariables {
    uint public i;
    bool public b;
    address public myAddr;

    function foo() external {
        uint x = 123;
        bool f = false;

        x+= 123;
        f = true;

        i = 6;
        b  =true;
        myAddr = address(1);
    }
}