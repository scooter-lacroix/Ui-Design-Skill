# Bold Typography — Token Card

## Identity
- **Mood**: Editorial Confidence
- **Best For**: Design studios, creative portfolios, editorial publications, architecture firms, luxury editorial brands, manifesto-style marketing
- **Avoid For**: E-commerce marketplaces, dense dashboards, playful consumer apps, brands needing warm/friendly tone

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| `background` | `#0A0A0A` | Near-black — dark mode foundation |
| `foreground` | `#FAFAFA` | Warm white — primary text |
| `accent` | `#FF3D00` | Vermillion — headlines, CTAs, underlines only |
| `muted` | `#1A1A1A` | Subtle elevation — surface differentiation |
| `mutedForeground` | `#737373` | Secondary text — captions, metadata |
| `border` | `#262626` | Barely-there dividers |
| `card` | `#0F0F0F` | Slight card elevation from background |
| `ring` | `#FF3D00` | Focus states matching accent |

## Typography
- **Heading Font**: `"Inter Tight", "Inter", system-ui, sans-serif`
- **Body Font**: `"Inter Tight", "Inter", system-ui, sans-serif`
- **Key Weights**: 600 (semibold for buttons), 400 (body); scale contrast does the work
- **Display Scale**: `text-8xl` (128px) hero statements up to `text-9xl` (160px) decorative numbers

## Geometry
- **Border Radius**: `0px` everywhere — sharp edges only, no rounded corners
- **Border Style**: 1px thin precise dividers; 2px for accent underlines
- **Shadow System**: No traditional shadows — depth via layered type (muted text behind bright text) and accent underlines

## Motion
- **Easing**: `cubic-bezier(0.25, 0, 0, 1)` — fast-out, crisp stop
- **Speed**: 150ms (micro-interactions) to 500ms (image hover effects)
- **Signature Motion**: Animated underline scale (scale-x-0 to scale-x-100) on ghost buttons — underline as primary interactive affordance

## Signature Elements (Bold Factor)
- Extreme typographic scale contrast (6:1+ ratio between H1 and body text)
- Tight letter-spacing on display headlines (`-0.04em` to `-0.06em`), wide on labels (`0.1em` to `0.2em`)
- Text-only primary buttons with animated accent underlines, no background fill
- Underlines as the primary interactive affordance across all elements
- Subtle noise grain texture overlay at 1.5% opacity for tactile quality
- Decorative oversized numbers/text behind content at low opacity for depth
- Full-width horizontal rules and border separators instead of cards

## Anti-Patterns
- Rounded corners anywhere — all elements must have sharp 0px radius
- Traditional box shadows or glows — use layered type for depth
- Color palettes beyond black, white, and vermillion accent
- Bouncy, springy, or playful easing — motion must be fast and decisive
- Decorative icons overused — text labels are preferred, icons sparingly
- Cards with background fills and shadows — prefer border-only containers or pure spacing

## Blend Compatibility
- **Family**: minimal
- **Blends Well With**: Systematic, Industrial, Geometric
- **Conflicts With**: Organic, Academia, Retro
