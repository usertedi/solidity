// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./zombieattack.sol";
import "./erc721.sol";
contract ZombieOwnership is ZombieAttack, ERC721 {
     function balanceOf(address _owner) external view returns (uint256 _balance) {
    return ownerZombieCount[_owner];// 1. Return the number of zombies `_owner` has here
  }

  function ownerOf(uint256 _tokenId) external view returns (address) {
    return zombieToOwner[_tokenId];// 2. Return the owner of `_tokenId` here
  }

  function transferFrom(address _from, address _to, uint256) external payable {

  }

  function approve(address _approved, uint256 _tokenId) external payable {

  }
    

}