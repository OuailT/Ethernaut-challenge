// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;

contract GateKeeperTwo {

  address public entrant;

  // We need to call this smart contract from another contract
  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  // The contract should have a extcodeze of Zero
  modifier gateTwo() {
    uint x;
    assembly { x := extcodesize(caller()) }
    require(x == 0);
    _;
  }

  // We should get _gateKey of msg.sender(the address of the attack contract in this case)
  modifier gateThree(bytes8 _gateKey) {
    require(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == uint64(0) - 1);
    _;
  }

  // We call this function to be the entrant
  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}