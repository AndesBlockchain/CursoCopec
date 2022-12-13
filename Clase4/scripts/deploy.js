
const {ethers, upgrades} = require("hardhat");

async function main() {
  const Counter = await ethers.getContractFactory("Counter");
  const counter = await upgrades.deployProxy(Counter,[1]);
  await counter.deployed();
  console.log("Deployed Address:", counter.address);
}

main();
