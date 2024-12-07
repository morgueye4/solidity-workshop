// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ExempleGasUsage {

    // Tableau de taille fixe
    uint256[5] public fixedArray = [1, 2, 3, 4, 5];

    // Tableau de taille variable
    uint256[] public dynamicArray;

    // Chaîne de caractères
    string public exampleString = "Bonjour Solidity!";

    // Ajouter des éléments dans un tableau dynamique
    function addToDynamicArray(uint256 element) public {
        dynamicArray.push(element); // Consomme plus de gas à mesure que le tableau grandit
    }

    // Boucle sur un tableau de taille fixe
    function sumFixedArray() public view returns (uint256 sum) {
        for (uint256 i = 0; i < fixedArray.length; i++) {
            sum += fixedArray[i]; // La taille du tableau est fixe, donc le coût est constant
        }
    }

    // Boucle sur un tableau dynamique
    function sumDynamicArray() public view returns (uint256 sum) {
        for (uint256 i = 0; i < dynamicArray.length; i++) {
            sum += dynamicArray[i]; // Le coût dépend de la taille actuelle du tableau
        }
    }

    // Modifier un tableau de taille fixe
    function modifyFixedArray() public {
        for (uint256 i = 0; i < fixedArray.length; i++) {
            fixedArray[i] = fixedArray[i] * 2; // Mise à jour d'un tableau de taille fixe
        }
    }

    // Modifier un tableau dynamique
    function modifyDynamicArray() public {
        for (uint256 i = 0; i < dynamicArray.length; i++) {
            dynamicArray[i] = dynamicArray[i] * 2; // Mise à jour d'un tableau dynamique
        }
    }

    // Manipuler une chaîne de caractères
    function appendToString(string memory suffix) public {
        exampleString = string(abi.encodePacked(exampleString, suffix));
        // Plus la chaîne devient longue, plus le coût augmente
    }

    // Lecture d'une chaîne de caractères
    function getStringLength() public view returns (uint256) {
        return bytes(exampleString).length; // Lire la longueur de la chaîne
    }

    // Boucle sur les bytes d'une chaîne
    function iterateOverString() public view returns (uint256 sum) {
        bytes memory strBytes = bytes(exampleString);
        for (uint256 i = 0; i < strBytes.length; i++) {
            sum += uint256(uint8(strBytes[i])); // Sommation des codes ASCII
        }
    }
}
