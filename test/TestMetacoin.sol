pragma solidity >=0.4.25 <0.6.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MetaCoin.sol";

contract TestMetacoin {

  function testInitialBalanceUsingDeployedContract() public {
    MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

    uint expected = 1000000000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 1000000000 MetaCoin initially");
  }

  function testInitialBalanceWithNewMetaCoin() public {
    MetaCoin meta = new MetaCoin();

    uint expected = 1000000000;

    Assert.equal(meta.getBalance(tx.origin), expected, "Owner should have 1000000000 MetaCoin initially");
  }

}
