// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Base contract T
contract T {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

// Base contract S
contract S {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// 兩種方式初始化繼承兩個合約

// 第一種
contract B is T("inputT"), S("inputS") {

}
// 第二種
contract C is T, S {
    constructor(string memory _name, string memory _text) T(_name) S(_text) {}
}

// 呼叫繼承合約順序

// 1. T
// 2. S
// 3. D
contract D is T, S {
    constructor(string memory _name , string memory _text) T("T was called") S("S was called") {}
}

// 1. T
// 2. S
// 3. E
contract E is T, S {
    constructor(string memory _name , string memory _text) S("S was called") T("T was called") {}
}

