// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./ZombieFeeding.sol";

contract ZombieHelper is ZombieFeeding {

  modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _; // Start here
  }

}
