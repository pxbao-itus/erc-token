// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract Turing is ERC721 {
    constructor() ERC721("Turing","TUR") {
        
    }
}
