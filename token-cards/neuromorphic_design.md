# Neumorphism (Soft UI) — Token Card

## Identity
- **Mood**: Tactile, calm, modern
- **Best For**: Dashboards, settings panels, wellness apps, music players, smart home controls
- **Avoid For**: High-density data tables, text-heavy editorial sites, e-commerce with many product images

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| Background | `#E0E5EC` | Base "cool clay" surface — everything molded from this |
| Foreground | `#3D4852` | Primary text (7.5:1 contrast) |
| Muted | `#6B7280` | Secondary text (4.6:1 WCAG AA) |
| Accent | `#6C63FF` | Soft violet for CTAs and focus states |
| Accent Secondary | `#38B2AC` | Teal for success/positive indicators |
| Shadow Light | `rgba(255,255,255,0.5-0.6)` | Top-left light source highlight |
| Shadow Dark | `rgb(163,177,198,0.6-0.7)` | Bottom-right depth shadow |

## Typography
- **Heading Font**: Plus Jakarta Sans
- **Body Font**: DM Sans
- **Key Weights**: 400, 500, 700, 800
- **Display Scale**: text-7xl (72px)

## Geometry
- **Border Radius**: 32px containers, 16px buttons, 12px inner elements
- **Border Style**: None — borders are `transparent`; shadows define all edges
- **Shadow System**: Dual opposing RGBA shadows (light top-left, dark bottom-right) with extruded, inset, and deep-inset variants

## Motion
- **Easing**: ease-out
- **Speed**: 300ms UI, 500ms decorative
- **Signature Motion**: Elements lift on hover with enhanced shadow depth; nested circles scale and rotate

## Signature Elements (Bold Factor)
- Dual opposing RGB shadows on every element (never flat)
- Monochromatic cool grey discipline — no color variety, shadows do all work
- Same-surface illusion — elements molded from background, not placed on it
- Deep inset wells for inputs and icon containers
- Complex nested depth (Extruded → Inset → Extruded)
- Hyper-rounded 32px container corners

## Anti-Patterns
- Hard hex shadows (must use RGBA transparency)
- White card backgrounds (cards must match body `#E0E5EC`)
- Flat buttons without shadow depth
- Sharp corners below 16px radius
- Visible borders (neumorphism never uses borders)
- Low-contrast text colors below WCAG AA

## Blend Compatibility
- **Family**: depth-based
- **Blends Well With**: claymorphism, organic-natural, material design
- **Conflicts With**: newsprint, retro/90s, swiss minimalist
