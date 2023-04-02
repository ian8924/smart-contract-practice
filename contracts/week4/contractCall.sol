// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ContractA {
    ContractB immutable public B;
    address public currentSender;
    constructor (address B_addr) {
        B = ContractB(B_addr);
    }
    function callB() external {
        currentSender = B.showMsgSender(); 
    }
}
contract ContractB {
    function showMsgSender() external view returns (address) {
        return msg.sender;
    }
}