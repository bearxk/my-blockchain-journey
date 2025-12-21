// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
//struct: 结构体  一个结构体可以有多个属性，每个属性都可以是不同的数据结构，或者基础数据类型
//array: 数组  数组适用于存储相同数据类型的变量
//mapping: 映射     适用于存储键值
contract HelloWorld{
    bool boolVar_1 = true;
    bool boolVar_2 = false;

    uint256 uintVar = 2566666;

    int intVar = -1;
    bytes32 bytesVar = "Hello World";//bytes为规定大小
    string strVar = "Hello World";//string自动限制大小

    address addrVar = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    /*
    1.storage  永久性存储 声明变量时默认为storage
    2.memory   暂时性存储 运行时可以对数据状态修改
    3.calldata 暂时性存储 运行时不可以对数据状态修改
    */
    struct Info{
        string phrase;
        uint256 id;
        address addr;
    }
    Info[] infos;
    mapping(uint256 id => Info info) infoMapping;
    function sayHello(uint256 _id) public view returns (string memory){
        if(infoMapping[_id].addr == address(0x0)){
            return addinfo(strVar);
        }else{
            return addinfo(infoMapping[_id].phrase);
        }
        /*
        for(uint256 i = 0; i < infos.length; i++){
            if(infos[i].id == _id){
                return addinfo(infos[i].phrase);
            }
        }
        return addinfo(strVar);
        */
    }
    function setHello(string memory newStrVar,uint256 _id)public{
        //strVar = newStrVar;
        Info memory info = Info(newStrVar,_id,msg.sender);
        infoMapping[_id] = info;
        //infos.push(info);
    }
    function addinfo(string memory helloworld)internal pure returns(string memory){
        return string.concat(helloworld," from Bear_xk contract");
    }

}