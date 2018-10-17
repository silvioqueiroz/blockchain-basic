pragma solidity ^0.4.24;

contract MessageContract{
    
    string public message;
    
    constructor (string initialMessage) public{
        message = initialMessage;
    }
    
    function getMessage() public view returns (string){
        return message;
    }
    
    function setMessage(string newMessage) public{
        message = newMessage;
    }
}
