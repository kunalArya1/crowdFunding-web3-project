// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Funding {
    struct Campaign {
        // like java class struct is a structure in solidity.
        address owner;
        string title;
        string description;
        uint256 target;
        uint256 amountcollected;
        uint256 deadline;
        address[] donators;
        uint256[] donations;
        string image;
    }

    mapping(uint256 => Campaign) public Campaigns;

    uint public numberOfCampaigns = 0;

    function createCampaign(
        address _owner,
        string memory _title,
        string memory _description,
        string memory _image,
        uint256 _deadline,
        uint256 _target
    ) public returns (uint256) {
        Campaign storage Campaign = Campaigns[numberOfCampaigns];

        Campaign.owner = _owner;
        Campaign.title = _title;
        Campaign.description = _description;
        Campaign.deadline = _deadline;
        Campaign.target = _target;
        Campaign.image = _image;
        Campaign.amountcollected = 0;

        numberOfCampaigns++;
        return numberOfCampaigns - 1;
    }

    function donateToCampaign(uint256 _id) public payable {
        //msg is predefined which is used to get details from frontend who has called (user == value)
        uint amount = msg.value;
        Campaign storage Campaign = Campaigns[_id];
        Campaign.donators.push(msg.sender);
        Campaign.donations.push(amount);

        (bool sent, ) = payable(Campaigns[_id].owner).call{value: amount}("");

        if (sent) Campaign.amountcollected = Campaign.amountcollected + amount;
    }

    function getDonators(
        uint256 _id
    ) public view returns (address[] memory, uint256[] memory) {
        return (Campaigns[_id].donators, Campaigns[_id].donations);
    }

    function getCampaign() public view returns (Campaign[] memory) {
        Campaign[] memory allCampaigns = new Campaign[](numberOfCampaigns);

        for (uint i = 0; i < numberOfCampaigns; i++) {
            allCampaigns[i] = Campaigns[i];
        }

        return allCampaigns;
    }
}
