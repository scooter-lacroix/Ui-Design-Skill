# Academia / Classical — Token Card

## Identity
- **Mood**: Scholarly Prestige
- **Best For**: Educational institutions, publishing houses, luxury brands, legal firms, heritage organizations, museums
- **Avoid For**: Consumer SaaS, gaming, youth-oriented products, fast-paced tech startups, playful brands

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| `background` | `#1C1714` | Deep Mahogany — page foundation |
| `backgroundAlt` | `#251E19` | Aged Oak — cards and elevated surfaces |
| `foreground` | `#E8DFD4` | Antique Parchment — primary text |
| `accent` | `#C9A962` | Polished Brass — all interactive elements |
| `accentSecondary` | `#8B2635` | Library Crimson — special emphasis only |
| `muted` | `#3D332B` | Worn Leather — disabled states, tertiary bg |
| `mutedForeground` | `#9C8B7A` | Faded Ink — secondary text, labels |
| `border` | `#4A3F35` | Wood Grain — subtle dividers |

## Typography
- **Heading Font**: `"Cormorant Garamond", serif`
- **Body Font**: `"Crimson Pro", serif`
- **Key Weights**: 400 (headings and body), 500-600 (Cinzel labels), italic for emphasis
- **Display Scale**: `text-7xl` (72px) for drop caps and display headings

## Geometry
- **Border Radius**: `4px` default; arch-top signature `40% 40% 0 0 / 20% 20% 0 0` on images
- **Border Style**: 1px solid wood-grain standard; 2px brass for decorative/focus
- **Shadow System**: Warm inset embossing for physical depth; hover glow in brass; no standard elevation shadows

## Motion
- **Easing**: `ease-out` only
- **Speed**: 150ms (fast) to 700ms (dramatic sepia-to-color reveal)
- **Signature Motion**: Sepia-to-color image transition over 700ms — aged photographs coming to life

## Signature Elements (Bold Factor)
- Arch-topped images using cathedral-arch border-radius (`40% 40% 0 0 / 20% 20% 0 0`)
- Brass gradient on all interactive elements (`linear-gradient(180deg, #D4B872, #C9A962, #B8953F)`)
- Roman numeral volume system ("Volume I", "Volume II") in Cinzel uppercase with brass color
- Brass drop cap introductions using Cinzel at `text-7xl` with engraved text-shadow
- Ornate corner flourishes (brass corner brackets via pseudo-elements) on hero and cards
- Ornate dividers with centered decorative glyph (gradient line fading through brass)
- Wax seal badges — crimson circular badges with radial gradient and inset shadows
- Fixed texture overlays: paper grain (3% noise) and vignette (radial gradient darkening edges)

## Anti-Patterns
- Sans-serif fonts anywhere (except accessibility overrides)
- Pure black (#000000) or pure white (#FFFFFF) — always use warm browns and creams
- Bright, saturated colors or modern gradients (brass metallic effect is the only exception)
- Sharp geometric shapes — favor organic curves and traditional architecture
- Playful animations, bounce, spring, or elastic effects
- Overusing crimson — reserved for special emphasis; brass should dominate

## Blend Compatibility
- **Family**: luxury
- **Blends Well With**: Minimal, Organic
- **Conflicts With**: Bauhaus, Bold Typography, Neo-Brutalist
