// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ballot {

    address internal chairperson;
    uint internal status;
    uint internal startDate;
    uint internal endDate;
    uint internal numOfProposals;

//1654019749
    struct Voter {
        uint weight; // weight is accumulated by delegation
        bool voted;  // if true, that person already voted
        address delegate; // person delegated to
        uint vote;   // index of the voted proposal
    }

    // This is a type for a single proposal.
    struct Proposal {
        string name;   // short name (up to 32 bytes)
        uint voteCount; // number of accumulated votes
    }

    // This declares a state variable that
    // stores a `Voter` struct for each possible address.
    mapping(address => Voter) public voters;

    // A dynamically-sized array of `Proposal` structs.
    Proposal[] public proposals;

    function createBallot(string[] memory proposalNames) public {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;

        setStartDate();
        numOfProposals = proposalNames.length;

        // For each of the provided proposal names,
        // create a new proposal object and add it
        // to the end of the array.
        for (uint i = 0; i < proposalNames.length; i++) {
            // `Proposal({...})` creates a temporary
            // Proposal object and `proposals.push(...)`
            // appends it to the end of `proposals`.
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    function giveRightToVote(address voter) public {
        // If the argument of `require` evaluates to `false`,
        // it terminates and reverts all changes to
        // the state and to Ether balances. It is often
        // a good idea to use this if functions are
        // called incorrectly. But watch out, this
        // will currently also consume all provided gas
        // (this is planned to change in the future).
        require((msg.sender == chairperson) && !voters[voter].voted && (voters[voter].weight == 0));
        voters[voter].weight = 1;
    }

    // return all proposals
    function vote(uint proposal) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted);
        sender.voted = true;
        sender.vote = proposal;

        // If `proposal` is out of the range of the array,
        // this will throw automatically and revert all
        // changes.
        proposals[proposal].voteCount += sender.weight;
    }

    function winningProposal() public view returns (uint winningProposal){
        uint winningVoteCount = 0;
        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal = p;
            }
        }
    }

    // Calls winningProposal() function to get the index
    // of the winner contained in the proposals array and then
    // returns the name of the winner
    function winnerName() public view returns(string memory winnerName)
    {
        winnerName = proposals[winningProposal()].name;
    }

    // ----------------------------------------------------------------------------------------------------------------//
    // return creator address of ballot
    function getCreatorBallot() public view returns(address){
        return chairperson;
    }

    // return status of proposals
    function setStatus(uint _status) public{
        status = _status;
    }

    // return status of proposals
    function getStatus() public view returns(uint){
        return status;
    }


    // return num of proposals
    function getnumOfProposals() public view returns(uint){
        return numOfProposals;
    }

    // return a single structure
    function getProposalStructure(uint _proposalId) public view returns(Proposal memory){
        return proposals[_proposalId];
    }
    // return all proposals
    function getProposals() public view returns(Proposal[] memory){
        return proposals;
    }

    // set starting date of ballot
    function setStartDate() internal{
        startDate = block.timestamp;
    }
    // get starting date of ballot
    function getStartDate() public view returns(uint){
        return startDate;
    }

    // set ending date of ballot
    function setEndDate() internal{
        endDate = block.timestamp;
    }
    // get ending date of ballot
    function getEndDate() public view returns(uint){
        return endDate;
    }
}