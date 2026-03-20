# FAQ

## General

### What is UI Architect?

A design system orchestrator for AI coding agents. It provides 31 design style specifications, a Flow system for visual coherence, blocking task lists, and automated QA. It works with Amp CLI, Claude Code, Gemini CLI, and OpenCode.

### How is this different from a regular design system?

UI Architect is not a component library or CSS framework. It is a structured workflow that agents follow to build UI that is visually coherent and style-adherent. The style specifications provide the design vocabulary; the agent does the building.

### Does it generate code?

No. UI Architect guides the agent's behavior. The agent reads the style specifications and builds code in your project's tech stack using your existing patterns and dependencies.

## Installation

### Which platforms are supported?

Amp CLI, Claude Code, Gemini CLI, and OpenCode. The installer auto-detects which are present.

### Can I use it with just one platform?

Yes. The installer only installs to detected platforms. If you only have Claude Code, only Claude Code gets the skill.

### Does it require Node.js?

The shell installer does not. The npm package and CLI require Node.js 18+.

### Does the npm package support Windows?

Not yet. The packaged CLI targets macOS and Linux because install, uninstall, and status still rely on Bash scripts. On Windows, use WSL or run the shell installer from a Unix-compatible shell.

### Can I embed it in my project?

Yes. Run `npx ui-architect-skill init ./my-project` to create a `.ui-architect/` directory in your project. The agent resolves styles from there first.

## Usage

### How do I trigger the skill?

In most agents, mentioning design, UI, style, theme, or interface in your prompt triggers the skill. In Claude Code, you can also use `/ui-architect`.

### Can I specify a style?

Yes. Mention the style name in your prompt:

```
Build a dashboard using the Modern Dark style
```

The agent will use it as the primary style.

### Can I blend styles?

Yes. The agent can combine styles when they are compatible. It checks the conflict matrix and identifies bridge styles when needed.

```
Build a landing page with a Modern Dark base and Kinetic Typography for the hero section
```

### What if the agent picks the wrong style?

You can override the selection. Tell the agent which style to use, and it will re-evaluate.

### What is Flow?

Flow is the governing principle that ensures visual, interactive, and semantic coherence across the build. There are 7 Flow types (Cascading, Radial, Grid-Locked, Orbital, Rhythmic, Convergent, Kinetic) selected based on the content structure and style.

## QA

### What does the QA lint check?

9 automated checks across 3 categories:
- **Token adherence**: hardcoded colors, font sizes, border radius consistency
- **Accessibility**: reduced motion, icon button labels, semantic HTML, focus states
- **Completeness**: placeholder content, stub components

### How does remediation work?

If QA finds failures, they are mapped back to specific tasks. The agent fixes only the affected scope, then re-runs the full QA. This cycles up to 3 times until zero failures remain.

### Can I run the lint independently?

Yes:

```bash
bash scripts/qa-lint.sh <target-path> [--style <style-name>]
```

The optional `--style` flag validates that the named style exists and records style context in the report header. The 9 lint checks themselves remain generic in `v1.0.0`.

## Styles

### Can I add my own styles?

Yes. Create `.md` files in `styles/` and matching token cards in `token-cards/`. Update the style table in `SKILL.md`.

### Are all 31 styles equally complete?

Token cards are complete and self-contained. Full style specs vary in section coverage — not every spec includes all canonical sections. When a section is absent, guidance is derived from the style's design philosophy.

### How do I know which styles blend well?

See `reference/conflicts.md` for the full compatibility matrix, bridge styles, and proven blend recipes.

## Claude Code Plugin

### Is this the official Claude Code IDE plugin?

No. This is a skill/plugin package that extends Claude Code with design system expertise. It complements the official Claude Code IDE integration.

### How do I test the plugin locally?

```bash
claude --plugin-dir /path/to/ui-architect-skill
```

### How do I use it with npm?

```bash
npm install -g ui-architect-skill
claude --plugin-dir $(ui-architect-skill plugin-path)
```
