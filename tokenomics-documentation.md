# FISH CERT Tokenomics Documentation

## Based on fishrewards.app Implementation

### CERT Tier Structure

| Tier ID | Name | Weighting Factor | Starting Price | Max Supply | Phase 2 Multiplier | Price Increment |
|---------|------|------------------|----------------|------------|-------------------|-----------------|
| cod-fish | Shoreline Drift | 0.50 (50%) | $250 | 12,500 | 2x | $25 per 100 sold |
| tuna-fish | Tide Catch | 0.75 (75%) | $500 | 10,000 | 3x | $50 per 100 sold |
| king-fish | Reef Bounty | 1.25 (125%) | $1,000 | 5,000 | 5x | $100 per 100 sold |
| opah-fish | Seafarer's Crest | 1.50 (150%) | $2,000 | 2,500 | 6x | $200 per 100 sold |
| sail-fish | Ocean Harvest | 1.75 (175%) | $5,000 | 1,250 | 7x | $500 per 100 sold |
| lion-fish | Legacy Deepwater | 2.00 (200%) | $10,000 | 625 | 8x | $1,000 per 100 sold |

Note: The weighting factor is used in reward calculations, NOT the same as the "50%-200%" reward rates shown in your table.

## Key Algorithms

### 1. Price Calculation Algorithm
```javascript
// Every 100 CERTs sold, price increases by incrementAmount
function getCurrentPriceForCert(cert, globalCount) {
  const incrementsSoFar = Math.floor(globalCount / cert.incrementInterval); // incrementInterval = 100
  const base = getBasePriceForCert(cert);
  return base + (incrementsSoFar * cert.incrementAmount);
}
```

### 2. Yearly Pool Distribution
```javascript
const totalStakerPool = 5.49e9; // 5.49 billion tokens total

// Year 1: 50% of total pool
// Year 2: 25% of total pool  
// Year 3: 12.5% of total pool
// etc... (halving each year for 10 years)
```

### 3. Daily Reward Calculation
```javascript
// Formula: (userWeightedStake / globalWeightedStake) * dailyPool
// Where: weightedStake = quantity * weightingFactor * phase2Multiplier

// Phase 2 multipliers apply when phase2StartYear is reached (default: Year 5)
```

### 4. Break-even Calculation
```javascript
breakEvenDays = totalCost / (dailyTokens * tokenPrice)
```

## Metadata Structure for Smart Contracts

Each CERT needs the following on-chain data:
- `id`: string (e.g., "cod-fish")
- `name`: string
- `weightingFactor`: uint256 (scaled by 100, so 50% = 50)
- `basePrice`: uint256 (in wei or stable coin units)
- `incrementAmount`: uint256
- `incrementInterval`: uint256 (always 100)
- `maxSupply`: uint256
- `currentSupply`: uint256
- `phase2Multiplier`: uint256

## Image Assets Available
- COD FISH CERT V1.svg (Shoreline Drift)
- TUNA FISH V1.svg (Tide Catch)
- KING FISH V1.svg (Reef Bounty)
- OPAH FISH.png (Seafarer's Crest)
- SAIL-FISH.png (Ocean Harvest)
- LION-FISH.png (Legacy Deepwater)

## Phase 2 Multiplier Event
- Default trigger: Year 5 (adjustable in UI)
- Multiplies each CERT by its tier multiplier (2x-8x)
- Affects both user and global weighted stake calculations
- Dramatically increases harvesting rates

## Important Implementation Notes

1. **Weighted Stake System**: The reward distribution is based on weighted stake, not direct percentage returns
2. **Dynamic Pricing**: Prices increase every 100 CERTs sold per tier
3. **Total Pool**: 5.49 billion FISH tokens distributed over 10 years
4. **Halving Mechanism**: Available pool halves each year
5. **Live Minting Data**: System pulls on-chain data from contract `0x43bf526abad45cfae684e706cdbec1cf52a91646`