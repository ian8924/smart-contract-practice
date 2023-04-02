// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Error {
    function testRequire(uint _i) public pure {
        // - 驗證用戶輸入
        // - 執行之前驗證狀態
        // - 回傳錯誤訊息
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure {
        // 適用於更複雜的驗證邏輯
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint public num;

    function testAssert() public view {
        // 檢查不變量
        // 更改後驗證狀態
        // 較少使用
        assert(num == 0);
    }

    // 自定義 Error 回傳值
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}