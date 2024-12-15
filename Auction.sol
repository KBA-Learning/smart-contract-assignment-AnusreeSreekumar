// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Auction{

    address admin;
    address public  owner;
    uint256 basePrice;
    string item;

    constructor(){
        admin = msg.sender;
    }

    modifier verify(){
        require(msg.sender == admin,"unautherized");
        _;
    }

    function setAuction(string memory _item) public verify payable {
            item = _item;
            basePrice = msg.value;
            owner = msg.sender;
    }

    function displayAuction() public view returns(string memory,uint256){
        return (item,basePrice);
    }

    function auctionCall() public payable  {
        if(msg.value > basePrice){
            payable(owner).transfer(basePrice);
            basePrice = msg.value;
            owner = msg.sender;
        }else{
            payable (msg.sender).transfer(msg.value);
        }
    }

}