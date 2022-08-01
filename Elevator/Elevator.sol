// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

// Interface must be external | Can inherit from other interfaces
// When the modifiers is not specified in the function, by default the function can read|write
// It doesn't contain the logic of the specified function, but in other smart contract.

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;
 
  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}