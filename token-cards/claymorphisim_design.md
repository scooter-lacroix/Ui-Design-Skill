# Claymorphism — Token Card

## Identity
- **Mood**: Playful, tactile, optimistic
- **Best For**: Consumer apps, SaaS landing pages, creative portfolios, educational platforms, wellness apps targeting younger audiences, playful e-commerce
- **Avoid For**: Enterprise/corporate dashboards, legal/financial services, serious editorial content, data-dense analytics

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| `canvas` | `#F4F1FA` | Primary background (cool lavender-white) |
| `foreground` | `#332F3A` | Primary text (soft charcoal) |
| `muted` | `#635F69` | Secondary text, labels (dark lavender-gray) |
| `accent` | `#7C3AED` | Primary CTAs, links (vivid violet) |
| `accent-alt` | `#DB2777` | Secondary emphasis (hot pink) |
| `tertiary` | `#0EA5E9` | Informational elements, blobs (sky blue) |
| `success` | `#10B981` | Checkmarks, positive indicators (emerald green) |
| `warning` | `#F59E0B` | Alerts, star ratings (amber) |

## Typography
- **Heading Font**: Nunito (rounded terminals complement soft clay aesthetic)
- **Body Font**: DM Sans (geometric, clean, highly readable)
- **Key Weights**: 900 (hero headlines, stats), 800/700 (section titles), 500/400 (body), 700 (small text)
- **Display Scale**: text-8xl on desktop (progressive: text-5xl to text-8xl)

## Geometry
- **Border Radius**: Aggressively rounded — hero sections `rounded-[48px]` to `rounded-[60px]`, cards `rounded-[32px]`, buttons `rounded-[20px]`, small badges `rounded-full`
- **Border Style**: No standard borders; depth is conveyed through multi-layer shadow stacks
- **Shadow System**: 4-layer high-fidelity shadow stacks simulating physical clay — outer drop shadows, top-left highlights, inner colored bounce light, inner rim light; pressed states use inset shadows

## Motion
- **Easing**: ease-out with spring-like feel (bouncy, organic)
- **Speed**: 200ms (active press) to 500ms (card transitions), ambient loops at 6-12s
- **Signature Motion**: Physical squish on click (`active:scale-[0.92]` + inset shadow), hover lift (`-translate-y-1` to `-translate-y-2`), breathing stat orbs (`scale-1.02` oscillation), zero-gravity floating background blobs

## Signature Elements (Bold Factor)
- 4-layer shadow stacks on every element — the engine of high-fidelity clay simulation with outer, highlight, inner bounce, and inner rim shadows
- "Squish" animation on button click — scale-[0.92] combined with shadow-clayPressed inset shadows
- Glass-clay hybrid cards using semi-transparent white (bg-white/60 to /80) with backdrop-blur-xl revealing animated background blobs
- Animated background blobs (3-4 required) in accent colors at 10% opacity with blur-3xl — never use flat backgrounds
- Vibrant gradient icon orbs with varied candy-store colors (violet, pink, blue, green, cyan, amber)
- Zero sharp corners anywhere — minimum radius is rounded-[20px]; everything signals safety and approachability

## Anti-Patterns
- Sharp corners (rounded-md, rounded-sm) — the minimum is rounded-[20px], never less
- Gray text lighter than #635F69 — fails accessibility against light backgrounds
- Flat solid backgrounds without animated blobs or gradients — the ambient lighting is mandatory
- Gradient text below text-5xl — readability risk at smaller sizes
- Buttons smaller than h-11 (44px) — accessibility requirement and tactile feel
- Skipping hover lift on interactive elements — the float is core to the physical illusion

## Blend Compatibility
- **Family**: maximalist
- **Blends Well With**: Playful Geometric, SaaS, Neuromorphic
- **Conflicts With**: Swiss Minimalist, Industrial, Newsprint
