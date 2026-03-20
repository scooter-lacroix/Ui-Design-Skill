# UI Architect

A design system orchestrator for AI coding agents. Selects a visual design language from 31 bundled style specifications, determines a governing **Flow**, builds via a blocking task list, and enforces completion through automated QA with targeted remediation.

No partial work. No generic output. Every build is style-adherent and flow-coherent.

## Why

AI coding agents produce UI quickly, but the result is often visually inconsistent, stylistically generic, or incomplete. UI Architect closes that gap by providing a structured design workflow that agents can follow — from style selection through build execution to QA validation.

It works across Amp CLI, Claude Code, Gemini CLI, and OpenCode, and can be adopted into any project as an npm package or Claude Code plugin.

## Key Capabilities

- **31 design style specifications** covering tokens, components, layout, motion, and accessibility
- **Style blending** with a conflict matrix, bridge styles, and proven blend recipes
- **Flow system** — 7 flow types that govern visual, interactive, and semantic coherence
- **Blocking task list** with archetypes for landing pages, app UIs, dashboards, component libraries, and editorial content
- **25-point QA checklist** plus an automated lint script with 9 checks for token adherence, accessibility, and completeness
- **Targeted remediation** — failures map back to specific tasks for precise fixes, up to 3 cycles

## Supported Platforms

| Platform | Skill Location |
|:---------|:---------------|
| Amp CLI | `~/.config/amp/skills/ui-architect/` |
| Claude Code | `~/.claude/skills/ui-architect/` |
| Gemini CLI | `~/.gemini/skills/ui-architect/` |
| OpenCode | `~/.config/opencode/skills/ui-architect/` |

## Quick Start

### Git clone (recommended)

```bash
git clone https://github.com/scooter-lacroix/Ui-Design-Skill.git
cd Ui-Design-Skill
bash install.sh
```

The installer auto-detects which platforms you have and installs only to those.

### npm

The npm package currently supports macOS and Linux. For Windows environments, use WSL or run the shell installer from a Unix-compatible shell.

```bash
npx ui-architect-skill install
```

Or add it to a project and run it locally:

```bash
npm add -D ui-architect-skill
npx ui-architect-skill init .
```

Or install globally:

```bash
npm install -g ui-architect-skill
ui-architect-skill install
```

### Claude Code plugin

```bash
claude --plugin-dir /path/to/ui-architect-skill
```

See [docs/claude-code-plugin.md](docs/claude-code-plugin.md) for full plugin setup instructions.

## Uninstall

```bash
bash uninstall.sh
# or
npx ui-architect-skill uninstall
```

## Repo Structure

```
ui-architect-skill/
├── SKILL.md                  # Agent-facing skill definition (4-phase protocol)
├── VERSION                   # Current release version
├── install.sh                # Universal installer (all platforms)
├── uninstall.sh              # Universal uninstaller
├── styles/                   # 31 full design style specifications
├── token-cards/              # 31 lightweight style summaries for fast selection
├── reference/                # Conflict matrix, task archetypes
├── scripts/                  # QA lint, status check, style normalizer
├── bin/                      # Node CLI entry point
├── docs/                     # Adoption and publishing documentation
├── .claude-plugin/           # Claude Code plugin metadata
└── skills/                   # Plugin-facing skill bundle
```

## Adopting Into a Project

**Local embedding** — copy the skill bundle into your project:

```bash
npx ui-architect-skill init ./my-project
# Creates ./my-project/.ui-architect/ with all styles, token cards, and scripts
```

**Per-platform install** — install globally for your agent:

```bash
bash install.sh
```

See [docs/adoption-guide.md](docs/adoption-guide.md) for team adoption workflows and CI integration.

## Claude Code Plugin Usage

After loading the plugin, invoke the skill in your prompt:

```
Build a SaaS landing page with a dark, cinematic look
```

The agent will:
1. Select the best matching style (e.g., Modern Dark)
2. Determine the governing Flow type
3. Create a blocking task list
4. Build each component to specification
5. Run QA and remediate any failures

See [docs/claude-code-plugin.md](docs/claude-code-plugin.md) for setup and [docs/style-library.md](docs/style-library.md) for the full style catalog.

## npm Package

```bash
# Install
npm install -g ui-architect-skill
npm add -D ui-architect-skill

# Commands
ui-architect-skill help          # Show usage
ui-architect-skill install       # Install to all detected platforms
ui-architect-skill uninstall     # Remove from all platforms
ui-architect-skill status        # Check sync status across platforms
ui-architect-skill init ./dir    # Copy bundle into a project
ui-architect-skill plugin-path   # Print path for --plugin-dir
```

See [docs/npm-package.md](docs/npm-package.md) for details.

## Documentation

| Document | Description |
|:---------|:------------|
| [Getting Started](docs/getting-started.md) | Overview, concepts, and first build |
| [Installation](docs/installation.md) | Install matrix for all platforms and npm |
| [Adoption Guide](docs/adoption-guide.md) | Team workflows, project embedding, CI |
| [Style Library](docs/style-library.md) | Full catalog of 31 styles with examples |
| [Claude Code Plugin](docs/claude-code-plugin.md) | Plugin setup, local testing, marketplace |
| [npm Package](docs/npm-package.md) | CLI reference and package consumption |
| [Release Process](docs/release.md) | Checklists and publish workflow |
| [FAQ](docs/faq.md) | Common questions and troubleshooting |
| [Marketplace Guide](docs/marketplace/claude-code-marketplace.md) | Marketplace setup and distribution |

## Contributing

Contributions are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding styles, reporting issues, and submitting changes.

## Support

See [SUPPORT.md](SUPPORT.md) for how to get help, report bugs, and request features.

## Security

See [SECURITY.md](SECURITY.md) for the security policy and vulnerability reporting.

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).

## License

[MIT](LICENSE)
