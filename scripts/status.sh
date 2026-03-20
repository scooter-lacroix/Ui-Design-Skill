#!/usr/bin/env bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# UI Architect — Sync Status
# Compares the installed skill across all supported platforms
# against the source package to detect drift.
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -euo pipefail

# ── Resolve source directory ──────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# ── Version ───────────────────────────────────────────────────────
VERSION_FILE="$SOURCE_DIR/VERSION"
VERSION="unknown"
[[ -f "$VERSION_FILE" ]] && VERSION=$(cat "$VERSION_FILE" | tr -d '[:space:]')

# ── Hash tool selection ───────────────────────────────────────────
if command -v sha256sum &>/dev/null; then
  HASH_CMD="sha256sum"
elif command -v md5sum &>/dev/null; then
  HASH_CMD="md5sum"
elif command -v shasum &>/dev/null; then
  HASH_CMD="shasum -a 256"
elif command -v md5 &>/dev/null; then
  # macOS fallback
  HASH_CMD="md5 -r"
else
  echo "Error: no hash utility found (sha256sum, md5sum, shasum, or md5)" >&2
  exit 2
fi

# ── compute_hash <directory> ──────────────────────────────────────
# Creates a content hash from all skill artifacts in a directory.
# Hashes file contents only (not paths/timestamps) for portability.
# Includes: SKILL.md, VERSION, styles/**, token-cards/**, reference/**, scripts/*
compute_hash() {
  local dir="$1"
  local combined_hash

  # Collect all skill artifacts
  {
    # SKILL.md
    if [[ -f "$dir/SKILL.md" ]]; then
      $HASH_CMD < "$dir/SKILL.md"
    fi
    # VERSION
    if [[ -f "$dir/VERSION" ]]; then
      $HASH_CMD < "$dir/VERSION"
    fi
    # All style files (sorted for deterministic order)
    if [[ -d "$dir/styles" ]]; then
      find "$dir/styles" -type f | sort | while IFS= read -r f; do
        $HASH_CMD < "$f"
      done
    fi
    # All token card files (sorted)
    if [[ -d "$dir/token-cards" ]]; then
      find "$dir/token-cards" -type f | sort | while IFS= read -r f; do
        $HASH_CMD < "$f"
      done
    fi
    # All reference files (sorted)
    if [[ -d "$dir/reference" ]]; then
      find "$dir/reference" -type f | sort | while IFS= read -r f; do
        $HASH_CMD < "$f"
      done
    fi
    # All scripts (sorted) — includes .sh and .py helpers
    if [[ -d "$dir/scripts" ]]; then
      find "$dir/scripts" -type f | sort | while IFS= read -r f; do
        $HASH_CMD < "$f"
      done
    fi
  } | $HASH_CMD | awk '{print $1}'
}

# Short hash (first 8 chars)
short_hash() {
  echo "${1:0:8}"
}

# ── Install locations ─────────────────────────────────────────────
# label:path pairs
declare -a LOCATIONS=(
  "Amp CLI:${HOME}/.config/amp/skills/ui-architect"
  "OMX (agents):${HOME}/.agents/skills/ui-architect"
  "Agents Config:${HOME}/.config/agents/skills/ui-architect"
  "Claude Code:${HOME}/.claude/skills/ui-architect"
  "Gemini CLI:${HOME}/.gemini/skills/ui-architect"
  "OpenCode:${HOME}/.config/opencode/skills/ui-architect"
  "Local (~):${HOME}/.ui-architect"
)

# ── Compute source hash ──────────────────────────────────────────
SOURCE_HASH=$(compute_hash "$SOURCE_DIR")
SOURCE_SHORT=$(short_hash "$SOURCE_HASH")

# ── Count source artifacts ────────────────────────────────────────
STYLE_COUNT=0
[[ -d "$SOURCE_DIR/styles" ]] && STYLE_COUNT=$(find "$SOURCE_DIR/styles" -maxdepth 1 -name '*.md' | wc -l | tr -d ' ')
TOKEN_COUNT=0
[[ -d "$SOURCE_DIR/token-cards" ]] && TOKEN_COUNT=$(find "$SOURCE_DIR/token-cards" -maxdepth 1 -name '*.md' | wc -l | tr -d ' ')
REF_COUNT=0
[[ -d "$SOURCE_DIR/reference" ]] && REF_COUNT=$(find "$SOURCE_DIR/reference" -maxdepth 1 -name '*.md' | wc -l | tr -d ' ')

# ── Header ────────────────────────────────────────────────────────
echo ""
echo "🎨 UI Architect — Sync Status"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Source:  $SOURCE_DIR"
echo "Version: $VERSION | Hash: $SOURCE_SHORT"
echo "Artifacts: ${STYLE_COUNT} styles, ${TOKEN_COUNT} token cards, ${REF_COUNT} reference docs"
echo ""

# ── Check each location ──────────────────────────────────────────
ANY_OUT_OF_SYNC=0
INSTALLED_COUNT=0

for entry in "${LOCATIONS[@]}"; do
  label="${entry%%:*}"
  path="${entry#*:}"

  # Pad label to 15 chars for alignment
  padded_label=$(printf "%-15s" "$label")

  if [[ ! -d "$path" ]]; then
    echo "  ⊘  ${padded_label} NOT INSTALLED"
    continue
  fi

  if [[ ! -f "$path/SKILL.md" ]]; then
    echo "  ⚠️  ${padded_label} INCOMPLETE (missing SKILL.md)"
    ANY_OUT_OF_SYNC=1
    continue
  fi

  INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
  TARGET_HASH=$(compute_hash "$path")
  TARGET_SHORT=$(short_hash "$TARGET_HASH")

  # Count installed artifacts
  installed_styles=0
  [[ -d "$path/styles" ]] && installed_styles=$(find "$path/styles" -maxdepth 1 -name '*.md' | wc -l | tr -d ' ')
  installed_tokens=0
  [[ -d "$path/token-cards" ]] && installed_tokens=$(find "$path/token-cards" -maxdepth 1 -name '*.md' | wc -l | tr -d ' ')
  installed_ref=0
  [[ -d "$path/reference" ]] && installed_ref=$(find "$path/reference" -maxdepth 1 -name '*.md' | wc -l | tr -d ' ')

  if [[ "$TARGET_HASH" == "$SOURCE_HASH" ]]; then
    echo "  ✅ ${padded_label} ${TARGET_SHORT} IN SYNC"
  else
    echo "  ⚠️  ${padded_label} ${TARGET_SHORT} OUT OF SYNC"
    # Show artifact counts for debugging
    if [[ "$installed_styles" -ne "$STYLE_COUNT" ]] || [[ "$installed_tokens" -ne "$TOKEN_COUNT" ]] || [[ "$installed_ref" -ne "$REF_COUNT" ]]; then
      echo "     Expected: ${STYLE_COUNT} styles, ${TOKEN_COUNT} tokens, ${REF_COUNT} ref"
      echo "     Found:    ${installed_styles} styles, ${installed_tokens} tokens, ${installed_ref} ref"
    fi
    ANY_OUT_OF_SYNC=1
  fi
done

echo ""

# ── Footer ────────────────────────────────────────────────────────
if [[ "$INSTALLED_COUNT" -eq 0 ]]; then
  echo "No installations found."
  echo "Run 'bash install.sh' to install across platforms."
elif [[ "$ANY_OUT_OF_SYNC" -gt 0 ]]; then
  echo "Run 'bash install.sh' to sync all platforms."
else
  echo "All installations in sync. ✅"
fi
echo ""
