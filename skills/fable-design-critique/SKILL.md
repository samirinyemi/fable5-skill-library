---
name: fable-design-critique
description: Use when finishing ANY fable-* design draft, before calling it done — a hostile-CD self-review that names the weakest element, diagnoses it on a 7-rung ladder (concept→motion), and routes the fix back to the owning fable-* skill. Also for reviewing/critiquing existing work.
requires: [fable-design-dna]
pairs_with: [(none)]
---

# Design Critique

## Overview

The difference between good and great is the number of honest passes. This is Fable 5's self-review protocol: **look at the artifact as a hostile creative director, name the weakest element, fix it, and repeat until the weakest element is genuinely good.**

## The Protocol

Run at least two full passes. Each pass:

1. **Fresh eyes:** view the actual render (screenshot/preview) — never critique from code or memory of intent.
2. **Squint test:** blur your attention. What reads first, second, third? Is that the intended order?
3. **Name the weakest element.** There is always one. "It's all fine" means you've stopped looking.
4. **Diagnose with the ladder** (below), fix at the highest failing rung, re-render.

**Exit gate — STOP only when all three hold:** (a) you ran ≥2 full passes, (b) the named weakest element of the final pass would survive being shown in a designer-you-admire's portfolio, and (c) the last pass removed more than it added. If any is false, run another pass.

## The Diagnosis Ladder (check top-down)

Fix at the highest failing rung, then reload the skill that owns it.

| Rung | Question | Typical fix | Owning skill |
|---|---|---|---|
| 1. Concept | Is there one committed idea, or a template with content? | Restate direction sentence; cut what fights it | `fable-design-dna` |
| 2. Hierarchy | Can I say what to look at 1st/2nd/3rd? | Bigger jumps in size/weight/space; demote rivals | `fable-design-dna` |
| 3. Layout | Does the grid have intention (rhythm, asymmetry, alignment)? | Align to fewer edges; vary section rhythm | `fable-design-systems` |
| 4. Typography | Does type have character AND discipline? | Recast display face; fix leading/measure | `fable-typography` |
| 5. Color | Is saturation spent in one place, temperature consistent? | Cut to one accent; tint neutrals | `fable-color-craft` |
| 6. Detail | States, spacing consistency, real content, punctuation? | Sweep: focus states, 4px grid, real copy | `fable-design-systems` |
| 7. Motion | Does movement orient/confirm, one physics personality? | Cut decorative motion; unify easing | `fable-motion-design` / `fable-micro-interactions` |

A rung-1 problem cannot be fixed at rung 6 — polishing a weak concept is the most common wasted effort in design. Every fable-* build skill hands off to this skill for its final pass; this skill hands back to the owning skill above for the actual fix.

## Worked Pass

One landing-page hero, critiqued end-to-end:

```
Pass 1 · squint test: H1, subhead, and eyebrow all read at once.
  → weakest element = hierarchy (rung 2 → fable-design-dna)
  → fix: push H1 to 64px, drop subhead to 14px/60% opacity. Re-render.
Pass 2 · the accent blue appears in 5 places (nav, CTA, badge, link, icon).
  → weakest element = color (rung 5 → fable-color-craft)
  → fix: reserve blue for the one CTA; tint the rest to neutral-30. Re-render.
Exit gate: 2 passes done, hero would survive a portfolio, last pass removed
  more than it added → done.
```

Why it works: each pass fixes the *single* highest failing rung and reloads the owning skill, instead of scattering small tweaks.

## Calibration — Weak vs Fixed per rung

| Rung | Weak (stop-ship) | Fixed |
|---|---|---|
| Hierarchy | Everything is 16px semibold | Clear 1st/2nd/3rd via a ~3× size jump |
| Layout | Elements float, no shared edges | Aligned to a few strong edges, varied rhythm |
| Typography | One system font at three sizes | Display face with character; disciplined leading/measure |
| Color | Accent on nav, CTA, badge, link, icon | Accent reserved for the single primary action |
| Detail | No focus/hover states, lorem ipsum | Real content, states, spacing on a 4px grid |
| Motion | Everything eases differently, decoration moves | One physics personality; motion only orients/confirms |

## The Hard Questions

- Would a stranger remember anything about this tomorrow?
- If I saw this in someone else's portfolio, would I be impressed or would I scroll past?
- What would a designer I admire delete first?
- Is anything here only there because the first draft had it? (Sunk-cost elements)
- Does the mobile/narrow version hold the same concept, or is it a stacked apology?

## Giving Critique to Others

Same ladder, different delivery: lead with what the design is trying to do (prove you saw the intent), locate feedback on a rung ("this is a hierarchy issue, not a color issue"), give the direction not the pixel ("the eye has no landing point" beats "make the logo bigger"), and always name what must NOT change — protecting the strongest element is half the value of critique.

## Red Flags — You've Stopped Critiquing

- Declaring done after the first render
- "It looks clean" as the entire assessment
- Fixing rung-6 details while a rung-2 problem stares at you
- Judging from code instead of the rendered result
- Every pass adds something; great passes mostly remove
