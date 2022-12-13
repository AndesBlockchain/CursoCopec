// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Copecoin is ERC20 {
    constructor() ERC20("Copecoin", "CPC") {
        _mint(msg.sender, 10000000 * 10 ** decimals());
    }

    function decimals() pure public override returns(uint8) {
        return 0;
    }
}