# 🎨 FishRewards NFT Visual Style Guide

## NFT Certificate Design Specifications

This guide provides specific visual design specifications for each of the 6 FishRewards NFT certificate tiers, ensuring consistency with the overall brand while creating a clear progression of value and prestige.

---

## 🌊 Tier 1: Shoreline Drift (COD-FISH)

### Visual Theme
**"Beginning Your Journey"** - Light, welcoming, and approachable

### Color Scheme
```css
Primary: #4ECDC4 /* Turquoise */
Secondary: #F7FFF7 /* Soft White */
Accent: #A8E6CF /* Mint Green */
Background Gradient: linear-gradient(135deg, #E0F7FA 0%, #B2EBF2 100%)
```

### Design Elements
- **Pattern**: Gentle wave patterns at 20% opacity
- **Border**: 2px solid with 10% opacity of primary color
- **Corner Radius**: 12px (softer, friendlier)
- **Shadow**: `0 2px 4px rgba(0, 0, 0, 0.05)`

### SVG Structure
```xml
<svg viewBox="0 0 400 600">
  <!-- Background -->
  <rect fill="url(#shorelineGradient)" width="400" height="600" rx="12"/>
  
  <!-- Wave Pattern -->
  <path d="..." fill="#4ECDC4" opacity="0.2"/>
  
  <!-- Cod Fish Icon -->
  <g transform="translate(200, 200)">
    <!-- Simple, friendly cod fish design -->
  </g>
  
  <!-- Tier Badge -->
  <circle cx="350" cy="50" r="30" fill="#4ECDC4"/>
  <text x="350" y="55" text-anchor="middle" fill="white">1</text>
  
  <!-- Title -->
  <text x="200" y="450" text-anchor="middle" font-size="24" fill="#2C3E50">
    SHORELINE DRIFT
  </text>
</svg>
```

---

## 🎣 Tier 2: Tide Catch (TUNA-FISH)

### Visual Theme
**"Gaining Momentum"** - Dynamic, energetic progression

### Color Scheme
```css
Primary: #44A1A0 /* Teal */
Secondary: #E6F9FF /* Ice Blue */
Accent: #5DADE2 /* Sky Blue */
Background Gradient: linear-gradient(135deg, #44A1A0 0%, #5DADE2 100%)
```

### Design Elements
- **Pattern**: Dynamic wave curves with slight animation potential
- **Border**: 3px solid with gradient border
- **Corner Radius**: 14px
- **Shadow**: `0 4px 8px rgba(0, 0, 0, 0.08)`
- **Shimmer Effect**: Subtle metallic sheen

### Visual Enhancements
- Increased contrast from Tier 1
- More detailed fish illustration
- Wave patterns show movement
- Subtle particle effects in background

---

## 🐠 Tier 3: Reef Bounty (KING-FISH)

### Visual Theme
**"Hidden Treasures"** - Rich, rewarding, abundant

### Color Scheme
```css
Primary: #2F6690 /* Deep Blue */
Secondary: #FFE66D /* Golden Yellow */
Accent: #FF6B6B /* Coral Red */
Background Gradient: linear-gradient(135deg, #2F6690 0%, #1E88E5 100%)
```

### Design Elements
- **Pattern**: Coral reef silhouettes
- **Border**: 4px solid with gold accent highlights
- **Corner Radius**: 16px
- **Shadow**: `0 6px 12px rgba(0, 0, 0, 0.1)`
- **Special Effect**: Gold foil texture on accents

### Unique Features
- Treasure chest icon integration
- Coral pattern background at 15% opacity
- Gold accent lines
- "Achievement unlocked" visual language

---

## ⚓ Tier 4: Seafarer's Crest (OPAH-FISH)

### Visual Theme
**"Experienced Navigator"** - Professional, accomplished, trusted

### Color Scheme
```css
Primary: #1E3A5F /* Navy Blue */
Secondary: #FF6B6B /* Sunset Red */
Accent: #F8F9FA /* Pure White */
Background Gradient: linear-gradient(135deg, #1E3A5F 0%, #2C5282 100%)
```

### Design Elements
- **Pattern**: Nautical rope borders
- **Border**: 5px solid with metallic silver finish
- **Corner Radius**: 18px
- **Shadow**: `0 8px 16px rgba(0, 0, 0, 0.12)`
- **Badge Design**: Crest/shield shape overlay

### Premium Features
- Embossed effect on fish illustration
- Compass rose watermark
- Metallic accents
- Certificate-style typography

---

## 🚢 Tier 5: Ocean Harvest (SAIL-FISH)

### Visual Theme
**"Master of the Seas"** - Elegant, powerful, sophisticated

### Color Scheme
```css
Primary: #0B2545 /* Midnight Blue */
Secondary: #8B5CF6 /* Royal Purple */
Accent: #C0C0C0 /* Silver */
Background Gradient: linear-gradient(135deg, #0B2545 0%, #13315C 50%, #8B5CF6 100%)
```

### Design Elements
- **Pattern**: Abstract ocean depths
- **Border**: 6px solid with platinum-style gradient
- **Corner Radius**: 20px
- **Shadow**: `0 12px 24px rgba(0, 0, 0, 0.15)`
- **Premium Effect**: Holographic shimmer

### Luxury Details
- Multi-layered depth effect
- Sailfish in dynamic pose
- Aurora-like color shifts
- Premium material simulation

---

## 👑 Tier 6: Legacy Deepwater (LION-FISH)

### Visual Theme
**"Legendary Status"** - Exclusive, prestigious, timeless

### Color Scheme
```css
Primary: #051923 /* Abyss Black */
Secondary: #FFC107 /* Pure Gold */
Accent: #FFFFFF /* Diamond White */
Background Gradient: radial-gradient(ellipse at center, #1a1a1a 0%, #051923 100%)
```

### Design Elements
- **Pattern**: Minimal, focusing on negative space
- **Border**: 8px solid gold with ornate corners
- **Corner Radius**: 24px
- **Shadow**: `0 16px 32px rgba(0, 0, 0, 0.2)`
- **Exclusive Effect**: Gold leaf texture

### Ultra-Premium Features
- Gold foil stamping effect
- Minimal, refined design
- Crown or trident symbol
- "Legacy" typography treatment
- Animated gold particles
- Serial number placement

---

## 🎯 Implementation Guidelines

### Progressive Enhancement
Each tier should feel noticeably more premium than the previous:

1. **Complexity**: Increase detail and sophistication
2. **Effects**: Add more premium visual effects
3. **Animation**: Subtle to sophisticated animations
4. **Rarity Indicators**: Visual cues for scarcity

### Responsive Scaling
```css
/* Base NFT Container */
.nft-certificate {
  width: 100%;
  max-width: 400px;
  aspect-ratio: 2/3;
  position: relative;
  overflow: hidden;
}

/* Responsive Typography */
.nft-title {
  font-size: clamp(18px, 5vw, 24px);
}
```

### Animation Specifications

#### Tier 1-2: Subtle
```css
@keyframes gentleFloat {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-5px); }
}
```

#### Tier 3-4: Moderate
```css
@keyframes shimmer {
  0% { background-position: -200% center; }
  100% { background-position: 200% center; }
}
```

#### Tier 5-6: Premium
```css
@keyframes premiumGlow {
  0%, 100% { 
    box-shadow: 0 0 20px rgba(139, 92, 246, 0.5);
  }
  50% { 
    box-shadow: 0 0 40px rgba(139, 92, 246, 0.8);
  }
}
```

---

## 📐 Technical Specifications

### File Formats
- **Display**: SVG (vector, scalable)
- **Metadata Image**: PNG (2000x3000px)
- **Thumbnail**: WebP (400x600px)

### Color Profiles
- **Working Space**: sRGB
- **Export**: sRGB with embedded profile
- **Web Display**: CSS color management

### Performance Optimization
- **SVG**: Optimized paths, minimal nodes
- **PNG**: Lossless compression
- **WebP**: 85% quality for thumbnails

---

## 🔄 Version Control

Each NFT design should maintain version history:
- `shoreline-drift-v1.svg` (original)
- `shoreline-drift-v1.1.svg` (minor updates)
- `shoreline-drift-v2.svg` (major revision)

---

## 📋 Quality Checklist

Before finalizing any NFT design:

- [ ] Colors match brand specification
- [ ] Tier progression is visually clear
- [ ] Text is readable at all sizes
- [ ] Animations are smooth (60fps)
- [ ] File sizes are optimized
- [ ] Metadata is complete and accurate
- [ ] Design works in light/dark modes
- [ ] Accessibility standards met

---

*This visual style guide ensures each FishRewards NFT certificate maintains brand consistency while creating a clear value hierarchy that rewards collectors as they progress through the tiers.* 