// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
contract SimpleStorage  {
    // bool, int , uint, address, types
    bool isTrue = true;
    uint8 a = 5;
    uint256 b = 5;
    uint c = 5;             // Default Size is 256 
    string Jiya = "Jiya";
    int256 signedint = -5;  
    address myAddress =  0x7B4a63dBF8d494e438D3fC06839fE48006F3d449 ;     // You cant explictly type address    // Try manipulating the digits
    bytes32 myBytes = "cat";     // Automatically it will be converted to bytes
    //bytes32 is max
    //  uint8 is min
    uint256 public num;                //Automatically it is initialised to 0 by default

    function setValue( uint _val ) public virtual{
        num = _val;
        //  More number of lines/operations in this , more the gas fees is charged
    }

    function reveal() public view returns(uint256) {
        return num;
    }
    function calc_1_1() public pure returns(uint256) {
        return 1+1 ;
    }
    //  The color of the button setValue is orange and of others are blue because it denotes setValue is taking gas fee while others are not doing so
    //  You need to pay gas only when you modify the blockchain state
    //  View and Pure functions are free unless you call it inside of a function that charges gas


    // view Functions
    // Definition: A view function is a function that reads data from the blockchain but does not modify it.
    // Use Case: Use view when your function needs to read state variables or blockchain data, like the balance of an account, but you don't want to alter the state.

    // pure Functions
    // Definition: A pure function is a function that neither reads nor modifies the blockchain state. It only uses its inputs to perform computations and return a result.
    // Use Case: Use pure when your function doesn't need to access any data stored in the contract or on the blockchain. It's purely for computations.


    //  Creating Array
    // uint256[] public numlist;        //  This is a dynamic array
    // uint256[3] public numlist;        //  This is a static array with fixed size


    // People public person = People({num:2,name:"Jiya"});

    People[] public people;     //Creating array

    struct People{
        uint256 num;
        string name;
    }

    //  Mapping
    mapping(string => uint256) public nameTonumber;


    function addNewPerson(string memory _name, uint256 _num) public {
        people.push(People(_num,_name));
        nameTonumber[_name] = _num;
    }

    //  EVM can access and store information in six places:
    // Stack 
    // memory
    // storage
    // calldata
    // code
    // calllogs

    //  Call data => Temporary variable that can't be modified
    //  Memory => Temporary variable that can be modified
    //  Storage => Permanent variable that can be modified


}
