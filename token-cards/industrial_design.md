# Industrial Skeuomorphism — Token Card

## Identity
- **Mood**: Tactile, mechanical, precise
- **Best For**: Developer tools, hardware products, dashboards, technical platforms, portfolio sites
- **Avoid For**: Children's apps, organic/wellness brands, minimalist editorial

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| `background` | `#e0e5ec` | Cool grey chassis (Level 0 base) |
| `foreground` | `#f0f2f5` | Raised panel surface |
| `muted` | `#d1d9e6` | Recessed/sunken areas (inputs, grooves) |
| `text` | `#2d3436` | Dark charcoal ink |
| `accent` | `#ff4757` | Safety orange — interactive elements only |
| `border-shadow` | `#babecc` | Neumorphic dark half |
| `border-highlight` | `#ffffff` | Neumorphic light half |

## Typography
- **Heading Font**: Inter (400–800)
- **Body Font**: Inter (400–500)
- **Key Weights**: 400, 500, 600, 700, 800 + JetBrains Mono for numeric/technical
- **Display Scale**: text-5xl to text-7xl (3rem–4.5rem)

## Geometry
- **Border Radius**: sm 4px → md 8px → lg 16px → xl 24px → full 9999px (injection-molded curves)
- **Border Style**: Dual-shadow neumorphic pairs instead of visible borders; `#babecc` dark + `#ffffff` highlight
- **Shadow System**: Neumorphic dual shadows — card: `8px 8px 16px #babecc, -8px -8px 16px #ffffff`; pressed: inset reversal

## Motion
- **Easing**: `cubic-bezier(0.175, 0.885, 0.32, 1.275)` — mechanical spring with subtle bounce
- **Speed**: 150ms–500ms (fast tactile to smooth transitions)
- **Signature Motion**: Button press with translate-y-[2px] + shadow inversion simulating physical switch depression

## Signature Elements (Bold Factor)
- Corner screw radial gradients on all cards (12px from edges)
- Ventilation slots (recessed pill-shaped divs) in card corners
- LED status indicators with animate-pulse and colored glow shadows
- Physical connector pipes between How It Works steps
- CRT scanline overlays on screen/display elements
- Grayscale-to-color image transition on hover (500ms)

## Anti-Patterns
- Flat single-layer shadows (must use neumorphic dual shadows)
- Pure white or pure black backgrounds
- Sharp 0px corners on major containers (curves mimic molded plastic)
- Color used decoratively — accent is reserved for interactive/alert only
- Generic mobile design that drops the physical metaphor
- Soft blur-only shadows without the neumorphic highlight/shadow pair

## Blend Compatibility
- **Family**: depth-based
- **Blends Well With**: Neuromorphic, Material Design, Modern Dark
- **Conflicts With**: Flat Design, Neo-Brutalism, Hand-Drawn/Sketch
