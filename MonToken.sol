// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// EXERCICE 1: MonToken Simple
// =========================
// Instructions:
// 1. Complétez le code en suivant les TODO
// 2. Testez chaque fonction après l'avoir implémentée
// 3. Vérifiez que les événements sont bien émis

contract MonToken {
    // TODO: Déclarer les variables d'état
    // - mapping pour les soldes
    // - adresse du propriétaire
    // - émission totale
    
    // TODO: Déclarer l'événement Transfert
    
    constructor(uint256 _emission) {
        // TODO: Initialiser les variables d'état
        // - Définir le msg.sender comme propriétaire
        // - Attribuer l'émission totale au propriétaire
    }
    
    function transferer(address destinataire, uint256 montant) public {
        // TODO: Implémenter la fonction transferer
        // - Vérifier que l'expéditeur a assez de jetons
        // - Mettre à jour les soldes
        // - Émettre l'événement Transfer
    }
    
    function solde(address compte) public view returns (uint256) {
        // TODO: Retourner le solde du compte
    }
}
