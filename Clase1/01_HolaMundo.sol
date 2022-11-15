// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract HolaMundo {

    string saludo;

    function setSaludo(string memory _saludo) public {
        saludo = _saludo;
    }

    function getSaludo() public view returns(string memory) {
        return saludo;
    }
}