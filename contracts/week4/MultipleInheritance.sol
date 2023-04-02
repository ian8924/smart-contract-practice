// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

/*
   X
/  |
Y  |
 \ |
   Z
*/

contract X {
    function foo() public pure virtual returns (string memory) {
        return "X";
    }

    function bar() public pure virtual returns (string memory) {
        return "X";
    }

    function x() public pure returns (string memory) {
        return "X";
    }
}

contract Y is X {
    function foo() public pure virtual override returns (string memory) {
        return "X";
    }

    function bar() public pure virtual override returns (string memory) {
        return "X";
    }

    function y() public pure returns (string memory) {
        return "Y";
    }
}
// Need to put X befoer Y, cuz X has most base
contract Z is X, Y {
    function foo() public pure virtual override(X, Y) returns (string memory) {
        return "Z";
    }

    function bar() public pure virtual override(Y, X) returns (string memory) {
        return "Z";
    }

    function z() public pure returns (string memory) {
        return "Z";
    }
}
