// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Whitelist {

    //Maxe number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses){
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        //check if user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        // check if the number of add whitelisted is less than maxwhistedAddress
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");

        whitelistedAddresses[msg.sender] = true;

        numAddressesWhitelisted += 1;
    }
}