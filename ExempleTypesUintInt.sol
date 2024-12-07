// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract ExempleTypesUintInt {
    /**
     * Les types 🟩 `uint` sont des entiers non signés (uniquement positifs) de différentes tailles.
     * - `uint8` à `uint256` (en incréments de 8 bits).
     * - Taille maximale en bits = 256, ce qui correspond à un entier non signé allant de 0 à 2^256 - 1.
     */

    // 🟩 uint8 : plage de 0 à 2^8-1 (0 à 255)
    uint8 public petitUint = 255;

    // 🟩 uint16 : plage de 0 à 2^16-1 (0 à 65 535)
    uint16 public moyenUint = 65535;

    // 🟩 uint32 : plage de 0 à 2^32-1 (0 à environ 4.29 milliards)
    uint32 public grandUint = 4294967295;

    // 🟩 uint64 : plage de 0 à 2^64-1 (0 à environ 18 quintillions)
    uint64 public tresGrandUint = 18446744073709551615;

    // 🟩 uint128 : plage de 0 à 2^128-1
    uint128 public immenseUint = 340282366920938463463374607431768211455;

    // 🟩 uint256 : plage de 0 à 2^256-1 (type par défaut pour `uint`)
    uint256 public maximumUint = type(uint256).max;

    /**
     * Les types 🟦 `int` sont des entiers signés (positifs ou négatifs) de différentes tailles.
     * - `int8` à `int256` (en incréments de 8 bits).
     * - Taille maximale en bits = 256, ce qui correspond à une plage allant de -2^(n-1) à 2^(n-1)-1.
     */

    // 🟦 int8 : plage de -2^7 à 2^7-1 (-128 à 127)
    int8 public petitInt = -128;

    // 🟦 int16 : plage de -2^15 à 2^15-1 (-32 768 à 32 767)
    int16 public moyenInt = 32767;

    // 🟦 int32 : plage de -2^31 à 2^31-1
    int32 public grandInt = -2147483648;

    // 🟦 int64 : plage de -2^63 à 2^63-1
    int64 public tresGrandInt = 9223372036854775807;

    // 🟦 int128 : plage de -2^127 à 2^127-1
    int128 public immenseInt = -170141183460469231731687303715884105728;

    // 🟦 int256 : plage de -2^255 à 2^255-1 (type par défaut pour `int`)
    int256 public maximumInt = type(int256).max;

    /**
     * @dev Démonstration de l'utilisation des différents types avec des opérations simples.
     */

    /**
     * 🟩
     * @notice Additionner deux entiers non signés.
     * @param a Un nombre de type uint8.
     * @param b Un autre nombre de type uint8.
     * @return La somme des deux nombres.
     */
    function additionUint8(uint8 a, uint8 b) public pure returns (uint8) {
        require(a + b >= a, "Overflow ou Depassement de capacite!");
        return a + b;
    }

    /**
     * 🟩
     * @notice Multiplier deux grands entiers non signés.
     * @param a Un nombre de type uint256.
     * @param b Un autre nombre de type uint256.
     * @return Le produit des deux nombres.
     */
    function multiplicationUint256(
        uint256 a,
        uint256 b
    ) public pure returns (uint256) {
        if (a == 0 || b == 0) return 0;
        uint256 resultat = a * b;
        require(resultat / a == b, "Overflow ou Depassement de capacite!");
        return resultat;
    }
    /**
     * 🟦
     * @notice Additionner deux entiers signés.
     * @param a Un nombre de type int16.
     * @param b Un autre nombre de type int16.
     * @return La somme des deux nombres.
     */
    function additionInt16(int16 a, int16 b) public pure returns (int16) {
        int16 resultat = a + b;
        require(
            (b >= 0 && resultat >= a) || (b < 0 && resultat <= a),
            "Overflow ou Depassement de capacite!"
        );
        return resultat;
    }

    /** 🟦
     * @notice Calculer la valeur absolue d'un entier signé.
     * @param a Un nombre de type int128.
     * @return La valeur absolue du nombre.
     */
    function valeurAbsolueInt128(int128 a) public pure returns (uint128) {
        if (a < 0) {
            return uint128(-a);
        } else {
            return uint128(a);
        }
    }
}
