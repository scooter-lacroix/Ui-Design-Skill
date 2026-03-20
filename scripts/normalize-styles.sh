#!/usr/bin/env bash
# Normalize all style .md files to a consistent structure:
# 1. Strip <role>...</role> blocks (handled by SKILL.md now)
# 2. Strip <design-system> and </design-system> tags
# 3. Strip leading blank lines so the file starts with content
set -euo pipefail

STYLES_DIR="${1:-$(dirname "$0")/../styles}"

if [[ ! -d "$STYLES_DIR" ]]; then
  echo "Usage: $0 <styles-directory>"
  exit 1
fi

count=0
for f in "$STYLES_DIR"/*.md; do
  name=$(basename "$f")
  tmp="${f}.tmp"

  # Remove <role>...</role> block, <design-system> tags, </design-system> tags
  # Use awk to skip everything between <role> and </role>
  awk '
    /<role>/     { in_role=1; next }
    /<\/role>/   { in_role=0; next }
    in_role      { next }
    /^<design-system>[[:space:]]*$/ { next }
    /^<\/design-system>[[:space:]]*$/ { next }
    { print }
  ' "$f" > "$tmp"

  # Strip leading blank lines (portable — no sed -i)
  sed '/./,$!d' "$tmp" > "${tmp}.clean" && mv "${tmp}.clean" "$tmp"

  mv "$tmp" "$f"
  count=$((count + 1))
  echo "  ✅ Normalized: $name"
done

echo ""
echo "  Normalized $count files."
