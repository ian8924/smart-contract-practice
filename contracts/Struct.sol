// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Struct {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car public car;
    Car[] public cars;

    mapping(address=>Car[]) public carsByOwner;

    function examples() external {
        Car memory toyota = Car('TOYOTA', 1990, msg.sender);
        Car memory lambo = Car({ model: 'Lambo' , year: 2020, owner: msg.sender });
        Car memory tesla;
        tesla.model = 'Tesla';
        tesla.year = 2020;
        tesla.owner = msg.sender;

        cars.push(tesla);
        cars.push(toyota);        
        cars.push(lambo);

        cars.push(Car("Ferrari",2020,msg.sender));

        Car storage _car = cars[0];
        _car.year = 1800;

        delete _car.owner;
        delete cars[1];



    }

    function returnCars() public view returns (Car[] memory){
        return cars;
    }

}