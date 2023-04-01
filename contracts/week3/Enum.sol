// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Enum {
    enum Status {
        NONE,
        Pending,
        Shipped,
        Complete,
        Rejected,
        Canceled
    }

    Status public status;

    struct Order {
        address buyer;
        Status status;
    }


    Order[] public orders;

    function get() external view returns(Status) {
        return status;
    }

    function set(Status _status) external {
        status = _status;
    }

    function ship() external {
        status = Status.Shipped;
    }

    function reset() external {
        delete status;
    }
}