// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract StateVariables {
    uint public myUnit = 123;

    function foo() public pure {
        uint notStateVariable = 456;
    }
}