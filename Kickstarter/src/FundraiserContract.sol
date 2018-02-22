pragma solidity ^0.4.0;

contract EthKickstarterContract {
    address client;

    uint fundraisingGoal;

    //Start the contract with a goal
    function EthKickstarterContract(uint goal){
        client = msg.sender;
        fundraisingGoal = goal;
    }

    function getFundraisingGoal() returns (uint){
        return fundraisingGoal;
    }

    modifier ifClient() {
        require(msg.sender != client);
        _;
    }

    modifier goalMet() {
        require(this.balance >= fundraisingGoal);
        _;
    }

    function retrieveFunds() ifClient goalMet {
        UpdateStatus('Goal has been met, creator is retrieving.');
        confirmation = client.send(amount);
    }

    // modifier for verifiying fundraising goal has been met

    function donate() payable {
        UserStatus('Someone has donated some funds', msg.sender, msg.value);
    }
}
