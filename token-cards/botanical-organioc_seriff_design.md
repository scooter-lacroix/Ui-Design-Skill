# Botanical / Organic Serif — Token Card

## Identity
- **Mood**: Peaceful, curated, artisanal
- **Best For**: Wellness brands, botanical products, editorial/literary sites, sustainable luxury, artisanal e-commerce
- **Avoid For**: High-energy tech products, gaming, data-heavy dashboards, urgent conversion funnels

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| `background` | `#F9F8F4` | Primary canvas (warm alabaster / rice paper) |
| `foreground` | `#2D3A31` | Primary text (deep forest green) |
| `primary` | `#8C9A84` | Buttons, highlights, icons (sage green) |
| `secondary` | `#DCCFC2` | Card backgrounds, secondary buttons (soft clay) |
| `border` | `#E6E2DA` | Subtle borders and dividers (stone) |
| `interactive` | `#C27B66` | Hover states, CTAs (terracotta) |

## Typography
- **Heading Font**: Playfair Display (transitional serif, high contrast)
- **Body Font**: Source Sans 3 (humanist sans-serif)
- **Key Weights**: 400/500 (body), 600/700 (headings), italic emphasis on keywords
- **Display Scale**: text-8xl (headlines), text-5xl minimum on mobile

## Geometry
- **Border Radius**: Highly rounded — cards `rounded-3xl` (24px), buttons `rounded-full` (pill), images `rounded-t-full` (arch) or `rounded-[40px]`
- **Border Style**: Thin, delicate 1px solid strokes
- **Shadow System**: Very soft diffused shadows using forest green tint at 5% opacity; never harsh dark drops

## Motion
- **Easing**: ease-out (significantly eased, honey-like)
- **Speed**: 300ms (fast interactions) to 700-1000ms (dramatic reveals)
- **Signature Motion**: Slow, graceful, fluid — cards lift gently with shadow bloom, images scale luxuriously at duration-700, scroll reveals float up into place

## Signature Elements (Bold Factor)
- Paper grain SVG noise overlay at opacity-[0.015] — mandatory, defines the tactile warmth of the entire design
- Arch-shaped imagery via `clip-path` or `rounded-t-full` — the iconic architectural moment
- Playfair Display italic emphasis on single words within bold headlines
- Staggered grid rhythm — every second card translates vertically (`translate-y-12`) for organic flow
- Uppercase pill-shaped buttons with wide tracking (`tracking-widest`) in deep forest green
- Decorative meandering SVG lines connecting sections like vines or roots

## Anti-Patterns
- Sharp corners or hard angles — everything must flow organically
- Artificial brights or saturated neon colors — only nature-derived earth tones
- Fast, snappy animations or bouncy/spring physics — motion must be slow and graceful
- Heavy icon containers or boxed icons — icons should float or sit in soft pale circles
- Stark white (#FFFFFF) as primary canvas — always use warm alabaster (#F9F8F4)
- Dense, cramped layouts — whitespace is sacred; never reduce below generous padding

## Blend Compatibility
- **Family**: organic
- **Blends Well With**: Serif (editorial), Organic-Natural, Luxury
- **Conflicts With**: Industrial, Terminal, Kinetic
