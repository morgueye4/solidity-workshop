// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

interface IERC20Basic {
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
}

contract MonTokenV2Solution is IERC20Basic {
    mapping(address => uint256) private _soldes;
    uint256 private _emissionTotale;
    
    constructor(uint256 emission) {
        _emissionTotale = emission;
        _soldes[msg.sender] = emission;
    }
    
    function totalSupply() external view override returns (uint256) {
        return _emissionTotale;
    }
    
    function balanceOf(address account) external view override returns (uint256) {
        return _soldes[account];
    }
    
    function transfer(address to, uint256 amount) external override returns (bool) {
        require(_soldes[msg.sender] >= amount, "Solde insuffisant");
        require(to != address(0), "Destinataire invalide");
        
        _soldes[msg.sender] -= amount;
        _soldes[to] += amount;
        
        emit Transfer(msg.sender, msg.sender, amount);
        return true;
    }
}