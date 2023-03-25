pragma solidity ^0.8.19;

contract Array {
    uint[] public nums = [1,2,3];
    uint[3] public numFixed = [44,5,6];

    function exp() external {
        nums.push(4); // [1,2,3,4]
        uint x = nums[1]; 
        nums[2] = 777; // [1,2,777,4]
        delete nums[1];  // [1,0,777,4]
        nums.pop(); // [1,0,777]

        uint len = nums.length;

        // create array in memory
        uint[] memory a = new uint[](5);
        // not work
        // a.push(1);
        a[1] = 22;

    }
    function returnArray1() external view returns (uint[] memory) {
        return nums;
    }
}