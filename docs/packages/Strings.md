# Strings



**Package:** strings

**Contract type:** Static library

**Source file:** [Strings.sol](../../src/strings/Strings.sol)


**Example usage:** [StringsExamples.sol](../../examples/strings/StringsExamples.sol)


**Tests source file:** [strings_tests.sol](../../test/strings/strings_tests.sol)


**Perf (gas usage) source file:** [strings_perfs.sol](../../perf/strings/strings_perfs.sol)


## description

This library can be used to validate that a solidity string is valid UTF-8.

Solidity strings uses the UTF-8 encoding, as defined in the unicode 10.0 standard: http://www.unicode.org/versions/Unicode10.0.0/, but the only checks that are currently carried out are compile-time checks of string literals. This library makes runtime checks possible.

The idea to add a UTF string validation library came from Arachnid's (Nick Johnson) string-utils: https://github.com/Arachnid/solidity-stringutils

## Functions

- [validate(string memory)](#validatestring-memory)
- [parseRune(uint)](#parseruneuint)

***

### validate(string memory)

`function validate(string memory self) internal pure returns (bool)`

Check that a string is proper UTF-8. No gas benchmark as it is simply an aggregate of the cost of validating each rune (benchmarks for that can be found in the docs for [parseRune(uint)](#parseruneuint).

##### params

- `string memory self`: The string.


##### returns

- `bool`: `true` if the string is valid UTF-8.

##### ensures

- See the library description.

***

### parseRune(uint)

`function parseRune(uint bytepos) internal pure returns (uint len)`

Check that a rune is valid UTF-8. The rune is provided as a pointer to a byte in memory.

##### params

- `uint bytepos`: The memory address where the rune is stored.


##### returns

- `uint len`: The length of the rune in bytes.

##### ensures

- See the library description.
##### gascosts

- Parsing a rune of length one: **291**
- Parsing a rune of length two: **512**
- Parsing a rune of length three: **746**
- Parsing a rune of length four: **1000**

