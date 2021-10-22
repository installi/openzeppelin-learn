// SPDX-License-Identifier: MIT

pragma solidity 0.7.0;

import "@openzeppelin/contracts/proxy/Initializable.sol";

contract Example is Initializable {
    uint256 public _x;

    function initialize(uint256 x_) public initializer {
        _x = x_;
    }
}