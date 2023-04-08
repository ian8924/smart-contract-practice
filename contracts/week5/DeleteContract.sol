// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

// selfdestruct 指令是從區塊鏈中刪除合約，並將合約儲存的以太幣發送到指定地址
contract Kill {
    constructor () payable {}

    function kill() external {
        selfdestruct(payable(msg.sender));
    }

    function test() public pure returns(uint) {
        return 1;
    }
}

contract Helper {
    function getBaalance() external view returns(uint) {
        return address(this).balance;
    }

    function kill(Kill _kill) external {
        _kill.kill();
    }
}