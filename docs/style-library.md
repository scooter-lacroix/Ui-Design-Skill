# Style Library

UI Architect includes 31 design style specifications, each covering design tokens, component patterns, layout principles, animation rules, and accessibility guidelines.

## Catalog

### Depth-Based Styles

Styles that build visual hierarchy through layered depth — shadows, gradients, elevation, and material simulation.

| Style | File | Mood |
|:------|:-----|:-----|
| Modern Dark (Linear) | `modern_dark_design.md` | Developer tools, premium SaaS, cinematic dark |
| Neumorphism (Soft UI) | `neuromorphic_design.md` | Soft, tactile, embedded, subtle depth |
| Claymorphism | `claymorphisim_design.md` | Soft 3D, playful, friendly, approachable |
| Material Design 3 | `material_design.md` | Google ecosystem, adaptive, systematic |
| Industrial Skeuomorphism | `industrial_design.md` | Hardware, mechanical, tactile |
| Corporate Trust | `corporate_design.md` | Enterprise, reliability, B2B |

### Flat Styles

Styles that reject depth simulation in favor of bold color blocks and typography-driven hierarchy.

| Style | File | Mood |
|:------|:-----|:-----|
| Flat Design | `flat_design.md` | Clean, digital-native, poster-like |
| Neo-Brutalism | `neo_brutalism_design.md` | Rebellious, anti-corporate, bold borders |
| Swiss International | `swiss_minimalist_design.md` | Grid-obsessed, Helvetica, systematic |
| SaaS Minimalist Modern | `saas_design.md` | Clean startup, conversion-focused |

### Minimalist Styles

Styles that achieve impact through restraint — whitespace, limited palette, typographic precision.

| Style | File | Mood |
|:------|:-----|:-----|
| Minimalist Monochrome | `monochrome_design.md` | B&W, typography-focused |
| Minimalist Monochrome (alt) | `monochrome.md` | Variant monochrome system |
| Minimalist Dark | `simple_dark_design.md` | Simple, elegant dark mode |

### Maximalist & Retro Styles

Styles that embrace visual density, high energy, nostalgia, or era-specific aesthetics.

| Style | File | Mood |
|:------|:-----|:-----|
| Maximalism / Dopamine | `maximalism_design.md` | Bold, loud, colorful, energetic |
| Vaporwave / Outrun | `vaporwave_design.md` | Retro-futurism, synthwave, neon |
| Cyberpunk / Glitch | `cyberpunk_design.md` | Dystopian, hacker, neon |
| Crypto / DeFi | `crypto_design.md` | Web3, blockchain, fintech |
| Retro / 90s Nostalgia | `retro_design.md` | Vintage, nostalgic, Y2K |

### Luxury & Heritage Styles

Styles that convey premium quality through material references and refined typography.

| Style | File | Mood |
|:------|:-----|:-----|
| Luxury / Editorial | `luxury_design.md` | High-end, fashion, editorial |
| Art Deco | `art_deco.md` | Luxury, heritage, "Gatsby" |
| Business Serif | `business_design.md` | Professional, trustworthy |

### Organic & Natural Styles

Styles inspired by nature, earth tones, and flowing forms.

| Style | File | Mood |
|:------|:-----|:-----|
| Botanical / Organic Serif | `botanical-organioc_seriff_design.md` | Natural, warm, artisanal |
| Organic / Natural | `organic-natural_design.md` | Earth tones, sustainability |

### Geometric & Playful Styles

Styles built on mathematical precision, primary shapes, or creative expression.

| Style | File | Mood |
|:------|:-----|:-----|
| Bauhaus | `bauhaus_design.md` | Form-follows-function, geometric |
| Playful Geometric | `playful_geometric_design.md` | Fun, shapes, education |
| Hand-Drawn / Sketch | `hand_drawn-sketch_design.md` | Whimsical, personal, creative |

### Typography & Motion Styles

Styles where type or motion is the primary design element.

| Style | File | Mood |
|:------|:-----|:-----|
| Bold Typography | `bold_typography_design.md` | Type-driven, editorial |
| Kinetic Typography | `kinetic_design.md` | Motion-first, animated |
| Terminal / CLI | `terminal_design.md` | Monospace, hacker, command-line |
| Newsprint | `newsprint_design.md` | Editorial, newspaper, ink-on-paper |
| Academia / Classical | `academia_deisgn.md` | Scholarly, intellectual |

## Style Blending

Multiple styles can be combined when they share compatible design families. The conflict matrix in `reference/conflicts.md` defines:

- **Family-level compatibility** (e.g., FLAT is incompatible with DEPTH-BASED)
- **Specific pairwise conflicts** (e.g., Neo-Brutalism + Neumorphism)
- **Bridge styles** that connect incompatible families (e.g., Art Deco bridges Luxury and Geometric)
- **Proven blend recipes** (e.g., Modern Dark + Kinetic Typography)

When blending, the primary style dominates (80%+). Up to 2 secondary styles can contribute specific elements, adapted to the primary's token system.

## Spec Coverage

Full specs in `styles/` include design tokens, component patterns, layout, motion, and accessibility. Token cards in `token-cards/` are complete, self-contained summaries suitable for style selection. Section coverage varies across full specs — when a section is absent, derive guidance from the style's design philosophy.

## Quick Matching Reference

| Prompt mentions | Consider |
|:----------------|:---------|
| "developer tool", "CLI" | Modern Dark, Terminal, Cyberpunk |
| "SaaS", "startup" | SaaS Minimalist, Modern Dark, Flat |
| "luxury", "premium" | Luxury/Editorial, Art Deco |
| "corporate", "enterprise" | Corporate Trust, Business Serif |
| "fun", "kids" | Playful Geometric, Claymorphism |
| "crypto", "web3" | Crypto/DeFi, Cyberpunk |
| "creative", "portfolio" | Bold Typography, Maximalism, Swiss |
| "natural", "wellness" | Botanical/Organic, Organic/Natural |
| "retro", "vintage" | Retro/90s, Vaporwave, Art Deco |
| "minimal", "clean" | Swiss, Monochrome, Flat |
| "dark mode" | Modern Dark, Simple Dark, Cyberpunk |
| "bold", "statement" | Neo-Brutalism, Maximalism |
| "soft", "friendly" | Claymorphism, Neumorphism |
| "animated", "motion" | Kinetic Typography, Vaporwave |
