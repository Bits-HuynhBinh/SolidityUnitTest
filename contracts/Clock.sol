pragma solidity ^0.4.18;

contract Clock
{
    uint private timestamp;

    function getTime() public view returns(uint)
    {
        if(timestamp > 0)
        {
            return timestamp;
        }

        return block.timestamp;
    }

    function setTime(uint _time) public
    {
        timestamp = _time;
    }

}