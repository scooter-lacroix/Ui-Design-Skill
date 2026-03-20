# Claude Code Marketplace Guide

## Overview

UI Architect ships with a bundled marketplace manifest so the plugin can be installed through the Claude CLI instead of only being loaded with `--plugin-dir`.

The marketplace name in this repo is `scooter-lacroix`, so installs use the form `ui-architect@scooter-lacroix`.

## Included Files

- `.claude-plugin/plugin.json` — plugin metadata
- `.claude-plugin/marketplace.json` — marketplace definition

## Validate the Manifests

Always validate before testing or publishing:

```bash
claude plugin validate /path/to/ui-architect-skill
```

This is the required release gate for the plugin layer.

## Marketplace Workflow

1. Validate the manifests:

```bash
claude plugin validate /path/to/ui-architect-skill
```

2. Add the repo as a marketplace:

```bash
claude plugin marketplace add /path/to/ui-architect-skill
```

3. Install the plugin from that marketplace:

```bash
claude plugin install ui-architect@scooter-lacroix --scope local
```

4. Verify the installation:

```bash
claude plugin list
```

## Current Marketplace Shape

The shipped manifest follows the current Claude CLI validator shape:

```json
{
  "name": "scooter-lacroix",
  "owner": {
    "name": "scooter-lacroix",
    "url": "https://github.com/scooter-lacroix"
  },
  "plugins": [
    {
      "name": "ui-architect",
      "version": "1.0.0",
      "description": "Design system orchestrator with 31 visual design styles, Flow governance, blocking task lists, and 25-point QA for AI coding agents",
      "source": {
        "source": "github",
        "repo": "scooter-lacroix/Ui-Design-Skill"
      }
    }
  ]
}
```

Key fields:

- `name` is the marketplace identifier used in `plugin@marketplace`
- `owner` identifies the publisher
- `plugins[].name` is the installable plugin identifier
- `plugins[].source` points to the public GitHub repository that contains the plugin

## Git Distribution

For Git-based distribution:

```bash
git clone https://github.com/scooter-lacroix/Ui-Design-Skill.git
claude plugin marketplace add ./Ui-Design-Skill
claude plugin install ui-architect@scooter-lacroix --scope user
```

## npm Distribution

For npm-based distribution:

```bash
npm install -g ui-architect-skill
claude --plugin-dir $(ui-architect-skill plugin-path)
```

If you also want marketplace installation from a packaged or mirrored source, keep `.claude-plugin/marketplace.json` aligned with the published plugin source and re-run `claude plugin validate .`.

## Maintenance Notes

When you update the plugin:

- keep `.claude-plugin/plugin.json` and `package.json` version metadata aligned
- keep `.claude-plugin/marketplace.json` in sync with the published plugin source
- run `claude plugin validate .` before tagging or publishing
