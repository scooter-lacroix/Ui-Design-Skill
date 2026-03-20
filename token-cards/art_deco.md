# Art Deco — Token Card

## Identity
- **Mood**: Luxurious, Theatrical, Timeless
- **Best For**: Luxury brands, premium services, cultural institutions, high-end hospitality, heritage products
- **Avoid For**: Consumer SaaS startups, playful youth brands, minimalist tech products, casual social apps

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| Background | `#0A0A0A` (Obsidian Black) | Deep void page base |
| Foreground | `#F2F0E4` (Champagne Cream) | Primary text — warm and readable |
| Card Background | `#141414` (Rich Charcoal) | Card surfaces with subtle depth |
| Primary Accent | `#D4AF37` (Metallic Gold) | Luxury accent — borders, headings, glows |
| Secondary Accent | `#1E3D59` (Midnight Blue) | Subtle depth, inactive states, outline hover fills |
| Border | `#D4AF37` (Gold) | Celebrated visible borders at varied opacity |
| Muted | `#888888` (Pewter) | Secondary text, placeholder text |

## Typography
- **Heading Font**: Marcellus (or Italiana) — Roman structures with Art Deco flair
- **Body Font**: Josefin Sans — geometric, vintage feel with readability
- **Key Weights**: Display headings use serif face; body uses geometric sans at regular weight
- **Display Scale**: `text-6xl` to `text-7xl` (60-72px), uppercase with `tracking-widest` (0.2em)

## Geometry
- **Border Radius**: Strictly `0px`; `rounded-sm` (2px) maximum — sharp architectural lines
- **Border Style**: Thin 1px gold borders; double-border (3px double style) for emphasis; stepped corners via CSS clip-path
- **Shadow System**: Glow-only shadows (`box-shadow: 0 0 15px rgba(212, 175, 55, 0.2)`) simulating neon/backlit signage; metallic linear gradients on buttons

## Motion
- **Easing**: `ease-out` or `ease-in-out` for smooth mechanical motion
- **Speed**: `duration-300` for quick feedback; `duration-500` for theatrical reveals
- **Signature Motion**: Card lift (`-translate-y-2`) with border glow intensifying from 30% to 100% opacity; button background color flip with glow expansion

## Signature Elements (Bold Factor)
- Stepped corner decorations (ziggurat shapes) on cards via CSS clip-path or pseudo-elements
- Rotated diamond containers (`rotate-45`) for icons and avatars with counter-rotated inner content
- Roman numerals (I, II, III, IV) for numbered steps, tiers, and lists
- Double-frame images with gold outer border and thick dark inner border, grayscale by default
- Diagonal crosshatch background pattern at 3-5% opacity using repeating 45-degree linear gradients
- All-caps display typography with extreme `tracking-widest` — mandatory for all headings
- Sunburst radial gradients emanating from focal points at 10-20% gold opacity

## Anti-Patterns
- Soft rounded corners (`rounded-md`, `rounded-lg`, `rounded-full`) — corners must be sharp or minimally 2px
- Neutral gray drop shadows — only gold-tinted glow shadows are permitted
- Organic curves, blobs, or fluid shapes — geometry is mandatory
- Lowercase display headings — all headings must be uppercase with wide tracking
- Gradient backgrounds that lack metallic sheen quality — gradients must evoke polished metal
- Asymmetric layouts — Art Deco demands bilateral symmetry and centered axes

## Blend Compatibility
- **Family**: luxury
- **Blends Well With**: Luxury Design, Modern Dark, Retro Design
- **Conflicts With**: Neo-brutalism, Organic-Natural, Playful Geometric
