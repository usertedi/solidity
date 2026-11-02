// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./zombieattack.sol";
import "./erc721.sol";
contract ZombieOwnership is ZombieAttack, ERC721 {

  function balanceOf(address _owner) external override view returns (uint256) {
    return ownerZombieCount[_owner];
  }

  function ownerOf(uint256 _tokenId) external override view returns (address) {
    return zombieToOwner[_tokenId];
  }

  function transferFrom(address _from, address _to, uint256 _tokenId) external override payable {

  }

  function approve(address _approved, uint256 _tokenId) external override payable {

  }


}
