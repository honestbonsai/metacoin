const ConvertLib = artifacts.require("ConvertLib");
const MetaCoin = artifacts.require("MetaCoin");
const MetaCoin2 = artifacts.require("MetaCoin2");
const MetaCoin3 = artifacts.require("MetaCoin3");
const MetaCoin4 = artifacts.require("MetaCoin4");
const MetaCoin5 = artifacts.require("MetaCoin5");
const SimpleStorage = artifacts.require("SimpleStorage");
const Crowdfunding = artifacts.require("Crowdfunding");

const contracts = [
  MetaCoin, 
  MetaCoin2, 
  MetaCoin3, 
  MetaCoin4, 
  MetaCoin5, 
  SimpleStorage,
  Crowdfunding
];

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);

  contracts.forEach(contract => {
    deployer.link(ConvertLib, contract);
    deployer.deploy(contract);
  });
};
