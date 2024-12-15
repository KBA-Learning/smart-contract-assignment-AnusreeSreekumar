// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract MathFunctions {

    uint8 largest; 
    string numword;
    string sign;
    
    function findLargest(uint8 num1, uint8 num2, uint8 num3) public pure returns(uint8 _largest){
        
        if(num1 > num2 && num1 > num3) return num1;
        else if(num2 > num3) return num2;    
        else return num3;
    }

    function getdigit(uint8 digit) public pure returns (string memory _numword) {

        if(digit == 0) return "Zero";
        if(digit == 1) return "One";
        if(digit == 2) return "Two";
        if(digit == 3) return "Three";
        if(digit == 4) return "Four";
        if(digit == 5) return "Five";
        if(digit == 6) return "Six";
        if(digit == 7) return "Seven";
        if(digit == 8) return "Eight";
        if(digit == 9) return "Nine";
        else return "Invalid input";
    }

    function checkSign(int8 number) public pure returns (string memory _sign){

        if(number == 0) return "Zero";
        if(number > 0) return "Positive";
        else return "Negative";
    }    
}