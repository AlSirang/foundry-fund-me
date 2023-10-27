// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";

// Type of tests

// 1. Unit Test
// - only a part specific part of code

// 2. Integration Test
// - how our code works with other parts of our code

// 3. Forked Test
// - test on simulated real environment

// 4. Staging
// - test in real environment

contract FundMeTest is Test {
    FundMe fundMe;
    address USER = makeAddr("Bob");

    uint256 constant FUND_VALUE = 0.1 ether;
    uint256 constant INITIAL_BALANCE = 10 ether;

    modifier callFund() {
        vm.prank(USER);
        fundMe.fund{value: FUND_VALUE}();

        _;
    }

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();

        vm.deal(USER, INITIAL_BALANCE);
    }

    function testMinimumDollarsIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public {
        assertEq(fundMe.getOwner(), msg.sender);
    }

    function testGetVersion() public {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4);
    }

    function testFundFailWithoutEnoughETH() public {
        vm.expectRevert();
        fundMe.fund(); // send no ETH
    }

    function testFundUpdatesAddressToAmountFunded() public callFund {
        assertEq(fundMe.getAddressToAmountFunded(USER), FUND_VALUE);
    }

    function testFundUpdatesFunders() public callFund {
        assertEq(fundMe.getFunderAddress(0), USER);
    }

    function testWithdrawWithNonOwner() public callFund {
        vm.expectRevert();
        vm.prank(USER);

        fundMe.withdraw();
    }

    function testWithdrawWithOwner() public callFund {
        uint256 balanceBefore = fundMe.getOwner().balance;
        uint256 contractBalanceBefore = address(fundMe).balance;

        vm.prank(fundMe.getOwner());
        fundMe.withdraw();

        uint256 balanceAfter = fundMe.getOwner().balance;

        assertGt(balanceAfter + contractBalanceBefore, balanceBefore);
    }
}
