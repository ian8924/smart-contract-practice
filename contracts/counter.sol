// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Counter {
    uint256 public counter = 0;

    function setIncrement() external {
        counter += 1;
    }
}