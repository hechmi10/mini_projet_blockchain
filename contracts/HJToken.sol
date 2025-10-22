// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; // Version stable recommandée pour Sepolia

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HJToken is ERC20, Ownable {
    
    event TokensMinted(address indexed to, uint256 amount);

    constructor()
        ERC20(
            "HJToken",
            "HJT"        
        ) Ownable(msg.sender)
    {
     
        mint(msg.sender, 1000000 * 18**decimals());
        emit TokensMinted(msg.sender, 1000000 * 18**decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }
}