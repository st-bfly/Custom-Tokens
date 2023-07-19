// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

// A smart contract that enables you to create your own token on a local HardHat network.
// Any user can mint, burn and transfer tokens.

contract CustomToken is ERC20 {                 // inheriting ERC20 contract

    // to create your token
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}

    // to mint tokens
    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }

    // to burn tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // transfer tokens
    function transfer(address to, uint256 amount) public override returns (bool) {
        require(amount <= balanceOf(msg.sender), "Insufficient balance");  
        _transfer(msg.sender, to, amount);
        return true;
    }
    
}
