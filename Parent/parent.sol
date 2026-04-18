// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleVoting {
    address public owner;
    uint public yesCount;
    mapping(address => bool) public hasVoted;

    constructor() {
        owner = msg.sender;
    }

    function voteYes() public {
        require(!hasVoted[msg.sender], "You have already voted");
        hasVoted[msg.sender] = true;
        yesCount += 1;
    }

    function resetVoting() public {
        require(msg.sender == owner, "Only owner can reset voting");
        yesCount = 0;
    }
}