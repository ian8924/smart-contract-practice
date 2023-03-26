// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract FunctionOutputs {

    function returnMany() public pure returns (uint, bool) {
        return (1,false);
    }
    function named() public pure returns (uint x, bool b) {
        return (1,false);
    }

    function assigned() public pure returns (uint x, bool b) {
        x = 1;
        b = true;
    }

    function destructingAssignment() public pure returns (uint , bool){
        (uint x, bool y) = returnMany();
        (,bool _y) = returnMany();
        return (x, _y);
    }
}