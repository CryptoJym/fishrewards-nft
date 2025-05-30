# FISH CERT: Presented vs Implemented Clarification

## Comparison Table

| Aspect | What Was Presented | What's Actually Implemented |
|--------|-------------------|---------------------------|
| **Reward Rates** | 50% - 200% | These are **weighting factors** (0.50 - 2.00) used in stake calculations |
| **Distribution** | "over 10 years" | Correct: 3,650 days with yearly halving pools |
| **Pricing** | $250 - $10,000 | Starting prices that increase by fixed amounts every 100 sold |
| **Supply** | Not specified | Specific limits: 625 - 12,500 per tier |
| **Returns** | Implied fixed % returns | Dynamic returns based on global participation |
| **Tier Names** | ✓ Correct | Matched in code (except "Ride Catch" typo → "Tide Catch") |

## Key Misunderstanding to Clarify

The "50%-200% rewards" are NOT annual percentage yields (APY). They are:
- **Weighting factors** that determine your share of the daily reward pool
- A 200% weighting factor (Legacy Deepwater) gets 4x the rewards of a 50% factor (Shoreline Drift)
- Actual returns depend on:
  - Total number of CERTs staked globally
  - Token price
  - Phase 2 multiplier activation
  - Year of distribution (pools halve yearly)

## Example Calculation

**Scenario**: You own 10 Reef Bounty CERTs
- Weighting Factor: 1.25 (NOT 125% APY)
- Your Weighted Stake: 10 × 1.25 = 12.5
- If Global Weighted Stake = 10,000
- Your Share: 12.5 ÷ 10,000 = 0.125%
- Daily Pool (Year 1): 7,520,547 FISH
- Your Daily Rewards: 9,401 FISH
- At $0.025/FISH: $235/day
- Cost: 10 × $1,000 = $10,000
- Break-even: 43 days (NOT guaranteed)

## Important Notes for Implementation

1. **Dynamic System**: Returns vary based on participation
2. **Not Fixed Returns**: The percentages are multipliers, not guaranteed yields
3. **Phase 2 Impact**: Multipliers (2x-8x) dramatically change economics
4. **Price Escalation**: Each tier gets more expensive as more are sold
5. **Halving Mechanism**: Available rewards decrease 50% each year

This is a **stake-weighted reward distribution system**, not a traditional fixed-yield investment product.