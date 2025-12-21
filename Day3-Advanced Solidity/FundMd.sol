// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

// 1. 创建一个收款函数 payable 收款关键字
// 2. 记录投资人并且查看 需要投资人的地址以及他的投资金额
// 3. 在锁定期内，达到目标值，生产商可以提款
// 4. 在锁定期内，没有达到目标值，投资人在锁定期以后退款

contract FundMe{
    AggregatorV3Interface internal dataFeed;
    mapping(address => uint256) public funderasToAmount;//创建投资人地址以及金额
    uint256 MINIMUM_VALUE = 1 * 10 ** 18;//USD
    //最小单位wei 1* 10 ** 18
    constructor(){
        dataFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }
    function fund() external payable {
        require(convertEthToUsd(msg.value) >= MINIMUM_VALUE, "Send more ETH");//最小值为1*10*18，如果小于MINIMUM_VALUE，则返回Send more ETH
        funderasToAmount[msg.sender] = msg.value;//查看投资人地址以及金额
    }
    function getChainlinkDataFeedLatestAnswer() public view returns (int256) {
    // prettier-ignore
    (
      /* uint80 roundId */
      ,
      int256 answer,
      /*uint256 startedAt*/
      ,
      /*uint256 updatedAt*/
      ,
      /*uint80 answeredInRound*/
    ) = dataFeed.latestRoundData();
    return answer;
  }
  function convertEthToUsd(uint256 ethAmount) internal view returns(uint256){
    uint256 ethPrice = uint256(getChainlinkDataFeedLatestAnswer());
    return ethAmount * ethPrice / (10 ** 8);
  }
}
