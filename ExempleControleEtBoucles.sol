// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ExempleBoucles {
    // Tableau pour stocker des nombres
    uint[] public nombres;
    
    // Fonction pour initialiser le tableau avec quelques valeurs
    function initialiserTableau() public {
        nombres = [1, 2, 3, 4, 5];
    }
    
    // Exemple de boucle FOR
    // Additionne tous les nombres du tableau
    function sommeAvecFor() public view returns (uint) {
        uint somme = 0;
        
        for (uint i = 0; i < nombres.length; i++) {
            somme += nombres[i];
        }
        
        return somme;
    }
    
    // Exemple de boucle WHILE
    // Compte combien de nombres sont supérieurs à 3
    function compterAvecWhile() public view returns (uint) {
        uint i = 0;
        uint compte = 0;
        
        while (i < nombres.length) {
            if (nombres[i] > 3) {
                compte++;
            }
            i++;
        }
        
        return compte;
    }
    
    // Exemple de boucle DO WHILE
    // Double chaque nombre du tableau jusqu'à ce qu'un nombre dépasse 10
    function doublerAvecDoWhile() public {
        uint i = 0;
        
        do {
            nombres[i] = nombres[i] * 2;
            i++;
        } while (i < nombres.length && nombres[i-1] <= 10);
    }
}