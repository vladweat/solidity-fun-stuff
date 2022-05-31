// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;
pragma solidity ^0.8.0;
//0xB5dea2661dfa4b8f0aaE8Bc1F583369D927c3b06

contract TestProposal {
    
    struct Proposal{
        uint proposalId;
        uint proposalStatus;
        address proposalCreator;
        uint proposalNumOfOptions;
        string proposalOptionsString;
        
    }
    
    // A dynamically-sized array of `Proposal` structs.
    Proposal[] public proposals;

    struct Voter{
        bool votes;
        address voterAddress;
        uint vote;
    }
    // This declares a state variable that
    // stores a `Voter` struct for each possible address.
    mapping(address => Voter) public voters;



    mapping (uint => Proposal) public proposals;
    // event savingEvent(uint indexed _proposalId);
    uint public proposalCount;

    for (uint i = 0; i < proposalNames.length; i++) {
            // `Proposal({...})` creates a temporary
            // Proposal object and `proposals.push(...)`
            // appends it to the end of `proposals`.
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }


    // add Proposal
    function createProposal(uint _proposalId, uint _proposalStatus, address _proposalCreator, uint _proposalNumOfOptions, string memory _proposalOptionsString) public {
        proposals[proposalCount] = Proposal(_proposalId, _proposalStatus, _proposalCreator, _proposalNumOfOptions, _proposalOptionsString);
        proposalCount++;
    }

    // get ? sections


    // return a single structure
    function getProposalStructure(uint _proposalId) public view returns(Proposal memory){
        return proposals[_proposalId];
    }
}
