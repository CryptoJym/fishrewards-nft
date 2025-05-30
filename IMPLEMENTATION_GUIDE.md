# FISH CERT NFT Implementation Guide

## Overview
This guide provides the complete technical specification for implementing FISH CERT NFTs based on the working fishrewards.app simulator.

## Key Discoveries from Code Analysis

### 1. Reward Rate Clarification
The "50%-200% reward rates" from your table are actually implemented as **weighting factors** (0.50 to 2.00) in the reward distribution algorithm, NOT direct percentage returns. 

### 2. Actual Token Distribution
- Total Pool: 5.49 billion FISH tokens
- Distribution: 10 years with yearly halving
- Year 1: 2.745B tokens (50% of total)
- Year 2: 1.3725B tokens (25% of total)
- And so on...

### 3. Phase 2 Multiplier Event
- Default trigger: Year 5
- Multiplies CERT quantities by 2x-8x based on tier
- Dramatically increases reward shares

## File Structure Created

```
fishrewards-nft/
├── tokenomics-documentation.md     # Complete algorithm breakdown
├── smart-contract-structure.md     # Contract architecture
├── metadata/                       # NFT metadata files
│   ├── shoreline-drift-nft.json   # Tier 1 (cod-fish)
│   ├── tide-catch-nft.json        # Tier 2 (tuna-fish) 
│   ├── reef-bounty-nft.json       # Tier 3 (king-fish)
│   ├── seafarers-crest-nft.json   # Tier 4 (opah-fish)
│   ├── ocean-harvest-nft.json     # Tier 5 (sail-fish)
│   └── legacy-deepwater-nft.json  # Tier 6 (lion-fish)
└── IMPLEMENTATION_GUIDE.md         # This file
```

## Critical Implementation Details

### Package ID Mapping
```
Package 1 = Shoreline Drift (cod-fish)
Package 2 = Tide Catch (tuna-fish)
Package 3 = Reef Bounty (king-fish)
Package 4 = Seafarer's Crest (opah-fish)
Package 5 = Ocean Harvest (sail-fish)
Package 6 = Legacy Deepwater (lion-fish)
```

### Pricing Formula
```javascript
currentPrice = startingPrice + (floor(mintedCount / 100) * incrementAmount)
```

### Reward Distribution Formula
```javascript
userDailyRewards = (userWeightedStake / globalWeightedStake) * dailyPool

where:
- userWeightedStake = Σ(userQty * weightingFactor * phase2Multiplier)
- globalWeightedStake = Σ(globalQty * weightingFactor * phase2Multiplier)
- dailyPool = yearlyPool / 365
```

## Smart Contract Requirements

### Essential Functions
1. `mint(packageId, quantity)` - With dynamic pricing
2. `getCurrentPrice(packageId)` - Real-time price calculation
3. `calculateRewards(user, year)` - Complex weighted distribution
4. `applyPhase2()` - Multiplier activation (admin only)
5. `claimRewards()` - User reward claiming

### View Functions for UI
1. `getMintedPerPackage(packageId)`
2. `getUserCertsByPackage(user, packageId)`
3. `calculateBreakEven(user)`
4. `getYearlyProjections(user)`

## Image Asset References
All images are in `/assets/` folder:
- Shoreline Drift: `COD FISH CERT V1.svg`
- Tide Catch: `TUNA FISH V1.svg`
- Reef Bounty: `KING FISH V1.svg`
- Seafarer's Crest: `OPAH FISH.png`
- Ocean Harvest: `SAIL-FISH.png`
- Legacy Deepwater: `LION-FISH.png`

## Integration with Existing Contract
The simulator pulls live data from: `0x43bf526abad45cfae684e706cdbec1cf52a91646`
- Uses `mintCountPerPackage(uint256)` function
- Package IDs 1-6 correspond to the tiers

## Next Steps for Engineers

1. **Review the metadata files** - They contain all tier-specific data in a smart contract-ready format
2. **Study the tokenomics documentation** - It explains the exact algorithms used
3. **Implement the smart contract structure** - Following the architecture provided
4. **Upload images to IPFS** - Update metadata files with actual IPFS hashes
5. **Match the simulator logic** - Ensure contract calculations match the JavaScript implementation

## Important Notes

- The system is NOT a simple "50% APY" return model
- It's a complex weighted stake distribution system
- Price increases are stepped, not linear
- Phase 2 multipliers are game-changing events
- Break-even calculations depend on token price assumptions

## Questions to Resolve

1. Will the NFTs be transferable?
2. Should unclaimed rewards accumulate indefinitely?
3. How will the Phase 2 trigger be controlled?
4. Will there be a governance mechanism?
5. Integration with the fish commodity backend?

---

All code references are from the actual fishrewards.app implementation. No assumptions or invented features have been added.