# Minimalist Dark — Token Card

## Identity
- **Mood**: Atmospheric, sophisticated, nocturnal
- **Best For**: Developer tools, premium apps, dark-mode dashboards, creative tools, music/media apps
- **Avoid For**: Children's products, print-oriented designs, healthcare, bright/sunny brands

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| Background | `#0A0A0F` | Deep slate (almost black, warmer) |
| Background Alt | `#12121A` | Slightly elevated surfaces |
| Foreground | `#FAFAFA` | Near-white text |
| Muted | `#1A1A24` | Card backgrounds, elevated surfaces |
| Muted Foreground | `#71717A` | Secondary text (zinc-500) |
| Accent | `#F59E0B` | Warm amber — interactive highlights |
| Card | `rgba(26,26,36,0.6)` | Semi-transparent glass cards |
| Border | `rgba(255,255,255,0.08)` | Very subtle (8% opacity) |

## Typography
- **Heading Font**: Space Grotesk
- **Body Font**: Inter
- **Key Weights**: 400, 500, 600, 700 + JetBrains Mono for labels
- **Display Scale**: text-7xl (96px)

## Geometry
- **Border Radius**: 6px sm, 8px md (default), 12px lg (cards), 16px xl
- **Border Style**: 1px at 8-15% white opacity; never heavy or prominent
- **Shadow System**: Ambient colored glows (`0 0 20-60px rgba(245,158,11, 0.15-0.25)`); dark elevation shadows with 0.3-0.4 opacity

## Motion
- **Easing**: ease-out
- **Speed**: 200-300ms
- **Signature Motion**: Ambient glow intensifies on hover; cards scale 1.02 with border brightening; buttons glow + scale 0.98 on active

## Signature Elements (Bold Factor)
- Layered darkness with 3+ distinct dark tones (#0A0A0F → #12121A → #1A1A24)
- Warm amber accent creating warm-cool contrast against slate
- Ambient glow effects (hero badge glow, button hover glow, background orbs)
- Glass-effect cards (semi-transparent bg + backdrop-blur-[8px])
- Extremely generous "darkspace" (py-24 to py-40)
- Atmospheric background with fixed ambient orbs + subtle noise texture

## Anti-Patterns
- Pure black backgrounds (use rich slate tones)
- Cold blue accents (must be warm amber)
- Harsh high-contrast borders
- Heavy visible borders (max 8-15% opacity)
- Bouncy or dramatic animations
- Flat shadowless surfaces (ambient glow is essential)

## Blend Compatibility
- **Family**: depth-based
- **Blends Well With**: saas/modern, cyberpunk, terminal
- **Conflicts With**: newsprint, swiss minimalist, organic-natural
