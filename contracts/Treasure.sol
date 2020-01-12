/*
 * Copyright (C) 2020 Chair of Applied Cryptography, TU Darmstadt, Germany. All
 * rights reserved. This file is part of the Cryptocurrencies WS 19/20 lecture
 * bonus exercise. It is distributed under the AGPL v3 license, see file LICENSE.
 */

pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts/access/roles/WhitelistedRole.sol";

contract Treasure is
    ERC20,
    ERC20Detailed("TUDa CAC Bonus Token", "CAC", 18),
    WhitelistedRole
{
    // The number of successful treasure claims.
    uint public claimed = 0;

    // Map of recorded hunters. Hunter addresses are mapped to their rank.
    mapping(address => uint) public rank;

    // Reward for the first successful hunter. Will be halved after every
    // successful claim.
    uint constant public initialReward = 1024 ether;

    // Event emitted when CAC token have successfully been claimed.
    event TreasureClaimed(address hunter, uint rank, uint reward);

    // Can be called by hunters to try to claim their reward. The key is
    // compared with the value returned by `insecureRandomness`.
    function claimTreasure(bytes32 key) external onlyWhitelisted {
        require(key == insecureRandomness(msg.sender), "wrong key");
        require(rank[msg.sender] == 0, "treasure already claimed");

        uint reward = initialReward >> claimed;
        claimed++;
        rank[msg.sender] = claimed;
        _mint(msg.sender, reward);

        emit TreasureClaimed(msg.sender, claimed, reward);
    }

    // insecureRandomness returns a not-so-secure randomness.
    function insecureRandomness(address hunter) internal view returns (bytes32) {
        return keccak256(abi.encode(hunter, now));
    }
}
