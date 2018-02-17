pragma solidity ^0.4.20;

contract CustodialContract {
    address client;
    
    bool confirmation = false;
    
    event UpdateStatus(string message);
    event UserStatus(string message, address userAddress, uint amount);
    function CustodialContract() {
        client = msg.sender;
    }
    
    modifier ifClient() {
        if(msg.sender != client) {
            throw;
        }
        _;
    }
    
    function depositFunds() payable {
        UserStatus('User has deposited some funds', msg.sender, msg.value);
    }
    
    function withdrawFunds(uint amount) ifClient{
        UpdateStatus('User has transferred some money');
        confirmation = client.send(amount);
    }
    
    function getBalance() ifClient constant returns (uint) {
        return this.balance;
    }
}