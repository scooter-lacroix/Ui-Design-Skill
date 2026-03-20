# Bauhaus — Token Card

## Identity
- **Mood**: Constructivist Modernism
- **Best For**: Art schools, architecture firms, creative agencies, design tooling, cultural institutions, editorial layouts
- **Avoid For**: Corporate enterprise, healthcare, luxury fashion, gentle/warm brands, traditional institutions

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| `background` | `#F0F0F0` | Off-white canvas — page foundation |
| `foreground` | `#121212` | Stark Black — text and borders |
| `primary-red` | `#D02020` | Bauhaus Red — color blocking, CTA backgrounds |
| `primary-blue` | `#1040C0` | Bauhaus Blue — section backgrounds, secondary actions |
| `primary-yellow` | `#F0C020` | Bauhaus Yellow — stats, CTA sections, check badges |
| `muted` | `#E0E0E0` | Light gray — subtle surface differentiation |
| `border` | `#121212` | Stark Black — thick deliberate borders |

## Typography
- **Heading Font**: `"Outfit", sans-serif` (geometric sans-serif)
- **Body Font**: `"Outfit", sans-serif`
- **Key Weights**: 900 (display headlines), 700 (subheadings, labels), 500 (body)
- **Display Scale**: `text-8xl` (desktop) — massive uppercase headlines with tight tracking

## Geometry
- **Border Radius**: Binary — `rounded-none` (0px) or `rounded-full` (9999px), no in-between
- **Border Style**: 2px mobile, 4px desktop — always black `#121212`
- **Shadow System**: Hard offset shadows only (`shadow-[4px_4px_0px_0px_black]`) — never soft/blurred

## Motion
- **Easing**: `ease-out` (mechanical feel)
- **Speed**: 200ms-300ms (fast and decisive)
- **Signature Motion**: Button press effect — translate 2px inward and remove shadow to simulate physical press

## Signature Elements (Bold Factor)
- Full section color blocking with solid primary backgrounds (red, blue, yellow)
- Geometric logo composed of circle, square, and triangle in primary colors
- Overlapping geometric compositions (circles, rotated squares, triangles) as decorative elements
- Hard offset box shadows with zero blur — flat layering, no depth illusion
- Deliberate 45-degree rotation on every 3rd shape in repeating patterns
- Images with grayscale filter by default, color revealed on hover
- Small geometric shape corner decorations (8-16px) on cards in rotating primary colors

## Anti-Patterns
- Gradients or subtle effects — everything must be direct and declarative
- Soft/blurred shadows — only hard offset shadows allowed
- Intermediate border radii (8px, 12px, etc.) — use only 0px or full round
- Organic or rounded shapes — all decorative elements derive from circles, squares, triangles
- Color palettes beyond the three primaries plus black and white
- Symmetric, predictable grid layouts — asymmetric balance with intentional breaking

## Blend Compatibility
- **Family**: geometric
- **Blends Well With**: Neo-Brutalist, Industrial, Systematic
- **Conflicts With**: Academia, Organic, Luxury
