// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ExempleEvents {
    // Déclaration de l'événement. L'événement émet des informations sur le nom et l'adresse du propriétaire.
    event NomAjoute(string indexed nom, address indexed proprietaire);
    event ValeurModifiee(uint256 ancienneValeur, uint256 nouvelleValeur);

    // Variable pour stocker une valeur
    uint256 public valeur;

    // Variable pour stocker un nom
    string public nom;

    function ajouterNom(string memory _nom) public {
        nom = _nom;
        // Émission de l'événement "NomAjoute" avec les informations
        emit NomAjoute(_nom, msg.sender);
    }

    /**
     * @dev Fonction pour modifier une valeur et émettre un événement.
     * @param _nouvelleValeur La nouvelle valeur à affecter.
     */
    function modifierValeur(uint256 _nouvelleValeur) public {
        uint256 ancienneValeur = valeur;
        valeur = _nouvelleValeur;
        // Émission de l'événement "ValeurModifiee"
        emit ValeurModifiee(ancienneValeur, _nouvelleValeur);
    }
}
