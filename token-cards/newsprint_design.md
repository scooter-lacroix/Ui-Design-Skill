# Newsprint — Token Card

## Identity
- **Mood**: Authoritative, intellectual, urgent
- **Best For**: Editorial sites, blogs, news platforms, long-form content, documentation
- **Avoid For**: Playful apps, children's products, SaaS dashboards, creative portfolios

## Color Tokens
| Token | Value | Usage |
|:------|:------|:------|
| Background | `#F9F9F7` | Newsprint off-white (warm paper) |
| Foreground | `#111111` | Ink black for text and borders |
| Muted | `#E5E5E0` | Divider grey for secondary borders |
| Accent | `#CC0000` | Editorial red — extremely sparingly for breaking/CTAs |
| Border | `#111111` | Primary structural grid element |
| Neutral-500 | `#737373` | Metadata, captions |

## Typography
- **Heading Font**: Playfair Display (serif)
- **Body Font**: Lora (serif)
- **Key Weights**: 400, 600, 700, 900
- **Display Scale**: text-9xl (128px)

## Geometry
- **Border Radius**: 0px everywhere — no exceptions
- **Border Style**: 1px solid black standard, 4px for major dividers; always solid
- **Shadow System**: Flat — no soft shadows; hard offset `4px 4px 0px 0px #111111` on hover only

## Motion
- **Easing**: ease-out / ease-in-out
- **Speed**: 200-300ms (fast, snappy)
- **Signature Motion**: Color inversion on buttons; hard shadow + translate on card hover; instant state changes

## Signature Elements (Bold Factor)
- Vertical grid dividers with `border-r` creating newspaper columns
- Drop caps (text-7xl, float-left) on key paragraphs
- Marquee ticker bar (black bg, white text, red badges)
- Edition metadata ("Vol. 1 | Date | Edition")
- Grayscale images with sepia hover effect
- Justified text in multi-column body layouts

## Anti-Patterns
- Any border-radius (must be 0px)
- Soft drop shadows or blur effects
- Gradient overlays or backgrounds
- Modern minimalist airy spacing (density is key)
- Removing link underlines
- Smooth easing transitions (changes should be snappy)

## Blend Compatibility
- **Family**: flat
- **Blends Well With**: swiss minimalist, monochrome, bold typography
- **Conflicts With**: neumorphism, organic-natural, vaporwave
