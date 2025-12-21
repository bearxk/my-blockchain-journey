// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 最小化测试合约：仅测试 fund() 函数的核心记录逻辑
contract FundMe_CoreTest {
    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;

    // fund函数（移除了预言机依赖）
    function fund() public payable {
        // 关键修改：将基于美元的价格检查，改为简单的ETH数量检查
        // 这让我们能在本地轻松测试
        require(msg.value >= 0.1 ether, "You need to send at least 0.1 ETH!");

        // 以下是教程原有逻辑，测试它们是否工作：
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    // 辅助函数：方便查看合约余额和资助者数量
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
    function getFunderCount() public view returns (uint256) {
        return funders.length;
    }

}
