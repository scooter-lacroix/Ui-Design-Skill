# Minimalist Monochrome — Token Card

## Identity
- **Mood**: Austere, authoritative, editorial
- **Best For**: Fashion editorials, luxury brand identities, architectural portfolios, museum catalogs, art galleries
- **Avoid For**: Consumer apps, playful brands, SaaS dashboards, children's content

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| `background` | `#FFFFFF` | Pure white |
| `foreground` | `#000000` | Pure black (IS the accent) |
| `muted` | `#F5F5F5` | Off-white subtle backgrounds |
| `muted-foreground` | `#525252` | Dark gray secondary text |
| `border` | `#000000` | Black borders |
| `border-light` | `#E5E5E5` | Light gray subtle dividers |

## Typography
- **Heading Font**: Playfair Display (serif)
- **Body Font**: Source Serif 4 (serif)
- **Key Weights**: 400 (Playfair), 400 (Source Serif), JetBrains Mono for metadata
- **Display Scale**: text-8xl to text-9xl (128px–160px)

## Geometry
- **Border Radius**: 0px everywhere — no exceptions, sharp 90-degree corners
- **Border Style**: Line-weight hierarchy — hairline 1px #E5E5E5, thin 1px #000, medium 2px, thick 4px, ultra 8px black
- **Shadow System**: NONE — zero drop shadows; depth via color inversion, border weight, scale contrast, negative space

## Motion
- **Easing**: None / instant (0–100ms maximum)
- **Speed**: 0–100ms transitions; binary on/off states; 300ms max for image effects
- **Signature Motion**: Instant full-color inversion on card/feature hover (bg + text + borders swap in 100ms)

## Signature Elements (Bold Factor)
- Oversized hero typography (8xl–9xl) where words become graphic elements
- Heavy horizontal rules (4px–8px black) between ALL major sections
- Inverted sections (black bg, white text) for emphasis instead of accent colors
- Editorial pull quotes as large italic serif with oversized quotation marks
- Boxed drop cap on Product Detail first paragraph
- Layered subtle textures (horizontal lines, grid, diagonal, noise) to prevent flatness

## Anti-Patterns
- Any accent colors whatsoever (black IS the accent — palette is absolute)
- Rounded corners of any radius
- Drop shadows or elevation effects
- Gradients, glows, or colored highlights
- Bouncy animations, floating elements, or parallax
- Soft/friendly rounded shapes or playful typography

## Blend Compatibility
- **Family**: minimal
- **Blends Well With**: Luxury/Editorial, Swiss Minimalist, Bauhaus
- **Conflicts With**: Maximalism, Cyberpunk, Material Design
