#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════
#  UI Architect — Universal Installer
#  Installs the design system orchestrator skill for:
#    • Amp CLI        (~/.config/amp/skills/)
#    • Claude Code    (~/.claude/skills/)
#    • Gemini CLI     (~/.gemini/skills/)
#    • OpenCode       (~/.config/opencode/skills/)
# ═══════════════════════════════════════════════════════════
set -euo pipefail

SKILL_NAME="ui-architect"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_MD="$SCRIPT_DIR/SKILL.md"
STYLES_DIR="$SCRIPT_DIR/styles"
TOKEN_CARDS_DIR="$SCRIPT_DIR/token-cards"
REFERENCE_DIR="$SCRIPT_DIR/reference"
SCRIPTS_DIR="$SCRIPT_DIR/scripts"
VERSION_FILE="$SCRIPT_DIR/VERSION"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

header() {
  echo ""
  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${BOLD}  🎨 UI Architect — Installer${NC}"
  echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
}

success() { echo -e "  ${GREEN}✅${NC} $1"; }
skip()    { echo -e "  ${YELLOW}⊘${NC}  $1 ${YELLOW}(skipped — not detected)${NC}"; }
info()    { echo -e "  ${CYAN}→${NC}  $1"; }
fail()    { echo -e "  ${RED}❌${NC} $1"; }

# ── Read version ────────────────────────────────────────
VERSION="unknown"
if [[ -f "$VERSION_FILE" ]]; then
  VERSION=$(cat "$VERSION_FILE" | tr -d '[:space:]')
fi

# ── Preflight checks ────────────────────────────────────
header

if [[ ! -f "$SKILL_MD" ]]; then
  fail "SKILL.md not found at $SKILL_MD"
  echo "  Run this script from inside the ui-architect-skill/ directory."
  exit 1
fi

if [[ ! -d "$STYLES_DIR" ]]; then
  fail "styles/ directory not found at $STYLES_DIR"
  echo "  The styles/ directory with .md design specs must sit next to install.sh"
  exit 1
fi

STYLE_COUNT=$(find "$STYLES_DIR" -maxdepth 1 -name '*.md' | wc -l)
TOKEN_COUNT=0
[[ -d "$TOKEN_CARDS_DIR" ]] && TOKEN_COUNT=$(find "$TOKEN_CARDS_DIR" -maxdepth 1 -name '*.md' | wc -l)
REF_COUNT=0
[[ -d "$REFERENCE_DIR" ]] && REF_COUNT=$(find "$REFERENCE_DIR" -maxdepth 1 -name '*.md' | wc -l)

if [[ "$STYLE_COUNT" -eq 0 ]]; then
  fail "No .md files found in styles/ directory"
  exit 1
fi

info "Version: $VERSION"
info "Found $STYLE_COUNT styles, $TOKEN_COUNT token cards, $REF_COUNT reference docs"
echo ""

# ── Install function ────────────────────────────────────
install_to() {
  local target_dir="$1"
  local platform_name="$2"
  local skill_dir="$target_dir/$SKILL_NAME"

  # Create all subdirectories
  mkdir -p "$skill_dir/styles"
  mkdir -p "$skill_dir/token-cards"
  mkdir -p "$skill_dir/reference"
  mkdir -p "$skill_dir/scripts"

  # Copy SKILL.md and VERSION
  cp "$SKILL_MD" "$skill_dir/SKILL.md"
  cp "$VERSION_FILE" "$skill_dir/VERSION"

  # Copy styles
  cp "$STYLES_DIR"/*.md "$skill_dir/styles/"

  # Copy token cards (if they exist)
  if [[ -d "$TOKEN_CARDS_DIR" ]] && [[ "$TOKEN_COUNT" -gt 0 ]]; then
    cp "$TOKEN_CARDS_DIR"/*.md "$skill_dir/token-cards/"
  fi

  # Copy reference docs (if they exist)
  if [[ -d "$REFERENCE_DIR" ]] && [[ "$REF_COUNT" -gt 0 ]]; then
    cp "$REFERENCE_DIR"/*.md "$skill_dir/reference/"
  fi

  # Copy shell scripts
  if [[ -d "$SCRIPTS_DIR" ]]; then
    find "$SCRIPTS_DIR" -maxdepth 1 -name '*.sh' -exec cp {} "$skill_dir/scripts/" \;
    find "$SCRIPTS_DIR" -maxdepth 1 -name '*.py' -exec cp {} "$skill_dir/scripts/" \;
    # Ensure scripts are executable
    chmod +x "$skill_dir/scripts/"*.sh 2>/dev/null || true
  fi

  success "$platform_name → $skill_dir/"
}

# ── Detect and install per platform ─────────────────────
echo -e "${BOLD}  Installing to detected platforms:${NC}"
echo ""

INSTALLED=0

# Amp CLI — primary config location (~/.config/amp/)
if [[ -d "$HOME/.config/amp" ]] || command -v amp &>/dev/null; then
  install_to "$HOME/.config/amp/skills" "Amp CLI"
  INSTALLED=$((INSTALLED + 1))
else
  skip "Amp CLI (~/.config/amp/)"
fi

# Amp CLI — legacy/agents-compatible location (~/.agents/skills/)
if [[ -d "$HOME/.agents/skills" ]]; then
  install_to "$HOME/.agents/skills" "Amp CLI (agents compat)"
  INSTALLED=$((INSTALLED + 1))
else
  skip "Amp CLI agents compat (~/.agents/skills/)"
fi

# Amp CLI — global user-wide agents location (~/.config/agents/skills/)
if [[ -d "$HOME/.config/agents/skills" ]]; then
  install_to "$HOME/.config/agents/skills" "Amp CLI (agents global)"
  INSTALLED=$((INSTALLED + 1))
else
  skip "Amp CLI agents global (~/.config/agents/skills/)"
fi

# Claude Code
if [[ -d "$HOME/.claude" ]] || command -v claude &>/dev/null; then
  install_to "$HOME/.claude/skills" "Claude Code"
  INSTALLED=$((INSTALLED + 1))
else
  skip "Claude Code (~/.claude/)"
fi

# Gemini CLI
if [[ -d "$HOME/.gemini" ]] || command -v gemini &>/dev/null; then
  install_to "$HOME/.gemini/skills" "Gemini CLI"
  INSTALLED=$((INSTALLED + 1))
else
  skip "Gemini CLI (~/.gemini/)"
fi

# OpenCode
if [[ -d "$HOME/.config/opencode" ]] || command -v opencode &>/dev/null; then
  install_to "$HOME/.config/opencode/skills" "OpenCode"
  INSTALLED=$((INSTALLED + 1))
else
  skip "OpenCode (~/.config/opencode/)"
fi

# ── Also install a global fallback for style resolution ──
GLOBAL_DIR="$HOME/.ui-architect"
mkdir -p "$GLOBAL_DIR/styles"
mkdir -p "$GLOBAL_DIR/token-cards"
mkdir -p "$GLOBAL_DIR/reference"
mkdir -p "$GLOBAL_DIR/scripts"

cp "$SKILL_MD" "$GLOBAL_DIR/SKILL.md"
cp "$VERSION_FILE" "$GLOBAL_DIR/VERSION"
cp "$STYLES_DIR"/*.md "$GLOBAL_DIR/styles/"

if [[ -d "$TOKEN_CARDS_DIR" ]] && [[ "$TOKEN_COUNT" -gt 0 ]]; then
  cp "$TOKEN_CARDS_DIR"/*.md "$GLOBAL_DIR/token-cards/"
fi

if [[ -d "$REFERENCE_DIR" ]] && [[ "$REF_COUNT" -gt 0 ]]; then
  cp "$REFERENCE_DIR"/*.md "$GLOBAL_DIR/reference/"
fi

if [[ -d "$SCRIPTS_DIR" ]]; then
  find "$SCRIPTS_DIR" -maxdepth 1 -name '*.sh' -exec cp {} "$GLOBAL_DIR/scripts/" \;
  find "$SCRIPTS_DIR" -maxdepth 1 -name '*.py' -exec cp {} "$GLOBAL_DIR/scripts/" \;
  chmod +x "$GLOBAL_DIR/scripts/"*.sh 2>/dev/null || true
fi

success "Global fallback → $GLOBAL_DIR/"

# ── Summary ─────────────────────────────────────────────
echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

if [[ "$INSTALLED" -gt 0 ]]; then
  echo -e "${GREEN}${BOLD}  Installation complete — v${VERSION}${NC}"
  echo -e "  ${BOLD}$INSTALLED${NC} platform(s) configured, ${BOLD}$STYLE_COUNT${NC} styles, ${BOLD}$TOKEN_COUNT${NC} token cards, ${BOLD}$REF_COUNT${NC} reference docs."
  echo ""
  echo -e "  ${BOLD}Usage:${NC}"
  echo -e "    Amp/Claude/Gemini:  Type ${CYAN}/ui-architect${NC} or mention UI/design in your prompt"
  echo -e "    OpenCode:           Skill auto-loads when design/UI keywords are detected"
  echo ""
  echo -e "  ${BOLD}To add to a specific project:${NC}"
  echo -e "    cp -r $SCRIPT_DIR /path/to/project/.ui-architect"
else
  echo -e "${YELLOW}${BOLD}  No platforms detected.${NC}"
  echo -e "  Install at least one of: Amp CLI, Claude Code, Gemini CLI, or OpenCode."
  echo -e "  Then re-run this script."
fi

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
