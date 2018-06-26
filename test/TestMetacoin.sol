pragma solidity ^0.4.2; 

import "truffle/Assert.sol"; 
import "truffle/DeployedAddresses.sol"; 
import "../contracts/MetaCoin.sol"; 

contract TestMetacoin
{
        uint public initialBalance = 10 ether; 

        // function testInitialBalanceUsingDeployedContract()public {
        //   MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin()); 
        //   uint expected = 10000; 
        //   Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially"); 
        // }

        // function testInitialBalanceWithNewMetaCoin()public {
        //   MetaCoin meta = new MetaCoin(); 
        //   uint expected = 10000; 
        //   Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 10000 MetaCoin initially"); 
        // }

        // function testAdd()public {
        //   MetaCoin meta = new MetaCoin(); 
        //   uint num1 = 3; 
        //   uint num2 = 6; 

        //   uint expected = 9; 

        //   Assert.equal(meta.addNumber(num1, num2), expected, "Not correct"); 
        // }

        // function testConvertionRate()public {
        //   uint num1 = 3; 
        //   uint num2 = 5; 
        //   uint expected = 15; 

        //   Assert.equal(ConvertLib.convert(num1, num2), expected, "Not correct"); 
        // }


        // function testDepositCoin() public {
        //   address addr1 = DeployedAddresses.MetaCoin(); 
        //   MetaCoin meta = MetaCoin(addr1); 

        //   meta.depositCoins(addr1, 50); 

        //   uint expected = 50; 
        //   Assert.equal(meta.getBalance(addr1), expected, "Owner should have 10000 MetaCoin initially"); 
        // }


        // // function testSendCoin()
        // // {
        // //   MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

        // //   address addr1 = 0x33853f1d4baf31ce900bdfb1b90038ae7f956d17;
        // //   address addr2 = 0xaaf1a8a6ebe43f420870f41eeeb384d1d1593c2a;

        // //   var result;
        // //   result = meta.depositCoins(addr1, 100);
        // //   Assert.equal(meta.getBalance(addr1), 100, "Address 1 should have 100 coins");

        // //   result = addr1.sendCoin(addr2, 10);
        // //   Assert.equal(meta.getBalance(addr1), 90, "Address 1 should have 90 coins");

        // //   var bal2 = meta.getBalance(addr2);
        // //   Assert.equal(bal2, 10, "Address 2 should have 10 coins");
        // // }

        // function testAcceptingDonations()public 
        // {
        //     MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin()); 
        //     Assert.equal(meta.raised(), 0, "Initial raised amount is different than 0"); 

        //     meta.donate.gas(50000).value(10 finney)(); 
        //     meta.donate.value(20 finney)(); 

        //     Assert.equal(meta.raised(), 30 finney, "Raised amount is different than sum of donations"); 
            
        //     meta.getBalance(tx.origin);
        // }


        // function testTrackingDonatorsBalance() public {
        //   MetaCoin funding = new MetaCoin();
        //   funding.donate.value(5 finney)();
        //   funding.donate.value(15 finney)();
        //   Assert.equal(funding.balances(this), 20 finney, "Donator balance is different than sum of donations ");
        //   //log("abc", true);
        // }

        function testFinishingFundRising() public 
        {
          Clock clock = Clock(DeployedAddresses.Clock());
          MetaCoin funding = new MetaCoin(1 days, address(clock));

          Assert.equal(funding.isFinished(), false, "Is finished before time is up");

          clock.setTime(now + 1 days);
          Assert.equal(funding.isFinished(), true, "Is not finished before time is up");
        }
}
