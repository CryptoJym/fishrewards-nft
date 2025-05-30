// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/**
 * @title FishCertNFT
 * @dev Main NFT contract for FISH CERT climate-aligned certificates
 * @notice Implements tiered NFT system with reward distribution over 10 years
 */
contract FishCertNFT is ERC721, ERC721Enumerable, ERC721URIStorage, Pausable, AccessControl, ReentrancyGuard {
    using Counters for Counters.Counter;

    // Role definitions
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant METADATA_ROLE = keccak256("METADATA_ROLE");

    // Tier definitions
    enum Tier {
        SHORELINE_DRIFT,    // 0: 50% rewards, $250
        TIDE_CATCH,         // 1: 75% rewards, $500
        REEF_BOUNTY,        // 2: 125% rewards, $1,000
        SEAFARERS_CREST,    // 3: 150% rewards, $2,000
        OCEAN_HARVEST,      // 4: 175% rewards, $5,000
        LEGACY_DEEPWATER    // 5: 200% rewards, $10,000
    }

    // Tier information structure
    struct TierInfo {
        string name;
        uint256 rewardRate;      // Basis points (50% = 5000)
        uint256 price;           // Price in wei
        uint256 maxSupply;       // Maximum tokens for this tier
        uint256 currentSupply;   // Current minted tokens
        bool isActive;           // Whether tier is active for minting
        string metadataURI;      // Base URI for tier metadata
    }

    // Token metadata structure
    struct TokenMetadata {
        Tier tier;
        uint256 mintTimestamp;
        address originalOwner;
        uint256 rewardsClaimed;
        uint256 lastClaimTimestamp;
    }

    // State variables
    Counters.Counter private _tokenIdCounter;
    mapping(Tier => TierInfo) public tierInfo;
    mapping(uint256 => TokenMetadata) public tokenMetadata;
    mapping(address => uint256[]) public ownerTokens;
    
    // Contract addresses
    address public rewardsDistributor;
    address public tierManager;
    address public treasury;

    // Constants
    uint256 public constant DISTRIBUTION_DAYS = 3650; // 10 years
    uint256 public constant SECONDS_PER_DAY = 86400;
    uint256 public constant BASIS_POINTS = 10000;

    // Events
    event CertMinted(address indexed to, uint256 indexed tokenId, Tier tier, uint256 price);
    event MetadataUpdated(uint256 indexed tokenId, string newURI);
    event RewardsDistributorUpdated(address indexed newDistributor);
    event TierUpdated(Tier indexed tier, TierInfo info);
    event TreasuryUpdated(address indexed newTreasury);

    constructor(
        address _treasury,
        address _rewardsDistributor
    ) ERC721("FISH Certificate", "FISH-CERT") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(PAUSER_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(METADATA_ROLE, msg.sender);
        
        treasury = _treasury;
        rewardsDistributor = _rewardsDistributor;
        
        _initializeTiers();
    }

    /**
     * @dev Initialize tier information
     */
    function _initializeTiers() private {
        tierInfo[Tier.SHORELINE_DRIFT] = TierInfo({
            name: "Shoreline Drift",
            rewardRate: 5000,  // 50%
            price: 250 ether,  // Using ether as placeholder for USD
            maxSupply: 10000,
            currentSupply: 0,
            isActive: true,
            metadataURI: "ipfs://QmShorelineDrift/"
        });
        
        tierInfo[Tier.TIDE_CATCH] = TierInfo({
            name: "Tide Catch",
            rewardRate: 7500,  // 75%
            price: 500 ether,
            maxSupply: 7500,
            currentSupply: 0,
            isActive: true,
            metadataURI: "ipfs://QmTideCatch/"
        });
        
        tierInfo[Tier.REEF_BOUNTY] = TierInfo({
            name: "Reef Bounty",
            rewardRate: 12500,  // 125%
            price: 1000 ether,
            maxSupply: 5000,
            currentSupply: 0,
            isActive: true,
            metadataURI: "ipfs://QmReefBounty/"
        });
        
        tierInfo[Tier.SEAFARERS_CREST] = TierInfo({
            name: "Seafarer's Crest",
            rewardRate: 15000,  // 150%
            price: 2000 ether,
            maxSupply: 2500,
            currentSupply: 0,
            isActive: true,
            metadataURI: "ipfs://QmSeafarersCrest/"
        });
        
        tierInfo[Tier.OCEAN_HARVEST] = TierInfo({
            name: "Ocean Harvest",
            rewardRate: 17500,  // 175%
            price: 5000 ether,
            maxSupply: 1000,
            currentSupply: 0,
            isActive: true,
            metadataURI: "ipfs://QmOceanHarvest/"
        });
        
        tierInfo[Tier.LEGACY_DEEPWATER] = TierInfo({
            name: "Legacy Deepwater",
            rewardRate: 20000,  // 200%
            price: 10000 ether,
            maxSupply: 500,
            currentSupply: 0,
            isActive: true,
            metadataURI: "ipfs://QmLegacyDeepwater/"
        });
    }

    /**
     * @dev Mint a new FISH CERT NFT
     * @param to Address to mint to
     * @param tier Tier level to mint
     */
    function mintCert(address to, Tier tier) public payable nonReentrant whenNotPaused {
        TierInfo storage info = tierInfo[tier];
        
        require(info.isActive, "Tier is not active");
        require(info.currentSupply < info.maxSupply, "Tier sold out");
        require(msg.value >= info.price, "Insufficient payment");
        
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        
        _safeMint(to, tokenId);
        
        // Set token metadata
        tokenMetadata[tokenId] = TokenMetadata({
            tier: tier,
            mintTimestamp: block.timestamp,
            originalOwner: to,
            rewardsClaimed: 0,
            lastClaimTimestamp: block.timestamp
        });
        
        // Update tier supply
        info.currentSupply++;
        
        // Add to owner's token list
        ownerTokens[to].push(tokenId);
        
        // Set token URI
        string memory uri = string(abi.encodePacked(info.metadataURI, uint2str(tokenId), ".json"));
        _setTokenURI(tokenId, uri);
        
        // Transfer payment to treasury
        (bool success, ) = treasury.call{value: msg.value}("");
        require(success, "Payment transfer failed");
        
        // Initialize rewards in distributor
        if (rewardsDistributor != address(0)) {
            IRewardsDistributor(rewardsDistributor).initializeRewards(tokenId, tier);
        }
        
        emit CertMinted(to, tokenId, tier, info.price);
    }

    /**
     * @dev Get tier information for a token
     * @param tokenId Token ID to query
     */
    function getTokenTier(uint256 tokenId) public view returns (Tier) {
        require(_exists(tokenId), "Token does not exist");
        return tokenMetadata[tokenId].tier;
    }

    /**
     * @dev Get reward rate for a token
     * @param tokenId Token ID to query
     */
    function getTokenRewardRate(uint256 tokenId) public view returns (uint256) {
        require(_exists(tokenId), "Token does not exist");
        Tier tier = tokenMetadata[tokenId].tier;
        return tierInfo[tier].rewardRate;
    }

    /**
     * @dev Calculate daily reward for a token
     * @param tokenId Token ID to query
     */
    function calculateDailyReward(uint256 tokenId) public view returns (uint256) {
        require(_exists(tokenId), "Token does not exist");
        
        TokenMetadata memory metadata = tokenMetadata[tokenId];
        TierInfo memory info = tierInfo[metadata.tier];
        
        // Calculate daily reward: (price * rewardRate / BASIS_POINTS) / DISTRIBUTION_DAYS
        uint256 totalReward = (info.price * info.rewardRate) / BASIS_POINTS;
        return totalReward / DISTRIBUTION_DAYS;
    }

    /**
     * @dev Update tier information (admin only)
     * @param tier Tier to update
     * @param info New tier information
     */
    function updateTierInfo(Tier tier, TierInfo memory info) public onlyRole(DEFAULT_ADMIN_ROLE) {
        tierInfo[tier] = info;
        emit TierUpdated(tier, info);
    }

    /**
     * @dev Update metadata URI for a token
     * @param tokenId Token ID to update
     * @param newURI New metadata URI
     */
    function updateTokenURI(uint256 tokenId, string memory newURI) public onlyRole(METADATA_ROLE) {
        require(_exists(tokenId), "Token does not exist");
        _setTokenURI(tokenId, newURI);
        emit MetadataUpdated(tokenId, newURI);
    }

    /**
     * @dev Update rewards distributor address
     * @param newDistributor New distributor address
     */
    function updateRewardsDistributor(address newDistributor) public onlyRole(DEFAULT_ADMIN_ROLE) {
        rewardsDistributor = newDistributor;
        emit RewardsDistributorUpdated(newDistributor);
    }

    /**
     * @dev Update treasury address
     * @param newTreasury New treasury address
     */
    function updateTreasury(address newTreasury) public onlyRole(DEFAULT_ADMIN_ROLE) {
        treasury = newTreasury;
        emit TreasuryUpdated(newTreasury);
    }

    /**
     * @dev Pause contract (emergency only)
     */
    function pause() public onlyRole(PAUSER_ROLE) {
        _pause();
    }

    /**
     * @dev Unpause contract
     */
    function unpause() public onlyRole(PAUSER_ROLE) {
        _unpause();
    }

    /**
     * @dev Get all tokens owned by an address
     * @param owner Address to query
     */
    function getOwnerTokens(address owner) public view returns (uint256[] memory) {
        return ownerTokens[owner];
    }

    /**
     * @dev Convert uint to string
     * @param _i Uint to convert
     */
    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }

    // Override required functions
    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        whenNotPaused
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
        
        // Update owner token lists
        if (from != address(0)) {
            _removeTokenFromOwner(from, tokenId);
        }
        if (to != address(0)) {
            ownerTokens[to].push(tokenId);
        }
    }

    function _removeTokenFromOwner(address owner, uint256 tokenId) private {
        uint256[] storage tokens = ownerTokens[owner];
        for (uint256 i = 0; i < tokens.length; i++) {
            if (tokens[i] == tokenId) {
                tokens[i] = tokens[tokens.length - 1];
                tokens.pop();
                break;
            }
        }
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, ERC721URIStorage, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}

// Interface for rewards distributor
interface IRewardsDistributor {
    function initializeRewards(uint256 tokenId, FishCertNFT.Tier tier) external;
}