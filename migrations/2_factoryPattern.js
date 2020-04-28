const FactoryPatternContract = artifacts.require("./FactoryPattern.sol");

module.exports = (deployer) => {
  deployer.deploy(FactoryPatternContract);
};
