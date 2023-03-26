// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract IfElse {
   function example(uint x) public pure returns(uint){
       if(x<10) {
           return 1;
       } else if (x < 20) {
           return 2;
       } else {
           return 3;
       }
   }

   function example2(uint x) public pure returns(uint){
    //    if(x < 10) {
    //        return 1;
    //    }
    //    return 2;
    return x < 10 ? 1 : 2;
   }
}