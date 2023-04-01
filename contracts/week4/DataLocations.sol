// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract DataLocations {
    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function exp(uint[] calldata p , string calldata s) public returns (uint[] memory) {
        myStructs[msg.sender] = MyStruct({foo:1, text:'123'});

        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = s;

        MyStruct memory readOnly = myStructs[msg.sender];
        readOnly.foo = 2;

        uint[] memory result = new uint[](3);
        _internal(p);

        return result;

    }

    function _internal(uint[] calldata y) pure private {
        uint x = y[0];
    }
}