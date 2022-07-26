// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./ERC20.sol";
import "./IMiner.sol";
import "./ERC20Capped.sol";

contract LoopToken is ERC20Capped,IMiner{
    address private immutable miner;
    address public  immutable airdropContract;
    constructor(address _treasury,address _miner,address _airdropContract) ERC20("Loop Token", "LOOP",_treasury) ERC20Capped(100000000 * 10 ** decimals()) {
        require(_treasury != address(0), "ERC20: zero address.");
        require(_miner != address(0), "ERC20: zero address.");
        require(_airdropContract != address(0), "ERC20: zero address.");

        miner = _miner;
        airdropContract = _airdropContract;
        _mint(msg.sender, 100000 * 10 ** decimals());
        _mint(_airdropContract, 50000 * 10 ** decimals());
    }

    function mint(address _to,uint256 _amount)external override returns(bool){
        require(msg.sender == miner,"sender not is miner");
        _mint(_to, _amount);
        return true;
    }
    
}