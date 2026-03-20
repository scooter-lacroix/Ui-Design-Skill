#!/usr/bin/env node
// UI Architect — Node CLI
// Dependency-free entry point for install, uninstall, status, init, and plugin-path.
// Compatible with Node.js 18+.

import { execFileSync } from "node:child_process";
import {
  existsSync,
  mkdirSync,
  cpSync,
  readFileSync,
  readdirSync,
  chmodSync,
} from "node:fs";
import { resolve, dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));
const REPO_ROOT = resolve(__dirname, "..");
const VERSION_FILE = join(REPO_ROOT, "VERSION");

function getVersion() {
  try {
    return readFileSync(VERSION_FILE, "utf8").trim();
  } catch {
    return "unknown";
  }
}

function runShell(scriptPath) {
  const abs = resolve(REPO_ROOT, scriptPath);
  if (!existsSync(abs)) {
    console.error(`Error: ${scriptPath} not found at ${abs}`);
    process.exit(1);
  }
  execFileSync("/usr/bin/env", ["bash", abs], { stdio: "inherit", cwd: REPO_ROOT });
}

function help() {
  const v = getVersion();
  console.log(`ui-architect-skill v${v}`);
  console.log("");
  console.log("A design system orchestrator for AI coding agents.");
  console.log("");
  console.log("Usage:");
  console.log("  ui-architect-skill <command> [options]");
  console.log("");
  console.log("Commands:");
  console.log("  help              Show this usage information");
  console.log("  install           Install skill to all detected platforms");
  console.log("  uninstall         Remove skill from all platforms");
  console.log("  status            Check sync status across installations");
  console.log("  init <path>       Copy skill bundle into a target project");
  console.log("  plugin-path       Print repo root path for --plugin-dir");
  console.log("  version           Print the current version");
  console.log("");
  console.log("Examples:");
  console.log("  ui-architect-skill install");
  console.log("  ui-architect-skill init ./my-project");
  console.log("  ui-architect-skill init ./my-project/.ui-architect");
  console.log("  ui-architect-skill plugin-path");
  console.log("  claude --plugin-dir $(ui-architect-skill plugin-path)");
}

function countFiles(dir, ext) {
  try {
    return readdirSync(dir)
      .filter((f) => f.endsWith(ext))
      .length.toString();
  } catch {
    return "0";
  }
}

function makeScriptsExecutable(dir) {
  try {
    for (const f of readdirSync(dir)) {
      if (f.endsWith(".sh")) {
        const p = join(dir, f);
        try {
          chmodSync(p, 0o755);
        } catch {
          // chmod may fail on some platforms; non-critical
        }
      }
    }
  } catch {
    // scripts dir may not exist; non-critical
  }
}

function init(targetArg) {
  if (!targetArg) {
    console.error("Error: init requires a target path.");
    console.error("Usage: ui-architect-skill init <path>");
    process.exit(1);
  }

  const target = resolve(targetArg);
  const bundleDir = target.endsWith(".ui-architect") ? target : join(target, ".ui-architect");

  // Source directories
  const dirs = ["styles", "token-cards", "reference", "scripts"];
  const files = ["SKILL.md", "VERSION"];

  // Validate source
  for (const d of dirs) {
    const src = join(REPO_ROOT, d);
    if (!existsSync(src)) {
      console.error(`Error: source directory ${d}/ not found in ${REPO_ROOT}`);
      process.exit(1);
    }
  }
  for (const f of files) {
    if (!existsSync(join(REPO_ROOT, f))) {
      console.error(`Error: ${f} not found in ${REPO_ROOT}`);
      process.exit(1);
    }
  }

  // Create target directories
  for (const d of dirs) {
    mkdirSync(join(bundleDir, d), { recursive: true });
  }

  // Copy files
  for (const f of files) {
    cpSync(join(REPO_ROOT, f), join(bundleDir, f));
  }

  // Copy directory contents recursively
  for (const d of dirs) {
    cpSync(join(REPO_ROOT, d), join(bundleDir, d), { recursive: true });
  }

  // Make shell scripts executable (pure Node, no shell-out)
  makeScriptsExecutable(join(bundleDir, "scripts"));

  // Count copied files
  const countStyles = countFiles(join(bundleDir, "styles"), ".md");
  const countTokens = countFiles(join(bundleDir, "token-cards"), ".md");
  const countRef = countFiles(join(bundleDir, "reference"), ".md");

  console.log(`Initialized UI Architect skill bundle at: ${bundleDir}`);
  console.log(`  ${countStyles} styles, ${countTokens} token cards, ${countRef} reference docs`);
}

// Main dispatch
const args = process.argv.slice(2);
const command = args[0];

switch (command) {
  case "help":
  case "--help":
  case "-h":
    help();
    break;

  case "install":
    runShell("install.sh");
    break;

  case "uninstall":
    runShell("uninstall.sh");
    break;

  case "status":
    runShell("scripts/status.sh");
    break;

  case "init":
    init(args[1]);
    break;

  case "plugin-path":
    console.log(REPO_ROOT);
    break;

  case "version":
  case "--version":
  case "-v":
    console.log(getVersion());
    break;

  default:
    if (command) {
      console.error(`Unknown command: ${command}`);
      console.error("Run 'ui-architect-skill help' for usage information.");
      process.exit(1);
    } else {
      help();
    }
}
