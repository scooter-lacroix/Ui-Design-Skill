# Neo-brutalism — Token Card

## Identity
- **Mood**: Loud, Rebellious, Playful
- **Best For**: Creative agencies, indie products, Gen-Z consumer apps, portfolios, punk/alternative brands, experimental tools
- **Avoid For**: Enterprise SaaS, luxury brands, finance/banking, healthcare, corporate B2B

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| Background | `#FFFDF5` (Cream/Off-White) | Paper-like canvas — mimics aged newsprint |
| Foreground | `#000000` (Pure Black) | ALL text, ALL borders, ALL shadows — no grays |
| Accent (Hot Red) | `#FF6B6B` | Primary buttons, CTAs, important badges |
| Secondary (Vivid Yellow) | `#FFD93D` | Secondary buttons, badges, footer backgrounds, input focus |
| Muted (Soft Violet) | `#C4B5FD` | Subtle card backgrounds, headers, decorative elements |
| White | `#FFFFFF` | Contrast panels, inverted button text, card surfaces |

## Typography
- **Heading Font**: Space Grotesk
- **Body Font**: Space Grotesk
- **Key Weights**: Black (900) for all headings, Bold (700) for body/buttons/labels, Medium (500) sparingly for emphasis only
- **Display Scale**: `text-8xl` to `text-9xl` (96-128px) for hero headlines with `tracking-tighter`

## Geometry
- **Border Radius**: Default `0px` (sharp angular corners); `rounded-full` ONLY for pill badges and circular stickers — no mid-range rounding
- **Border Style**: Mandatory `border-4` (4px solid black) on every visual element; `border-8` for major dividers
- **Shadow System**: Hard solid black shadows with zero blur, offset at 45 degrees — Small: `4px 4px 0 0 #000`, Medium: `8px 8px 0 0 #000`, Large: `12px 12px 0 0 #000`

## Motion
- **Easing**: `ease-linear` for mechanical feel, `ease-out` for natural deceleration — never `ease-in-out`
- **Speed**: `duration-100` (100ms) for buttons; `duration-200` to `duration-300` for cards and hovers
- **Signature Motion**: Button "push down" on click (`active:translate-x-[2px] active:translate-y-[2px]` covering its shadow); card lift on hover (`hover:-translate-y-2`) with shadow growth

## Signature Elements (Bold Factor)
- Hard black `border-4` on every visible element — if it has no border, it does not exist
- Offset solid black shadows (zero blur) at 45-degree angles for all cards, buttons, and containers
- Text stroke display typography (`-webkit-text-stroke: 2px black` with `color: transparent`) for hollow outlined headlines
- Sticker layering with slight rotations (`rotate-1`, `-rotate-2`, `rotate-3`) on text blocks, badges, and cards
- Color blocking — large sections alternate between cream, yellow, violet, and black for high-contrast rhythm
- Texture overlays on all backgrounds — halftone dots, grid patterns, noise textures, or geometric overlays
- Primitive shape motifs: 5-point stars, arrows, basic geometric shapes as decorative floaters

## Anti-Patterns
- Blur effects (`blur()`, `backdrop-blur`, soft `box-shadow` with blur radius) — all shadows must be hard-edged
- Opacity and transparency on backgrounds (except low-opacity texture overlays)
- Smooth gradients (`bg-gradient-to-r` fades) — use hard color stops or patterns instead
- Mid-range rounded corners (`rounded-md`, `rounded-lg`, `rounded-xl`) — only sharp or fully round
- Subtle grays (`#333`, `#666`, `#999`) — use pure black or a saturated color
- Slow, gentle animations (`ease-in-out`, long durations) — motion must be fast, snappy, and mechanical
- Large empty minimalist whitespace — fill space with texture, patterns, or decorative elements

## Blend Compatibility
- **Family**: maximalist
- **Blends Well With**: Retro Design, Playful Geometric, Hand-Drawn/Sketch
- **Conflicts With**: Corporate Trust, Luxury Design, Swiss Minimalist
