// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Moneybox {
    uint256 public balance;
    address private owner;

    receive() external payable { // 0xbAD94311DeFEEa52E6bDc4397CAA8c179397a4fB
        balance = balance + msg.value;
     }

     constructor(){
        owner = msg.sender;
     }

     function withdraw(uint amount, address payable destAddr) public{
        require(msg.sender == owner, "only owner can withdraw");
        require(amount <= balance, "not enough money");

        destAddr.transfer(amount);
        balance = balance - amount;
     }
}