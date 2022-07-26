// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Vault {
  bool public locked;
  /* @info Private modifier only says that only the others smart contracts can not read this variable, However, using web3 library wil allow us get the passwords from the storage of the smart contract*/
  /* @info In order to make the data private in the blockchain, it should always be encrypted before putting in on the blockchain*/
  
  bytes32 private password;

  constructor(bytes32 _password) public {
    locked = true;
    password = _password;
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}

/* Solution :
    -- Slot number 1 --
    bytes32 new_password = web3.eth.getStorageAt(contract.address, 1);
    contract.unlock(new_password)
 */