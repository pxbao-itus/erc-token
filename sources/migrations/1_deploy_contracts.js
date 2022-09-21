const Swan = artifacts.require("./ERC20/Swan.sol");
module.exports = function(deployer) {
    deployer.deploy(Swan);
    // Additional contracts can be deployed here
};