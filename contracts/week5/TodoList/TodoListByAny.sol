// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract TodoListByAny {
    struct Task {
        string name;
        bool completed;
    }

    mapping(address=> Task[]) public todoList;

    function create(string calldata _name) external {
        Task memory a = Task(_name,false);
        todoList[msg.sender].push(a);
    }

    function update(uint index, bool _completed) external {
        todoList[msg.sender][index].completed = _completed;
    }

    function get(uint index) external view returns(Task memory)  {
        require ( todoList[msg.sender].length > index , "No Data");
        return todoList[msg.sender][index];
    }

}