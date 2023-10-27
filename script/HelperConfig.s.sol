// SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/mock/MockAggregator.sol";

contract HelperConfig is Script {
    NetworkConfig public activeNetworkConfig;

    uint8 constant DECIMALS = 8;
    int256 constant INITIAL_PRICE = 2000e8;

    struct NetworkConfig {
        address priceFee;
    }

    constructor() {
        if (block.chainid == 1115111) {
            activeNetworkConfig = getSepoliaEthConfig();
        } else {
            activeNetworkConfig = getAnvilOrCreateEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory configs) {
        configs = NetworkConfig({priceFee: 0x694AA1769357215DE4FAC081bf1f309aDC325306});
    }

    function getAnvilOrCreateEthConfig() public returns (NetworkConfig memory) {
        if (activeNetworkConfig.priceFee != address(0)) {
            return activeNetworkConfig;
        }
        vm.startBroadcast();

        MockV3Aggregator mockAggregator = new MockV3Aggregator(
            DECIMALS,
            INITIAL_PRICE
        );
        vm.stopBroadcast();

        NetworkConfig memory configs = NetworkConfig({priceFee: address(mockAggregator)});

        return configs;
    }
}
