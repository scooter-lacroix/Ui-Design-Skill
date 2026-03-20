# Adoption Guide

This guide covers how teams can adopt UI Architect into their projects, workflows, and CI pipelines.

## Adoption Models

### Model 1: Per-Developer Install

Each developer installs the skill globally. The agent picks it up automatically.

```bash
git clone https://github.com/scooter-lacroix/Ui-Design-Skill.git
cd Ui-Design-Skill
bash install.sh
```

**Best for**: Small teams, individual contributors, open source projects.

### Model 2: Project-Embedded Bundle

Embed the skill bundle directly in the project repository. All team members share the same version.

```bash
# From the project root
npx ui-architect-skill init .
# Creates .ui-architect/ with styles, token-cards, reference, scripts, SKILL.md, VERSION
```

Commit `.ui-architect/` to version control. The agent resolves styles from the project-local directory.

**Best for**: Teams that need version-pinned styles and reproducible builds.

### Model 3: npm Dependency

Add UI Architect as a dev dependency:

```bash
npm install --save-dev ui-architect-skill
```

Team members install via `npm ci`. The skill bundle is available in `node_modules/ui-architect-skill/`.

**Best for**: Node.js projects with standard npm workflows.

### Model 4: Claude Code Plugin

Load as a Claude Code plugin for all sessions:

```bash
claude --plugin-dir /path/to/ui-architect-skill
```

**Best for**: Claude Code users who want plugin-level integration.

## Adding Custom Styles

To extend the style library for your team:

1. Create style specs in `.ui-architect/styles/` (or `styles/` at project root).
2. Create matching token cards in `.ui-architect/token-cards/`.
3. Update the style table in `SKILL.md` to include new entries.
4. Commit the changes to version control.

Custom styles are resolved before the bundled library, so they take precedence.

## CI Integration

### Lint Builds Against a Style

Use the QA lint script in CI to validate that builds adhere to style tokens:

```bash
bash scripts/qa-lint.sh src/ --style modern_dark_design
```

The script exits 0 on pass, 1 on failure. It checks:
- Hardcoded colors, font sizes, border radius consistency
- Reduced motion, icon button labels, missing focus states
- Placeholder content, stub components

### Check Style Bundle Integrity

Verify that the embedded bundle is in sync:

```bash
bash scripts/status.sh
```

### Example GitHub Actions

```yaml
name: Style QA
on: [push, pull_request]
jobs:
  qa:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: bash scripts/qa-lint.sh src/ --style saas_design
```

## Version Management

### Pinning a Version

When embedding the bundle, the `VERSION` file tracks the release. Pin to a specific tag or commit:

```bash
git clone --branch v1.0.0 https://github.com/scooter-lacroix/Ui-Design-Skill.git
(cd Ui-Design-Skill && npx ui-architect-skill init ../my-project)
```

### Updating

```bash
bash install.sh          # Re-syncs all platforms
bash scripts/status.sh   # Confirms sync
```

## Workflow Examples

### Starting a New Feature

1. Open your agent in the project directory.
2. Describe the UI you want to build, optionally mentioning a style.
3. The agent runs the 4-phase protocol.
4. Review the blocking task list before the agent starts building.

### Restyling an Existing Component

1. Describe what you want to change and the target style.
2. The agent assesses the existing code, selects the style, and creates a task list.
3. Tasks are scoped to the components being restyled.

### Building a Design System

1. Request a component library or design system build.
2. The agent uses the Component Library archetype with systematic tokens.
3. QA validates that all components use only design tokens with no hardcoded values.
