---
name: fable-site-replication
description: Use when asked to replicate/clone/rebuild an existing site or page 1:1 from a URL or screenshots ("make me this site", "copy this design", "rebuild this page") — measured, forensic fidelity. NOT for "in the style of" (use fable-style-extraction); use when a replica came out "similar but off" and must match exactly.
requires: [fable-design-dna]
pairs_with: [fable-style-extraction, fable-design-critique]
---

# Site Replication

## Overview

Replication is forensics, not inspiration. Models fail at 1:1 copies for one reason: **they glance at the source and freestyle something "similar" from memory.** Fable's method never designs during replication — it measures, transcribes, and diffs until the copy is indistinguishable.

**The iron rule: never type a value you didn't measure.** No estimated hex, no "looks like 24px", no font guessed from vibes.

**Works with:** load `fable-style-extraction` INSTEAD if the user wants the reference's *look* applied to *different* content (not a 1:1 clone) — same forensic-capture method, different output mode. Use `fable-figma-craft` / browser tooling in Phase 1 to pull real DOM + computed styles. Replication reproduces *their* decisions, not new ones, so hold `fable-design-dna`'s generative heuristics — they fight 1:1 fidelity. Run `fable-design-critique` only AFTER parity, as a separate improvement pass (see Red Flags and Ship Gate).

## Phase 1 — Capture Evidence (before writing ANY code)

This capture procedure is shared with `fable-style-extraction` — one method, two output modes: a 1:1 clone (here) vs. the reference's look applied to new content (there). Capture identically; only what you do with the inventory differs.

1. **Screenshot the original** at desktop (1440), tablet (768), and mobile (375) — full page, plus close-ups of the header, hero, and one content section. These are the ground truth for the diff loop.
2. **Fetch the real DOM and CSS.** Use whatever the session offers: browser tools (navigate + read page + computed styles), WebFetch, or `curl` the HTML and its linked stylesheets. Save them — you will quote from them, not recall them.
3. **Interact before transcribing:** note sticky behavior, hover states, scroll animations, menus, carousels. Static screenshots hide half the design.

## Phase 2 — Token Inventory (the measured facts)

Extract into a written list — this inventory IS the design file:

| Token | How to get the true value |
|---|---|
| Fonts | `font-family` from computed styles / @font-face rules — plus weight, size, line-height, letter-spacing per text role. Identify the actual font files; substitute the closest free face ONLY if the original is licensed, and say so |
| Colors | Exact hex/rgb from computed styles — background, text tiers, accent, borders. Never eyeball from a screenshot (JPEG shifts colors) |
| Spacing | Section paddings, grid gaps, container max-width — measured from the box model, not estimated |
| Radii, shadows, borders | Copied verbatim from computed styles |
| Breakpoints | From the stylesheet's media queries |
| Motion | Durations, easings, transforms from transition/animation rules |
| Assets | Download images/SVGs where permitted; otherwise recreate at identical dimensions and treatment |

## Phase 3 — Rebuild Section by Section

- Rebuild in source order: header → hero → each section → footer. Complete one section to visual parity before starting the next — twelve half-matched sections cannot be debugged.
- Match the structure (semantic tags, grid/flex choices, container widths) so responsive behavior matches for free.
- Use the original's real copy and content verbatim unless the user asked for their own content in the original's design.

## Phase 4 — The Diff Loop (where 1:1 actually happens)

Render your replica and compare side-by-side against the Phase-1 screenshots at all three widths. Then:

1. Name the single largest visible discrepancy (spacing is the usual killer, fonts second).
2. Fix ONLY that. Re-render. Repeat.
3. Stop when a stranger flicking between the two can't tell which is the original — typically 3–6 passes. One pass is never enough.

Check the details that expose fakes: exact heading letter-spacing, nav item gaps, image aspect ratios, border subtleties, hover/scroll behavior.

**Example pass.** Side-by-side at 1440: replica hero feels "looser." Largest diff: nav item gap. Measured original `gap: 32px`; replica shipped `24px` (eyeballed). Fix the gap only, re-render. Pass 2: heading too light — original computed `font-weight: 600 / letter-spacing: -0.02em`, replica used 500/normal. Fix, re-render. Pass 3: stranger-flick test passes. The concrete numbers are the point — measure, fix one diff, re-render.

**Done when:**
- [ ] Every CSS value traces to the Phase-2 token inventory
- [ ] 3+ diff passes logged at 1440 / 768 / 375
- [ ] Opened / hover / scroll states transcribed, not just the resting state
- [ ] Stranger-flick test passes

Only after parity, offer improvements via `fable-design-critique` as a labeled, separate pass.

## Multi-Page & Stateful Behavior

For whole sites (not one page), replicate **templates, not pages**: most sites are 3–5 templates (home, listing, detail, article, utility) — inventory them first, build shared components (header, footer, cards) exactly once, and any drift between two instances of the same component means one of them is wrong.

Screenshots capture the resting state only. Also capture and transcribe:

- **Opened states:** menus/mega-navs expanded, search active, modals visible, accordions open
- **Focus and hover:** form fields focused (border/label behavior), links and buttons hovered
- **Mid-animation:** scroll to trigger reveals and screenshot partway — easing and offsets live here
- **Flows:** for multi-step behavior (checkout, onboarding), walk the flow and capture each step plus its transition; replicate the sequence, not just the screens

## Scope & Ethics

Replicating is legitimate for learning, prototyping, client-authorized rebuilds, and migrating one's own site. Don't clone a site to impersonate a brand or ship someone else's design as a client deliverable — logos, copy, and photography stay with their owners; swap them out for anything public-facing.

## Red Flags — You're Freestyling, Not Replicating

| If you catch yourself... | Do this instead |
|---|---|
| Typing a CSS value that isn't in your token inventory | Go measure it from computed styles first — the inventory is the only source |
| Calling it "close enough" before any side-by-side | Render and diff at all three widths — "close enough" is unmeasured |
| Picking a font "that looks similar" without checking | Read `font-family` from @font-face / computed styles; substitute only if licensed, and say so |
| Rebuilding from memory of the screenshot | Rebuild from the screenshot open beside you, not recall |
| Improving the design mid-replication | 1:1 means their decisions, not yours — offer improvements only after parity, via `fable-design-critique` |

## Worked Example

The single most important move — measure, never eyeball:

```
BEFORE (freestyled)         AFTER (measured)
color: #1a1a1a;             color: #17171a;   /* computed style */
font-family: Inter;         font-family: "Söhne", -apple-system;  /* @font-face */
padding: 80px 0;            padding: 96px 0;  /* box model */
letter-spacing: normal;     letter-spacing: -0.021em;  /* computed */
```

Why: every "close" value on the left reads as *off* stacked together — the diff loop can't converge on guesses, only on numbers pulled from the source.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to `fable-design-critique` for an independent pass:
- [ ] Every CSS value traces to the Phase-2 token inventory — zero eyeballed hex, sizes, or fonts
- [ ] 3+ diff passes logged at 1440 / 768 / 375, largest-discrepancy-first
- [ ] Opened / hover / focus / scroll states transcribed, not just the resting screenshot
- [ ] Stranger-flick test passes; no design "improvements" snuck in — those go to a separate post-parity critique pass
