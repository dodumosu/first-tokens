async function main() {
  const MeffyCoin = await ethers.getContractFactory("MeffyCoin");
  const FunkyMonkey = await ethers.getContractFactory("FunkyMonkey");

  // Start deployment, returning a promise that resolves to a contract object
  const meffyCoin = await MeffyCoin.deploy();
  const funkyMonkey = await FunkyMonkey.deploy();
  console.log("MeffyCoin deployed to address:", meffyCoin.address);
  console.log("FunkyMonkey deployed to address:", funkyMonkey.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });