// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract StateVariables {
    uint public myUnit = 123;

    function foo() public {
        uint notStateVariable = 456;
    }
}