---
name: fable-site-replication
description: Use when asked to replicate, clone, copy, or rebuild an existing website or page 1:1 from a URL or screenshots — "make me this site", "copy this design", "rebuild this page" — or when a replica came out "similar but off" and must match the original exactly.
---

# Site Replication

## Overview

Replication is forensics, not inspiration. Models fail at 1:1 copies for one reason: **they glance at the source and freestyle something "similar" from memory.** Fable's method never designs during replication — it measures, transcribes, and diffs until the copy is indistinguishable.

**The iron rule: never type a value you didn't measure.** No estimated hex, no "looks like 24px", no font guessed from vibes.

## Phase 1 — Capture Evidence (before writing ANY code)

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

- Any CSS value in your code that isn't in your token inventory
- "Close enough" before a single side-by-side comparison
- A different font "that looks similar" chosen without checking what the original uses
- Rebuilding from memory of the screenshot instead of the screenshot
- Improving the design mid-replication — 1:1 means their decisions, not yours; offer improvements as a separate pass after parity
