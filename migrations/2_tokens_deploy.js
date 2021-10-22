// const ERC1155Example = artifacts.require("ERC1155Example");
const HolderExample = artifacts.require("HolderExample");
const PausableExample = artifacts.require("PausableExample");

module.exports = function (deployer, network, accounts) {
  // deployer.deploy(ERC1155Example);
  
  deployer.deploy(HolderExample);

  deployer.deploy(PausableExample);
};
