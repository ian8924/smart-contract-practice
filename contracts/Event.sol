// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Event {
   event Log(string message, uint val);
   event IndexedLog(address indexed sender , uint val);


   function example () external {
        emit Log("test" ,123);
        emit IndexedLog(msg.sender ,789);
   }

   event Message(address _from, address _to, string message);

   function sendMessage(address to , string calldata message) public {
       emit Message(msg.sender ,to ,message);
   }
}