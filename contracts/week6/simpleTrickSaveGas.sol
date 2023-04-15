// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract simpleTrickSaveGas {

    uint public n = 1000;
    // n = 5 , gas: 4864
    // n = 10 , gas: 7224
    // n = 100 , gas: 49704
    // n = 1000 , gas: 374495
    function noCache() external view returns(uint) {
        uint s = 0;
        for(uint i = 0; i < n; i++) {
            s += 1;
        }
        return s;
    }
    // n = 5 , gas: 4355
    // n = 10 , gas: 6215
    // n = 100 , gas: 39695
    // n = 1000 , gas: 228318
    function cache() external view returns(uint) {
        uint s = 0;
        uint _n = n;
        for(uint i = 0; i < _n; i++) {
            s += 1;
        }
        return s;
    }


    // 不用 變數先將 state variable 存起來，若是讀取 state variable 越多次將會消耗越多 gas

}
