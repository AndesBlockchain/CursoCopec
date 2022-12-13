// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

import "@openzeppelin/contracts/access/Ownable.sol";

contract AuthorizedList is Ownable {
    
    mapping(address=>bool) public authorized;
    
    function grantAuthorization(address _authorized) public onlyOwner {
        authorized[_authorized]=true;
    }
    
    function revokeAuthorization(address _authorized) public onlyOwner {
        authorized[_authorized]=false;
    }
 
    function batchGrant(address[] memory _addresses) public onlyOwner {
        for(uint i=0;i<_addresses.length;i++) {
            grantAuthorization(_addresses[i]);
        } 
    }

    function isAuthorized(address _add) view public returns(bool) {
        return authorized[_add];
    }
     
} 