// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FuncitonSelector {

   function getSelector(string calldata _fun) external pure returns(bytes4){
       return bytes4(keccak256(bytes(_fun)));
   }
    
}




contract Receiver {
   event Log(bytes data);

   function transfer(address _to, uint _amount) public {
       emit Log(msg.data);
   }

    
}
