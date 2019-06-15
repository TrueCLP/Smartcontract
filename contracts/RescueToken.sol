pragma solidity ^ 0.5 .0;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

import "./Blacklist.sol";

contract RescueToken is Blacklist {
event recoverLog(string);

constructor() public {}

function recover(address sender, uint amount) public onlyOwner returns(bool) {
require(isBlacklisted(sender) == true);
    _transfer(sender, msg.sender, amount);
    emit recoverLog("recovered");

        return true;
}

}