// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExempleModifier {
    // Adresse du propriétaire du contrat
    address public owner;

    // Variable pour stocker une valeur
    uint256 public valeur;

    /**
     * Définit l'appelant initial comme propriétaire du contrat lors du déploiement.
     */
    constructor() {
        owner = msg.sender;
    }

    /**
     * Modificateur pour vérifier si l'appelant est le propriétaire du contrat.
     */
    modifier isOwner() {
        // Vérifie si l'appelant est le propriétaire
        require(msg.sender == owner, "L'appellant n'est pas owner");
        _;
    }

    /**
     * Fonction pour mettre à jour la valeur. Accessible uniquement par le propriétaire.
     * _nouvelleValeur La nouvelle valeur à stocker.
     */
    function mettreAJourValeur(uint256 _nouvelleValeur) public isOwner {
        valeur = _nouvelleValeur;
    }

    /**
     * Fonction publique accessible par tous pour lire la valeur actuelle.
     */
    function lireValeur() public view returns (uint256) {
        return valeur;
    }
}
