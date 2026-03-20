# Release Process

## Prerequisites

- All changes merged to the release branch
- Shell scripts pass syntax checks
- CLI works correctly
- `npm pack --dry-run` shows expected contents

## Pre-Release Checklist

- [ ] Update `VERSION` with the new version number
- [ ] Update `package.json` `version` field to match
- [ ] Update `CHANGELOG.md` with changes since last release
- [ ] Verify shell scripts: `bash -n install.sh uninstall.sh scripts/qa-lint.sh scripts/status.sh scripts/normalize-styles.sh`
- [ ] Verify CLI: `node bin/ui-architect-skill.mjs help`
- [ ] Verify plugin-path: `node bin/ui-architect-skill.mjs plugin-path`
- [ ] Verify init: create temp dir, run `init`, confirm bundle exists
- [ ] Verify pack: `npm pack --dry-run`
- [ ] Run full installer: `bash install.sh`
- [ ] Run status check: `bash scripts/status.sh`
- [ ] Validate Claude plugin manifests: `claude plugin validate .`
- [ ] Confirm the public GitHub repository contains the release commit before publishing npm metadata that points to it

## Release Steps

### Git Tag

```bash
git tag v<version>
git push origin main
git push origin v<version>
```

### npm Publish

```bash
npm pack --dry-run  # Final verification
npm publish
```

### GitHub Release

Create a GitHub Release from the tag with the changelog entry as the release notes.

## Post-Release

- [ ] Verify the npm package installs correctly: `npm install -g ui-architect-skill@<version>`
- [ ] Verify the CLI works from the installed package
- [ ] Update documentation if any URLs changed

## Versioning

This project follows [Semantic Versioning](https://semver.org/):

- **MAJOR**: Breaking changes to the skill protocol, CLI interface, or style spec format
- **MINOR**: New styles, new CLI commands, new features
- **PATCH**: Bug fixes, style spec corrections, documentation updates
