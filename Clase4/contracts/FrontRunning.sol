// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.17;

contract Prize {

    bytes32 public hashedSecret;

    constructor(bytes32 _hashedSecret) payable {
        hashedSecret= _hashedSecret;
    }

    function giveMeThePrize(string calldata _secret) public {
        require(keccak256(abi.encodePacked(_secret))==hashedSecret,"Wrong Secret");
        payable(msg.sender).transfer(address(this).balance);
    }
}

contract PrizeNotFrontrunned {

    bytes32 public hashedSecret;
    address public commit;

    constructor(bytes32 _hashedSecret) payable {
        hashedSecret= _hashedSecret;
    }

    function commitment(string calldata _secret) public {
        require(keccak256(abi.encodePacked(_secret))==hashedSecret,"Wrong Secret");
        commit = msg.sender;
    }

    function action() public {
        payable(commit).transfer(address(this).balance);
    }

}