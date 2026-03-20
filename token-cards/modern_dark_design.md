# Linear / Modern Dark — Token Card

## Identity
- **Mood**: Cinematic, precise, premium
- **Best For**: Developer tools, SaaS dashboards, design tools, technical products (Linear, Vercel, Raycast style)
- **Avoid For**: Children's products, playful brands, print-first editorial, budget services

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| `background-base` | `#050506` | Primary canvas (near-black, never pure) |
| `background-deep` | `#020203` | Deepest layer — footer, background |
| `surface` | `rgba(255,255,255,0.05)` | Card/container backgrounds |
| `foreground` | `#EDEDEF` | Primary text (bright off-white) |
| `foreground-muted` | `#8A8F98` | Body text, descriptions |
| `accent` | `#5E6AD2` | Indigo — buttons, links, glows |
| `border-default` | `rgba(255,255,255,0.06)` | Hairline borders |

## Typography
- **Heading Font**: Inter / Geist Sans
- **Body Font**: Inter / Geist Sans
- **Key Weights**: 400 (body), 600 (semibold headings), font-mono for labels
- **Display Scale**: text-7xl to text-8xl with `tracking-[-0.03em]`

## Geometry
- **Border Radius**: rounded-2xl (16px) containers/cards, rounded-lg (8px) buttons/inputs, rounded-full badges
- **Border Style**: Nearly invisible — `border-white/[0.06]`; gradient borders on hover with mask-composite
- **Shadow System**: Multi-layer formula — `0_0_0_1px border + 0_2px_20px dark + 0_0_40px ambient + optional accent glow`

## Motion
- **Easing**: `[0.16, 1, 0.3, 1]` expo-out — swift and decisive, never bouncy
- **Speed**: 200–300ms interactions, 600ms entrances, 8000–10000ms background blob float
- **Signature Motion**: Animated gradient blobs floating across canvas (blur-[150px], 900×1400px) + mouse-tracking radial spotlight on card surfaces

## Signature Elements (Bold Factor)
- Animated ambient gradient blobs creating cinematic lighting pools
- Mouse-tracking spotlight effect on interactive card surfaces (300px radial glow)
- Gradient typography (white to semi-transparent vertical gradient + accent shimmer)
- Multi-layer shadows on every elevated surface (border highlight + diffuse + ambient + accent glow)
- Scroll-linked parallax (hero fades/scales/translates on scroll)
- Asymmetric bento grid layouts with varying card spans

## Anti-Patterns
- Flat single-color backgrounds (always layer gradients + noise + ambient light)
- Pure black (#000000) or pure white (#FFFFFF)
- Large hover movements (>8px) — movements are tiny and precise
- Uniform same-size card grids (bento layouts need variety)
- Harsh visible borders (keep at 6–10% white opacity)
- Bouncy/spring animations (use expo-out, not spring physics)

## Blend Compatibility
- **Family**: depth-based
- **Blends Well With**: Cyberpunk, Industrial Skeuomorphism, Swiss Minimalist
- **Conflicts With**: Neo-Brutalism, Hand-Drawn/Sketch, Maximalism
