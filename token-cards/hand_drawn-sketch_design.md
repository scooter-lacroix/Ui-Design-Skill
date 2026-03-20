# Hand-Drawn / Sketch — Token Card

## Identity
- **Mood**: Playful, approachable, human
- **Best For**: Creative tools, brainstorming platforms, educational content, collaborative apps
- **Avoid For**: Corporate dashboards, fintech, medical/legal, luxury brands

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| `background` | `#fdfbf7` | Warm paper base |
| `foreground` | `#2d2d2d` | Soft pencil black (never pure black) |
| `muted` | `#e5e0d8` | Old paper / erased pencil |
| `accent` | `#ff4d4d` | Red correction marker |
| `border` | `#2d2d2d` | Pencil lead |
| `secondary-accent` | `#2d5da1` | Blue ballpoint pen |

## Typography
- **Heading Font**: Kalam (700)
- **Body Font**: Patrick Hand (400)
- **Key Weights**: 400, 700
- **Display Scale**: text-5xl md:text-6xl

## Geometry
- **Border Radius**: Wobbly irregular ellipses via inline style (`255px 15px 225px 15px / 15px 225px 15px 255px`) — never standard rounded classes
- **Border Style**: border-2 to border-4 solid, border-dashed for secondary; always thick and variable
- **Shadow System**: Hard offset only, zero blur — `4px 4px 0px 0px #2d2d2d` standard, `8px 8px` emphasized

## Motion
- **Easing**: Default CSS transitions
- **Speed**: 100ms (fast and snappy)
- **Signature Motion**: Jiggle on hover via small rotations (`hover:rotate-1`, `hover:-rotate-2`), button press-flat effect removing shadow on active

## Signature Elements (Bold Factor)
- Wobbly irregular border-radius on ALL containers, buttons, cards — never standard Tailwind rounded classes
- Hard offset shadows with zero blur (cut-paper collage aesthetic)
- Handwritten fonts exclusively (Kalam + Patrick Hand)
- Tape strips, thumbtack pins, and dashed circle decorations on cards
- Paper grain dot-pattern background (`radial-gradient` 24px grid)
- Playful rotation on elements (`rotate-1`, `-rotate-2`)

## Anti-Patterns
- Standard Tailwind `rounded-*` classes without wobbly override
- Soft blur shadows or neumorphic depth
- Corporate sans-serif fonts (Inter, Roboto, etc.)
- Pure black (#000000) or pure white (#ffffff) backgrounds
- Rigid grid alignment without rotation/asymmetry
- Gradient backgrounds or color transitions

## Blend Compatibility
- **Family**: organic
- **Blends Well With**: Neo-Brutalism, Playful Geometric, Botanical/Organic
- **Conflicts With**: Luxury/Editorial, Modern Dark, Swiss Minimalist
