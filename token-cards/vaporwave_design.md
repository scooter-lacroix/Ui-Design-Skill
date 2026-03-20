# Vaporwave / Outrun — Token Card

## Identity
- **Mood**: Nostalgic-futuristic, synthetic, neon-drenched
- **Best For**: Music/entertainment, indie games, retro-themed portfolios, nightlife brands, creative agencies
- **Avoid For**: Corporate/enterprise, healthcare, finance, accessibility-critical apps, minimalist brands

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| Background | `#090014` | Near-black with purple tint (the void) |
| Foreground | `#E0E0E0` | Light silver-gray (chrome text) |
| Primary | `#FF00FF` | Hot magenta — THE hero color |
| Secondary | `#00FFFF` | Electric cyan — links, focus, secondary borders |
| Tertiary | `#FF9900` | Sunset orange — sparingly for highlights |
| Card BG | `rgba(26,16,60,0.8)` | Semi-transparent deep purple |
| Border | `#2D1B4E` | Muted dark purple (default) |

## Typography
- **Heading Font**: Orbitron (geometric, wide, futuristic)
- **Body Font**: Share Tech Mono (monospace terminal)
- **Key Weights**: 400, 500, 700, 900
- **Display Scale**: text-9xl (128px)

## Geometry
- **Border Radius**: 0px primary (aggressively angular); `rounded-full` for dots only
- **Border Style**: 2px standard, 4px emphasis; neon cyan/magenta borders on interactive elements
- **Shadow System**: Colored neon glows only — `shadow-[0_0_10-50px_#FF00FF]` and `shadow-[0_0_20px_#00FFFF]`; no dark drop shadows

## Motion
- **Easing**: ease-linear (fast, unnatural, digital)
- **Speed**: 200ms (snappy, mechanical)
- **Signature Motion**: Buttons un-skew on hover with glow explosion; icons rotate 45°→90°; 2-3x glow amplification on interactive hover

## Signature Elements (Bold Factor)
- Aggressive skewing (`-skew-x-12`) on buttons/badges that un-skew on hover
- Global CRT scanline overlay + RGB chromatic aberration
- Perspective grid backgrounds receding to horizon
- Gradient text fills (sunset: orange → magenta → cyan via `bg-clip-text`)
- Rotating diamond icon containers (`rotate-45` → `rotate-90`)
- Terminal window chrome (title bars with colored dots)

## Anti-Patterns
- Flat, shadowless design (everything must glow)
- Minimalist restraint or muted colors (100% saturation required)
- Soft organic shapes or rounded corners
- Corporate or professional aesthetic
- Subtle hover states (interactions must be theatrical)
- Dark drop shadows (use colored neon glows instead)

## Blend Compatibility
- **Family**: maximalist
- **Blends Well With**: cyberpunk, terminal, retro/90s
- **Conflicts With**: swiss minimalist, organic-natural, monochrome
