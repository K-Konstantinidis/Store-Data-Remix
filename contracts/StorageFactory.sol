// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;
import "./StoreNumberToPerson.sol";

contract StorageFacory { // 'is StoreNumberToPerson' => Inheritance
    StoreNumberToPerson[] public StoreArray;

    // Creates a SimpleStorage to store a value
    function createSimpleStorageContract() public {
        StoreNumberToPerson StoreNtP = new StoreNumberToPerson();
        StoreArray.push(StoreNtP);
    }

    /*  Pass the array position (0 the 1st time, 1 the 2nd etc)
        (If you pass an existing position, the number will get updated)
        Pass the number you want to store in that position */
    function sfStore(uint256 index, uint256 number) public {
        // Address
        // ABI: Application Binary Interface
        StoreNumberToPerson(address(StoreArray[index])).store(number);
    }

    // Pass the array position from which you want to retrieve the stored value
    function sfGet(uint256 index) public view returns(uint256){
        return StoreNumberToPerson(address(StoreArray[index])).retrieve();
    }
}