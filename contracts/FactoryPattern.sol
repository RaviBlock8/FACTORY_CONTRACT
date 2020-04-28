pragma solidity ^0.5.12;


contract Dummy {
    uint256 x;

    constructor(uint256 _x) public {
        x = _x;
    }
}


contract FactoryPattern {
    event createdAddress(address dummyAddress);

    function createPair(uint256 x) public {
        bytes memory bytecode = type(Dummy).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(x));
        address pair;
        assembly {
            pair := create2(0, add(bytecode, 32), mload(bytecode), salt)
        }
        // Dummy(pair).initialize(x);
        emit createdAddress(pair);
    }
}
