# Flat Design — Token Card

## Identity
- **Mood**: Boldly Reductive, Graphic, Confident
- **Best For**: SaaS landing pages, productivity tools, startup websites, educational platforms, clean brand showcases
- **Avoid For**: Luxury/premium brands, immersive storytelling, photo-heavy portfolios, gaming or entertainment

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| Background | `#FFFFFF` (Pure White) | Canvas and primary background |
| Foreground | `#111827` (Gray 900) | Sharp high-contrast text |
| Primary | `#3B82F6` (Blue 500) | Action color, primary CTAs, links |
| Secondary | `#10B981` (Emerald 500) | Supporting accent color |
| Accent | `#F59E0B` (Amber 500) | Highlights, badges, attention draws |
| Muted | `#F3F4F6` (Gray 100) | Secondary backgrounds, section blocks |
| Border | `#E5E7EB` (Gray 200) | Sparingly used structural borders |

## Typography
- **Heading Font**: Outfit (geometric sans-serif)
- **Body Font**: Outfit (geometric sans-serif, same family)
- **Key Weights**: 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold), 800 (Extra Bold)
- **Display Scale**: Generous — headings use tight letter-spacing (`-0.02em`) with dramatic size contrast

## Geometry
- **Border Radius**: `rounded-md` (6px) or `rounded-lg` (8px) consistently; pill only for tags
- **Border Style**: Generally 0px (background colors define edges); `border-2` solid when needed; `border-4` on outline buttons
- **Shadow System**: `shadow-none` — absolutely no box shadows on any element

## Motion
- **Easing**: Default Tailwind easing (smooth but direct)
- **Speed**: 200ms (most interactions), 300ms (larger transformations)
- **Signature Motion**: Scale transformations on hover (`scale-105` buttons, `scale-[1.02]` cards) and color fill effects on outline elements

## Signature Elements (Bold Factor)
- Full-section vibrant color blocks (blue hero, emerald benefits, amber CTA) with sharp transitions
- Large decorative geometric shapes in hero backgrounds at low opacity (circles, rotated squares)
- Outline buttons with `border-4` that fill with color on hover
- Multi-color stat numbers where each stat uses a different accent color
- Thick structural borders (`border-2`) for FAQ items instead of thin dividers
- Dramatic scale hierarchy on pricing cards (popular tier starts larger, scales more on hover)

## Anti-Patterns
- Drop shadows or box shadows on any element
- Gradients on buttons or interactive elements (only subtle directional bg decoration allowed)
- Backdrop blur or glassmorphism effects
- Rounded pill shapes on non-tag elements
- Thin line dividers between sections (use whitespace or color blocks)
- Skeuomorphic textures, bevels, or realistic depth cues

## Blend Compatibility
- **Family**: flat
- **Blends Well With**: Swiss Minimalist, SaaS, Playful Geometric
- **Conflicts With**: Cyberpunk, Luxury, Crypto
