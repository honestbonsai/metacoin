pragma solidity >=0.4.21 <0.6.0;

contract SimpleStorage {
    event StorageSet(string _message);

    int public storedInt;
    uint public storedUint;
    bool public storedBool;
    address public storedAddress;
    address payable public storedAddressPayable;
    string public storedString;
    bytes32 public storedBytes32;

    enum Direction{ UP, DOWN, LEFT, RIGHT }
    Direction public direction;

    struct Person {
      string firstName;
      string lastName;
    }
    Person person;

    int[] public storedIntArr;

    function setInt(int x) public {
        storedInt = x;
        emit StorageSet("int data stored successfully!");
    }

    function setUint(uint x) public {
        storedUint = x;
        emit StorageSet("uint data stored successfully!");
    }

    function setBool(bool x) public {
        storedBool = x;
        emit StorageSet("bool data stored successfully!");
    }

    function setAddress(address x) public {
        storedAddress = x;
        emit StorageSet("address data stored successfully!");
    }

    function setAddressPayable(address payable x) public {
        storedAddressPayable = x;
        emit StorageSet("addressPayable data stored successfully!");
    }

    function setString(string memory x) public {
        storedString = x;
        emit StorageSet("string data stored successfully!");
    }

    function setBytes32(bytes32 x) public {
        storedBytes32 = x;
        emit StorageSet("bytes32 data stored successfully!");
    }

    function addInt(int x) public {
        storedIntArr.push(x);
        emit StorageSet("intArr data stored successfully!");
    }

    function setIntArr(int[] memory x) public {
        storedIntArr = x;
        emit StorageSet("intArr data stored successfully!");
    }

    function setDirection(Direction x) public {
      direction = x;
      emit StorageSet("direction enum data stored successfully!");
    }

    function setPerson(string memory firstName, string memory lastName) public {
      person.firstName = firstName;
      person.lastName = lastName;
      emit StorageSet("person data stored successfully!");
    }

    function setPersonByStruct(Person memory _person) {
        person = _person;
        emit StorageSet("person data stored successfully!");
    }
}
