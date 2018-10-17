pragma solidity ^0.4.24;

contract Ownable{
    
    address owner;
    int256 qtdChangeOwner;
    bool lock;
    
    event ChangeLock(address _address, bool _lock);
    
    constructor () public {
        owner = msg.sender;
        lock = false;
    }
    
    modifier onlyOwner(){
        require(msg.sender == owner, 'Only Owner');
        _;
    }
    
    modifier onlyUnlock(){
        require(!lock, 'Contract locked');
        _;
    }
    
    function changeOwner(address newOwner) public onlyOwner onlyUnlock {
        owner = newOwner;
        qtdChangeOwner = qtdChangeOwner +1;
    }
    
    function setLock(bool newLock) public onlyOwner {
        lock = newLock;
        emit ChangeLock(msg.sender, lock);
    }
}