# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability, please report it responsibly.

1. Open a [GitHub Security Advisory](../../security/advisories/new) (preferred).
2. If GitHub advisories are not available for this repository, email the maintainers.

Please include:

- A description of the vulnerability
- Steps to reproduce it
- The affected component or file
- Any potential impact

## What to Report

- Code injection through style specifications or token values
- Path traversal in the installer or CLI
- Command injection in shell scripts
- Malicious content in markdown files

## What We Consider Out of Scope

- Issues in the AI agent platforms themselves (Claude Code, Amp, Gemini CLI, OpenCode)
- General markdown rendering vulnerabilities in external tools
- Typo or content quality issues in style specifications (use regular issues for these)

## Response

- We will acknowledge receipt within 48 hours.
- We will provide an initial assessment within 7 days.
- We will notify you when the issue is resolved.

## Supported Versions

| Version | Supported |
|:--------|:----------|
| 1.x     | Yes       |

Only the latest release is actively supported.
