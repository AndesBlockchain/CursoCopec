// scripts/upgrade-box.js
const { ethers, upgrades } = require("hardhat");

async function main() {
  const CounterV2 = await ethers.getContractFactory("CounterV2");
  const counterv2 = await upgrades.upgradeProxy("0x22FF6dB615f1ED40FF85eb19CA4EaAC1E2B66866", CounterV2);
  console.log("Box upgraded");
}

main();