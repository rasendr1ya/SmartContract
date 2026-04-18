// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleVoting {
    address public owner;
    uint public yesCount;
    uint public noCount;
    bool public votingOpen;
    mapping(address => bool) public hasVoted;

    event Voted(address indexed voter, bool support);
    event VotingStatusChanged(bool isOpen);

    constructor() {
        owner = msg.sender;
        votingOpen = true;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    modifier votingIsOpen() {
        require(votingOpen, "Voting is closed");
        _;
    }

    function voteYes() public votingIsOpen {
        require(!hasVoted[msg.sender], "You have already voted");
        hasVoted[msg.sender] = true;
        yesCount += 1;
        emit Voted(msg.sender, true);
    }

    function voteNo() public votingIsOpen {
        require(!hasVoted[msg.sender], "You have already voted");
        hasVoted[msg.sender] = true;
        noCount += 1;
        emit Voted(msg.sender, false);
    }

    function getTotalVotes() public view returns (uint) {
        return yesCount + noCount;
    }

    function openVoting() public onlyOwner {
        require(!votingOpen, "Voting is already open");
        votingOpen = true;
        emit VotingStatusChanged(true);
    }

    function closeVoting() public onlyOwner {
        require(votingOpen, "Voting is already closed");
        votingOpen = false;
        emit VotingStatusChanged(false);
    }

    function resetVoting() public onlyOwner {
        yesCount = 0;
        noCount = 0;
    }
}