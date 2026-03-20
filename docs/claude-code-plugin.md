# Claude Code Plugin

UI Architect can be used as a Claude Code plugin in two ways:

- Load the repo directly for the current session with `--plugin-dir`
- Add the repo as a marketplace and install `ui-architect` through the Claude CLI after the public repository is pushed

## Direct Loading

This is the fastest way to test the plugin during development:

```bash
claude --plugin-dir /path/to/ui-architect-skill
```

After Claude Code starts, the skill is available as `/ui-architect` and also auto-triggers on relevant design and UI prompts.

## Validate Before Use

Use the built-in validator before publishing or testing a marketplace install:

```bash
claude plugin validate /path/to/ui-architect-skill
```

This validates both `.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json` against the current Claude Code schema.

## Install Through the Bundled Marketplace

The repo ships with a marketplace manifest named `scooter-lacroix`. That manifest points at the public GitHub repository as the plugin source, so it is the release-ready path rather than the local development path.

1. Validate the plugin and marketplace manifests:

```bash
claude plugin validate /path/to/ui-architect-skill
```

2. Add the marketplace:

```bash
claude plugin marketplace add /path/to/ui-architect-skill
```

3. Install the plugin from that marketplace:

```bash
claude plugin install ui-architect@scooter-lacroix --scope local
```

4. Confirm the install:

```bash
claude plugin list
```

## Plugin Structure

```text
ui-architect-skill/
├── .claude-plugin/
│   ├── plugin.json
│   └── marketplace.json
└── skills/
    └── ui-architect/
        ├── SKILL.md
        └── skill.md
```

- `.claude-plugin/plugin.json` defines plugin metadata and points Claude Code at `./skills/`
- `.claude-plugin/marketplace.json` defines the bundled marketplace entry and points to the public GitHub repo as the install source
- `skills/ui-architect/SKILL.md` is the canonical plugin skill file
- `skills/ui-architect/skill.md` is kept as a lowercase compatibility copy

## Distribution Options

### npm Package

```bash
npm install -g ui-architect-skill
claude --plugin-dir $(ui-architect-skill plugin-path)
```

### Git Repository

```bash
git clone https://github.com/scooter-lacroix/Ui-Design-Skill.git
claude --plugin-dir ./Ui-Design-Skill
```

### Marketplace Install

```bash
claude plugin marketplace add /path/to/ui-architect-skill
claude plugin install ui-architect@scooter-lacroix --scope user
```

## Release Guidance

Before releasing a new version:

- Run `claude plugin validate .`
- Confirm `VERSION`, `package.json`, and `.claude-plugin/plugin.json` all agree
- Confirm the public GitHub repo contains the exact release commit referenced by the package metadata

## What This Plugin Adds

Claude Code provides the agent runtime, tools, and session management. UI Architect adds:

- style selection across 31 bundled design systems
- Flow-driven UI coherence
- blocking task list generation
- automated QA and remediation guidance

The plugin does not replace Claude Code. It gives Claude a structured design-system workflow it can load and reuse.
