#!/usr/bin/env bash
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# UI Architect — Automated QA Lint
# Performs code-level checks for token adherence, accessibility,
# and completeness against target files/directories.
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
set -euo pipefail

# ── Defaults ──────────────────────────────────────────────────────
TARGET=""
STYLE="generic"
PASS_COUNT=0
FAIL_COUNT=0
WARN_COUNT=0
TOTAL_CHECKS=9

# ── File extensions to scan ───────────────────────────────────────
RG_TYPE_INCLUDE=(-g '*.html' -g '*.jsx' -g '*.tsx' -g '*.vue' -g '*.svelte' -g '*.css' -g '*.scss' -g '*.ts' -g '*.js')
GREP_INCLUDE=(--include='*.html' --include='*.jsx' --include='*.tsx' --include='*.vue' --include='*.svelte' --include='*.css' --include='*.scss' --include='*.ts' --include='*.js')

# ── Token definition files to exclude ─────────────────────────────
EXCLUDE_DIRS=(-g '!node_modules' -g '!.next' -g '!dist' -g '!build' -g '!.git')
EXCLUDE_TOKEN_FILES=(-g '!globals.css' -g '!theme.ts' -g '!theme.js' -g '!tailwind.config.*' -g '!tokens.*' -g '!variables.*')

# ── Parse arguments ───────────────────────────────────────────────
usage() {
  echo "Usage: $(basename "$0") <target-path> [--style <style-name>]"
  echo ""
  echo "  target-path    File or directory to lint"
  echo "  --style NAME   Style name to check against (default: generic)"
  exit 2
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --style)
      [[ $# -lt 2 ]] && { echo "Error: --style requires a value"; usage; }
      STYLE="$2"; shift 2 ;;
    --help|-h)
      usage ;;
    -*)
      echo "Unknown option: $1"; usage ;;
    *)
      [[ -z "$TARGET" ]] && TARGET="$1" || { echo "Error: multiple targets not supported"; usage; }
      shift ;;
  esac
done

[[ -z "$TARGET" ]] && { echo "Error: target path required"; usage; }
[[ ! -e "$TARGET" ]] && { echo "Error: target '$TARGET' does not exist"; exit 2; }

# ── Search tool selection ─────────────────────────────────────────
if command -v rg &>/dev/null; then
  SEARCHER="rg"
else
  SEARCHER="grep"
fi

# Wrapper: search <pattern> [extra-args...]
# Searches TARGET with the correct tool + file type filters.
# Excludes build directories but NOT token-definition files.
# For token-adherence checks needing token file exclusions, use search_token().
# Returns matching lines on stdout; exit 0 if matches, 1 if none.
search() {
  local pattern="$1"; shift
  if [[ "$SEARCHER" == "rg" ]]; then
    # Filter out grep-only flags (-E, -P) that rg doesn't need (rg uses extended regex by default)
    local rg_args=()
    for arg in "$@"; do
      case "$arg" in
        -E|-P) ;;
        -[a-zA-Z]*)
          local cleaned="$arg"
          cleaned="${cleaned//-E/}"
          cleaned="${cleaned//-P/}"
          [[ -n "$cleaned" && "$cleaned" != "-" ]] && rg_args+=("$cleaned")
          ;;
        *) rg_args+=("$arg") ;;
      esac
    done
    rg --no-heading --line-number "${RG_TYPE_INCLUDE[@]}" "${EXCLUDE_DIRS[@]}" "${rg_args[@]}" "$pattern" "$TARGET" 2>/dev/null || true
  else
    grep -rn "${GREP_INCLUDE[@]}" --exclude-dir='node_modules' --exclude-dir='.next' --exclude-dir='dist' --exclude-dir='build' --exclude-dir='.git' \
      "$@" "$pattern" "$TARGET" 2>/dev/null || true
  fi
}

# Like search() but also excludes token-definition files (globals.css, theme.ts, etc.)
# Use ONLY for token-adherence checks (hardcoded colors, font sizes, etc.)
search_token() {
  local pattern="$1"; shift
  if [[ "$SEARCHER" == "rg" ]]; then
    local rg_args=()
    for arg in "$@"; do
      case "$arg" in
        -E|-P) ;;
        -[a-zA-Z]*)
          local cleaned="$arg"
          cleaned="${cleaned//-E/}"
          cleaned="${cleaned//-P/}"
          [[ -n "$cleaned" && "$cleaned" != "-" ]] && rg_args+=("$cleaned")
          ;;
        *) rg_args+=("$arg") ;;
      esac
    done
    rg --no-heading --line-number "${RG_TYPE_INCLUDE[@]}" "${EXCLUDE_DIRS[@]}" "${EXCLUDE_TOKEN_FILES[@]}" "${rg_args[@]}" "$pattern" "$TARGET" 2>/dev/null || true
  else
    grep -rn "${GREP_INCLUDE[@]}" --exclude-dir='node_modules' --exclude-dir='.next' --exclude-dir='dist' --exclude-dir='build' --exclude-dir='.git' \
      --exclude='globals.css' --exclude='theme.ts' --exclude='theme.js' --exclude='tailwind.config.*' \
      --exclude='tokens.*' --exclude='variables.*' \
      "$@" "$pattern" "$TARGET" 2>/dev/null || true
  fi
}

# Count matching lines
search_count() {
  search "$@" | wc -l | tr -d ' '
}

# Collect unique files with matches
search_files() {
  search "$@" | cut -d: -f1 | sort -u
}

# Count matching lines with token file exclusions
search_token_count() {
  search_token "$@" | wc -l | tr -d ' '
}

# ── Result helpers ────────────────────────────────────────────────
pass() {
  local label="$1"; shift
  PASS_COUNT=$((PASS_COUNT + 1))
  printf "  ✅ PASS  %s: %s\n" "$label" "$*"
}

fail() {
  local label="$1"; shift
  FAIL_COUNT=$((FAIL_COUNT + 1))
  printf "  ❌ FAIL  %s: %s\n" "$label" "$*"
}

warn() {
  local label="$1"; shift
  WARN_COUNT=$((WARN_COUNT + 1))
  printf "  ⚠️  WARN  %s: %s\n" "$label" "$*"
}

# ── Header ────────────────────────────────────────────────────────
echo ""
echo "🔍 UI Architect — Automated QA Lint"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Target: $TARGET"
echo "Style:  $STYLE"
echo ""

# ══════════════════════════════════════════════════════════════════
# TOKEN ADHERENCE
# ══════════════════════════════════════════════════════════════════
echo "TOKEN ADHERENCE"

# 1. Hardcoded hex colors not in CSS variable definitions or Tailwind config
#    Exclude token definition files (globals.css, theme.ts, tailwind.config.*, tokens.*, variables.*)
#    Exclude build directories (node_modules, .next, dist, build, .git)
hardcoded_colors_raw=$(search_token '#[0-9a-fA-F]{3,8}\b' -E 2>/dev/null || true)

# Filter out CSS custom property declarations (--var-name: ...)
hardcoded_colors=""
if [[ -n "$hardcoded_colors_raw" ]]; then
  hardcoded_colors=$(echo "$hardcoded_colors_raw" \
    | grep -v -E '^\s*--[a-zA-Z]' \
    || true)
fi

color_count=0
if [[ -n "$hardcoded_colors" ]]; then
  color_count=$(echo "$hardcoded_colors" | grep -c '[^[:space:]]' 2>/dev/null) || color_count=0
fi
color_files=$(echo "$hardcoded_colors" | cut -d: -f1 | sort -u | head -5 | tr '\n' ', ' | sed 's/,$//')

if [[ "$color_count" -eq 0 ]]; then
  pass "Hardcoded colors" "0 found"
else
  fail "Hardcoded colors" "${color_count} found in: ${color_files}"
fi

# 2. Hardcoded pixel values in font-size (CSS font-size: 14px and JS/TS fontSize: '14px' / fontSize: 14)
font_css_count=$(search_token_count 'font-size:\s*[0-9]+px' -E)
font_js_count=$(search_token_count "fontSize:\s*['\"]?[0-9]+px['\"]?" -E)
font_px_count=$((font_css_count + font_js_count))
if [[ "$font_px_count" -eq 0 ]]; then
  pass "Hardcoded font sizes" "0 found"
else
  fail "Hardcoded font sizes" "${font_px_count} found"
fi

# 3. Border radius inconsistency
#    Extract unique border-radius values (Tailwind rounded-* classes and CSS border-radius values)
#    If more than 3 unique radius values exist across the project, flag as inconsistent.
radius_issues=0
radius_values=""

collect_radius_values() {
  local file="$1"
  # Tailwind rounded-* classes
  local tw_radii
  tw_radii=$(grep -oE 'rounded(-[a-z]+)+' "$file" 2>/dev/null | sort -u || true)
  # CSS border-radius values
  local css_radii
  css_radii=$(grep -oE 'border-radius:\s*[^;]+' "$file" 2>/dev/null | sort -u || true)
  echo "${tw_radii}"$'\n'"${css_radii}"
}

if [[ -d "$TARGET" ]]; then
  all_radii=""
  while IFS= read -r file; do
    [[ -z "$file" ]] && continue
    file_radii=$(collect_radius_values "$file")
    [[ -n "$file_radii" ]] && all_radii="${all_radii}"$'\n'"${file_radii}"
  done < <(find "$TARGET" -type f \( -name '*.html' -o -name '*.jsx' -o -name '*.tsx' -o -name '*.vue' -o -name '*.svelte' -o -name '*.css' -o -name '*.scss' -o -name '*.ts' -o -name '*.js' \) \
    ! -path '*/node_modules/*' ! -path '*/.next/*' ! -path '*/dist/*' ! -path '*/build/*' ! -path '*/.git/*' \
    ! -name 'globals.css' ! -name 'theme.*' ! -name 'tailwind.config.*' ! -name 'tokens.*' ! -name 'variables.*' 2>/dev/null)

  unique_count=$(echo "$all_radii" | sed '/^\s*$/d' | sort -u | wc -l | tr -d ' ')
  [[ "$unique_count" -gt 3 ]] && radius_issues=1
  radius_values=$(echo "$all_radii" | sed '/^\s*$/d' | sort -u | head -6 | tr '\n' ', ' | sed 's/,$//')
elif [[ -f "$TARGET" ]]; then
  all_radii=$(collect_radius_values "$TARGET")
  unique_count=$(echo "$all_radii" | sed '/^\s*$/d' | sort -u | wc -l | tr -d ' ')
  [[ "$unique_count" -gt 3 ]] && radius_issues=1
  radius_values=$(echo "$all_radii" | sed '/^\s*$/d' | sort -u | head -6 | tr '\n' ', ' | sed 's/,$//')
fi

if [[ "$radius_issues" -eq 0 ]]; then
  pass "Border radius consistency" "consistent (${unique_count:-0} unique values)"
else
  fail "Border radius consistency" "${unique_count} unique values found (max 3): ${radius_values}"
fi

echo ""

# ══════════════════════════════════════════════════════════════════
# ACCESSIBILITY
# ══════════════════════════════════════════════════════════════════
echo "ACCESSIBILITY"

# 4. prefers-reduced-motion when animations/transitions/@keyframes/animate- are used
has_animation=$(search_count '\b(animation|transition|@keyframes)\b' -E)
# Also check for animate- Tailwind classes
has_animate_class=$(search_count 'animate-' -E)
has_any_motion=$((has_animation + has_animate_class))
has_reduced_motion=$(search_count 'prefers-reduced-motion' -E)

if [[ "$has_any_motion" -gt 0 && "$has_reduced_motion" -eq 0 ]]; then
  fail "Reduced motion" "animations/transitions present but no prefers-reduced-motion query"
else
  pass "Reduced motion" "$(if [[ "$has_any_motion" -eq 0 ]]; then echo "no animations used"; else echo "prefers-reduced-motion present"; fi)"
fi

# 5. Icon-only buttons/links without aria-label
#    Heuristic: <button> or <a> containing only an icon component / <svg> / <img>
#    and lacking aria-label or aria-labelledby or visible text content.
icon_button_issues=0

# Pattern: button or anchor tags that have no aria-label and contain icon-like children
icon_only_raw=$(search '<(button|a)\b[^>]*>' -E | grep -v 'aria-label' | grep -v 'aria-labelledby' || true)
if [[ -n "$icon_only_raw" ]]; then
  icon_button_issues=$(echo "$icon_only_raw" \
    | grep -iE '(<svg|<Icon|<i\s+class|class="[^"]*icon|<img\b)' \
    | wc -l | tr -d ' ')
fi

if [[ "$icon_button_issues" -eq 0 ]]; then
  pass "Icon button labels" "0 unlabeled"
else
  fail "Icon button labels" "${icon_button_issues} unlabeled"
fi

# 6. Semantic HTML issues — WARN, not FAIL
#    Heuristic checks:
#    a) <div> with onClick → should be <button>
#    b) <div> with role="navigation" → should be <nav>
#    c) <div> with role="button" → should be <button>
semantic_issues=0

# Divs with onClick/onclick
div_onclick=$(search_count '<div[^>]*\bonClick\b' -E)
semantic_issues=$((semantic_issues + div_onclick))

div_onclick_lower=$(search_count '<div[^>]*\bonclick\b' -E)
semantic_issues=$((semantic_issues + div_onclick_lower))

# Divs with role="navigation" but not using <nav>
div_nav_role=$(search_count '<div[^>]*role="navigation"' -E)
semantic_issues=$((semantic_issues + div_nav_role))

# Divs with role="button" but not using <button>
div_btn_role=$(search_count '<div[^>]*role="button"' -E)
semantic_issues=$((semantic_issues + div_btn_role))

if [[ "$semantic_issues" -eq 0 ]]; then
  pass "Semantic HTML" "0 potential issues"
else
  warn "Semantic HTML" "${semantic_issues} potential issues (div with onClick/role)"
fi

echo ""

# ══════════════════════════════════════════════════════════════════
# COMPLETENESS
# ══════════════════════════════════════════════════════════════════
echo "COMPLETENESS"

# 7. Placeholder content: TODO, FIXME, PLACEHOLDER, lorem ipsum, coming soon, TBD, HACK
placeholder_count=$(search_count '\b(TODO|FIXME|PLACEHOLDER|TBD|HACK)\b|lorem ipsum|coming soon' -iE)

if [[ "$placeholder_count" -eq 0 ]]; then
  pass "Placeholder content" "0 found"
else
  fail "Placeholder content" "${placeholder_count} found"
fi

# 8. Stub components: functions returning null, empty fragment/div, or TODO-only bodies
stub_count=0

# return null (React stub pattern)
return_null=$(search_count 'return\s+null\s*;?\s*$' -E)
stub_count=$((stub_count + return_null))

# return <></> or return <div></div> (empty fragment / empty div)
empty_return=$(search_count 'return\s*(<></>|<div\s*/?>\s*</div>|<div\s*/>)' -E)
stub_count=$((stub_count + empty_return))

# Function body is just TODO
todo_body=$(search_count '{\s*(//\s*TODO|/\*\s*TODO)' -E)
stub_count=$((stub_count + todo_body))

if [[ "$stub_count" -eq 0 ]]; then
  pass "Stub components" "0 found"
else
  fail "Stub components" "${stub_count} found"
fi

# 9. Hover/focus parity: if :hover is used, :focus-visible or :focus should also be present
hover_focus_issues=0

if [[ -d "$TARGET" ]]; then
  while IFS= read -r file; do
    [[ -z "$file" ]] && continue
    # Detect hover via CSS :hover or Tailwind hover: classes
    has_hover=$(grep -cE '(:hover|hover:)' "$file" 2>/dev/null) || has_hover=0
    # Detect focus via CSS :focus-visible/:focus-within/:focus or Tailwind focus:/focus-visible: classes
    has_focus=$(grep -cE '(:focus-visible|:focus-within|:focus|focus:|focus-visible:)' "$file" 2>/dev/null) || has_focus=0
    if [[ "$has_hover" -gt 0 && "$has_focus" -eq 0 ]]; then
      hover_focus_issues=$((hover_focus_issues + 1))
    fi
  done < <(find "$TARGET" -type f \( -name '*.html' -o -name '*.jsx' -o -name '*.tsx' -o -name '*.vue' -o -name '*.svelte' -o -name '*.css' -o -name '*.scss' -o -name '*.ts' -o -name '*.js' \) \
    ! -path '*/node_modules/*' ! -path '*/.next/*' ! -path '*/dist/*' ! -path '*/build/*' ! -path '*/.git/*' 2>/dev/null)
elif [[ -f "$TARGET" ]]; then
  has_hover=$(grep -cE '(:hover|hover:)' "$TARGET" 2>/dev/null) || has_hover=0
  has_focus=$(grep -cE '(:focus-visible|:focus-within|:focus|focus:|focus-visible:)' "$TARGET" 2>/dev/null) || has_focus=0
  if [[ "$has_hover" -gt 0 && "$has_focus" -eq 0 ]]; then
    hover_focus_issues=1
  fi
fi

if [[ "$hover_focus_issues" -eq 0 ]]; then
  pass "Missing focus states" "0 hover-only elements"
else
  fail "Missing focus states" "${hover_focus_issues} files with hover but no focus"
fi

echo ""

# ══════════════════════════════════════════════════════════════════
# Summary
# ══════════════════════════════════════════════════════════════════
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
if [[ "$FAIL_COUNT" -eq 0 ]]; then
  echo "Result: ${PASS_COUNT}/${TOTAL_CHECKS} PASSED | PASS ✅"
  exit 0
else
  echo "Result: ${PASS_COUNT}/${TOTAL_CHECKS} PASSED | FAIL ❌"
  exit 1
fi
