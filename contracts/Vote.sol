// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Vote {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    Candidate[] private candidates;
    mapping(address => uint256) public lastVoteTime;

    event Voted(address indexed voter, uint256 candidateIndex);

    constructor() {
        candidates.push(Candidate("Leon Blum", 0));
        candidates.push(Candidate("Jacques Chirac", 0));
        candidates.push(Candidate("Francois Mitterrand", 0));
    }

    function getCandidatesCount() external view returns (uint256) {
        return candidates.length;
    }

    function getCandidate(uint256 index) external view returns (string memory, uint256) {
        require(index < candidates.length, "Candidat invalide");
        Candidate memory c = candidates[index];
        return (c.name, c.voteCount);
    }

    function getTimeUntilNextVote(address voter) external view returns (uint256) {
        uint256 nextVoteTime = lastVoteTime[voter] + 3 minutes;

        if (block.timestamp >= nextVoteTime) {
            return 0;
        }

        return nextVoteTime - block.timestamp;
    }

    function vote(uint256 candidateIndex) external {
        require(candidateIndex < candidates.length, "Candidat invalide");
        require(
            block.timestamp >= lastVoteTime[msg.sender] + 3 minutes,
            "Attendez 3 minutes avant de revoter"
        );

        candidates[candidateIndex].voteCount += 1;
        lastVoteTime[msg.sender] = block.timestamp;

        emit Voted(msg.sender, candidateIndex);
    }
}