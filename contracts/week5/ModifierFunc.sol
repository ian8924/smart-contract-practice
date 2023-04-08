// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Modifier 有三種形式
// 1. base
// 2. inputs
// 3. sandwich
contract ModifierFunc {

    bool public paused = false;
    uint public count = 0;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    // 1. base
    modifier whenNotPaused {
        require(!paused , "paused !");
        _;
    }

    function inc() external whenNotPaused {
        count += 1;
    }

    function des() external whenNotPaused {
        count -= 1;
    }

    // 2. inputs 傳入參數
    modifier cap(uint _x) {
        require(_x <= 100, "_x > 100");
        _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x){
        // 會先經過 modifier whenNotPaused 驗證後，再驗證 cap(_x) 
        count += _x;
    }

    // 3. sandwich 
     modifier sandwich {
        //  code here
        count += 10;
        _;
        // more code 
        count *= 10;
    }

    function sandwichFun() external sandwich{
        count += 1;
    }
}
