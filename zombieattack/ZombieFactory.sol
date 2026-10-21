// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ZombieFactory {
    event NewZombie(uint256 zombieId, string name, uint256 dna);

    uint256 internal dnaDigits = 16;
    uint256 internal dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint256 dna;
    }

    Zombie[] public zombies;

    // zombie id => owner address
    mapping(uint256 => address) public zombieToOwner;
    // owner address => number of zombies owned
    mapping(address => uint256) public ownerZombieCount;

    // internal: callable here and in contracts that inherit from this one
    function _createZombie(string memory _name, uint256 _dna) internal {
        zombies.push(Zombie(_name, _dna));
        uint256 id = zombies.length - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint256) {
        uint256 rand = uint256(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        // Each address may only create one free zombie
        require(ownerZombieCount[msg.sender] == 0, "You already have a zombie");
        uint256 randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
