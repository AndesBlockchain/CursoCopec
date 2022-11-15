// SPDX-License-Identifier: MIT
pragma solidity ^0.5;

contract Casting {

    function overflow(uint8 valor1, uint8 valor2) pure public returns(uint8) {
        return valor1+valor2
    }

    function safe(uint8 valor1, uint8 valor2) pure public returns(uint8) {
        uint8 resultado= valor1+valor2;
        require(resultado >= valor1,"Overflow");
        return resultado;
    }

}