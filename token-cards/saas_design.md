# Minimalist Modern (SaaS) — Token Card

## Identity
- **Mood**: Confident, sophisticated, alive
- **Best For**: SaaS products, tech startups, creative agencies, developer tools, modern portfolios
- **Avoid For**: Traditional/conservative brands, rustic businesses, children's products, retro-themed projects

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| Background | `#FAFAFA` | Warm off-white primary canvas |
| Foreground | `#0F172A` | Deep slate text + inverted section backgrounds |
| Accent | `#0052FF` | Electric blue — primary CTAs, links, highlights |
| Accent Secondary | `#4D7CFF` | Gradient endpoint for signature gradient |
| Muted | `#F1F5F9` | Secondary surfaces, card fills |
| Border | `#E2E8F0` | Subtle structural borders |
| Card | `#FFFFFF` | Elevated surfaces — pure white |

## Typography
- **Heading Font**: Calistoga (warm serif)
- **Body Font**: Inter (clean sans)
- **Key Weights**: 400, 500, 600, 700 + JetBrains Mono for labels
- **Display Scale**: text-[5.25rem] (84px)

## Geometry
- **Border Radius**: rounded-xl (12px) standard, rounded-2xl (16px) for large cards
- **Border Style**: 1px subtle slate borders; 2px gradient stroke for featured elements
- **Shadow System**: Layered elevation shadows (sm→xl) plus accent-tinted shadows (`rgba(0,82,255,0.25-0.35)`)

## Motion
- **Easing**: ease-out with custom [0.16, 1, 0.3, 1]
- **Speed**: 200ms interactions, 700ms entrances with stagger
- **Signature Motion**: Floating hero cards bob on sine wave; rotating ring at 60s; pulsing indicator dots; fade-up entrances

## Signature Elements (Bold Factor)
- Gradient text highlights via `bg-clip-text` (Electric Blue → Sky Blue)
- Inverted contrast sections (dark bg with dot pattern texture)
- Animated hero graphic with rotating ring + floating cards
- Gradient border effects (2px stroke via nested divs)
- Section label pill badges with pulsing accent dot + monospace text
- Asymmetric grid layouts (`1.1fr / 0.9fr`)

## Anti-Patterns
- Flat, shadowless cards (must have layered depth)
- Generic gray accent colors (accent must be vibrant Electric Blue)
- Static, lifeless layouts (micro-animations are essential)
- Single-font typography (dual-font system is core identity)
- Perfectly symmetrical grids (strategic asymmetry required)
- Heavy borders or visible grid lines

## Blend Compatibility
- **Family**: minimal
- **Blends Well With**: simple dark, material design, flat design
- **Conflicts With**: retro/90s, newsprint, terminal
