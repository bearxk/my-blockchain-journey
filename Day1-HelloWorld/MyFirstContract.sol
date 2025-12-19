// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract HelloWorld{
    string message = "HelloWorld";
    constructor(){

    }
    function setMessage(string memory _message) public {
    message = _message;
}
    function gerMessage()public view returns (string memory){
        return message;
    }
}
