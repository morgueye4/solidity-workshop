// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// Interface : définit seulement la signature des fonctions
interface IVehicule {
    // Fonctions que tous les véhicules doivent implémenter
    function demarrer() external returns (bool);
    function arreter() external returns (bool);
    function obtenirVitesseMax() external view returns (uint);
}

// Contrat abstrait : peut avoir des implémentations et des variables d'état
abstract contract VehiculeBase is IVehicule {
    // Variables d'état communes
    string public marque;
    bool public estDemarre;
    uint public numeroSerie;

    // Constructeur du contrat abstrait
    constructor(string memory _marque, uint _numeroSerie) {
        marque = _marque;
        numeroSerie = _numeroSerie;
        estDemarre = false;
    }

    // Fonction implémentée dans le contrat abstrait
    function demarrer() public virtual override returns (bool) {
        require(!estDemarre, "Vehicule deja demarre");
        estDemarre = true;
        return true;
    }

    // Fonction implémentée dans le contrat abstrait
    function arreter() public virtual override returns (bool) {
        require(estDemarre, "Vehicule deja arrete");
        estDemarre = false;
        return true;
    }

    // Fonction abstraite - doit être implémentée par les enfants
    function obtenirVitesseMax() public view virtual override returns (uint);
}

// Contrat pour les fonctionnalités électriques
abstract contract Electrique {
    uint public niveauBatterie;

    function charger() public virtual {
        niveauBatterie = 100;
    }

    function obtenirNiveauBatterie() public view returns (uint) {
        return niveauBatterie;
    }
}

// Héritage unique : Voiture hérite de VehiculeBase
contract Voiture is VehiculeBase {
    uint public nombrePortes;

    constructor(
        string memory _marque,
        uint _numeroSerie,
        uint _nombrePortes
    ) VehiculeBase(_marque, _numeroSerie) {
        nombrePortes = _nombrePortes;
    }

    // Implémentation de la fonction abstraite
    function obtenirVitesseMax() public pure override returns (uint) {
        return 180;
    }
}

// Héritage multiple : VoitureElectrique hérite de Voiture et Electrique
contract VoitureElectrique is Voiture, Electrique {
    constructor(
        string memory _marque,
        uint _numeroSerie,
        uint _nombrePortes
    ) Voiture(_marque, _numeroSerie, _nombrePortes) {
        niveauBatterie = 0;
    }

    // Override de la fonction demarrer pour vérifier la batterie
    function demarrer() public override returns (bool) {
        require(niveauBatterie > 0, "Batterie vide");
        return super.demarrer();
    }

    // Override de la vitesse max pour les voitures électriques
    function obtenirVitesseMax() public pure override returns (uint) {
        return 200;
    }
}

// Contrat final qui ne peut pas être hérité (mot-clé 'final')
contract VoitureSport is VoitureElectrique {
    bool public modeBoost;

    constructor(
        string memory _marque,
        uint _numeroSerie
    ) VoitureElectrique(_marque, _numeroSerie, 2) {
        modeBoost = false;
    }

    function activerBoost() public {
        require(estDemarre, "Demarrez d'abord la voiture");
        require(niveauBatterie > 50, "Niveau de batterie insuffisant");
        modeBoost = true;
    }

    // Vitesse max augmentée en mode boost
    function obtenirVitesseMax() public view override returns (uint) {
        return modeBoost ? 300 : super.obtenirVitesseMax();
    }
}
