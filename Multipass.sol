pragma solidity = 0.4.25;

contract Multipass {
    address public owner;
    uint256 public money;
    
    mapping(address => int256) public contributions;
    
    bool public withdrawn;
    
    constructor() public payable {
        contributions[msg.sender] = int256(msg.value * 900000000000000000000);
        owner = msg.sender;
        money = msg.value;
        withdrawn = false;
    }
    
    function gift() public payable {
        require(contributions[msg.sender] == 0 && msg.value == 0.00005 ether);
        contributions[msg.sender] = int256(msg.value) * 10;
        money += msg.value;
    }
  
    function takeSomeMoney() public {
        require(msg.sender == owner && withdrawn == false);
        uint256 someMoney = money/20;
        if(msg.sender.call.value(someMoney)()){
            money -= someMoney;
        }
        withdrawn = true;
    }
    
    function contribute(int256 _factor) public {
        require(contributions[msg.sender] != 0 && _factor < 10);
        contributions[msg.sender] *= _factor;
    }
    
    function claimContract() public {
        require(contributions[msg.sender] > contributions[owner]);
        owner = msg.sender;
    }
}
