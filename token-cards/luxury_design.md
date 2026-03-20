# Luxury / Editorial — Token Card

## Identity
- **Mood**: Sophisticated, timeless, expensive
- **Best For**: Fashion brands, luxury products, editorial magazines, high-end portfolios, curated experiences
- **Avoid For**: SaaS dashboards, children's apps, budget/discount brands, developer tools

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| `background` | `#F9F8F6` | Warm alabaster (expensive paper feel) |
| `foreground` | `#1A1A1A` | Rich charcoal (never pure black) |
| `muted` | `#EBE5DE` | Pale taupe for subtle elevation |
| `muted-foreground` | `#6C6863` | Warm grey for secondary text |
| `accent` | `#D4AF37` | Metallic gold — sparingly, hover/focus only |
| `accent-foreground` | `#FFFFFF` | White on dark/gold surfaces |

## Typography
- **Heading Font**: Playfair Display (serif, 300–400, italic)
- **Body Font**: Inter (sans-serif, 400–500)
- **Key Weights**: 300, 400 (Playfair), 400, 500 (Inter)
- **Display Scale**: text-6xl to text-9xl (4rem–8rem+)

## Geometry
- **Border Radius**: 0px everywhere — strictly rectangular, architectural precision
- **Border Style**: 1px thin precise lines; single-side borders (border-t) preferred over full boxes; opacity 10–20% for dividers
- **Shadow System**: Extremely subtle soft shadows — `0_4px_24px_rgba(0,0,0,0.08)` with inset borders; deepens on hover

## Motion
- **Easing**: ease-out or `cubic-bezier(0.25, 0.46, 0.45, 0.94)` — never ease-in-out
- **Speed**: 500ms–2000ms (deliberately slow and cinematic); images 1500–2000ms
- **Signature Motion**: Ultra-slow grayscale-to-color image reveal on hover + gold overlay sliding from left on primary buttons

## Signature Elements (Bold Factor)
- Vertical text labels via `writing-mode: vertical-rl` on image edges
- Drop caps with Playfair Display (7xl, float-left) on intro paragraphs
- Mixed italic headlines with gold-colored italic words for spoken cadence
- Grayscale images with 1500–2000ms color reveal on hover
- Fixed visible grid lines (4 vertical lines spanning viewport at 20% opacity)
- Gold sliding button animation via translate-x transform

## Anti-Patterns
- Rounded corners of any kind (0px border-radius is absolute)
- Fast animations (<500ms for interactions, <1500ms for images)
- Vibrant or multiple accent colors (gold only, used sparingly)
- Pure black (#000000) or pure white (#FFFFFF)
- Prominent icons or decorative elements
- Centered-everything layouts (use asymmetry and offset columns)

## Blend Compatibility
- **Family**: luxury
- **Blends Well With**: Monochrome, Swiss Minimalist, Art Deco
- **Conflicts With**: Neo-Brutalism, Maximalism, Cyberpunk
