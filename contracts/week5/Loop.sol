// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// 跑迴圈有兩種用法, 與 js 寫法差不多
// 1. for
// 2. while
contract Loop {
   function loops () external pure {
        for(uint i = 0; i <= 10; i++ ) {
            // code
            if(i == 3) {
                continue;
            }
            // do somthing
            if(i == 5) {
                break;
            }
        }
        uint j = 0;
        while (j< 10) {
            j++;
        }
   }

   function sum(uint _n) external pure returns (uint) {
        uint s;
        for(uint i = 1; i<=_n; i++) {
            s += i;
        }
        return s;
   }
}
