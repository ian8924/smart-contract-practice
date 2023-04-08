// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Immutable {
    // 1.  固定變量通常會加 immutable , 可節省gas
    // 2.  固定變量名稱通常都會大寫以區別

    // 寫法一
    address public immutable OWNER = msg.sender;
    // 寫法二
    address public immutable OWNER2;
    constructor () {
        OWNER2 = msg.sender;
    }
}
