// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

struct People{
    uint256 favoriteNumber;
    string name;
}

contract StoreNumberToPerson{
    uint256 favoriteNumber; // Initialized to zero

    People[] public people;
    mapping(string => uint256) public nameTofvNumber; // Connect a person with their favourite number

    /*
        memory & storage
        memory:     Data will only be stored during excecution of function/contract
        storage:    Data will stay even after the excecution
        string:     Not a value type, it is an array of bytes so we should decide 
                    whether we want to store it in memory or storage
    */
    // Add a person & their favourite number in an array
    function addPerson(string memory _name, uint256 _favoriteNumber) public{
        people.push(People(_favoriteNumber, _name));
        nameTofvNumber[_name] = _favoriteNumber;
    }

    /*  Store the favourite number (Retrieve it with retrieve())
        Initialized stored value = 0 */
    function store(uint256 fv) public {
        favoriteNumber = fv;
    }

    /*
        view & pure: Won't change the state of the blockchain (not making a transaction)
        view:  Reads a state of the blockchain without changing it
        pure:  Does purely math without saving the state somewhere
    */
    // Retrieve the favourite number of a person
    // Initialized retrieve value = 0
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
}