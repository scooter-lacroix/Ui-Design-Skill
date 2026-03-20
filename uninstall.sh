#!/usr/bin/env bash
# UI Architect — Universal Uninstaller
set -euo pipefail

SKILL_NAME="ui-architect"
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BOLD}  🎨 UI Architect — Uninstaller${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

REMOVED=0

remove_if_exists() {
  local dir="$1"
  local label="$2"
  if [[ -d "$dir" ]]; then
    rm -rf "$dir"
    echo -e "  ${GREEN}✅${NC} Removed: $label → $dir"
    REMOVED=$((REMOVED + 1))
  fi
}

remove_if_exists "$HOME/.config/amp/skills/$SKILL_NAME" "Amp CLI"
remove_if_exists "$HOME/.agents/skills/$SKILL_NAME" "Amp CLI (agents compat)"
remove_if_exists "$HOME/.config/agents/skills/$SKILL_NAME" "Amp CLI (agents global)"
remove_if_exists "$HOME/.claude/skills/$SKILL_NAME" "Claude Code"
remove_if_exists "$HOME/.gemini/skills/$SKILL_NAME" "Gemini CLI"
remove_if_exists "$HOME/.config/opencode/skills/$SKILL_NAME" "OpenCode"
remove_if_exists "$HOME/.ui-architect" "Global styles fallback"

echo ""
if [[ "$REMOVED" -gt 0 ]]; then
  echo -e "${GREEN}${BOLD}  Uninstalled from $REMOVED location(s).${NC}"
else
  echo -e "  Nothing to remove — UI Architect was not installed."
fi
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
