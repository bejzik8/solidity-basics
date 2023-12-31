// SPDX-License-Identifier: MIT

// pragma solidity ^0.8.7;
// pragma solidity >=0.8.7 <0.9.0;
pragma solidity 0.8.8;

contract SimpleStorage {
    // boolean, uint, int, address, bytes, string

    // bool hasFavoriteNumber = true; // boolean
    // uint256 favoriteNumber = 5; // unsigned integer; uint128, uint64, uint32...
    // string favoriteNumberInText = 'five'; // string
    // int256 favoriteInt = -5; // integer; uint128, uint64, int32...
    // address myAddress = 0xb492873D940dAc02B5021dFF82282d8374509582; // address
    // bytes32 favoriteBytes = 'cat'; // 0x12412412fsafas; bytes2, bytes4, bytes8...

    // This gets initialized to zero if no value assigned!
    uint256 favoriteNumber; // 0 index

    // TYPE of the variable, VISIBILITY of the variable, NAME of the variable
    uint256 public brothersFavoriteNumber; // 1 index

    // People public person1 = People({ favoriteNumber: 8, name: 'Mirko' });
    // People public person2 = People({ favoriteNumber: 3, name: 'Nikola' });
    // People public person3 = People({ favoriteNumber: 5, name: 'Ivana' });
    // People public person4 = People({ favoriteNumber: 7, name: 'Teodora' });

    // max. 3 uint in the array
    // uint256[3] public favoriteNumbersList;
    People[] public people;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        // uint256 testVar = 5;

        // costs the gas if called from other method
        // retrieve();
    }

    // testVar is not scoped to "something" function
    // function something() public {
    //     testVar = 6; // ???
    // }

    // view, pure - gasless; disallow modification of the state
    function retrieveFavoriteNumber() public view returns(uint256) {
        return favoriteNumber;
    }

    // function add() public pure returns(uint256) {
    //     return(1 + 1);
    // }

    // parameter can't be stored in: stack, code, logs & storage
    // parameter can be stored in: calldata & memory

    // calldata - temporary variable that can't be modified
    // memory - temporary variable that can be modified
    // storage - permanent variable that can be modified

    // string - array of bytes, must be stored somewhere
    function addPerson(uint256 _favoriteNumber, string memory _name) public {
        // People memory newPerson = People({ favoriteNumber: _favoriteNumber, name: _name });
        // people.push(newPerson);

        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

// 0xd9145CCE52D386f254917e481eB44e9943F39138
