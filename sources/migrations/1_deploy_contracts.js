const Swan = artifacts.require("./ERC20/Swan.sol");
const Turing = artifacts.require("./ERC721/Turing.sol");
const Mixer = artifacts.require("./ERC1155/Mixer.sol");
module.exports = function(deployer) {
    // deployer.deploy(Swan);
    // Additional contracts can be deployed here
    // deployer.deploy(Turing);
    deployer.deploy(Mixer);
};