// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract BlockGameToken is ERC721, Ownable {
    using Counters for Counters.Counter;

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(string => uint8) hashes;

    string public Name;
    string public URI;
    string public Description;

    constructor() ERC721 ("BlockGameToken", "BGT") {}

    function setName(string memory _BlockGameToken) public {
    Name = _BlockGameToken;
  }

  function setURI(string memory _URI) public {
    URI = _URI;
  }

  function setDescription(string memory _Description) public {
    Description = _Description;
  }

   function awardItem(address recipient, string memory hash)
  public
  returns (uint256)

{

  require(hashes[hash] != 1);

  hashes[hash] = 1;

  _tokenIds.increment();

  uint256 newItemId = _tokenIds.current();

  _mint(recipient, newItemId);

  return newItemId;
}
}