// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Ownable  {
    address public owner;

    constructor() {
        // 初始化 合約owner 
        owner = msg.sender;
    }

    // 檢查是否為合約 owner 
    modifier onlyOwner {
        require(owner == msg.sender, "not owner");
        _;
    }
    // 只有 合約owner 可以更改 合約owner
    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0));
        owner = _newOwner;
     }

     function onlyOwnerCanCall() external onlyOwner {

     }

     function anyOwnerCanCall() external {

     }
}