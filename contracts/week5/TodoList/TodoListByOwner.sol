// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract TodoList {
    struct Task {
        string name;
        bool completed;
    }

    Task[] public todoList;
    address private immutable onwer;

    constructor() {
        onwer = msg.sender;
    }

    // 透過 modifier onlyMe 檢查權限
    modifier onlyMe () {
        require(onwer ==  msg.sender, "Not your Contract");
        _;
    }

    function create(string calldata _name) external onlyMe {
        Task memory a = Task(_name,false);
        todoList.push(a);
    }

    function update(uint index, bool _completed) external onlyMe {
        todoList[index].completed = _completed;
    }

    function get(uint index) external view returns(Task memory)  {
        return todoList[index];
    }

    function kill() external {
        selfdestruct(payable(msg.sender));
    }
}