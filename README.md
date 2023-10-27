## Documentation

https://book.getfoundry.sh/

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
