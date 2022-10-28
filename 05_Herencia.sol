// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Padre {

    string public saludo;

    function setSaludo(string calldata _saludo) external {
        saludo = _saludo;
    }
 
}

contract Hijo is Padre {

    string public despedida;

    function setDespedida(string calldata _despedida) public {
        despedida = _despedida;
    }

    function devolverSaludos() public view returns(string memory, string memory) {
        return(saludo,despedida);
    }
}