// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./AuthList.sol";

contract DummyWallet is Ownable {

    address authList;

    constructor(address _newOwner, address _authList) {
        _transferOwnership(_newOwner);
        authList= _authList;
    }

    function transferToken(address _token, address _to, uint _amount) public onlyOwner {
        AuthorizedList _authList = AuthorizedList(authList);
        require(_authList.isAuthorized(address(this)),"KYC not ready");
        ERC20 token = ERC20(_token);
        token.transfer(_to,_amount);
    }
}

contract Factory {

    function deploy(address _owner, address _authList) public returns(address) {
        DummyWallet _newDummy= new DummyWallet(_owner, _authList);
        return address(_newDummy);    
}

    function deployWithCreate2(uint _salt, address _owner, address _authList) public returns(address) {
        DummyWallet _contract = new DummyWallet{salt: bytes32(_salt)}(_owner,_authList);
        return address(_contract);
    }

    function getAddress(uint _salt, address _owner, address _authList) public view returns (address) {
        bytes32 hash = keccak256(
            abi.encodePacked(
                bytes1(0xff), address(this), _salt, keccak256(getBytecode(_owner,_authList))
            )
        );
        return address (uint160(uint(hash)));
    }

    // get the ByteCode of the contract DeployWithCreate2
    function getBytecode(address _owner, address _authList) public pure returns (bytes memory) {
        bytes memory bytecode = type(DummyWallet).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_owner,_authList));
    }

}