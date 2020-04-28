pragma solidity ^0.5.12;


contract Dummy {
    uint256 x;

    constructor(uint256 _x) public {
        x = _x;
    }
}


contract FactoryPattern {
    event createdAddress(address predicted,address actual);

    function createPair(uint256 x) public {
        bytes memory bytecode = type(Dummy).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(x));
        address predictedAddress = address(uint(keccak256(abi.encodePacked(
            byte(0xff),
            address(this),
            salt,
            keccak256(abi.encodePacked(
                bytecode,
                x
            ))
        ))));
        Dummy d=new Dummy{salt:salt}(x);
        emit createdAddress(address(d),predictedAddress);
    }
}
