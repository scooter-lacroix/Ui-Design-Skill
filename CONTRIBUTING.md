# Contributing to UI Architect

Thank you for your interest in contributing. This guide covers how to add styles, report issues, and submit changes.

## Adding a New Style

1. Create a full style spec in `styles/<name>.md` following the existing format. Required sections:
   - Design Tokens (colors, typography, spacing, radii, shadows)
   - Component Patterns (buttons, cards, inputs, navigation)
   - Layout & Spacing
   - Animation & Motion

2. Create a matching token card in `token-cards/<name>.md` — a concise summary including mood, color tokens, typography, geometry, motion, signature elements, and family classification.

3. Update the style table in `SKILL.md` with the new entry (ID, name, filename, mood).

4. Run the normalizer to ensure consistent formatting:

   ```bash
   bash scripts/normalize-styles.sh
   ```

5. If the new style belongs to a family or has known conflicts, update `reference/conflicts.md`.

6. Submit a pull request with a description of the style and its intended use cases.

## Reporting Issues

- Use GitHub Issues with a clear title and description.
- For style bugs, specify which style and which section/token is incorrect.
- For the installer or CLI, include your OS, shell, and Node.js version.

## Style Spec Guidelines

- Token values should be specific and implementable (hex codes, px/rem values, font names).
- Component patterns should cover all interactive states: default, hover, focus, active, disabled.
- Include anti-patterns specific to the style.
- Keep the tone prescriptive — agents follow these specs literally.

## Pull Request Process

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/my-style`).
3. Make your changes and verify with `bash scripts/qa-lint.sh .` (where applicable).
4. Submit the PR with a description of what changed and why.
5. Ensure CI passes before requesting review.

## Development Setup

No build step is required. The project is plain markdown, shell scripts, and a Node.js CLI.

```bash
git clone https://github.com/scooter-lacroix/Ui-Design-Skill.git
cd Ui-Design-Skill

# Verify shell scripts parse correctly
bash -n install.sh uninstall.sh scripts/status.sh scripts/qa-lint.sh scripts/normalize-styles.sh

# Test the CLI
node bin/ui-architect-skill.mjs help
node bin/ui-architect-skill.mjs plugin-path
```

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). By participating, you agree to its terms.
