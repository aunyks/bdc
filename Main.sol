pragma solidity ^0.4.0;
contract Dividend {
    struct Investor {
        uint usedPayouts;
        bool invested;
    }
    mapping(address => Investor) private investorRecords;
    address private owner;
    uint private averageDividend;
    uint private numPayouts;
    uint private numInvestors;
    uint constant INVESTMENT_AMOUNT = 1 ether;
    
    function Dividend() public {
        owner = msg.sender;
        averageDividend = 0;
        numPayouts = 0;
        numInvestors = 0;
    }
    modifier payedAmount(){
        require(msg.value == INVESTMENT_AMOUNT);
        _;
    }
    modifier invested(){
        require(investorRecords[msg.sender].invested);
        _;
    }
    modifier notInvested(){
        require(!(investorRecords[msg.sender].invested));
        _;
    }
    modifier ownerOnly {
        require(msg.sender == owner);
        _;
    }
    modifier notOwner {
        require(msg.sender != owner);
        _;      
    }
    modifier nonZeroPayouts {
        require(numPayouts >= 1);
        _;
    }
    function getOwner() constant public returns (address) {
        return owner;
    }
    function getNumInvestors() ownerOnly constant public returns (uint) {
        return numInvestors;
    }
    function getNumPayouts() ownerOnly constant public returns (uint) {
        return numPayouts;
    }
    function payOut() payable ownerOnly public {
        numPayouts++;
        averageDividend = this.balance / numInvestors;
    }
    function invest() payable notInvested notOwner payedAmount public  {
        // Pass sent money to contract owner
        owner.transfer(msg.value);
        // Initialize information about this investor
        investorRecords[msg.sender].invested = true;
        // investorRecords[msg.sender].usedPayouts = 0;
        // Add their existence to record
        numInvestors++;
    }
    function withdrawalBalance() invested constant public returns (uint) {
        return averageDividend;
        // uint usedPayouts = investorRecords[msg.sender].usedPayouts;
        // return averageDividend * (numPayouts - usedPayouts);
    }
    function withdraw() invested nonZeroPayouts public {
        msg.sender.transfer(averageDividend);
        // Investor storage thisInvestor = investorRecords[msg.sender];
        // msg.sender.transfer(averageDividend * (numPayouts - thisInvestor.usedPayouts));
        // thisInvestor.usedPayouts = numPayouts;
    }
}
