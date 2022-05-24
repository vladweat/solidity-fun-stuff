// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;
pragma solidity ^0.8.0;

contract StructArrayInitWrong {
    // все работает, не трогай сука
    // если создать Proposal с пустым proposaOptions, то потом, во вьюхах 
    // можно вызывать createOptions - которая дополняет proposaOptions
    // ограничением будет выступать proposal.num_of_options из базы proposal (sqlite)
    // 
    // этим кодом можно дополнить основной contract Proposal
    struct Option {
        uint id;
        // address[] players;
        string[] name;      
    }  
    Option[] options;
    string[] nms;
    address[] adr; // <=== if we're going to store this, then let's store this.
    uint public optionCount;

    function createOptions(string memory _option) public {
                                        // <=== note gaping hole
        // adr.push(msg.sender);
        nms.push(_option);

        // Room memory room = Room(roomCount, room_nms);
        Option memory option = Option(optionCount, nms);    
        options.push(option);
        optionCount++;
    }

    // 
    // function createOptions(string memory _option, uint _num) public {
    //                                     // <=== note gaping hole
    //     // adr.push(msg.sender);
    //     nms.push(_option);

    //     // Room memory room = Room(roomCount, room_nms);
    //     Option memory option = Option(optionCount, nms, _num);    
    //     options.push(option);
    //     optionCount++;
    // }

    function getOptionStructure(uint _optionid) public view returns(Option memory){
        return options[_optionid];
    }

    function getResultOptions(uint _num) public view returns(Option memory){
        return options[_num];
    }
    

    // function getRoomsLength() public view returns (uint) {
    //     return rooms.length;
    // }

    // function getRoomStructure(uint _roomid) public view returns(Room memory){
    //     return rooms[_roomid];
    // }
}