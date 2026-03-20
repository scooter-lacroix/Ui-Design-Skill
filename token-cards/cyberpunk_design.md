# Cyberpunk / Glitch Design — Token Card

## Identity
- **Mood**: Dangerous, Electric, Rebellious
- **Best For**: Gaming platforms, hacker/tech communities, music production tools, underground events, retro-futuristic brands
- **Avoid For**: Corporate enterprise, healthcare, education, luxury fashion, anything requiring calm trust

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| Background | `#0a0a0f` | Deep void black with blue undertone |
| Card | `#12121a` | Card backgrounds, deep purple-black |
| Muted | `#1c1c2e` | UI chrome, elevated backgrounds |
| Accent (Primary Neon) | `#00ff88` | Electric green — CTAs, borders, focus rings |
| Accent Secondary | `#ff00ff` | Hot magenta — secondary buttons, accents |
| Accent Tertiary | `#00d4ff` | Cyan — tertiary highlights, text shadows |
| Destructive | `#ff3366` | Error/danger states, red-pink |

## Typography
- **Heading Font**: Orbitron, Share Tech Mono (geometric, futuristic, robotic)
- **Body Font**: JetBrains Mono, Fira Code, Consolas (monospace terminal feel)
- **Key Weights**: Black (900), Bold (700), Semibold (600), Normal (400)
- **Display Scale**: `text-6xl` to `text-8xl` (hero), all uppercase with widest tracking

## Geometry
- **Border Radius**: None (0px default) — chamfered corners via clip-path polygon replace all rounded corners
- **Border Style**: 1px default, 2px for emphasis, often with gradient or neon glow stacked shadows
- **Shadow System**: Multi-layered neon glow shadows (green, magenta, cyan) creating real light-emission effect

## Motion
- **Easing**: cubic-bezier(0.4, 0, 0.2, 1) or steps(4) for digital snap
- **Speed**: 100ms (snaps), 150ms (transitions), 1s+ (ambient loops like blink/scanline)
- **Signature Motion**: Chromatic aberration glitch animation with random skew/translate flicker on headlines

## Signature Elements (Bold Factor)
- Full-page scanline overlay via CSS pseudo-element (CRT monitor texture)
- Glitched hero headlines with RGB-split text-shadow (magenta left, cyan right) and clip-path flicker
- Chamfered/clipped corners on all cards and buttons via clip-path polygon (never rounded)
- Terminal aesthetic with monospace font, `>` prompt prefixes, and blinking cursor animations
- Circuit/grid SVG background patterns visible through translucent card surfaces
- Neon borders that actually glow via stacked multi-layer box-shadows, not just colored borders

## Anti-Patterns
- Rounded corners or pill-shaped elements (use chamfered clip-path only)
- Smooth, organic easing curves (use sharp, digital transitions)
- Light mode or pastel backgrounds (dark void is mandatory)
- Clean sans-serif body fonts (monospace is required for all text)
- Flat, shadowless cards without glow effects
- Symmetrical, centered, perfectly balanced layouts (embrace asymmetry and skew)

## Blend Compatibility
- **Family**: industrial
- **Blends Well With**: Terminal, Vaporwave, Retro
- **Conflicts With**: Organic-Natural, Luxury, Swiss Minimalist
