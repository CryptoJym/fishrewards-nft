# 🐟 FishRewards NFT Branding Guide

## Table of Contents
1. [Brand Overview](#brand-overview)
2. [Color Palette](#color-palette)
3. [Typography](#typography)
4. [Visual Language](#visual-language)
5. [Logo & Icons](#logo--icons)
6. [NFT Tier Branding](#nft-tier-branding)
7. [UI Components](#ui-components)
8. [Tone of Voice](#tone-of-voice)
9. [Design Principles](#design-principles)
10. [Implementation Guidelines](#implementation-guidelines)

---

## Brand Overview

### Mission Statement
FishRewards NFT combines sustainable fishing practices with blockchain technology to create a revolutionary digital loyalty rewards ecosystem that supports global food security while rewarding participants.

### Brand Personality
- **Innovative**: Pioneering blockchain solutions for real-world challenges
- **Sustainable**: Committed to environmental and economic sustainability
- **Trustworthy**: Transparent, secure, and reliable
- **Inclusive**: Accessible to fishers and investors globally
- **Premium**: High-quality design that reflects value

### Key Differentiators
- First-of-its-kind fishing rewards ecosystem
- UN SDG alignment for global impact
- Sophisticated tokenomics with real utility
- Premium tier system with meaningful progression

---

## Color Palette

### Primary Colors

#### Deep Ocean Blue
- **Hex**: #0C2730
- **RGB**: rgb(12, 39, 48)
- **Usage**: Primary backgrounds, headers, premium elements
- **Meaning**: Depth, trust, ocean connection

#### Aqua Mint
- **Hex**: #94F3E4
- **RGB**: rgb(148, 243, 228)
- **Usage**: Accents, highlights, CTAs, success states
- **Meaning**: Growth, rewards, vitality

### Secondary Colors

#### Dark Navy
- **Hex**: #09090B
- **RGB**: rgb(9, 9, 11)
- **Usage**: Dark mode backgrounds, text
- **Meaning**: Sophistication, depth

#### Pearl White
- **Hex**: #E5F6F5
- **RGB**: rgb(229, 246, 245)
- **Usage**: Light text, clean backgrounds
- **Meaning**: Purity, clarity

#### Ocean Teal
- **Hex**: #106F6C
- **RGB**: rgb(16, 111, 108)
- **Usage**: Gradients, mid-tones
- **Meaning**: Balance, harmony

### Gradient Combinations

#### Primary Gradient
```css
background: linear-gradient(to right bottom, #0C2730, #106F6C);
```

#### Accent Gradient
```css
background: linear-gradient(to right bottom, #0D2832, rgba(148, 243, 228, 0.1));
```

### Tier-Specific Colors

| Tier | Primary Color | Accent Color | Meaning |
|------|--------------|--------------|---------|
| Shoreline Drift | #4ECDC4 | #F7FFF7 | Beginner, fresh start |
| Tide Catch | #44A1A0 | #E6F9FF | Progress, momentum |
| Reef Bounty | #2F6690 | #FFE66D | Achievement, treasure |
| Seafarer's Crest | #1E3A5F | #FF6B6B | Experience, mastery |
| Ocean Harvest | #0B2545 | #8B5CF6 | Excellence, abundance |
| Legacy Deepwater | #051923 | #FFC107 | Prestige, legacy |

---

## Typography

### Font Stack
```css
font-family: -apple-system, BlinkMacSystemFont, "Inter", "Segoe UI", "Roboto", sans-serif;
```

### Font Hierarchy

#### Display (Hero Headers)
- **Font**: Inter Bold
- **Size**: 48-72px
- **Weight**: 700-800
- **Line Height**: 1.1
- **Letter Spacing**: -0.02em

#### H1 - Page Titles
- **Size**: 36-48px
- **Weight**: 700
- **Line Height**: 1.2
- **Letter Spacing**: -0.01em

#### H2 - Section Headers
- **Size**: 28-32px
- **Weight**: 600
- **Line Height**: 1.3

#### H3 - Subsections
- **Size**: 20-24px
- **Weight**: 600
- **Line Height**: 1.4

#### Body Text
- **Size**: 16-18px
- **Weight**: 400
- **Line Height**: 1.6
- **Color**: rgba(229, 246, 245, 0.9)

#### Small Text / Captions
- **Size**: 14px
- **Weight**: 400
- **Line Height**: 1.5
- **Color**: rgba(229, 246, 245, 0.8)

---

## Visual Language

### Design Elements

#### Wave Patterns
- Subtle wave SVG patterns for backgrounds
- Represents ocean connection
- Use sparingly to avoid visual clutter

#### Depth Layers
- Use shadows and overlays to create depth
- Glass-morphism effects for cards
- Example: `backdrop-filter: blur(10px)`

#### Geometric Fish Shapes
- Abstract, geometric representations of fish
- Used in icons and decorative elements
- Maintain consistency with tier themes

### Spacing System

Based on 8px grid:
- **xs**: 4px
- **sm**: 8px
- **md**: 16px
- **lg**: 24px
- **xl**: 32px
- **2xl**: 48px
- **3xl**: 64px

---

## Logo & Icons

### Primary Logo
- Geometric fish symbol combined with "FISH" wordmark
- Minimum size: 120px width
- Clear space: 16px on all sides

### Icon Style
- **Line Weight**: 2px
- **Corner Radius**: 2px
- **Style**: Outlined, minimal
- **Grid**: 24x24px base

### Tier Icons
Each tier should have a unique icon:
- **Shoreline Drift**: Simple wave
- **Tide Catch**: Fishing hook
- **Reef Bounty**: Coral/treasure chest
- **Seafarer's Crest**: Anchor/compass
- **Ocean Harvest**: Ship/net
- **Legacy Deepwater**: Trident/crown

---

## NFT Tier Branding

### Visual Hierarchy
Each tier should feel progressively more premium:

1. **Shoreline Drift**
   - Light, airy design
   - Soft gradients
   - Simple patterns

2. **Tide Catch**
   - Increased contrast
   - More dynamic elements
   - Wave motifs

3. **Reef Bounty**
   - Rich colors
   - Treasure/abundance themes
   - Coral patterns

4. **Seafarer's Crest**
   - Nautical elements
   - Badge-like design
   - Professional feel

5. **Ocean Harvest**
   - Bold, confident design
   - Premium materials feel
   - Sophisticated patterns

6. **Legacy Deepwater**
   - Luxurious, exclusive
   - Gold accents
   - Minimal, refined design

---

## UI Components

### Buttons

#### Primary Button
```css
background: linear-gradient(135deg, #94F3E4 0%, #106F6C 100%);
border-radius: 8px;
padding: 12px 24px;
font-weight: 600;
text-transform: uppercase;
letter-spacing: 0.05em;
transition: all 0.3s ease;
```

#### Secondary Button
```css
background: rgba(255, 255, 255, 0.05);
border: 1px solid rgba(148, 243, 228, 0.3);
border-radius: 8px;
padding: 12px 24px;
```

### Cards
```css
background: rgba(255, 255, 255, 0.05);
border: 1px solid rgba(255, 255, 255, 0.1);
border-radius: 16px;
padding: 24px;
backdrop-filter: blur(10px);
box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
```

### Input Fields
```css
background: rgba(255, 255, 255, 0.05);
border: 1px solid rgba(255, 255, 255, 0.2);
border-radius: 8px;
padding: 12px 16px;
transition: border-color 0.3s ease;
```

---

## Tone of Voice

### Brand Voice Attributes
- **Professional** yet approachable
- **Confident** without being arrogant
- **Educational** but not condescending
- **Inspiring** and forward-thinking
- **Clear** and transparent

### Messaging Guidelines

#### Do's:
- Use maritime and fishing metaphors appropriately
- Emphasize community and sustainability
- Be transparent about tokenomics
- Celebrate achievements and milestones
- Use active voice

#### Don'ts:
- Over-promise returns
- Use complex jargon without explanation
- Make unsubstantiated claims
- Use aggressive sales tactics
- Ignore environmental impact

### Example Copy:
- **Hero**: "Navigate Your Digital Fishing Rewards Journey"
- **CTA**: "Cast Your Line into the Future"
- **Value Prop**: "Where Sustainable Fishing Meets Blockchain Innovation"

---

## Design Principles

### 1. Ocean-Inspired Depth
Create visual hierarchy through layers, like ocean depths

### 2. Fluid Motion
Smooth transitions and animations that mimic water movement

### 3. Sustainable Luxury
Premium feel that doesn't compromise environmental values

### 4. Clear Navigation
Like navigating open waters - always know where you are

### 5. Reward Visualization
Make rewards tangible and exciting through visual feedback

### 6. Progressive Disclosure
Reveal complexity gradually, like diving deeper

---

## Implementation Guidelines

### Responsive Design
- Mobile-first approach
- Breakpoints: 320px, 768px, 1024px, 1440px
- Touch-friendly interactions (min 44px tap targets)

### Dark Mode First
- Primary design in dark mode
- Light mode as secondary option
- Ensure sufficient contrast ratios (WCAG AA)

### Animation Guidelines
- Use subtle animations (max 0.3s duration)
- Ease-in-out timing functions
- Reduce motion for accessibility

### Performance
- Optimize images (WebP format)
- Lazy load below-fold content
- Minimize gradient complexity on mobile

### Accessibility
- WCAG AA compliance minimum
- Semantic HTML structure
- Keyboard navigation support
- Screen reader optimization

### File Naming Convention
- Lowercase with hyphens
- Descriptive names
- Version control: `element-state-version.svg`
- Example: `tier-icon-shoreline-v2.svg`

---

## Brand Application Examples

### Website Header
```css
.header {
  background: linear-gradient(180deg, #0C2730 0%, rgba(12, 39, 48, 0.8) 100%);
  backdrop-filter: blur(20px);
  border-bottom: 1px solid rgba(148, 243, 228, 0.1);
}
```

### NFT Card Design
```css
.nft-card {
  background: linear-gradient(135deg, rgba(255, 255, 255, 0.05) 0%, rgba(255, 255, 255, 0.02) 100%);
  border: 1px solid rgba(148, 243, 228, 0.2);
  border-radius: 20px;
  overflow: hidden;
  position: relative;
}

.nft-card::before {
  content: '';
  position: absolute;
  top: -2px;
  left: -2px;
  right: -2px;
  bottom: -2px;
  background: linear-gradient(45deg, #94F3E4, #106F6C);
  border-radius: 20px;
  opacity: 0;
  transition: opacity 0.3s ease;
  z-index: -1;
}

.nft-card:hover::before {
  opacity: 1;
}
```

---

## Version Control
- **Version**: 1.0
- **Last Updated**: December 2024
- **Approved By**: FishRewards Design Team

---

## Contact
For brand-related questions or asset requests:
- **Email**: brand@fishrewards.app
- **Design System**: [Figma Link]
- **Asset Library**: [Brand Portal URL]

---

*This branding guide is a living document and will be updated as the FishRewards NFT ecosystem evolves.* 