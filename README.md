# 🐟 FishRewards NFT - Sustainable Fishing Reward System

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Solidity](https://img.shields.io/badge/Solidity-0.8.19-363636?logo=solidity)
![ERC-721](https://img.shields.io/badge/Token-ERC721-orange)
![Status](https://img.shields.io/badge/Status-In%20Development-yellow)

## 🌊 Overview

FishRewards NFT is a revolutionary blockchain-based reward system that incentivizes sustainable fishing practices through tiered NFT certificates. Each NFT represents a unique fishing achievement level and provides holders with weighted rewards from a carefully managed token distribution pool.

### 🎯 Key Features

- **6 Tiered NFT Certificates** - From beginner to expert fishing achievements
- **Dynamic Pricing Algorithm** - Prices increase based on minting activity
- **Weighted Reward Distribution** - Higher tiers earn proportionally more rewards
- **Sustainable Tokenomics** - 10-year halving schedule with 5.49B FISH tokens
- **On-chain Verification** - Fully transparent and immutable reward calculations
- **Beautiful SVG Artwork** - Unique visual design for each certificate tier

## 📊 Tier Structure

| Tier | NFT Name | ID | Weight | Start Price | Max Supply | Phase 2x | Price Increment |
|------|----------|-----|---------|-------------|------------|----------|-----------------|
| 1 | 🌊 Shoreline Drift | cod-fish | 0.50x | $250 | 12,500 | 2x | $25/100 mints |
| 2 | 🎣 Tide Catch | tuna-fish | 0.75x | $500 | 10,000 | 3x | $50/100 mints |
| 3 | 🐠 Reef Bounty | king-fish | 1.25x | $1,000 | 5,000 | 5x | $100/100 mints |
| 4 | ⚓ Seafarer's Crest | opah-fish | 1.50x | $2,000 | 2,500 | 6x | $200/100 mints |
| 5 | 🚢 Ocean Harvest | sail-fish | 1.75x | $5,000 | 1,250 | 7x | $500/100 mints |
| 6 | 👑 Legacy Deepwater | lion-fish | 2.00x | $10,000 | 625 | 8x | $1,000/100 mints |

## 🏗️ Architecture

```
fishrewards-nft/
├── contracts/
│   ├── FishCertNFT.sol         # Main NFT contract
│   ├── architecture-diagram.md  # System architecture
│   └── metadata-flow-diagram.svg
├── metadata/
│   ├── [tier]-nft.json         # NFT metadata files (ERC-721)
│   └── [tier].json             # Simplified metadata
├── images/
│   └── [tier].svg              # NFT artwork files
└── documentation/
    ├── IMPLEMENTATION_GUIDE.md  # Engineering guide
    ├── tokenomics-documentation.md
    └── smart-contract-structure.md
```

## 🚀 Quick Start

### Prerequisites

- Node.js >= 16.0.0
- npm or yarn
- Hardhat or Foundry
- MetaMask or compatible Web3 wallet

### Installation

```bash
# Clone the repository
git clone https://github.com/CryptoJym/fishrewards-nft.git
cd fishrewards-nft

# Install dependencies (when package.json is added)
npm install

# Compile contracts
npx hardhat compile
```

### Deploy Contract

```bash
# Deploy to local network
npx hardhat run scripts/deploy.js --network localhost

# Deploy to testnet (e.g., Goerli)
npx hardhat run scripts/deploy.js --network goerli

# Deploy to mainnet
npx hardhat run scripts/deploy.js --network mainnet
```

## 💰 Tokenomics & Rewards

### Distribution Model

The FishRewards system distributes 5.49 billion FISH tokens over 10 years with a halving mechanism:

| Year | Pool Size | Daily Distribution |
|------|-----------|-------------------|
| 1 | 2.745B (50%) | ~7.52M FISH |
| 2 | 1.373B (25%) | ~3.76M FISH |
| 3 | 686M (12.5%) | ~1.88M FISH |
| ... | Continues halving | ... |

### Reward Calculation

```javascript
// Daily rewards for a user
userDailyRewards = (userWeightedStake / globalWeightedStake) × dailyPool

// Weighted stake calculation
weightedStake = quantity × weightingFactor × phase2Multiplier
```

### Dynamic Pricing Formula

```javascript
currentPrice = startingPrice + (floor(mintedCount/100) × incrementAmount)
```

## 📋 Smart Contract Interface

### Core Functions

```solidity
// Minting
function mintFishCert(uint256 packageId, uint256 quantity) external payable

// View Functions
function getCurrentPrice(uint256 packageId) external view returns (uint256)
function getUserRewardProjection(address user) external view returns (uint256)
function getGlobalWeightedStake() external view returns (uint256)

// Admin Functions
function setPhase2Active(bool active) external onlyOwner
function withdrawFunds() external onlyOwner
```

### Events

```solidity
event FishCertMinted(address indexed user, uint256 indexed packageId, uint256 quantity)
event RewardsClaimed(address indexed user, uint256 amount)
event Phase2Activated(uint256 timestamp)
```

## 🧪 Testing

```bash
# Run all tests
npx hardhat test

# Run specific test file
npx hardhat test test/FishCertNFT.test.js

# Run with coverage
npx hardhat coverage
```

## 🔗 Integration

### Existing Contract Integration

The system integrates with the existing FishRewards purchase contract:

- **Address**: `0x43bf526abad45cfae684e706cdbec1cf52a91646`
- **Function**: `mintCountPerPackage(uint256 packageId)`
- **Package IDs**: 1-6 (matching tier order)

### Frontend Integration

```javascript
// Example: Check current price
const price = await contract.getCurrentPrice(1); // Shoreline Drift

// Example: Mint NFT
await contract.mintFishCert(1, 2, { value: price * 2 });

// Example: Check rewards
const rewards = await contract.getUserRewardProjection(userAddress);
```

## 📚 Documentation

- 📖 [Implementation Guide](./IMPLEMENTATION_GUIDE.md) - Detailed engineering instructions
- 💹 [Tokenomics Documentation](./tokenomics-documentation.md) - Complete economic model
- 🏛️ [Smart Contract Structure](./smart-contract-structure.md) - Contract architecture
- 📊 [Clarification Table](./clarification-table.md) - Feature comparison
- 🔄 [Reward Calculation Diagram](./reward-calculation-diagram.svg) - Visual flow

## ⚠️ Important Clarifications

> **Note**: The "50%-200% reward rates" mentioned in marketing materials are **weighting factors** in the reward distribution algorithm, NOT fixed percentage returns. Actual returns depend on:
> - Total number of participants
> - Global weighted stake
> - FISH token market value
> - Time of participation

## 🎨 NFT Artwork

Each tier features unique SVG artwork representing different fishing achievements. View the artwork files in the `images/` directory.

## 🛠️ Development Roadmap

- [x] Complete technical documentation
- [x] Design NFT metadata structure
- [x] Create tier artwork
- [ ] Implement smart contracts
- [ ] Deploy to testnet
- [ ] Security audit
- [ ] Frontend development
- [ ] Mainnet deployment
- [ ] IPFS integration for metadata

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔒 Security

- All smart contracts will undergo professional auditing before mainnet deployment
- Bug bounty program to be announced
- Please report security vulnerabilities to: security@fishrewards.app

## 📞 Contact & Support

- **GitHub Issues**: [Create an issue](https://github.com/CryptoJym/fishrewards-nft/issues)
- **Documentation**: [Wiki](https://github.com/CryptoJym/fishrewards-nft/wiki)
- **Community**: Join our Discord and Twitter communities

## 🙏 Acknowledgments

- FishRewards.app team for the original concept
- OpenZeppelin for secure contract libraries
- The sustainable fishing community

---

<p align="center">
  <strong>🐟 Building a sustainable future for fishing, one NFT at a time 🌊</strong>
</p>

<p align="center">
  Made with ❤️ by the FishRewards Team
</p>