//SPDX-License-Identifier: MIT

pragma solidity 0.8.30;

contract SmartContractWallet {

    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function transfer(address payable _to, uint _amount, bytes memory _payload) public returns(bytes memory) {
        require(msg.sender == owner, "You are not the owner, aborting");

        (bool success, bytes memory returnData) = _to.call{value: _amount}(_payload);
        require(success, "Aborting, call was not successful");
        return returnData;
    }

    receive() external payable { }

}