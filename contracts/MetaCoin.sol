pragma solidity ^0.4.18;

import "./ConvertLib.sol";
import "./Clock.sol";

// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract MetaCoin 
{
	mapping (address => uint) public balances;

	uint finishAt;
	Clock clock;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);


	constructor(uint _duration, address _clockAddress) public 
	{
		balances[tx.origin] = 10000;

		clock = Clock(_clockAddress);
		finishAt = clock.getNow() + _duration;
	}

	
	function isFinished() public view returns(bool)
	{
		return finishAt <= clock.getNow();
	}

	function sendCoin(address receiver, uint amount) public returns(bool sufficient) 
	{
		if (balances[msg.sender] < amount)
		{
			return false;
		}
			
		balances[msg.sender] -= amount;
		balances[receiver] += amount;

		emit Transfer(msg.sender, receiver, amount);

		return true;
	}

	function getBalanceInEth(address addr) public view returns(uint)
	{
		return ConvertLib.convert(getBalance(addr), 2);
	}

	function getBalance(address addr) public view returns(uint) 
	{
		return balances[addr];
	}

	function getBalance1(address addr) public view returns(uint) 
	{
		return balances[addr];
	}

	function addNumber(uint a, uint b) public pure returns(uint)
	{
		return a + b;
	}

	function depositCoins(address to, uint _amount) public returns(uint)
	{
		//balances[tx.origin]  += _amount;
		balances[to] += _amount;
		return _amount;
	}

	uint public raised;
	function donate() public payable 
	{
		balances[msg.sender] += msg.value;
    	raised += msg.value;
  	}	
}
