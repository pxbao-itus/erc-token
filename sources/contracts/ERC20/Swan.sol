// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
contract Swan is ERC20 {
    address payable owner;
    constructor() ERC20 ("Swan", "SWN") {
        _mint(msg.sender, 1000000);
        owner = payable(msg.sender);
        
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "ERC20: only owner can mint tokens");
        _;
       
    }

    function mintMore(uint amount) public onlyOwner{
        _mint(msg.sender, amount);
    }
    function getTokensByEth() public payable {
        owner.transfer(msg.value);
        _transfer(owner, msg.sender, (msg.value /1 ether)*10);
    }

    function burnTokens(uint amount) public returns(bool) {
        _burn(msg.sender, amount);
        return true;
    }

    function getTokens(uint amount) public {
        _transfer(owner, msg.sender, amount);
    }
}