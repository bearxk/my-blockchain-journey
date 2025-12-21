// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { HelloWorld } from "./test.sol";
// 1. 直接引入统一一个文件系统下的合约
// 2. 引入GitHub上的合约
// 3. 通过包引入 例如第三方，其他公司所写的合约
contract HelloWorldFactory{
    HelloWorld hw;

    HelloWorld[] hws;

    function createHelloWorld()public{
        hw = new HelloWorld();
        hws.push(hw);
    }

    function getHelloWorldByIndex(uint256 _index) public view returns(HelloWorld){
        return hws[_index];
    }
    function callSayHelloFromFactory(uint256 _index,uint256 _id) public view returns(string memory){
        return hws[_index].sayHello(_id);
    }
    function callSetHelloWorldFromFactory(uint256 _index,string memory newStrVar,uint256 _id)public{
        hws[_index].setHello(newStrVar, _id);
    }
}