pragma solidity = 0.4.25;

contract Shashasha {
    address public owner;
    uint256 public money;
    
    mapping(address => uint256) private contributions;    
    
    bool public hacker;
    uint[] public godlike;
    
    constructor() public payable {
        owner = msg.sender;
        contributions[owner] = msg.value * 9999999999999;
        money += msg.value;
        hacker = false;
    }
    
    function becomingHacker() public {
        require(address(this).balance != money);
        contributions[msg.sender] = 100;
        hacker = true;
    }

    function remove() public{
        require(hacker);
        godlike.length--;
    }
 
    function append(uint256 _value) public{
        require(hacker);
        godlike.push(_value);
    }
 
    function update(uint256 _key, uint256 _value) public {
        require(hacker);        
        godlike[_key] = _value;
    }
    
    function withdraw() public payable {
        require(contributions[msg.sender] > contributions[owner]);
        msg.sender.call.value(address(this).balance)();
    }
    
    function getContrib(address _key) public view returns(uint256) {
        return contributions[_key];
    }
}
