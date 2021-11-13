// SPDX-License-Identifier: MIT

pragma solidity 0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

/**
 * @title Access control extended blacklist function
 *
 * @notice The extension is very simple. You can see openzeppelin's {AccessControl.sol}
 * for the basic operation of access control
 *
 * Docs: https://docs.openzeppelin.com/contracts/4.x/access-control#using-access-control
 *
 * v1.0.0 | 2021-11-11 | openzeppelin: v0.8.0
 *
 */
contract AccessControlExtend is AccessControl {
    // Bytes32 value corresponding to blacklist role
    bytes32 public constant BLACK_LIST = bytes32("BLACK");

    constructor(address admin) {
        // Add users to the default administrator role
        // Only members of this role can call "grantrole" and "revokerole"
        // WARNING： Without this operation, some functions will be called
        // completely without permission
        _setupRole(DEFAULT_ADMIN_ROLE, admin);
    }

    /**
     * @notice Check whether the user is a administrator of the role
     *
     * The effect is the same as "onlyRole(getRoleAdmin(role))", and
     * the Chinese name is used to facilitate code reading
     */
    modifier onlyRoleAdmin(string memory roleName) {
        bytes32 role = keccak256(abi.encode(roleName));
        _checkRole(getRoleAdmin(role), _msgSender());
        _;
    }

    /**
     * @notice Check whether the user is a member of the role
     *
     * The effect is the same as "onlyrole", and the Chinese
     * name is used to facilitate code reading
     */
    modifier onlyRoleMember(string memory roleName) {
        _checkRole(keccak256(abi.encode(roleName)), _msgSender());
        _;
    }

    /**
     * @notice Check whether the user is in the blacklist
     *
     * Add user in to blacklist See { AccessControlExtend: addBlackList }
     * Remove user from blacklist  See { AccessControlExtend: addBlackList }
     */
    modifier checkBlackList() {
        require(!hasRole(BLACK_LIST, _msgSender()), "Disabled");
        _;
    }

    /**
     * @notice Get the corresponding bytes32 value according to the name
     *
     * To add a role manually,
     * query the bytes32 value corresponding to the role name
     *
     * @param name The string name of role
     * @return value The bytes32 value of string
     */
    function getRoleByName(string memory name) public pure
        returns (bytes32 value) {

        return keccak256(abi.encode(name));
    }

    /**
     * @notice Add user in to blacklist
     *
     * It is also possible to call the "grantRole" method directly
     * The bytes32 value of the blacklist role is "bytes32("BLACK")"
     *
     * @param target Address of members
     */
    function addBlackList(address target) public {
        require(target != address(0), "Address invalid");
        grantRole(BLACK_LIST, target);
    }

    /**
     * @notice Remove user from blacklist
     *
     * It is also possible to call the "revokeRole" method directly
     * The bytes32 value of the blacklist role is "bytes32("BLACK")"
     *
     * @param target Address of members
     */
    function removeBlackList(address target) public {
        require(target != address(0), "Address invalid");
        revokeRole(BLACK_LIST, target);
    }
}
