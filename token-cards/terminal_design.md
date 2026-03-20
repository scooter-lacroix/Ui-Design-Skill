# Terminal CLI — Token Card

## Identity
- **Mood**: Cyber-industrial, hacker, system-level
- **Best For**: Developer tools, CLI dashboards, hacker-themed projects, tech portfolios, DevOps products
- **Avoid For**: Consumer apps, e-commerce, luxury brands, accessibility-critical products, print design

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| Background | `#0a0a0a` | Deep black (not pure OLED, allows scanlines) |
| Primary | `#33ff00` | Classic terminal neon green |
| Secondary | `#ffb000` | Amber/orange for warnings and accents |
| Muted | `#1f521f` | Dimmed green for borders/inactive text |
| Error | `#ff3333` | Bright red |
| Border | `#1f521f` | Dimmed green |

## Typography
- **Heading Font**: JetBrains Mono / Fira Code / VT323
- **Body Font**: JetBrains Mono / Fira Code (monospace everywhere)
- **Key Weights**: 400, 700 — ALL CAPS for headers
- **Display Scale**: Strict modular scale snapping to grid sizes

## Geometry
- **Border Radius**: 0px — absolutely no rounded corners
- **Border Style**: 1px solid or dashed green; borders define "windows" and "panes"
- **Shadow System**: No drop shadows; text-shadow glow only (`0 0 5px rgba(51,255,0,0.5)`) for phosphor persistence

## Motion
- **Easing**: step-end / linear (digital, not organic)
- **Speed**: Instant or blinking intervals
- **Signature Motion**: Blinking cursor `█`; typewriter character-by-character headlines; occasional glitch text offsets on hover

## Signature Elements (Bold Factor)
- Monospace supremacy — every character from headlines to footer is monospaced
- Blinking block cursor `█` as interface heartbeat
- Shell prompt metaphors (`>`, `$`, `~`, `--help`, `[OK]`, `[ERR]`)
- ASCII art for logos and key graphics
- Progress bar data visualization (`[||||||||||.....]`)
- CRT scanline overlay (faint, pointer-events-none)

## Anti-Patterns
- Any sans-serif or serif fonts (monospace only)
- Rounded corners of any kind
- Soft drop shadows or ambient glows
- Color images (everything should be terminal-colored)
- Modern UI patterns (floating action buttons, carousels)
- Smooth organic transitions

## Blend Compatibility
- **Family**: retro
- **Blends Well With**: cyberpunk, retro/90s, simple dark
- **Conflicts With**: organic-natural, luxury, playful geometric
