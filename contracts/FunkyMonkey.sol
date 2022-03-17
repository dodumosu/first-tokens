// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.5;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract FunkyMonkey is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private tokenIds;
    string internal baseURI;

    constructor() ERC721("FunkyMonkey", "FMN") {
        baseURI = "ipfs://";
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function mintNFT(address receiver, string memory tokenURI) public onlyOwner {
        tokenIds.increment();
        uint256 id = tokenIds.current();
        _safeMint(receiver, id);
        _setTokenURI(id, tokenURI);
    }
}
