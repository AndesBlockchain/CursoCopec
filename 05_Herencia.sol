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

//Tambien podemos definir y heredar desde interfaces, que solo traen 
//el signature de las funciones (ni implementacion ni estado)
interface IAuthList {
    function grant(address _grant) external;
    function revoke(address _revoke) external;
    function isAuthorized(address _toCheck) external view returns(bool); 
}

//o bien desde un contrato abstracto que puede tener parte de una implementacion
 abstract contract Pago {

    function iniciarPago() public {
        //codigo
    }

    //Si no hay implementacion, la funcion debe marcarse como Virtual
    function aprobar() virtual external;

 }
