// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract Turing is ERC721 {
    string private baseURI;
    address private owner;
    using Address for address;
    using Strings for uint256;
    constructor() ERC721("Turing","TUR") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can change base uri");
        _;
    }
    function setBaseURI(string memory URI) public onlyOwner{
        baseURI = URI;
    }
    function _baseURI() internal view override returns(string memory) {
        return baseURI;
    }
    function _requireMinted(uint256 tokenId) internal view virtual {
        require(_exists(tokenId), "ERC721: invalid token ID");
    }

    function tokenURI(uint256 tokenId) public view override returns(string memory) {
        _requireMinted(tokenId);
        return string(abi.encodePacked(baseURI, tokenId.toString(),".json"));
    }
    
}
