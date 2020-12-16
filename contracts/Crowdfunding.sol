// SPDX-License-Identifier: MIT
pragma solidity >=0.4.11 <0.7.0;
pragma experimental ABIEncoderV2;

contract CrowdFunding {
    CampaignGoal[] public campaignGoals;
    CampaignGoal public campaignGoal;
    // Defines a new type with two fields.
    struct Funder {
        address addr;
        uint256 amount;
    }

    struct Campaign {
        address payable beneficiary;
        uint256 fundingGoal;
        uint256 numFunders;
        uint256 amount;
        mapping(uint256 => Funder) funders;
    }

    struct CampaignGoal {
        uint256 fundingGoal;
        uint256 amount;
    }

    uint256 numCampaigns;
    mapping(uint256 => Campaign) campaigns;

    function newCampaign(address payable beneficiary, uint256 goal)
        public
        returns (uint256 campaignID)
    {
        campaignID = numCampaigns++; // campaignID is return variable
        // Creates new struct in memory and copies it to storage.
        // We leave out the mapping type, because it is not valid in memory.
        // If structs are copied (even from storage to storage), mapping types
        // are always omitted, because they cannot be enumerated.
        campaigns[campaignID] = Campaign(beneficiary, goal, 0, 0);
    }

    function contribute(uint256 campaignID) public payable {
        Campaign storage c = campaigns[campaignID];
        // Creates a new temporary memory struct, initialised with the given values
        // and copies it over to storage.
        // Note that you can also use Funder(msg.sender, msg.value) to initialise.
        c.funders[c.numFunders++] = Funder({
            addr: msg.sender,
            amount: msg.value
        });
        c.amount += msg.value;
    }

    function checkGoalReached(uint256 campaignID)
        public
        returns (bool reached)
    {
        Campaign storage c = campaigns[campaignID];
        if (c.amount < c.fundingGoal) return false;
        uint256 amount = c.amount;
        c.amount = 0;
        c.beneficiary.transfer(amount);
        return true;
    }

    function getCampaignGoal(uint256 campaignID)
        public
        view
        returns (CampaignGoal memory)
    {
        CampaignGoal memory c = campaignGoals[campaignID];
        return c;
    }
}
