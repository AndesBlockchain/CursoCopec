// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract TiposDatos {

    //Entero Unsigned uint 8, 16, 32, 64, 128, 256
    uint8 numero_chico;
    uint16 numero_mediano;
    uint256 numero_enorme;

    //Booleano
    bool activo;

    //Address, Wallet o Contrato
    address contrato;

    //En este caso, esta direccion está habilitada para recibir Ether
    address payable contrato;

    //Esta funcion transfiere Ether del contrato a la dirección de destino
    //(siempre que el contrato tenga saldo...)
    function pagar(uint amount,address destino) public {
        payable(destino).transfer(amount);
    }

    //Bytes -> En la práctica se almacenan como arreglos de largo fijo
    bytes dato;
    bytes8 dato_corto;

    //String -> se almacenan como arreglos de largo variable
    //No existen las típicas funciones de string como concatenar, substring, etc
    string saludo;

    //Arreglos de variables


    //Mapping: Arreglo indexado
    mapping(address=>uint) saldos //Caso típico para almacenar saldos
    mapping(address=>bool) autorizados //Típico para una lista de address autorizadas
    
}