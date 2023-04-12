// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Payable {
    address payable public owner;
    constructor() {
        owner = payable(msg.sender);
    } 

    function deposit() public payable {}

    function getBalance() public view returns (uint){
        return address(this).balance;
    } 
}
