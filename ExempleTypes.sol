// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ExempleTypesDemo {
    // 🟩 **Types de base**

    // 🟩 Entier non signé (0 ou positif seulement)
    uint256 public entierNonSigne = 42;

    // 🟩 Entier signé (peut être négatif)
    int256 public entierSigne = -42;

    // 🟩 Booléen (true ou false)
    bool public valeurBooleenne = true;

    // 🟩 Adresse Ethereum (utilisée pour représenter un compte ou un contrat)
    address public adresse = 0x1aE0EA34a72D944a8C7603FfB3eC30a6669E454C;

    // 🟩 Chaîne de caractères
    string public chaineDeCaracteres = "Bonjour Solidity";

    // 🟩 Tableau d’octets (taille fixe)
    bytes32 public tableauOctetsFixe = "SolidityFixedBytes";

    // 🟩 Tableau d’octets dynamique
    bytes public tableauOctetsDynamique = "SolidityBytes";

    // 🟨 **Constantes et variables immuables**
    uint256 public constant CONSTANTE = 100; // Ne peut pas être modifiée
    uint256 public immutable valeurFixe; // Doit être définie au déploiement

    /**
     *  Constructeur pour définir la variable immuable.
     *  _valeur est La valeur initiale de la variable immuable.
     */
    constructor(uint256 _valeur) {
        valeurFixe = _valeur;
    }

    // 🟦 **Types complexes**

    // 🟦 Mapping (clé-valeur, comme un dictionnaire)
    mapping(address => uint256) public soldes;

    // 🟦 Structure personnalisée
    struct Utilisateur {
        string nom;
        uint256 age;
    }

    Utilisateur public utilisateur = Utilisateur("Alice", 30);

    // 🟦 Tableau dynamique (taille variable)
    uint256[] public tableauDynamique = [1, 2, 3];

    // 🟦 Tableau fixe (taille prédéfinie)
    uint256[3] public tableauFixe = [10, 20, 30];

    // 🟦 **Enumérations**
    // Enum pour représenter un état
    enum Etat {
        EN_ATTENTE,
        ACTIVE,
        TERMINEE
    }

    Etat public etat = Etat.EN_ATTENTE;

    // **Fonctions pour manipuler les données**

    /**
     * Modifier le solde d'une adresse dans le mapping.
     *  _adresse L'adresse à mettre à jour.
     *  _montant Le nouveau montant à attribuer.
     */
    function mettreAJourSolde(address _adresse, uint256 _montant) public {
        soldes[_adresse] = _montant;
    }

    /**
     * Ajouter un élément au tableau dynamique.
     * _valeur La valeur à ajouter.
     */
    function ajouterAuTableau(uint256 _valeur) public {
        tableauDynamique.push(_valeur);
    }

    /**
     * Récupérer une valeur d'un tableau fixe.
     * index L'indice de la valeur à récupérer.
     *  La valeur à l'indice spécifié.
     */
    function obtenirDepuisTableauFixe(
        uint256 index
    ) public view returns (uint256) {
        require(index < tableauFixe.length, "Index hors limites");
        return tableauFixe[index];
    }

    /**
     * Changer l'état du contrat.
     * _nouvelEtat Le nouvel état.
     */
    function changerEtat(Etat _nouvelEtat) public {
        etat = _nouvelEtat;
    }

    // **Types spéciaux**

    // Adresse payable (pour envoyer/recevoir des ethers)
    address payable public adressePayable;

    /**
     * Définir une adresse payable.
     * _adressePayable L'adresse payable à définir.
     */
    function definirAdressePayable(address payable _adressePayable) public {
        adressePayable = _adressePayable;
    }

    /**
     * @dev Envoyer des ethers à l'adresse payable.
     */
    function envoyerEther() public payable {
        require(msg.value > 0, "Envoyer des ethers");
        adressePayable.transfer(msg.value);
    }
}
