# FISH CERT NFT Implementation Files

## Overview
This repository contains the technical documentation and metadata files for implementing FISH CERT NFTs based on the actual fishrewards.app codebase analysis.

## Important Clarification
The "50%-200% reward rates" mentioned in the original specification are actually **weighting factors** in the reward distribution algorithm, NOT fixed percentage returns. See `clarification-table.md` for details.

## Repository Contents

### 📄 Documentation Files
- **`IMPLEMENTATION_GUIDE.md`** - Complete guide for engineers
- **`tokenomics-documentation.md`** - Detailed algorithm breakdown
- **`smart-contract-structure.md`** - Contract architecture specification
- **`clarification-table.md`** - Comparison of presented vs implemented features
- **`reward-calculation-diagram.svg`** - Visual flow of reward calculations

### 📋 Metadata Files
All NFT metadata files follow ERC-721 standards and include:
- `shoreline-drift-nft.json` - Tier 1 (Package ID: 1)
- `tide-catch-nft.json` - Tier 2 (Package ID: 2) 
- `reef-bounty-nft.json` - Tier 3 (Package ID: 3)
- `seafarers-crest-nft.json` - Tier 4 (Package ID: 4)
- `ocean-harvest-nft.json` - Tier 5 (Package ID: 5)
- `legacy-deepwater-nft.json` - Tier 6 (Package ID: 6)

## Key Implementation Details

### Tier Structure (From Code)
| Tier | ID | Weighting | Start Price | Max Supply | Phase 2x | Price +/100 |
|------|-----|-----------|-------------|------------|----------|-------------|
| Shoreline Drift | cod-fish | 0.50 | $250 | 12,500 | 2x | $25 |
| Tide Catch | tuna-fish | 0.75 | $500 | 10,000 | 3x | $50 |
| Reef Bounty | king-fish | 1.25 | $1,000 | 5,000 | 5x | $100 |
| Seafarer's Crest | opah-fish | 1.50 | $2,000 | 2,500 | 6x | $200 |
| Ocean Harvest | sail-fish | 1.75 | $5,000 | 1,250 | 7x | $500 |
| Legacy Deepwater | lion-fish | 2.00 | $10,000 | 625 | 8x | $1,000 |

### Core Algorithms

1. **Dynamic Pricing**
   ```
   currentPrice = startingPrice + (floor(mintedCount/100) × incrementAmount)
   ```

2. **Reward Distribution**
   ```
   userDailyRewards = (userWeightedStake / globalWeightedStake) × dailyPool
   weightedStake = quantity × weightingFactor × phase2Multiplier
   ```

3. **Yearly Pool Halving**
   - Total: 5.49 billion FISH tokens
   - Year 1: 50% (2.745B)
   - Year 2: 25% (1.373B)
   - Continues halving for 10 years

### Existing Contract Integration
- Address: `0x43bf526abad45cfae684e706cdbec1cf52a91646`
- Function: `mintCountPerPackage(uint256 packageId)`
- Package IDs: 1-6 (matching tier order)

## For Smart Contract Engineers

### Required Functions
1. **Minting System**
   - Dynamic pricing based on minted count
   - Package ID tracking (1-6)
   - Max supply enforcement

2. **Reward System**
   - Weighted stake calculations
   - Yearly pool distribution
   - Phase 2 multiplier logic

3. **View Functions**
   - Current price per tier
   - User holdings and projections
   - Global stake information

### Image Assets
Located in original project's `/assets/` folder:
- `COD FISH CERT V1.svg`
- `TUNA FISH V1.svg`
- `KING FISH V1.svg`
- `OPAH FISH.png`
- `SAIL-FISH.png`
- `LION-FISH.png`

## Next Steps

1. **Upload images to IPFS** and update metadata files with hashes
2. **Review all documentation** to understand the complex tokenomics
3. **Implement contracts** matching the JavaScript calculations exactly
4. **Test thoroughly** with the simulator as reference
5. **Ensure compatibility** with existing purchase contract

## Important Notes

⚠️ This is NOT a simple fixed-return system. It's a complex weighted distribution model where returns depend on global participation and token price assumptions.

---

All specifications are derived from actual fishrewards.app implementation. No features have been invented or assumed.