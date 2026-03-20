# npm Package

UI Architect is distributed as an npm package (`ui-architect-skill`). It has zero runtime dependencies.

The published package targets macOS and Linux. On Windows, use WSL or clone the repository and run the shell installer from a Unix-compatible shell.

## Installation

### Global install

```bash
npm install -g ui-architect-skill
```

### Dev dependency

```bash
npm add -D ui-architect-skill
```

Equivalent long form:

```bash
npm install --save-dev ui-architect-skill
```

### One-time use

```bash
npx ui-architect-skill <command>
```

## Requirements

- Node.js 18+
- macOS or Linux for the packaged CLI and installer
- npm 9+ for `npm add` shorthand, or use `npm install --save-dev`

## CLI Reference

```
ui-architect-skill <command> [options]
```

### Commands

| Command | Description |
|:--------|:------------|
| `help` | Show usage information |
| `install` | Install the skill to all detected platforms (Amp, Claude Code, Gemini, OpenCode) |
| `uninstall` | Remove the skill from all platforms |
| `status` | Check sync status across all installations |
| `init <path>` | Copy the skill bundle into a target project |
| `plugin-path` | Print the repo/package root path for use with `--plugin-dir` |
| `version` | Print the current version |

### Examples

```bash
# Install to all detected agent platforms
ui-architect-skill install

# Check which platforms have the skill installed and in sync
ui-architect-skill status

# Embed the skill bundle into a project
ui-architect-skill init ./my-project
# Creates ./my-project/.ui-architect/

# Embed with explicit path
ui-architect-skill init ./my-project/.ui-architect

# Get the plugin path for Claude Code
ui-architect-skill plugin-path
# Output: /home/user/.npm/.../ui-architect-skill/

# Use with Claude Code
claude --plugin-dir $(ui-architect-skill plugin-path)
```

## init Command Details

The `init` command copies the full skill bundle into a target directory:

- **SKILL.md** — Agent-facing skill definition
- **VERSION** — Release version
- **styles/** — 31 full design style specifications
- **token-cards/** — 31 lightweight style summaries
- **reference/** — Conflict matrix and task archetypes
- **scripts/** — QA lint, status check, style normalizer

If the target path already ends in `.ui-architect`, files are copied directly there. Otherwise, a `.ui-architect` subdirectory is created.

## npm Scripts

When installed as a dependency, these scripts are available:

```bash
npm run help            # Show CLI usage
npm run install:skill   # Install to detected platforms
npm run uninstall:skill # Remove from all platforms
npm run status          # Check sync status
npm run plugin-path     # Print plugin path
npm run lint:scripts    # Validate shell script syntax
```

## Package Contents

The npm package includes:

```
CHANGELOG.md
CODE_OF_CONDUCT.md
CONTRIBUTING.md
SECURITY.md
SKILL.md
SUPPORT.md
VERSION
install.sh
uninstall.sh
docs/
styles/
token-cards/
reference/
scripts/
bin/
skills/
.claude-plugin/
```

The package intentionally includes the runtime bundle plus the supporting docs and policy files referenced by the bundled README.

## Publishing

If you are maintaining a fork or custom distribution:

```bash
# Dry run to verify contents
npm pack --dry-run

# Publish
npm publish
```

See [release.md](release.md) for the full release checklist.
