// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ExempleErrorHandling {
    
    // Custom errors (erreurs personnalisées)
    error SoldeInsuffisant(uint solde, uint montant);
    error CompteInexistant(address compte);
    error MontantInvalide();

    // Mapping pour stocker les soldes
    mapping(address => uint) public soldes;
    
    // Événement pour tracer les dépôts
    event Depot(address compte, uint montant);
    
    // Fonction pour déposer de l'argent
    function deposer() public payable {
        // require : vérifie une condition avec un message d'erreur simple
        require(msg.value > 0, "Le montant du depot doit etre superieur a 0");
        
        soldes[msg.sender] += msg.value;
        emit Depot(msg.sender, msg.value);
    }
    
    // Fonction de retrait utilisant require
    function retirerAvecRequire(uint _montant) public {
        require(soldes[msg.sender] >= _montant, "Solde insuffisant");
        require(_montant > 0, "Le montant doit etre superieur a 0");
        
        soldes[msg.sender] -= _montant;
        payable(msg.sender).transfer(_montant);
    }
    
    // Fonction de retrait utilisant revert avec custom error
    function retirerAvecRevert(uint _montant) public {
        if (_montant == 0) {
            revert MontantInvalide();
        }
        
        if (soldes[msg.sender] < _montant) {
            revert SoldeInsuffisant({
                solde: soldes[msg.sender],
                montant: _montant
            });
        }
        
        soldes[msg.sender] -= _montant;
        payable(msg.sender).transfer(_montant);
    }
    
    // Fonction utilisant assert pour vérifier une invariante
    function transferer(address _destinataire, uint _montant) public {
        // Vérifie si le destinataire existe
        if (_destinataire == address(0)) {
            revert CompteInexistant(_destinataire);
        }
        
        uint soldeInitial = soldes[msg.sender] + soldes[_destinataire];
        
        // Effectue le transfert
        soldes[msg.sender] -= _montant;
        soldes[_destinataire] += _montant;
        
        // Assert vérifie que le solde total reste constant
        // Ne devrait jamais échouer si le code est correct
        assert(soldes[msg.sender] + soldes[_destinataire] == soldeInitial);
    }
}