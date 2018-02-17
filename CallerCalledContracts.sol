pragma solidity ^0.4.20;

contract CallerContract {
    
    //Need the contract address to call a contract that is already on the blockchain
    //Otherwise use new to create a new instance of the contract
    CalledContract toBeCalled = CalledContract(0xad8742d9b48be31f69ccea55b183c2ee7d4d8058);
    
    function returnNumber() constant returns (uint) {
        return toBeCalled.getNumber();
    }
    
    function returnWords() constant returns (bytes32) {
        return toBeCalled.getWords();
    }
}

contract CalledContract {
    uint number = 42;
    bytes32 words = "Hello World";
    
    function getNumber() constant returns (uint) {
        return number;
    }
    
    function getWords () constant returns (bytes32) {
        return words;
    }
}