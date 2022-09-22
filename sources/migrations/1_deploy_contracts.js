const Swan = artifacts.require("./ERC20/Swan.sol");
const Turing = artifacts.require("./ERC20/Turing.sol");
module.exports = function(deployer) {
    // deployer.deploy(Swan);
    // Additional contracts can be deployed here
    deployer.deploy(Turing);
};