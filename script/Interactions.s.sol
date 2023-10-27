// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 1 ether;

    function fundFundMe(address mostRecentDeployedContract) public {
        vm.startBroadcast();

        FundMe(payable(mostRecentDeployedContract)).fund{value: SEND_VALUE}();

        vm.stopBroadcast();
    }

    function run() public {
        address mostRecentDeployedContract = DevOpsTools
            .get_most_recent_deployment("FundMe", block.chainid);

        fundFundMe(mostRecentDeployedContract);
    }
}

contract WithdrawFundMe is Script {
    function withdrawFundMe(address mostRecentDeployedContract) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeployedContract)).withdraw();
        vm.stopBroadcast();
    }

    function run() public {
        address mostRecentDeployedContract = DevOpsTools
            .get_most_recent_deployment("FundMe", block.chainid);
        withdrawFundMe(mostRecentDeployedContract);
    }
}
