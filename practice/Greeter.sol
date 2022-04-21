pragma solidity >=0.7.0 <0.9.0;

contract Greeter {
    string public greeting;

    function Greeter() public {
        greeting = "Hello";
    }

    function setGreeting(string _greeting) public {
        greeting = _greeting;
    }

    function greet() view public returns (string) {
        return greeting;
    }

}