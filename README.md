# Fable 5 — Skill Library

**Twenty-seven design skills that encode how Fable 5 designs** — its decision rules, its restraint, its critique loop. Install them into Claude Code and get Fable-grade design output from Opus, Sonnet, Haiku, or any model.

🔗 **See them in action:** [fable-skill-library.vercel.app](https://fable-skill-library-samirinyemi-gmailcoms-projects.vercel.app)

---

## Install — inside the Claude Code app, no terminal

You do **not** need a terminal, `npx`, or any folder-copying. Do it right in the Claude Code chat (desktop app, web at claude.ai/code, or the IDE extension):

**1. Add the library**
```
/plugin marketplace add samirinyemi/fable5-skill-library
```

**2. Install the skills**
```
/plugin install fable-skills@fable5-skill-library
```

That's it — all 27 skills are now available in every session. List them anytime with `/help`.

> **Prefer clicking?** Type `/plugin`, open the **Discover** tab, search **"fable"**, and press **Install**. Same result, fully visual.

---

## What you get

Invoke any skill by name (e.g. describe your task and mention it, or type its command). The library is organized into seven disciplines:

| Discipline | Skills |
|---|---|
| **Foundations** | design-dna · design-critique |
| **Web & Replication** | award-winning-web · web-design · site-replication · style-extraction · design-research |
| **Craft** | typography · color-craft · image-direction · ux-copywriting · accessibility |
| **Motion** | motion-design · animation-engineering · micro-interactions · signature-effects |
| **Editorial & Brand** | editorial-design · brand-identity |
| **Systems & Product** | design-systems · figma-craft · product-ui · web-app-design · mobile-ui · onboarding-empty-states · data-viz |
| **Career** | presentation-design · portfolio-case-study |

The recommended stack: open with **design-dna** (the operating loop and anti-generic contract), add the **domain skill** for your task, and close with **design-critique** (the quality gate).

---

## How it works

Skills load into the model's context on demand — not into its weights. So the same method runs on whatever model or agent you already have open. Each skill is a plain-markdown reference the model picks up when it's relevant to the task; nothing is hard-coded, and you can fork and tune any of them.

---

## Manual install (advanced / terminal)

If you'd rather manage the files yourself, the skills are plain folders:

```bash
npx degit samirinyemi/fable5-skill-library/skills ~/.claude/skills
```

This drops all 27 `fable-*` skill folders into `~/.claude/skills`, where Claude Code auto-discovers them (invoked as `/fable-web-design`, etc.). The plugin route above is recommended for everyone else.

---

## Credit

Authored by **Samuel Irinyemi** · © 2026, powered by Soni Labs Studio.
