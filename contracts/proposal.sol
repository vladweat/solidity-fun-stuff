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
        // Option[] options;
        // mapping (uint => Voter) voters;
        // mapping (uint => proposalOption) options;
    }
    // Option[] options;


    mapping (uint => Proposal) public proposals;
    // event savingEvent(uint indexed _proposalId);
    uint public proposalCount;

    constructor() public {
        proposalCount = 0;
        addProposal(1, 1, 0xB5dea2661dfa4b8f0aaE8Bc1F583369D927c3b06, 3, "op1-op2-op3");
    }

    struct TestStructure{
        uint id;
        Option[] optionArray;
    }

    struct Option{
        string name;
    }

    


    // add Proposal
    function addProposal(uint _proposalId, uint _proposalStatus, address _proposalCreator, uint _proposalNumOfOptions, string memory _proposalOptionsString) public {
        proposals[proposalCount] = Proposal(_proposalId, _proposalStatus, _proposalCreator, _proposalNumOfOptions, _proposalOptionsString);
        proposalCount++;
    }

    // get ? sections
    // return a single structure
    function getProposalStructure(uint _proposalId) public view returns(Proposal memory){
        return proposals[_proposalId];
    }
}
