var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var Clock = artifacts.require("./Clock.sol");


const DAY = 3600 * 24;

module.exports = function(deployer) 
{
  deployer.deploy(Clock).then(function()
  {
     return deployer.deploy(ConvertLib).then(function()
     {
       deployer.link(ConvertLib, MetaCoin);
       deployer.deploy(MetaCoin, DAY, Clock.address);
     }); 
  });
};

