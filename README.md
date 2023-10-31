# Foundry FundMe Contract

## Deployed Contract

<a href="https://sepolia.etherscan.io/address/0x30972cfa0ad95f5e693a0957765512353f261dc9#code" target="_blank">0x30972cfa0ad95f5e693a0957765512353f261dc9</a>

# Getting Started

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

## Quickstart

```
git clone https://github.com/Cyfrin/foundry-fund-me-f23
cd foundry-fund-me-f23
forge build
```

# Usage

## Scripts

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

# NOTES

# Test

## Run test on temporary anvil Node

- Runs all test files in test directory

```shell
forge test
```

- Run single test file

```shell
forge test <path_to_test_file>
```

- Run single test from a test file

```shell
forge test --match-test <test_function_name>
```

- Run test on forked node

```shell
forge test <path_to_test_file> --fork-url <RPC_URL>
```

# Acknowledgments

This project is part of **Blockchain Developer, Smart Contract, & Solidity Course - Powered By AI - Beginner to Expert Course | Foundry Edition 2023 |**.

Thank you Patrick Collins for your awesome course.
