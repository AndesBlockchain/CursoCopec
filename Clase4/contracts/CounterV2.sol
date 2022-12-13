// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract CounterV2 is Initializable {

    uint8 public counter;

    function initialize(uint8 _start) public initializer {
        counter=_start;
    }

    function increment() public {
        counter += 1;
    }

    function decrement() public {
        counter -= 1;
    }
}