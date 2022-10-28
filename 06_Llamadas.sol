// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Base {

    uint public contador;

    function incrementarContador() public {
        contador++;
    }
}

contract Caller {

    Base contratoBase;

    constructor(address _base) public {
        contratoBase = Base(_base);
    }

    //Llamada tipica
    function llamarBase() public {
        _base.incrementarContador();
    }

    //Llamada de muy bajo nivel, poco recomendable su uso
    //Solo sirve si necesito enviar Ether de un contrato a otro
    function llamadaBajoNivel() public {
        address(_base).call({value:0,gas:21000}(abi.encodeWithSignature("incrementarContador()")));
    }
}
