// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./safeMath.sol";
import "hardhat/console.sol";

contract FlipCoin {

  using SafeMath for uint256;
  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;


  constructor() {
    consecutiveWins = 0;
  }

  function flip(bool _guess) public returns (bool) {
    /* 1- Since we don't know if the current block is valid and created
          we get the the prevouis block that why I we sub - 1
       2- we hash it, then we convert it to uint256.
    */

    uint256 blockValue = uint256(blockhash(block.number - 1));

    // To check if the blockValue is unique to make guessing difficut
    if (lastHash == blockValue) {
      revert();
    }


    lastHash = blockValue;
    uint256 coinFlip = blockValue.div(FACTOR);
    bool side = coinFlip == 1 ? true : false;

    if (side == _guess) {
      consecutiveWins++;
      return true;
    } else {
      consecutiveWins = 0;
      return false;
    }
  }
}


