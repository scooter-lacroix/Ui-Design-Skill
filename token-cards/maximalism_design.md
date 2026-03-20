# Maximalism / Dopamine — Token Card

## Identity
- **Mood**: Euphoric, overwhelming, joyful
- **Best For**: Entertainment, gaming, Gen-Z brands, hyperpop/music, social platforms
- **Avoid For**: Corporate enterprise, healthcare, accessibility-sensitive, luxury/editorial

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| `background` | `#0D0D1A` | Deep cosmic purple-black void |
| `foreground` | `#FFFFFF` | Pure white maximum contrast |
| `accent` | `#FF3AF2` | Hot magenta — primary energy |
| `secondary` | `#00F5D4` | Electric cyan/teal |
| `tertiary` | `#FFE600` | Screaming yellow |
| `quaternary` | `#FF6B35` | Electric orange |
| `quinary` | `#7B2FFF` | Vivid purple |

## Typography
- **Heading Font**: Outfit (700–900) or Unbounded
- **Body Font**: DM Sans (400–700)
- **Key Weights**: 400, 500, 700, 800, 900
- **Display Scale**: text-7xl to text-9xl (72px–128px)

## Geometry
- **Border Radius**: rounded-full for buttons, rounded-3xl (24px) cards, rounded-none for sharp accent contrast
- **Border Style**: border-4 standard, border-8 heavy; mix solid + dashed + dotted within sections; always vibrant accent colors that clash
- **Shadow System**: Multi-layered — glow (`0 0 20px rgba(accent)`) + hard stacked offsets (`8px 8px 0 color1, 16px 16px 0 color2`) combined

## Motion
- **Easing**: ease-out default, `cubic-bezier(0.68, -0.55, 0.265, 1.55)` for bouncy overshoot
- **Speed**: 100–500ms interactions; 1–8s continuous animations (float, pulse, spin); 20s ultra-slow rotation
- **Signature Motion**: 30–40% of elements have continuous keyframe animation (float, wiggle, pulse-glow, spin-slow) + gradient text background-position shifting

## Signature Elements (Bold Factor)
- 5 distinct accent colors rotating per section via modulo arithmetic
- Floating decorative shapes (5–10 per section) with float/wiggle animations
- Multi-layered text shadows (2–4 layers in different accent colors)
- Pattern-on-pattern layering (minimum 2 overlapping textures per section: dots, stripes, checker, mesh)
- Clashing border colors (border accent always different from background accent)
- Massive background typography (12rem–20rem, 20% opacity, bleeding off edges)

## Anti-Patterns
- Neutral or muted borders (must be vibrant accent colors)
- Single-layer shadows (always 2–3 stacked layers minimum)
- Perfectly aligned symmetrical grids (use broken grid with offsets/rotations)
- Empty flat background sections (layer 2–3 patterns minimum)
- Monochromatic color scheme (must rotate all 5 accents)
- Thin borders (1–2px) — always border-4 or border-8

## Blend Compatibility
- **Family**: maximalist
- **Blends Well With**: Cyberpunk, Vaporwave, Neo-Brutalism
- **Conflicts With**: Luxury/Editorial, Swiss Minimalist, Monochrome
