# Basic Dividend Contract  
A smart contract that facilitates the payout of funds (via dividend) to investors. *Note: This software is experimental. This author is not responsible for any lost funds.*

### What is it?  
BDC is a smart contract written in Solidity to exist on the Ethereum blockchain that lets individuals or organizations raise funds for a cause. Once the funds are raised and the cause is complete, the owner (funded party) can pay the investors back by sending ETH back to the contract. When the owner loads the contract with money, each investor can withdraw their dividend (or portion) of the contract's balance back to their own wallets.

### Why this?  
Fundraising is a common use case for the Ethereum blockchain in the form of ICOs. However, ICOs utilize alot of gas and generate a lot of traffic on the blockchain. A much simpler method of fundraising that can, at times, reward investors is to have a single, simple smart contract mediate the investment and paying back of money.

### How does it work?  
1. The owner, who wishes to raise money, deploys the contract to the blockchain.  
2. Investors, who wish to give money to the owner, call the contract's payment function, `invest()`, and send the contract the investment amout that is set by the owner (defaults to 1 ETH).  
3. The owner utilizes the newly raised money as they wish.  
4. The owner pays back the investors, preferably more than was originally raised, by calling the contract's payout function, `payOut()`, and sending the amount of ETH to be divided equally among each investor.  
5. Each investor withdraws their funds by calling the contract's `withdraw()` function, which sends their share of the contract's balance (i.e. dividend) to their account.  
  
**For example:**  
1. Alice, who wants to start a business, asks each prospective investor for 1 ETH to pay for her startup costs. She then deploys BDC to the blockchain and gives the contract's address to investors.  
2. Bob, Charlie, and David wish to invest in Alice's business in hopes of seeing a return on their investment. Each call the contract's `invest()` function and send 1 ETH.  
3. Alice receives 3 ETH, one from each investor, and launches her business. The business is a success, so Alice is now able to give money back to each investor.  
4. Alice calls the contract's `payOut()` function and sends 12 ETH.
5. Bob, Charlie, and David withdraw their dividend of the contract's balance, so they each get 4 ETH (12 ETH divided among the 3 of them) and receive 3 ETH in profit (4 ETH - 1 ETH investment = 3 ETH profit).

### Any important things to note?  
- Once a person invests, they are not allowed to invest again.  
- The owner of the contract (who deployed it) cannot invest in the contract from the owning address.  
- There is a function `getOwner()` that can be used to retrieve the owner of the contract.  
- While investment occurs once per investor, payouts and withdrawals can occur an infinite amount of times. 
- Similarly to an ICO, this contract creates no explicit incentive for the owner to pay back funds. Thus, their incentive to pay back investors must be created and enforced elsewhere.  
- **If an investor doesn't withdraw their dividend before the next payout, their dividend for the last period is lost. For example:**  
Charlie is an investor in Alice's business.  
If Alice pays out a balance to the contract, Charlie has a dividend waiting to be withdrawn.  
Charlie forgets to withdraw his dividend.  
Alice issues another payout to the contract.  
Charlie remembers to withdraw his dividend. In this case, he only receives his most recent dividend and **not** the sum of the most recent dividend and his missed dividend.  

## How can I help development?  
Thanks for your interest in contributing. At the moment, I'll be accepting new feature proposals and changes to the contract's code.  

If you'd like to tip me, my addresses are below:  
BTC: 38wbJRCVNnDLLZw1WA6rExNx5crGpFG6dk  
ETH: 0x037c241Baf5Ba2fa395db0Befac185e4E6b6608f
