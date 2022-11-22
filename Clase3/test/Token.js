const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

  describe("Token Contract", function(){
    it("El saldo inicial debe ser de 100",async function(){
        const [owner]=await ethers.getSigners();
        const Token = await ethers.getContractFactory("Token");
        const tokenInstance= await Token.deploy();

        const totalSupply = await tokenInstance.totalSupply();
        expect(totalSupply).to.equal(100);
    })
  })

  describe("Token Contract", function(){
    it("Debo poder transferir 50 tokens y mi saldo debe bajar a 50",async function(){
        const [owner,addr1]=await ethers.getSigners();
        const Token = await ethers.getContractFactory("Token");
        const tokenInstance= await Token.deploy();
        const transfer= await tokenInstance.transfer(addr1.address,50);
        expect(await tokenInstance.balanceOf(owner.address)).to.equal(50);
        expect(await tokenInstance.balanceOf(addr1.address)).to.equal(50);
    })
  })