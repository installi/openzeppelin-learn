// SPDX-License-Identifier: MIT

pragma solidity 0.7.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155Holder.sol";

contract HolderExample is ERC1155Holder {
    ReceiverStruct[] public _receivers;
    struct ReceiverStruct{ address o; address f; uint256 i; uint256 a; }

    function onERC1155Received(
        address o, address f, uint256 i, uint256 a, bytes memory
    ) public virtual override returns (bytes4) {
        _receivers.push(ReceiverStruct(o, f, i, a));
        return this.onERC1155Received.selector;
    }

    function onERC1155BatchReceived(
        address o, address f, uint256[] memory ids, uint256[] memory a, bytes memory
    ) public virtual override returns (bytes4) {
        for (uint256 i = 0; i < ids.length; i++) {
            _receivers.push(ReceiverStruct(o, f, ids[i], a[i]));
        }

        return this.onERC1155BatchReceived.selector;
    }
}