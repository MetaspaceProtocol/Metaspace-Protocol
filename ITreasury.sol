// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.0;

interface ITreasury {
    function notify(address from, address to,uint256 amount,uint256 feeAmount) external;
}