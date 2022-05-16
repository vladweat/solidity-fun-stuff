// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.0;

contract VoteSaving {
    struct Member{
        uint id;
        string name;
        bool isVoted;
    }

    mapping (uint => Member) public members;
    event savingEvent(uint indexed _memberId);
    uint public memberCount;

    constructor() public {
        memberCount = 0;
        addMember("Vlad", true);
        addMember("Nika", true);
        addMember("Nastya", true);
        addMember("Danya", false);
        addMember("Gosha", false);
        addMember("Anya", false);
        addMember("Lera", true);
        addMember("Vita", true);
    }

    function addMember(string memory _name, bool _isVote) public {
        members[memberCount] = Member(memberCount, _name, _isVote);
        memberCount++;
    }

    // change member[i].isVote state
    function setVote(uint _memberId, bool _isVote) public {
        members[_memberId].isVoted = _isVote;
    }

    // return count of voted or unvoted
    function getCountOfVoted(bool _isVote) public view returns(uint){
        uint votedCount = 0;
        for (uint i = 0; i < memberCount; i++) {
            if (members[i].isVoted == _isVote) {
                votedCount++;
            }
        }
        return votedCount;
    }

    function getVotedMember(bool _isVoted) public view returns(Member[] memory){
        uint resultCount;

        for (uint i = 0; i < memberCount; i++) {
            if (members[i].isVoted == _isVoted) {
                resultCount++;
            }
        }

        Member[] memory result = new Member[](resultCount);
        uint j;
        for (uint i = 0; i < memberCount; i++) {
            if (members[i].isVoted == _isVoted) {
                result[j] = members[i];
                j++;
            }
        }

        return result;
    }  

    // return a single structure
    function getMemberStructure(uint _memberId) public view returns(Member memory){
        return members[_memberId];
    }

    // return the value of a structure
    function getMemberValue() public view returns(uint[] memory, string[] memory, bool[] memory) {
        uint[]      memory id = new uint[](memberCount);
        string[]    memory name = new string[](memberCount);
        bool[]      memory isVoted = new bool[](memberCount);
        for (uint i = 0; i < memberCount; i++) {
            Member storage member = members[i];
            id[i] = member.id;
            name[i] = member.name;
            isVoted[i] = member.isVoted;
        }
        return (id, name, isVoted);
    } 


}