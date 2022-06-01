// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./prop_test.sol";

contract BallotFactory is Ballot {
    
    Ballot[] public ballotArray;

    function createBallotContract() public {
        Ballot ballot = new Ballot();
        ballotArray.push(ballot);    
    }

    // function bfGetBallotsLenght() public view returns (uint){
    //     return Ballot[].length
    // }

    function bfCreateBallot(uint256 _ballotIndex, string[] memory proposalNames) public {
        Ballot(address(ballotArray[_ballotIndex])).createBallot(proposalNames);
    }

    function bfGiveRightToVote(uint256 _ballotIndex, address _voter) public {
        Ballot(address(ballotArray[_ballotIndex])).giveRightToVote(_voter);
    }

    function bfVote(uint256 _ballotIndex, uint _proposal) public {
        Ballot(address(ballotArray[_ballotIndex])).vote(_proposal);
    }

    function bfWinningProposal(uint256 _ballotIndex) public view returns (uint winningProposal) {
        return Ballot(address(ballotArray[_ballotIndex])).winningProposal();
    }

    function bfWinningName(uint256 _ballotIndex) public view returns (string memory winnerName) {
        return Ballot(address(ballotArray[_ballotIndex])).winnerName();
    }

    function bfGetCreatorBallot(uint256 _ballotIndex) public view returns (address) {
        return Ballot(address(ballotArray[_ballotIndex])).getCreatorBallot();
    }

    function bfSetStatus(uint256 _ballotIndex, uint _status) public{
        Ballot(address(ballotArray[_ballotIndex])).setStatus(_status);
    }

    function bfGetStatus(uint256 _ballotIndex) public view returns(uint) {
        return Ballot(address(ballotArray[_ballotIndex])).getStatus();
    }

    function bfGetNumOfProposals(uint256 _ballotIndex) public view returns(uint){
        return Ballot(address(ballotArray[_ballotIndex])).getnumOfProposals();
    }

    function bfGetProposalStructure(uint256 _ballotIndex, uint _proposalId) public view returns(Proposal memory){
        return Ballot(address(ballotArray[_ballotIndex])).getProposalStructure(_proposalId);
    }

    function bfGetProposals(uint256 _ballotIndex) public view returns(Proposal[] memory){
        return Ballot(address(ballotArray[_ballotIndex])).getProposals();
    }

    function getStartDate(uint256 _ballotIndex) public view returns(uint){
        return Ballot(address(ballotArray[_ballotIndex])).getStartDate();
    }

    function setEndDate(uint256 _ballotIndex) public{
        Ballot(address(ballotArray[_ballotIndex])).setEndDate();
    }
    
    function getEndDate(uint256 _ballotIndex) public view returns(uint){
        return Ballot(address(ballotArray[_ballotIndex])).getEndDate();
    }
}