// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "openzeppelin-solidity/contracts/token/ERC1155/ERC1155.sol";
import "openzeppelin-solidity/contracts/utils/Strings.sol";

contract Mixer is ERC1155 {
    using Strings for string;

    uint256 public constant Flower = 1;
    uint256 public constant Leaf = 2;
    uint256 public constant Crystal = 3;
    uint256 public constant Water = 4;

    address private owner;

    constructor() ERC1155("https://raw.githubusercontent.com/pxbao-itus/erc-token/main/assets/ERC1155/metadata/"){
        owner = msg.sender;
        _mint(owner, Flower, 10, "");
        _mint(owner, Leaf, 10, "");
        _mint(owner, Crystal, 10, "");
        _mint(owner, Water, 10, "");
    }

     modifier onlyOwner(){
        require(msg.sender == owner, "ERC1155: only owner can change token uri");
        _;
    }

    function getTokenURI(uint256 tokenId) public view returns(string memory) {
       return string(abi.encodePacked(uri(tokenId), Strings.toString(tokenId),".json"));
    }

    function getContractOwner() public view returns(address) {
        return owner;
    }

        function setTokenURI(string memory uri) public  onlyOwner{
        _setURI(uri);
    }

    function createAndMintNewToken(uint256 tokenId, uint amount) public onlyOwner{
        _mint(owner, tokenId, amount, "");
    }
    
}   