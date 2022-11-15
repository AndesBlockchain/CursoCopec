// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "@openzeppelin/contracts/access/Ownable.sol";

contract AuthList is Ownable {

    mapping(address=>bool) public list;

    function grant(address _newAuth) public onlyOwner {
        require(!isAuthorized(_newAuth),"Already granted");
        list[_newAuth] = true;
    }

    function revoke(address _newAuth) public onlyOwner {
        require(isAuthorized(_newAuth),"Not granted");
        list[_newAuth] = false;
    }

    function isAuthorized(address _verify) public view returns(bool) {
        return(list[_verify]);
    }

}

contract Counter {

    uint public count;
    AuthList public authList;

    constructor(address _authList) {
        authList= AuthList(_authList);
    }

    function increase() public {
        require(authList.isAuthorized(msg.sender),"Not Authorized");
        count++;
    }
}

//Se puede crear un contrato que reuna pasos que involucren a varios contratos
contract Deployer {


    function deploy() public returns(address list,address counter) {
        //Crear la lista de autorizados
        AuthList _list= new AuthList();
        Counter _counter = new Counter(address(_list));
        _list.transferOwnership(msg.sender);
        return(address(_list),address(_counter));
    }
}