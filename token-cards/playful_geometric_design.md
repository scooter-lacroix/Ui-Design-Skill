# Playful Geometric — Token Card

## Identity
- **Mood**: Friendly, tactile, energetic
- **Best For**: Children's products, creative tools, education platforms, startups, event sites
- **Avoid For**: Financial services, legal/medical, luxury brands, enterprise B2B

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| Background | `#FFFDF5` | Warm cream/off-white (paper feel) |
| Foreground | `#1E293B` | Slate 800 (softer than black) |
| Accent | `#8B5CF6` | Vivid violet (primary brand) |
| Secondary | `#F472B6` | Hot pink (playful pop) |
| Tertiary | `#FBBF24` | Amber/yellow (optimism) |
| Quaternary | `#34D399` | Emerald/mint (freshness) |
| Border | `#E2E8F0` | Slate 200 |

## Typography
- **Heading Font**: Outfit
- **Body Font**: Plus Jakarta Sans
- **Key Weights**: 400, 500, 700, 800
- **Display Scale**: 1.25 ratio (Major Third)

## Geometry
- **Border Radius**: 8px sm, 16px md, 24px lg, 9999px full; plus asymmetric "blob" shapes
- **Border Style**: 2px chunky borders by default; dark `#1E293B` outlines on colored elements
- **Shadow System**: Hard offset shadows with zero blur (`4px 4px 0px #1E293B`); extends on hover, shrinks on active

## Motion
- **Easing**: cubic-bezier(0.34, 1.56, 0.64, 1) — bouncy overshoot
- **Speed**: 300ms
- **Signature Motion**: Elements pop in with bounce (scale 0→1); wiggle keyframe on hover; cards rotate -1deg + scale 1.02

## Signature Elements (Bold Factor)
- Hard "pop" shadows (no blur, solid offset) on buttons and cards
- Primitive shape decorations (circles, triangles, squiggles) behind content
- Pattern fills (polka dots, grid lines, diagonal stripes) inside shapes
- Confetti-colored accent rotation (violet, pink, yellow, mint)
- Icons always enclosed in colored shapes, never floating alone
- Dashed SVG connectors between feature cards

## Anti-Patterns
- Soft drop shadows or glassmorphism
- Monochrome or muted palettes
- Corporate minimalist spacing
- Thin, subtle borders
- Static, grid-locked layouts without decorative elements
- Smooth/gentle easing (must feel bouncy)

## Blend Compatibility
- **Family**: maximalist
- **Blends Well With**: retro/90s, neo-brutalism, bold typography
- **Conflicts With**: swiss minimalist, monochrome, luxury
