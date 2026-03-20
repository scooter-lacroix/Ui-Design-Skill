# UI Architect — Task List Archetypes

Task list templates for common build types. Every archetype starts with **T-01 Design Token Foundation** and ends with **Final Flow Audit**. Flow obligations must be adapted to the selected style's motion philosophy, easing family, and color gravity model.

---

## Archetype 1: Marketing / Landing Page

**Use when**: Building a single-page marketing site, product landing page, portfolio showcase, or conversion-focused page.

**Typical scope**: Hero → Social proof → Features → Testimonials → Pricing → CTA → Footer

**Flow Contract**: Every task must declare a Flow Contract specifying: how it shares token/color with adjacent tasks, boundary treatment between sections, and transitions using the style's Flow Signature easing. Marketing pages tend toward **Cascading** (top-to-bottom storytelling), **Convergent** (funnel toward CTA), or **Rhythmic** (alternating section density).

### Task Template

```
T-01: Design Token Foundation                          [BLOCKED BY: none]
  ├─ Scope: CSS variables / theme config for colors, typography, spacing, radii, shadows
  ├─ Style Spec: "Design Tokens" section
  ├─ Flow: Establish the color gravity anchor and motion easing family
  └─ Done when: All tokens from style spec are defined, no hardcoded values

T-02: Layout Shell & Responsive Grid                   [BLOCKED BY: T-01]
  ├─ Scope: Page container, max-width, responsive breakpoints, section spacing, global background
  ├─ Style Spec: "Layout & Spacing" section
  ├─ Flow Contract: Section transitions use [easing from Flow Signature]; background gradient bleeds between sections per style's color gravity model
  └─ Done when: Empty but correctly structured page skeleton renders at all breakpoints (mobile, tablet, desktop)

T-03: Navigation Component                             [BLOCKED BY: T-01, T-02]
  ├─ Scope: Header bar, logo, nav links, mobile hamburger menu, CTA button
  ├─ Style Spec: "Component Patterns" section
  ├─ Flow Contract: Nav anchors top of visual flow; mobile menu open/close transitions use Flow Signature easing; shares border/color tokens with T-02 layout shell
  └─ Done when: Desktop + mobile nav renders with all states (default, hover, focus, active, mobile open/close)

T-04: Hero Section                                     [BLOCKED BY: T-01, T-02]
  ├─ Scope: Headline, subheadline, primary CTA, secondary CTA, hero visual/illustration, background treatment
  ├─ Style Spec: "Design Tokens", "Component Patterns", "Signature Elements" sections
  ├─ Flow Contract: Hero is the Flow origin point — establishes directional momentum; CTA styling shares tokens with T-03 nav; background treatment shares color with T-02 shell
  └─ Done when: Hero renders at all breakpoints with gradient text, animations, background effects per style spec

T-05: Social Proof / Trust Bar                         [BLOCKED BY: T-04]
  ├─ Scope: Logo strip, testimonial quotes, star ratings, user count
  ├─ Style Spec: "Component Patterns", "Design Tokens" sections
  ├─ Flow Contract: Shares background treatment with T-04 or transitions via style's section boundary approach; testimonials use card tokens from T-01
  └─ Done when: Logo strip and at least 3 testimonial cards render with correct styling

T-06: Features Section                                 [BLOCKED BY: T-01, T-02]
  ├─ Scope: Section heading, feature grid/cards (3-6 features), icons, descriptions
  ├─ Style Spec: "Component Patterns", "Iconography", "Layout & Spacing" sections
  ├─ Flow Contract: Feature cards share border-radius and shadow tokens with T-05 cards; section heading uses same typographic scale as T-04 hero subheadline
  └─ Done when: Feature grid renders with correct card styling, icons, and responsive layout

T-07: Detailed Feature / How It Works                  [BLOCKED BY: T-06]
  ├─ Scope: Step-by-step flow, screenshots/mockups, numbered items, detailed descriptions
  ├─ Style Spec: "Component Patterns", "Design Tokens", "Animation & Motion" sections
  ├─ Flow Contract: Steps use same card/container tokens as T-06; numbering uses label typography from T-01; animations use Flow Signature easing
  └─ Done when: All steps render with correct visual hierarchy and any scroll-triggered animations

T-08: Testimonials / Case Studies                      [BLOCKED BY: T-01]
  ├─ Scope: Testimonial cards, quotes, author photos, company logos, case study blocks
  ├─ Style Spec: "Component Patterns", "Design Tokens" sections
  ├─ Flow Contract: Shares card tokens with T-06 features; author styling uses body typography from T-01; section background provides visual rhythm break per style's color gravity
  └─ Done when: Testimonial section renders with correct card styling and author attribution

T-09: Pricing Section                                  [BLOCKED BY: T-01]
  ├─ Scope: Pricing tiers (2-4), feature comparison, toggle (monthly/yearly), CTA per tier
  ├─ Style Spec: "Component Patterns", "Design Tokens" sections
  ├─ Flow Contract: Pricing cards use same border/shadow system as T-06/T-08; highlighted tier uses accent token from T-01; toggle animation uses Flow Signature easing
  └─ Done when: All pricing tiers render, toggle works, CTAs are styled per button spec

T-10: Final CTA Section                                [BLOCKED BY: T-04, T-09]
  ├─ Scope: Closing headline, description, primary CTA button, background treatment
  ├─ Style Spec: "Design Tokens", "Component Patterns", "Signature Elements" sections
  ├─ Flow Contract: CTA button shares exact styling with T-04 hero CTA; background treatment creates visual crescendo per style's color gravity; heading mirrors T-04 hero typography scale
  └─ Done when: Final CTA renders with maximum visual weight per style spec

T-11: Footer                                           [BLOCKED BY: T-02]
  ├─ Scope: Logo, link columns, social icons, copyright, legal links
  ├─ Style Spec: "Component Patterns", "Design Tokens" sections
  ├─ Flow Contract: Shares border token with T-02 layout shell; typography uses muted/secondary tokens from T-01; social icons use same interactive states as T-03 nav
  └─ Done when: Footer renders with correct link structure and responsive column layout

T-12: Final Flow Audit                                  [BLOCKED BY: all previous]
  ├─ Scope: Verify visual, interactive, and semantic flow across all completed tasks
  ├─ Flow Contract: End-to-end eye-tracking walkthrough — verify the eye travels hero → trust → features → proof → pricing → CTA without dead zones; verify all animations use the same easing family; verify section transitions are designed, not accidental
  └─ Done when: A user's eye naturally travels through the entire page; all Flow Contracts from T-02 through T-11 are verified; no orphaned elements exist
```

---

## Archetype 2: Application UI (Full App Shell)

**Use when**: Building a full application with navigation, multiple views/pages, forms, and interactive components.

**Typical scope**: App shell (sidebar + header) → Dashboard/home view → Settings → Profile → Data views → Forms

**Flow Contract**: Every task must declare a Flow Contract specifying: how it shares token/color with adjacent tasks, boundary treatment between views/panels, and transitions using the style's Flow Signature easing. App UI Flow tends toward **Orbital** (elements orbit around a central workspace) or **Grid-Locked** (systematic panel layout).

### Task Template

```
T-01: Design Token Foundation                          [BLOCKED BY: none]
  ├─ Scope: CSS variables / theme config for colors, typography, spacing, radii, shadows, elevation levels
  ├─ Style Spec: "Design Tokens" section
  ├─ Flow: Establish the color gravity anchor, motion easing family, and elevation scale
  └─ Done when: All tokens from style spec are defined including elevation levels; no hardcoded values

T-02: App Shell & Navigation                           [BLOCKED BY: T-01]
  ├─ Scope: Sidebar navigation, top header bar, breadcrumbs, mobile drawer, layout grid (sidebar + main)
  ├─ Style Spec: "Component Patterns", "Layout & Spacing" sections
  ├─ Flow Contract: Sidebar shares background/surface tokens with main content area; active nav item uses accent token; mobile drawer animation uses Flow Signature easing; header shares border token with sidebar
  └─ Done when: App shell renders with sidebar + header + main content area at all breakpoints; mobile drawer opens/closes with animation

T-03: Typography & Text Components                    [BLOCKED BY: T-01]
  ├─ Scope: Heading hierarchy (h1-h4), body text, captions, labels, links, inline code
  ├─ Style Spec: "Design Tokens" section
  ├─ Flow Contract: All text components reference token variables from T-01; link hover states use Flow Signature easing
  └─ Done when: Complete typographic scale renders correctly; all weights and sizes match style spec

T-04: Button System                                    [BLOCKED BY: T-01]
  ├─ Scope: Primary, secondary, ghost, destructive, icon-only buttons; sizes (sm, md, lg); all states
  ├─ Style Spec: "Component Patterns" section
  ├─ Flow Contract: All button variants share the same border-radius and shadow tokens from T-01; hover/focus/active transitions use Flow Signature easing; disabled state uses muted token
  └─ Done when: All button variants render with correct styling and all interactive states (default, hover, focus, active, disabled, loading)

T-05: Form Components                                  [BLOCKED BY: T-01, T-04]
  ├─ Scope: Text input, textarea, select/dropdown, checkbox, radio, toggle/switch, file upload
  ├─ Style Spec: "Component Patterns" sections
  ├─ Flow Contract: Input borders/shadows share token values with T-04 buttons; focus ring uses accent token; labels use caption typography from T-03; error/success states use semantic colors
  └─ Done when: All form components render with correct styling, labels, validation states, and focus indicators

T-06: Data Display Components                          [BLOCKED BY: T-01]
  ├─ Scope: Table, card, list, stat/block, badge/tag, avatar, tooltip
  ├─ Style Spec: "Component Patterns" sections
  ├─ Flow Contract: Cards share border/shadow tokens with T-02 panels; tables use body typography from T-03; badges use accent/muted tokens; tooltips use surface + border tokens
  └─ Done when: All data display components render with correct styling and responsive behavior

T-07: Dashboard / Home View                            [BLOCKED BY: T-02, T-06]
  ├─ Scope: Stat cards, chart area, recent activity, quick actions
  ├─ Style Spec: "Component Patterns", "Layout & Spacing", "Signature Elements" sections
  ├─ Flow Contract: Stat cards use card tokens from T-06; layout follows grid from T-02; quick actions use button tokens from T-04; section spacing matches app shell rhythm
  └─ Done when: Dashboard view renders with stat cards, chart placeholder, and activity feed

T-08: Settings View                                    [BLOCKED BY: T-02, T-05]
  ├─ Scope: Settings sections, toggle groups, select fields, save/cancel actions
  ├─ Style Spec: "Component Patterns", "Layout & Spacing" sections
  ├─ Flow Contract: Settings form uses input tokens from T-05; section headings use typography from T-03; save/cancel buttons use T-04 button tokens; shares layout grid with T-02
  └─ Done when: Settings view renders with form sections, toggles, and action buttons

T-09: Profile View                                     [BLOCKED BY: T-02, T-06]
  ├─ Scope: Profile header (avatar, name, bio), tabs/sections, edit form, activity history
  ├─ Style Spec: "Component Patterns", "Design Tokens" sections
  ├─ Flow Contract: Profile card uses card tokens from T-06; avatar uses border-radius from T-01; tabs use same active state treatment as T-02 sidebar nav
  └─ Done when: Profile view renders with header, tabs, and content sections

T-10: Loading & Empty States                           [BLOCKED BY: T-01]
  ├─ Scope: Skeleton loaders, spinner, empty state illustrations, error state
  ├─ Style Spec: "Animation & Motion", "Design Tokens" sections
  ├─ Flow Contract: Skeleton loaders use muted/surface tokens from T-01; spinner animation uses Flow Signature easing; error state uses destructive token
  └─ Done when: Loading skeleton, empty state, and error state render for at least one view

T-11: Notification & Feedback System                   [BLOCKED BY: T-01, T-04]
  ├─ Scope: Toast/snackbar, modal/dialog, confirmation prompt, inline validation messages
  ├─ Style Spec: "Animation & Motion", "Component Patterns" sections
  ├─ Flow Contract: Toast enter/exit animations use Flow Signature easing; modal overlay uses surface token from T-01; action buttons in modals use T-04 button tokens
  └─ Done when: Toast, modal, and inline validation render with correct animations and styling

T-12: Final Flow Audit                                  [BLOCKED BY: all previous]
  ├─ Scope: Verify visual, interactive, and semantic flow across the entire application shell
  ├─ Flow Contract: End-to-end navigation walkthrough — verify sidebar → header → content area flow; verify all interactive elements share the same motion signature; verify consistent elevation hierarchy; verify token consistency across all views
  └─ Done when: Application shell feels cohesive across all views; all Flow Contracts from T-02 through T-11 are verified; no orphaned components or inconsistent tokens
```

---

## Archetype 3: Dashboard

**Use when**: Building a data-heavy dashboard, analytics panel, admin panel, or monitoring interface.

**Typical scope**: Shell → Stat cards → Charts → Data tables → Filters → Activity feed

**Flow**: Tends toward **Grid-Locked** or **Orbital**. Information density is high; clarity is paramount.

### Task Template

```
T-01: Design Token Foundation                          [BLOCKED BY: none]
  ├─ Scope: CSS variables for colors, typography, spacing, radii, shadows, chart palette
  ├─ Style Spec: "Design Tokens" section
  ├─ Flow: Establish color gravity for data hierarchy (most important metric gets most visual weight)
  └─ Done when: All tokens defined including chart color palette; no hardcoded values

T-02: Dashboard Shell & Sidebar                        [BLOCKED BY: T-01]
  ├─ Scope: Sidebar nav, top bar (search, notifications, profile), main content area, responsive grid
  ├─ Style Spec: "Component Patterns", "Layout & Spacing" sections
  ├─ Flow Contract: Sidebar active state uses accent token; content area shares surface token with sidebar
  └─ Done when: Shell renders with nav + content area; responsive layout works

T-03: Stat Cards & KPI Row                             [BLOCKED BY: T-01, T-02]
  ├─ Scope: Metric cards (4-6), trend indicators, sparklines, comparison values
  ├─ Style Spec: "Component Patterns", "Design Tokens" sections
  ├─ Flow Contract: Card border/shadow matches T-02 panel style; metric values use display typography; trend colors use semantic tokens
  └─ Done when: KPI row renders with correct card styling and typography hierarchy

T-04: Chart Components                                 [BLOCKED BY: T-01, T-03]
  ├─ Scope: Line chart, bar chart, donut/pie, area chart (as needed)
  ├─ Style Spec: "Design Tokens" sections
  ├─ Flow Contract: Chart colors use palette tokens from T-01; chart container shares card tokens from T-03; tooltips share surface/border tokens
  └─ Done when: All chart types render with correct colors and responsive sizing

T-05: Data Table                                       [BLOCKED BY: T-01]
  ├─ Scope: Table with sorting, filtering, pagination, row actions, column headers
  ├─ Style Spec: "Component Patterns", "Design Tokens" sections
  ├─ Flow Contract: Table borders use border token from T-01; header uses muted background; row hover uses Flow Signature easing; pagination uses button tokens
  └─ Done when: Table renders with sorting, pagination, and correct styling

T-06: Filter & Search Bar                              [BLOCKED BY: T-01, T-05]
  ├─ Scope: Search input, date range picker, dropdown filters, active filter tags
  ├─ Style Spec: "Component Patterns" sections
  ├─ Flow Contract: Inputs use token values from T-01; filter tags use accent/muted tokens; clear button uses ghost button style
  └─ Done when: Filter bar renders with search, dropdowns, and active filter tags

T-07: Activity Feed / Recent Events                    [BLOCKED BY: T-01]
  ├─ Scope: Timeline list, event cards, status badges, timestamps
  ├─ Style Spec: "Component Patterns", "Design Tokens" sections
  ├─ Flow Contract: Event items use same list styling as T-05 table rows; timestamps use caption typography; badges use accent token
  └─ Done when: Activity feed renders with timeline styling and correct badges

T-08: Final Flow Audit                                  [BLOCKED BY: all previous]
  ├─ Scope: Verify data hierarchy, visual flow, and interactive consistency
  ├─ Flow Contract: Verify eye moves from KPIs → charts → table naturally; verify all charts share the same palette; verify consistent elevation across cards and panels
  └─ Done when: Dashboard presents data with clear hierarchy; all Flow Contracts verified; no visual dead zones
```

---

## Archetype 4: Component Library / Design System

**Use when**: Building a reusable component library, design system documentation, or Storybook-style component catalog.

**Typical scope**: Tokens → Primitives (Button, Input, Tag) → Composites (Card, Modal, Table) → Patterns (Form, Nav, Data Display) → Documentation pages

**Flow**: **Grid-Locked** — systematic, predictable, documented. Every component must demonstrate all states.

### Task Template

```
T-01: Design Token Foundation                          [BLOCKED BY: none]
  ├─ Scope: Complete token system — colors, typography, spacing, radii, shadows, elevation, motion, semantic colors
  ├─ Style Spec: "Design Tokens" section
  ├─ Flow: Document the complete token vocabulary; these tokens govern every component below
  └─ Done when: All tokens from style spec defined with semantic names; token documentation page renders

T-02: Primitive Components — Buttons                   [BLOCKED BY: T-01]
  ├─ Scope: Button variants (primary, secondary, ghost, destructive, icon), sizes, all states
  ├─ Style Spec: "Component Patterns" section
  ├─ Flow Contract: All variants share border-radius and shadow tokens; transitions use Flow Signature easing
  └─ Done when: All button variants render with every state (default, hover, focus, active, disabled, loading)

T-03: Primitive Components — Inputs                    [BLOCKED BY: T-01]
  ├─ Scope: Text input, textarea, select, checkbox, radio, toggle, file upload
  ├─ Style Spec: "Component Patterns" section
  ├─ Flow Contract: Focus ring uses accent token; error/success use semantic tokens; label uses caption typography
  └─ Done when: All input types render with default, focus, error, disabled states

T-04: Primitive Components — Typography & Tags        [BLOCKED BY: T-01]
  ├─ Scope: Complete type scale, headings, body, captions, links, code, badges/tags
  ├─ Style Spec: "Design Tokens" section
  ├─ Flow Contract: Link hover uses Flow Signature easing; badges use accent/muted/destructive tokens
  └─ Done when: Complete type scale renders; all tag/badge variants shown

T-05: Composite Components — Cards                     [BLOCKED BY: T-01, T-02]
  ├─ Scope: Content card, stat card, profile card, interactive card with hover
  ├─ Style Spec: "Component Patterns" section
  ├─ Flow Contract: Cards share elevation/shadow tokens; interactive card hover uses Flow Signature easing
  └─ Done when: All card variants render with correct styling and hover states

T-06: Composite Components — Modals & Overlays         [BLOCKED BY: T-01, T-02]
  ├─ Scope: Dialog/modal, drawer, popover, tooltip, toast
  ├─ Style Spec: "Animation & Motion", "Component Patterns" sections
  ├─ Flow Contract: Enter/exit animations use Flow Signature easing; overlay uses surface token; action buttons use T-02 tokens
  └─ Done when: All overlay types render with enter/exit animations

T-07: Composite Components — Navigation                [BLOCKED BY: T-01, T-02]
  ├─ Scope: Navbar, sidebar, tabs, breadcrumbs, pagination
  ├─ Style Spec: "Component Patterns" section
  ├─ Flow Contract: Active state uses accent token; mobile menu animation uses Flow Signature easing
  └─ Done when: All navigation patterns render with active, hover, focus states

T-08: Composite Components — Data Display              [BLOCKED BY: T-01, T-05]
  ├─ Scope: Table, list, avatar group, progress bar, skeleton loader
  ├─ Style Spec: "Component Patterns" sections
  ├─ Flow Contract: Table borders share border token; skeleton pulse uses Flow Signature easing
  └─ Done when: All data display components render with correct styling

T-09: Pattern Templates                                [BLOCKED BY: T-02 through T-08]
  ├─ Scope: Login form, signup form, search page, settings panel, empty state, error state
  ├─ Style Spec: All relevant sections
  ├─ Flow Contract: Patterns compose primitives and composites using shared tokens
  └─ Done when: All pattern templates render using only library components

T-10: Final Flow Audit                                  [BLOCKED BY: all previous]
  ├─ Scope: Verify token consistency, state coverage, and component cohesion
  ├─ Flow Contract: Verify all components use tokens (no hardcoded values); verify all states demonstrated; verify consistent motion across all interactive elements
  └─ Done when: Every component uses only design tokens; all states shown; motion is consistent; library feels cohesive
```

---

## Archetype 5: Content / Editorial Page

**Use when**: Building a blog, documentation site, article page, news layout, or long-form content experience.

**Typical scope**: Article header → Body content → Images/media → Sidebar → Related content → Footer

**Flow**: Tends toward **Cascading** — content flows top-to-bottom with typographic rhythm driving the visual path.

### Task Template

```
T-01: Design Token Foundation                          [BLOCKED BY: none]
  ├─ Scope: CSS variables for colors, typography (including article-specific scales), spacing, radii
  ├─ Style Spec: "Design Tokens" section
  ├─ Flow: Establish reading-optimized typographic scale and color contrast for long-form readability
  └─ Done when: All tokens defined including article typography scale; no hardcoded values

T-02: Page Shell & Content Layout                      [BLOCKED BY: T-01]
  ├─ Scope: Content container (max-width for readability), sidebar, grid layout, responsive behavior
  ├─ Style Spec: "Layout & Spacing" section
  ├─ Flow Contract: Content max-width optimizes reading line length (~65-75 characters); sidebar shares surface tokens
  └─ Done when: Content layout renders with correct max-width and responsive sidebar behavior

T-03: Article Header                                   [BLOCKED BY: T-01, T-02]
  ├─ Scope: Title, subtitle, author, date, reading time, category/tag, featured image
  ├─ Style Spec: "Design Tokens", "Component Patterns" sections
  ├─ Flow Contract: Title uses display typography; metadata uses caption scale; featured image shares border-radius with T-05 inline images
  └─ Done when: Article header renders with full metadata and featured image

T-04: Article Body & Rich Text                         [BLOCKED BY: T-01]
  ├─ Scope: Paragraphs, headings (h2-h4), blockquotes, code blocks, lists, links, images, captions
  ├─ Style Spec: "Design Tokens" section
  ├─ Flow Contract: Body text uses optimized reading font/size/line-height; heading scale creates clear hierarchy; blockquote uses accent/border token; code blocks use mono font
  └─ Done when: All rich text elements render with correct typographic styling; reading experience is comfortable

T-05: Media & Interactive Elements                     [BLOCKED BY: T-01]
  ├─ Scope: Inline images, image galleries, embedded video, code playgrounds, interactive diagrams
  ├─ Style Spec: "Component Patterns", "Animation & Motion" sections
  ├─ Flow Contract: Images use consistent border-radius; gallery uses grid from T-02; interactive elements use Flow Signature easing
  └─ Done when: All media types render with correct styling and responsive behavior

T-06: Sidebar & Related Content                        [BLOCKED BY: T-01, T-02]
  ├─ Scope: Table of contents, related articles, author bio, newsletter signup, tags/categories
  ├─ Style Spec: "Component Patterns", "Design Tokens" sections
  ├─ Flow Contract: TOC active link uses accent token; author card uses card tokens; newsletter input uses input tokens from T-01
  └─ Done when: Sidebar renders with TOC, related articles, and author bio

T-07: Footer & Navigation                              [BLOCKED BY: T-02]
  ├─ Scope: Site footer, prev/next article links, related categories, back-to-top
  ├─ Style Spec: "Component Patterns", "Design Tokens" sections
  ├─ Flow Contract: Footer shares border token with T-02 layout; prev/next links use same styling as body links
  └─ Done when: Footer and article navigation render with correct styling

T-08: Final Flow Audit                                  [BLOCKED BY: all previous]
  ├─ Scope: Verify reading flow, typographic consistency, and visual rhythm
  ├─ Flow Contract: Verify eye moves naturally from header → body → media → sidebar; verify consistent typographic rhythm; verify no reading dead zones; verify all links and interactive elements have proper states
  └─ Done when: Article reads comfortably; typographic hierarchy is clear; all media renders correctly; all Flow Contracts verified
```

---

## Adapting Archetypes to Styles

When selecting a style for any archetype:

1. **Flow Contract obligations** must reference the style's specific easing family, color gravity model, and motion philosophy.
2. **Token values** in "Done when" criteria must match the style's actual token specifications.
3. **Component behavior** (hover, focus, transitions) must follow the style's interaction model.
4. **Bold Factor elements** from the selected style must appear in at least 2-3 tasks.
5. **Anti-patterns** from the selected style must be explicitly avoided in all tasks.
6. **Border radius, shadows, and depth model** must be consistent with the style's geometry specification.
