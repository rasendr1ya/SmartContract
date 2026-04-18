# Blockchain Technology - Smart Contract

Solidity smart contracts for a simple voting system, written for the Blockchain Technology class assignment.

## Overview

Simple voting contract. Voters can vote yes or no (one vote per address). The owner can open, close, or reset the voting. Emits events on votes and status changes.

## Quickstart

1. Go to [Remix IDE](https://remix.ethereum.org)
2. Create a new file `SimpleVoting.sol` and paste the contract code
3. Go to the **Solidity Compiler** tab, select version `0.8.20`, and compile
4. Go to the **Deploy & Run** tab, select the environment (e.g., Remix VM), and click **Deploy**
5. Interact with the contract using the deployed instance panel below

## Test Cases

| # | Test Case | Expected Result |
|---|-----------|----------------|
| 1 | Owner deploys and votes yes | `yesCount` becomes 1, `hasVoted[owner]` is true |
| 2 | Owner votes no | `noCount` becomes 1 |
| 3 | Non-owner votes yes | `yesCount` increments |
| 4 | Same address votes twice | Transaction reverts with "You have already voted" |
| 5 | Owner closes voting | `votingOpen` becomes false |
| 6 | Voting after closed | Transaction reverts with "Voting is closed" |
| 7 | Owner reopens voting | `votingOpen` becomes true |
| 8 | Already open, owner opens again | Transaction reverts with "Voting is already open" |
| 9 | Owner resets voting | `yesCount` and `noCount` become 0 |
| 10 | Non-owner tries to close voting | Transaction reverts with "Only owner can call this" |
| 11 | Non-owner tries to reset voting | Transaction reverts with "Only owner can call this" |
| 12 | `getTotalVotes()` after mixed votes | Returns `yesCount + noCount` |
