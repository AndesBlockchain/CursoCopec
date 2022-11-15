// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Mutabilidad {

    uint contador;

    //Esta funcion modifica el estado del contrato y de la cadena
    //Su ejecución necesita el consenso de la red y por ende cuesta gas
    function incrementar() public {
        contador++;
    }

    //Esta funcion lee el estado del contrato, pero no lo modifica
    //Se ejecuta localmente en el nodo
    //No cuesta gas si se ejecuta por si sola (pero sí aumenta el costo si se ejecuta dento de 
    //método que si modifique el estado)
    function estadoContador() public view returns(uint) {
        return contador;
    }

    //Esta funcion no lee ni modifica el estado del contrato, solo usa sus propios input
    //No cuesta gas.
    function hashValor(bytes32 _valor) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_valor));
    }
 
}