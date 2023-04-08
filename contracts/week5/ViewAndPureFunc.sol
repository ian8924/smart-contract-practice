// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ViewAndPureFunc {

    // view function vs  pure function 
    // pure function 不會對區塊鏈上的 state variable 做任何讀取
    // view function 會對 state variable 做讀取
   
    uint public a;

    function viewFunc() view external returns (uint) {
        return a;
    }

    function pureFunc() pure external returns (uint) {
        return 1;
    }

    // 讀取了 variable a 所以是 view function
    function addToA(uint _a) view internal returns (uint) {
        return a + _a;
    }

    // 只透過傳入參數做計算所以是 pure function
    function add(uint _a, uint _b) pure internal returns (uint) {
       return _b + _a;
    }

    // function 調用 pure funciton 本身也是 pure funciton
    function test(uint _c, uint _d) pure external returns (uint) {
        return add(_c, _d);
    }

    // function 調用 variable a 傳入 pure funciton 是 view funciton
    function test2(uint _e) view external returns (uint) {
        // send state variable return pure function
        return add(a, _e);
    }

    // 若內部使用的 function 有用過 view funciton , 那也不能是 pure function 
    function test3(uint _e) view external returns (uint) {
        // return view function
        return addToA(_e);
    }

}
