// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;
pragma solidity ^0.8.0;

contract StructArrayInitWrong {

    struct Room {
        uint id;
        address[] players;
        // uint[] room_nums;       
    }  
    Room[] rooms;
    uint[] room_nms;
    address[] adr; // <=== if we're going to store this, then let's store this.
    uint public roomCount;

    function createRoom(uint _room_nums) public {
                                        // <=== note gaping hole
        adr.push(msg.sender);
        // room_nms.push(_room_nums);
        
        // Room memory room = Room(roomCount, room_nms);
        Room memory room = Room(roomCount, adr);    
        rooms.push(room);
        roomCount++;
    }

    // function getRoomsLength() public view returns (uint) {
    //     return rooms.length;
    // }

    function getRoomStructure(uint _roomid) public view returns(Room memory){
        return rooms[_roomid];
    }
}