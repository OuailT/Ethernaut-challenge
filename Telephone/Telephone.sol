// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() {
    owner = msg.sender;
  }

  // msg.sender the caller can be a contract
  // tx.origin the caller can never be a contract
  // If I call this function from a wallet, it will show as tx.origin
  // but if I call it from a contract, it will show as msg.sender because
  // A (tx.origin) => B(msg.sender) => C Contract
  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}