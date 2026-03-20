# Getting Started

## What UI Architect Does

UI Architect is a design system orchestrator that gives AI coding agents a structured workflow for building visually coherent UI. Instead of relying on the agent's default aesthetic sensibilities, UI Architect provides:

- **Style selection** from 31 curated design specifications
- **Flow governance** to ensure visual and interactive coherence
- **Blocking task lists** that prevent incomplete builds
- **Automated QA** with targeted remediation

## How It Works

### Phase 1: Style Selection

When you request UI work, the agent parses your prompt for style cues (mood keywords, product type, target audience) and selects the best matching design language from the library. It can also blend multiple styles when appropriate, checking compatibility against a conflict matrix.

### Phase 2: Context Assessment

The agent reviews your tech stack, existing patterns, and build scope before writing any code.

### Phase 3: Build Execution

The build is decomposed into a blocking task list. Each task has explicit completion criteria, references specific style spec sections, and declares a Flow Contract explaining how it connects to adjacent components. Tasks are executed sequentially — no skipping.

### Phase 4: QA & Remediation

After all tasks complete, a 25-point QA checklist validates token adherence, component completeness, Flow coherence, responsiveness, and accessibility. Failures are mapped back to specific tasks for targeted fixes, cycling up to 3 times until zero failures remain.

## Your First Build

### 1. Install the skill

```bash
git clone https://github.com/scooter-lacroix/Ui-Design-Skill.git
cd Ui-Design-Skill
bash install.sh
```

### 2. Open your agent and request UI work

In Claude Code, Amp, Gemini CLI, or OpenCode, describe what you want to build:

```
Build a dark, cinematic SaaS landing page with a hero section,
feature cards, pricing, and a CTA footer.
```

### 3. Watch the 4-phase protocol execute

The agent will:
1. Announce its style and Flow selection
2. Assess your codebase
3. Present a blocking task list for approval
4. Build each component to specification
5. Run QA and remediate any issues

### 4. Review the output

The final completion declaration lists every component built, Bold Factor signatures confirmed, and Flow verification results.

## Next Steps

- Read the [style library](style-library.md) to understand available design languages
- See the [installation guide](installation.md) for all platform options
- Check the [adoption guide](adoption-guide.md) for team and CI workflows
- Review the [FAQ](faq.md) for common questions
