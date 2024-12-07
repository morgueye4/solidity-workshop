// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ExempleTypesDeFonctions {
    
    // 🟦 Variable d'état accessible dans tout le contrat
    uint256 public nombrePublic = 42;

    // 🟦 Variable d'état interne (accessible dans ce contrat et les contrats dérivés)
    uint256 internal nombreInterne = 10;

    // 🟦 Variable d'état privée (accessible uniquement dans ce contrat)
    uint256 private nombrePrive = 5;

    // 🟩 ** 1. Fonctions publiques **

    /**
     * Fonction publique : peut être appelée par n'importe qui (à l'intérieur ou à l'extérieur du contrat).
     * Elle est également visible dans les contrats dérivés.
     */
    function obtenirNombrePublic() public view returns (uint256) {
        return nombrePublic;
    }

    /**
     * Fonction publique avec des paramètres.
     * Permet d'ajouter une valeur au `nombrePublic`.
     */
    function ajouterAuNombrePublic(uint256 _valeur) public {
        nombrePublic += _valeur;
    }

    // 🟩 ** 2. Fonctions privées **

    /**
     * Fonction privée : accessible uniquement dans ce contrat.
     * Elle n'est pas accessible dans les contrats dérivés ou par un appel externe.
     */
    function _multiplierNombrePrive(
        uint256 _facteur
    ) private view returns (uint256) {
        return nombrePrive * _facteur;
    }

    /**
     * Utilisation interne d'une fonction privée.
     */
    function multiplierNombrePrive(
        uint256 _facteur
    ) public view returns (uint256) {
        return _multiplierNombrePrive(_facteur);
    }

    // 🟩 ** 3. Fonctions internes **

    /**
     * Fonction interne : accessible dans ce contrat et dans les contrats dérivés.
     */
    function _ajouterAuNombreInterne(uint256 _valeur) internal {
        nombreInterne += _valeur;
    }

    /**
     * Fonction publique qui utilise une fonction interne.
     */
    function utiliserAjoutInterne(uint256 _valeur) public {
        _ajouterAuNombreInterne(_valeur);
    }

    /**
     * Fonction pour obtenir la valeur de `nombreInterne`.
     */
    function obtenirNombreInterne() public view returns (uint256) {
        return nombreInterne;
    }

    // 🟩 ** 4. Fonctions externes **

    /**
     * Fonction externe : ne peut être appelée qu'à l'extérieur du contrat.
     * Elle ne peut pas être appelée directement à partir d'autres fonctions internes du contrat.
     */
    function obtenirNombrePublicExterne() external view returns (uint256) {
        return nombrePublic;
    }

    /**
     * Exemple pour appeler une fonction externe depuis l'extérieur.
     * Vous pouvez utiliser Remix pour interagir avec cette fonction.
     */

    // 🟩 ** 5. Fonctions avec des modificateurs de vue (view) et d'état (pure) **

    /**
     * Fonction `view` : permet de lire les variables d'état mais ne modifie pas leur valeur.
     */
    function lireSansModifier() public view returns (uint256) {
        return nombrePublic;
    }

    /**
     * Fonction `pure` : ne lit ni ne modifie aucune variable d'état.
     */
    function calculerSansEtat(
        uint256 a,
        uint256 b
    ) public pure returns (uint256) {
        return a + b;
    }

    // 🟩 ** 6. Fonctions payables **

    /**
     * Fonction `payable` : peut recevoir des ethers.
     */
    function recevoirEther() public payable {}

    /**
     * Fonction pour vérifier le solde du contrat.
     */
    function obtenirSolde() public view returns (uint256) {
        return address(this).balance;
    }

    /**
     * Fonction pour envoyer des ethers à une adresse spécifique.
     */
    function envoyerEther(
        address payable destinataire,
        uint256 montant
    ) public {
        require(address(this).balance >= montant, "Solde insuffisant");
        destinataire.transfer(montant);
    }
}
