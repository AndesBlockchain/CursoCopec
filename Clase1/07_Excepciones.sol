// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Excepciones {

    address creador;
    uint contador;

    constructor() {
        creador =  msg.sender;
    }

    //Esta funcion solo puede ser llamada por el creador del contrato
    function incrementar() public {
        require(msg.sender==creador,"Solo puede hacerlo el creador");
        contador++;
    }

}