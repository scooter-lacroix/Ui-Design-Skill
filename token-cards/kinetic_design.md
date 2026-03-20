# Kinetic Typography — Token Card

## Identity
- **Mood**: High-energy, aggressive, relentless
- **Best For**: Music/events, creative agencies, portfolio sites, bold brand launches
- **Avoid For**: Enterprise SaaS, healthcare, accessibility-critical apps, conservative brands

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| `background` | `#09090B` | Rich black (not pure black) |
| `foreground` | `#FAFAFA` | Off-white (not pure white) |
| `muted` | `#27272A` | Dark gray secondary surfaces |
| `muted-foreground` | `#A1A1AA` | Zinc 400 body text |
| `accent` | `#DFE104` | Acid yellow/lime — single accent only |
| `border` | `#3F3F46` | Zinc 700 structural lines |

## Typography
- **Heading Font**: Space Grotesk (fallback: Inter)
- **Body Font**: Space Grotesk
- **Key Weights**: 400, 500, 700
- **Display Scale**: `clamp(3rem, 12vw, 14rem)` — viewport-responsive fluid scaling

## Geometry
- **Border Radius**: 0px everywhere (sharp brutalist corners) — never above 2px
- **Border Style**: 2px solid zinc-700 for structural emphasis; bottom-border-only for inputs
- **Shadow System**: NO drop shadows — completely flat; depth via color layering and massive background numbers

## Motion
- **Easing**: ease-in-out for buttons, linear for marquees, spring physics for accordions
- **Speed**: 200–300ms micro-interactions, continuous linear for marquees
- **Signature Motion**: Infinite scrolling marquees (react-fast-marquee, no gradient edges, never pause) + scroll-triggered parallax scale/opacity

## Signature Elements (Bold Factor)
- Viewport-width typography (10vw+ headlines using clamp())
- Infinite marquees in at least two sections (fast stats, slower testimonials)
- Massive background numbers (8rem–12rem) in muted tones as graphic shapes
- Hard color inversions on card hover (black→yellow, white→black)
- ALL display text uppercase with tight tracking
- 8–10x scale hierarchy (body 20px vs headlines 200px+)

## Anti-Patterns
- Soft pastels or mid-tone colors (high contrast extremes only)
- Serif or script fonts
- Border-radius above 2px
- Drop shadows of any kind
- Slow gentle transitions (800ms+) or pausing marquees
- Small heading text (<text-3xl) or mixed-case display text

## Blend Compatibility
- **Family**: flat
- **Blends Well With**: Neo-Brutalism, Bold Typography, Cyberpunk
- **Conflicts With**: Luxury/Editorial, Material Design, Organic/Natural
