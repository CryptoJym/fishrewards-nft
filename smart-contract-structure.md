# FISH CERT Smart Contract Structure

Based on the fishrewards.app implementation analysis.

## Core Contract Components Needed

### 1. FishCertNFT Contract
Main ERC-721 contract for CERT NFTs with the following data structures:

```solidity
struct CertTier {
    string id;              // e.g., "cod-fish"
    string name;            // e.g., "Shoreline Drift"
    uint256 weightingFactor; // Scaled by 100 (50 = 0.50)
    uint256 startingPrice;   // In stable coin units
    uint256 incrementAmount; // Price increase per interval
    uint256 incrementInterval; // Always 100
    uint256 maxSupply;
    uint256 currentSupply;
    uint256 phase2Multiplier;
    string imageURI;        // IPFS hash
}

mapping(uint256 => CertTier) public tiers; // 1-6
mapping(uint256 => uint256) public mintCountPerPackage;
```

### 2. Pricing Algorithm Implementation
```solidity
function getCurrentPrice(uint256 packageId) public view returns (uint256) {
    CertTier memory tier = tiers[packageId];
    uint256 mintedCount = mintCountPerPackage[packageId];
    uint256 increments = mintedCount / tier.incrementInterval;
    return tier.startingPrice + (increments * tier.incrementAmount);
}

function calculateCostForQuantity(
    uint256 packageId, 
    uint256 quantity
) public view returns (uint256) {
    // Implement stepped pricing as quantity crosses increment boundaries
}
```

### 3. Reward Distribution Contract
```solidity
uint256 constant TOTAL_STAKER_POOL = 5_490_000_000 * 10**18; // 5.49B tokens
uint256 constant DISTRIBUTION_YEARS = 10;

function computeYearlyPool(uint256 year) public pure returns (uint256) {
    if (year == 1) return TOTAL_STAKER_POOL / 2;
    // Halve the previous year's pool
    return computeYearlyPool(year - 1) / 2;
}

function calculateWeightedStake(
    address user,
    uint256 year
) public view returns (uint256 userWeight, uint256 globalWeight) {
    // Sum across all tiers:
    // weight = quantity * weightingFactor * (year >= phase2Start ? phase2Multiplier : 1)
}
```

### 4. Phase 2 Multiplier System
```solidity
uint256 public phase2StartYear = 5; // Configurable

function applyPhase2Multiplier(
    uint256 packageId,
    uint256 quantity,
    uint256 year
) public view returns (uint256) {
    if (year < phase2StartYear) return quantity;
    return quantity * tiers[packageId].phase2Multiplier;
}
```

## Key Implementation Notes

### From Existing Contract (0x43bf526abad45cfae684e706cdbec1cf52a91646)
The current purchase contract tracks:
- `mintCountPerPackage(uint256)` - Returns minted count per package ID (1-6)

### Reward Calculation Formula
```
Daily Rewards = (userWeightedStake / globalWeightedStake) * dailyPool
Where:
- dailyPool = yearlyPool / 365
- weightedStake = quantity * weightingFactor * phase2Multiplier (if applicable)
```

### Integration Requirements
1. **Minting**: Track package ID (1-6) for each NFT
2. **Pricing**: Dynamic pricing based on minted count
3. **Rewards**: Complex weighted distribution system
4. **Phase 2**: Time-based multiplier activation
5. **UI Data**: Expose view functions for simulator calculations

## Metadata Storage
- On-chain: Tier ID, mint timestamp, package ID
- Off-chain (IPFS): Full metadata JSON with all attributes
- Image files: Already available in assets folder

## Security Considerations
1. Reentrancy protection for minting
2. Overflow protection in reward calculations
3. Access control for phase 2 year adjustment
4. Price manipulation protection

## Gas Optimization
1. Pack struct data efficiently
2. Use events for off-chain tracking
3. Batch operations where possible
4. Minimize storage updates