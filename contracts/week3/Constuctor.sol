// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Constuctor {
   address public owner;
   uint public a;

   constructor (uint _a) {
       owner = msg.sender;
       a = _a;
   }
}