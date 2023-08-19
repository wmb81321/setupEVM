// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract TKNCALI is ERC20, ERC20Burnable, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor() ERC20("TKNCALI", "ETHCALI") {
        _mint(msg.sender, 1000 * 10 ** decimals());

        // Asignar el rol de administrador al creador del contrato.
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);

        // Asignar el rol de minter al creador del contrato.
        _setupRole(MINTER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }
}
