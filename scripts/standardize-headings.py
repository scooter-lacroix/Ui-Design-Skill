#!/usr/bin/env python3
"""Standardize section headings across all style .md files.

Maps variant heading names to canonical names so the skill
can reference sections reliably in QA and task list creation.
"""
import re, sys, os, glob

# Canonical heading mappings: regex pattern → replacement
# Order matters — more specific patterns first
HEADING_MAP = [
    # Philosophy section
    (r'^## ?\d*\.?\s*Design Philosophy.*', '## Design Philosophy'),
    (r'^# Design Philosophy.*', '## Design Philosophy'),
    (r'^## Core Design Principles', '## Design Philosophy'),

    # Tokens section
    (r'^## ?\d*\.?\s*Design Token System.*', '## Design Tokens'),
    (r'^# Design Token System.*', '## Design Tokens'),
    (r'^## Design Token Reference.*', '## Design Token Quick Reference'),

    # Component section
    (r'^## ?\d*\.?\s*Component Styl.*', '## Component Patterns'),
    (r'^## ?\d*\.?\s*Component Architecture.*', '## Component Patterns'),
    (r'^# Component Stylings', '## Component Patterns'),

    # Layout section
    (r'^## ?\d*\.?\s*Layout.*(?:Spacing|Strategy|Principles).*', '## Layout & Spacing'),
    (r'^## ?\d*\.?\s*Spacing & Layout.*', '## Layout & Spacing'),
    (r'^## ?\d*\.?\s*Spacing.*Iconography.*', '## Layout & Spacing'),
    (r'^# Layout.*(?:Spacing|Strategy).*', '## Layout & Spacing'),

    # Bold Factor / Signature section
    (r'^## ?\d*\.?\s*(?:The )?"?Bold (?:Factor|Choices).*', '## Signature Elements'),
    (r'^## ?\d*\.?\s*Non-Generic.*(?:Bold|Choices|Signatures?).*', '## Signature Elements'),
    (r'^## ?\d*\.?\s*(?:Dos and Don\'ts|Implementation Checklist)', '## Signature Elements'),
    (r'^# Non-Genericness.*', '## Signature Elements'),

    # Anti-patterns section
    (r'^## ?\d*\.?\s*Anti-Patterns.*', '## Anti-Patterns'),

    # Animation section
    (r'^## ?\d*\.?\s*(?:Animation|Effects).*(?:Motion|Animation|Micro).*', '## Animation & Motion'),
    (r'^## ?\d*\.?\s*Animation System.*', '## Animation & Motion'),
    (r'^# (?:Effects|Motion).*', '## Animation & Motion'),

    # Responsive section
    (r'^## ?\d*\.?\s*Responsive.*', '## Responsive Strategy'),

    # Accessibility section
    (r'^## ?\d*\.?\s*Accessibility.*', '## Accessibility'),

    # Iconography section
    (r'^## ?\d*\.?\s*Icon.*', '## Iconography'),
    (r'^# Iconography', '## Iconography'),

    # Implementation section
    (r'^## ?\d*\.?\s*Implementation.*', '## Implementation Notes'),

    # Section patterns (academia-specific)
    (r'^## Section Patterns', '## Section Patterns'),
]

def standardize_file(filepath):
    with open(filepath, 'r') as f:
        lines = f.readlines()

    changes = 0
    new_lines = []
    for line in lines:
        stripped = line.rstrip()
        matched = False
        for pattern, replacement in HEADING_MAP:
            if re.match(pattern, stripped, re.IGNORECASE):
                if stripped != replacement:
                    new_lines.append(replacement + '\n')
                    changes += 1
                    matched = True
                break
        if not matched:
            new_lines.append(line)

    with open(filepath, 'w') as f:
        f.writelines(new_lines)

    return changes

if __name__ == '__main__':
    styles_dir = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(__file__), '..', 'styles')
    files = sorted(glob.glob(os.path.join(styles_dir, '*.md')))

    total = 0
    duplicates_found = 0
    for f in files:
        n = standardize_file(f)
        name = os.path.basename(f)
        status = f'  ✅ {name}: {n} headings standardized' if n > 0 else f'  ✓  {name}: already standard'
        print(status)
        total += n

        # Check for duplicate h2 headings after normalization
        with open(f, 'r') as fh:
            h2_headings = [line.rstrip() for line in fh if re.match(r'^## ', line.rstrip())]
        seen = {}
        for h in h2_headings:
            if h in seen:
                seen[h] += 1
            else:
                seen[h] = 1
        dupes = {h: c for h, c in seen.items() if c > 1}
        if dupes:
            duplicates_found += len(dupes)
            for heading, count in dupes.items():
                print(f'  ⚠️  {name}: duplicate heading "{heading}" appears {count} times')

    print(f'\n  Total: {total} headings standardized across {len(files)} files.')
    if duplicates_found:
        print(f'  ⚠️  {duplicates_found} duplicate heading(s) found — resolve manually to avoid ambiguous section lookup.')
    else:
        print('  ✓  No duplicate headings detected.')
