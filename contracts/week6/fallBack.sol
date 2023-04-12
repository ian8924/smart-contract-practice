// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FAllback {
   event Log(string func, address sender, uint value, bytes data);

   function deposit() public payable {}

    fallback() external payable {
        emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
        emit Log("receive", msg.sender, msg.value, "");
    }

    // not pay , send calldata => fallback
    // not pay , not send calldata => recieve
    // pay , not send calldata => recieve
    // pay , send calldata => fallback

    // if(calldata) => fallback
    // if(receive()) => receive()

    // if(calldata) {
    //     => fallback()
    // } else {
    //     if(receive()) {
    //         => receive()
    //     } else {
    //         => fallback()
    //     }
    // }
}
