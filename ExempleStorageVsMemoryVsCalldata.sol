// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ExempleStorageVsMemoryVsCalldata {
    // Structure pour représenter un utilisateur
    struct Utilisateur {
        string nom;
        uint256 age;
        string[] competences;
    }

    // Stockage permanent des utilisateurs (storage par défaut)
    mapping(address => Utilisateur) public utilisateurs;
    
    // Événement pour tracer les modifications
    event UtilisateurModifie(address indexed utilisateur, string nom, uint256 age);

    function ajouterUtilisateur(string memory _nom, uint256 _age, string[] memory _competences) public {
        // Crée un nouvel utilisateur directement dans le storage
        utilisateurs[msg.sender].nom = _nom;
        utilisateurs[msg.sender].age = _age;
        utilisateurs[msg.sender].competences = _competences;
        
        emit UtilisateurModifie(msg.sender, _nom, _age);
    }

    function modifierAge(address _utilisateur, uint256 _nouvelAge) public {
        // Référence storage - pointe directement vers le stockage
        Utilisateur storage utilisateur = utilisateurs[_utilisateur];
        utilisateur.age = _nouvelAge; // Modifie directement le stockage

        emit UtilisateurModifie(_utilisateur, utilisateur.nom, _nouvelAge);
    }

    function obtenirUtilisateurEnMemoire(address _utilisateur) public view 
        returns (string memory nom, uint256 age, string[] memory competences) 
    {
        // Copie les données en mémoire
        Utilisateur memory utilisateur = utilisateurs[_utilisateur];
        
        // Les modifications ici n'affecteraient pas le stockage
        utilisateur.age = 999; // Cette modification reste en mémoire temporaire
        
        return (utilisateur.nom, utilisateurs[_utilisateur].age, utilisateur.competences);
    }

    function verifierCompetences(
        address _utilisateur, 
        string[] calldata _competencesRequises
    ) public view returns (bool) {
        // calldata est en lecture seule et plus économique en gas
        string[] storage competencesUtilisateur = utilisateurs[_utilisateur].competences;
        
        // Reste de la logique de verification des compétences
        
        return true;
    }
}