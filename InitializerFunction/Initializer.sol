// This utils contract is intended to be inherited by concrete (actual) contracts. 
// Therefore/ it's initializer function should not use the initializer modifier, but onlyInitializing instead.


//BEFORE 

   /// @notice initialize method for EIP712Upgradeable
    /// @dev called once after initial deployment and every upgrade.
    /// @param _name the user readable name of the signing domain for EIP712
    /// @param _version the current major version of the signing domain for EIP712
abstract contract EIP712Upgradeable is Initializable {

function initializeEIP712(string memory _name, string memory _version)
        public
        initializer
    {
        name = _name;
        version = _version;

        __EIP712_init(_name, _version);
    }
}

//FIXED

abstract contract EIP712MetaTransaction is EIP712Upgradeable {
    // ...

    /// @notice initialize method for EIP712Upgradeable
    /// @dev called once after initial deployment.
    /// @param _name the user readable name of the signing domain for EIP712
    /// @param _version the current major version of the signing domain for EIP712
    function __EIP712MetaTransaction_init(string memory _name, string memory _version)
        internal
        onlyInitializing
    {
        name = _name;
        version = _version;

        __EIP712_init(_name, _version);
    }
    }
