# Installation

## Platform Matrix

| Platform | Method | Location |
|:---------|:-------|:---------|
| Amp CLI | `bash install.sh` | `~/.config/amp/skills/ui-architect/` |
| Claude Code | `bash install.sh` | `~/.claude/skills/ui-architect/` |
| Gemini CLI | `bash install.sh` | `~/.gemini/skills/ui-architect/` |
| OpenCode | `bash install.sh` | `~/.config/opencode/skills/ui-architect/` |
| Any project | `npx ui-architect-skill init ./path` | `<path>/.ui-architect/` |
| npm global | `npm install -g ui-architect-skill` | system `node_modules` |
| Claude Code plugin | `claude --plugin-dir <path>` | loaded from plugin dir |

## Method 1: Git Clone + Shell Installer

The recommended method. Clones the full repo and installs to all detected platforms.

```bash
git clone https://github.com/scooter-lacroix/Ui-Design-Skill.git
cd Ui-Design-Skill
bash install.sh
```

The installer:
- Auto-detects which platforms are present on your system
- Copies SKILL.md, VERSION, styles, token-cards, reference docs, and scripts
- Skips platforms that are not installed
- Creates a global fallback at `~/.ui-architect/`

### Requirements

- Bash 3.2+
- No other dependencies

## Method 2: npm

The npm package currently supports macOS and Linux. Windows users should use WSL or run the shell installer from a Unix-compatible environment.

### Global install

```bash
npm install -g ui-architect-skill
ui-architect-skill install
```

### One-time use (npx)

```bash
npx ui-architect-skill install
```

### Requirements

- Node.js 18+

## Method 3: Claude Code Plugin

```bash
claude --plugin-dir /path/to/ui-architect-skill
```

See [claude-code-plugin.md](claude-code-plugin.md) for detailed setup.

## Method 4: Manual Copy

Copy the skill bundle directly into a project:

```bash
cp -r /path/to/ui-architect-skill /path/to/my-project/.ui-architect
```

Or use the CLI:

```bash
npx ui-architect-skill init /path/to/my-project
```

## Verifying Installation

### Shell

```bash
bash scripts/status.sh
```

### npm

```bash
ui-architect-skill status
```

Both commands compare installed copies against the source to detect drift.

## Uninstallation

```bash
# Shell
bash uninstall.sh

# npm
npx ui-architect-skill uninstall
```

Removes the skill from all platform locations and the global fallback.
