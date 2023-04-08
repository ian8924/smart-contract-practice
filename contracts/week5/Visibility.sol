// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


contract VisibilityBase {
    // Variable Visibility
    uint private x = 0; // 繼承合約不可用
    uint public y = 1;  // 繼承合約可用
    uint internal z = 2; // 繼承合約可用


    // Function Visibility
    // public fumction : 合約內部或外部都可以呼叫
    function publicFunc() public pure returns(uint) {
        return 1;
    }
    // internal function : 內部或繼承合約可呼叫 , 外部不可以呼叫
    function internalFunc() internal pure returns(uint) {
        return 1;
    }
    // external function : 內部或繼承合約不可呼叫 , 外部可以呼叫
    function externalFunc() external pure returns(uint) {
        return 1;
    }
    // private function : 只有內部合約可呼叫
    function privateFunc() private pure returns(uint) {
        return 1;
    }

    // 測試內部呼叫
    function example() external view {
        x + y + z;
        publicFunc();
        internalFunc();
        // externalFunc();  has error
        privateFunc();
    }  
}

contract VisibilityChild is VisibilityBase {
    function example2() external view {
        y + z;
        publicFunc();
        internalFunc();
        // externalFunc(); has error
        // privateFunc(); has error
    }
}