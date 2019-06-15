pragma solidity ^ 0.5 .0;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Burnable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Pausable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";


import "./MasterMinter.sol";
import "./Blacklist.sol";
import "./RescueToken.sol";



/**
@dev By the moment, the Owner address is the msg.sender
 */
contract TrueCLP is ERC20Detailed, ERC20Burnable, ERC20Pausable, RescueToken {

    constructor(
        string memory name,
        string memory symbol,
        uint8 decimals
        
    )

    ERC20Burnable()
    ERC20Mintable()
    ERC20Detailed(name, symbol, decimals)
    ERC20()
    public {}

    /**
     * @dev Just to be sure at all
     */
    function () external payable {
        revert();
    }

}