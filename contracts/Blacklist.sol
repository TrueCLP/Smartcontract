pragma solidity ^ 0.5 .0;
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

import "./MasterMinter.sol";

/**
 * @title Blacklist Token
 * @dev Allows accounts to be blacklisted by a "blacklister" role
 */
contract Blacklist is MasterMinter {

    address public blacklister;
    mapping(address => bool) internal blacklisted;

    event Blacklisted(address indexed _account);
    event UnBlacklisted(address indexed _account);
    event BlacklisterChanged(address indexed newBlacklister);

    constructor() public {
        blacklister = msg.sender;
        emit BlacklisterChanged(blacklister);
    }

    /**
     * @dev Throws if called by any account other than the blacklister
     */
    modifier onlyBlacklister() {
        require(msg.sender == blacklister, "Need to be the blacklister");
        _;
    }

    /**
     * @dev Throws if argument account is blacklisted
     * @param _account The address to check
     */
    modifier notBlacklisted(address _account) {
        require(blacklisted[_account] == false, "Your account had to not be blacklisted");
        _;
    }

    /**
     * @dev Checks if account is blacklisted
     * @param _account The address to check    
     */
    function isBlacklisted(address _account) public view returns(bool) {
        return blacklisted[_account];
    }

    /**
     * @dev Adds account to blacklist
     * @param _account The address to blacklist
     */
    function blacklist(address _account) public onlyBlacklister {
        blacklisted[_account] = true;
        emit Blacklisted(_account);
    }

    /**
     * @dev Removes account from blacklist
     * @param _account The address to remove from the blacklist
     */
    function unBlacklist(address _account) public onlyBlacklister {
        blacklisted[_account] = false;
        emit UnBlacklisted(_account);
    }

    function updateBlacklister(address _newBlacklister) public onlyOwner {
        require(_newBlacklister != address(0), "blacklister is 0x0");
        blacklister = _newBlacklister;
        emit BlacklisterChanged(blacklister);
    }
}