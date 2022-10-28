// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Empty {

    uint public voidCalls;
    address creator;

    constructor() payable {
        creator= msg.sender;
        voidCalls=0;
    }

    fallback() external {
        voidCalls++;
    }

    receive() external payable {

    }
}

contract Caller {

    address target;

    constructor(address _target) payable {
        target=_target;
    }

    function llamar() public {
        address(target).call{value: 0, gas: 50000}(abi.encodeWithSignature("hola()"));
    }

    function enviar() public {
        address(target).call{value: 100, gas: 21000}(abi.encodeWithSignature("hola()"));
    }
    
}