// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract LeapYear {

    function findLeapYr(uint256 year) public pure returns (string memory) {
        
        if (year % 4 == 0 || (year % 100 == 0 && year % 400 == 0))
            return "Leap Year";
        else return "Not a Leap Year";
    }
}
