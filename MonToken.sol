// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract MonToken {
    mapping(address => uint256) private _soldes;
    address private _proprietaire;
    uint256 private _emissionTotale;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    constructor(uint256 emission) {
        _proprietaire = msg.sender;
        _emissionTotale = emission;
        _soldes[msg.sender] = emission;
    }
    
    function transferer(address destinataire, uint256 montant) public {
        require(_soldes[msg.sender] >= montant, "Solde insuffisant");
        require(destinataire != address(0), "Destinataire invalide");
        
        _soldes[msg.sender] -= montant;
        _soldes[destinataire] += montant;
        
        emit Transfer(msg.sender, destinataire, montant);
    }
    
    function solde(address compte) public view returns (uint256) {
        return _soldes[compte];
    }
}