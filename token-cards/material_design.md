# Material You (Material Design 3) — Token Card

## Identity
- **Mood**: Friendly, soft, personal
- **Best For**: Consumer apps, productivity tools, mobile-first products, cross-platform UIs
- **Avoid For**: Luxury brands, brutalist aesthetics, editorial/print-inspired designs

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| `background` | `#FFFBFE` | Warm off-white surface (never pure white) |
| `foreground` | `#1C1B1F` | Near-black with warmth |
| `primary` | `#6750A4` | Rich purple seed color — CTAs, focus, interactive |
| `secondary-container` | `#E8DEF8` | Light lavender for pills, chips |
| `tertiary` | `#7D5260` | Complementary mauve for FABs, accents |
| `surface-container` | `#F3EDF7` | Tinted card backgrounds |
| `outline` | `#79747E` | Medium gray borders |

## Typography
- **Heading Font**: Roboto (500 medium)
- **Body Font**: Roboto (400 regular)
- **Key Weights**: 400, 500, 700
- **Display Scale**: 3.5rem / 56px (Display Large)

## Geometry
- **Border Radius**: Organic generous rounding — 8px chips → 16px cards → 24px containers → 48px hero → `rounded-full` all buttons (pill-shaped)
- **Border Style**: Sparingly used; tonal surface differences preferred over borders; 1px outline color when needed
- **Shadow System**: Subtle elevation tiers — `shadow-sm` rest → `shadow-md` hover → `shadow-lg` important; combined with tonal surfaces

## Motion
- **Easing**: `cubic-bezier(0.2, 0, 0, 1)` — Material You's signature "Emphasized Decelerate"
- **Speed**: 200ms micro, 300ms standard, 400–500ms large surfaces (never exceed 500ms)
- **Signature Motion**: `active:scale-95` tactile press on all clickable elements + state layer opacity overlays (not color shifts) for hover

## Signature Elements (Bold Factor)
- Pill-shaped buttons (`rounded-full`) on ALL buttons — most recognizable MD3 trait
- Organic blur shapes (`blur-3xl`) with primary/secondary/tertiary colors in hero sections
- Tonal surface system (never pure white backgrounds; layered surface containers)
- State layer interaction model (opacity overlays `bg-primary/90` not color changes)
- Filled text field inputs (rounded top, square bottom, border-bottom)
- `active:scale-95` tactile feedback on every interactive element

## Anti-Patterns
- Pure white (#FFFFFF) backgrounds (breaks tonal system)
- Rectangular or lightly rounded buttons (must be pill-shaped)
- Heavy drop shadows (prefer subtle elevation + tonal surfaces)
- Changing button colors on hover (use state layer opacity instead)
- Sharp corners on containers (generous radius is architectural)
- Borders for container separation (use tonal backgrounds instead)

## Blend Compatibility
- **Family**: depth-based
- **Blends Well With**: Claymorphism, Flat Design, Organic/Natural
- **Conflicts With**: Neo-Brutalism, Kinetic Typography, Monochrome
