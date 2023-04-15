// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract sendEther {
    constructor() payable {}

    receive() external payable {}

    // gas: 2238
    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(100);
    }

    // gas: 2238
    function sendViaSend(address payable _to) external payable {
        bool sent = _to.send(100);
        require(sent, "send failed");
    }

    // gas: 5423
    function sendViaCall(address payable _to) external payable {
        (bool success, ) = _to.call{value: 100}("");
        require(success,"call fail");
    }

    function showCurrentVal() public view returns(uint) {
        return address(this).balance;
    }

}


contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value , gasleft());
    }

    function showCurrentVal() public view returns(uint) {
        return address(this).balance;
    }

}