// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Modifier {

    address creador;
    uint contador;

    //Este modificador empaqueta la funcionalidad de la verificacion
    //y la hace más reutilizable y legible
    //Es parecido a un decorator
    modifier onlyOwner {
        require(msg.sender==creador,"Solo puede hacerlo el creador");
        _;
    }

    constructor() {
        creador =  msg.sender;
    }

    //Misma funcionalidad, pero con menos codigo y más legible
    function incrementar() public onlyOwner {
        contador++;
    }

}

//Una aun mejor forma es empaquetar la funcionalidad completa de manejar
//al creador en un contrato aparte que sea heredable
contract Owner {
    
    address owner;

    modifier onlyOwner {
        require(msg.sender==owner,"Solo puede hacerlo el creador");
        _;
    }

    constructor() {
        owner =  msg.sender;
    }
}

contract Incrementador is Owner {

    uint contador;

    function incrementar() public onlyOwner {
        contador++;
    }   

}

//Y una aún mejor es buscar esta funcionalidad ya implementada y "battle tested"
//La mejor fuente: Open Zeppelin
import "@openzeppelin/contracts/access/Ownable.sol";
contract Incrementador2 is Ownable {

    uint contador;

    function incrementar() public onlyOwner {
        contador++;
    }   

}
