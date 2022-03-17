async function main() {
  const MeffyCoin = await ethers.getContractFactory("MeffyCoin");

  // Start deployment, returning a promise that resolves to a contract object
  const meffyCoin = await MeffyCoin.deploy();   
  console.log("Contract deployed to address:", meffyCoin.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });