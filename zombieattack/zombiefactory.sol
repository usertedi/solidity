// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ZombieFactory {
    uint256 public constant DNA_DIGITS = 16;
    uint256 private constant DNA_MODULUS = 10 ** DNA_DIGITS;
    uint cooldownTime = 1 days;

    struct Zombie {
        string name;
        uint256 dna;
        uint32 level;
        uint32 readyTime;
        uint16 winCount;
        uint16 lossCount;
    }

    Zombie[] public zombies;

    event NewZombie(uint256 indexed zombieId, string name, uint256 dna);

    function createRandomZombie(string memory _name) public {
        uint256 randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

    function _createZombie(string memory _name, uint256 _dna) private {
        zombies.push(Zombie(_name, _dna, 1, uint32(block.timestamp + cooldownTime), 0, 0));
        uint256 id = zombies.length - 1;
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private pure returns (uint256) {
        uint256 rand = uint256(keccak256(abi.encodePacked(_str)));
        return rand % DNA_MODULUS;
    }

    // My twist: how many zombies exist
    function getZombieCount() public view returns (uint256) {
        return zombies.length;
    }
}