---
name: fable-style-extraction
description: Use when applying a reference's aesthetic to DIFFERENT content — "make my site feel like this one", "in the style of X", "use this as inspiration", "match this vibe" — extracting its type/color/spacing/motion rules as a token sheet. NOT a 1:1 clone (fable-site-replication); NOT finding references (fable-design-research).
requires: [fable-design-dna]
pairs_with: [fable-design-research, fable-site-replication, fable-design-critique]
---

# Style Extraction

## Overview

The middle ground between cloning and inventing: **steal the system, not the pixels.** A reference site's magic lives in its rules — type logic, color proportions, spacing rhythm, motion personality — not in its specific layout. Extract those rules as a token sheet, then design YOUR content with THEIR system.

**REQUIRED BACKGROUND:** fable-design-dna. For 1:1 clones use fable-site-replication instead — mixing the two modes produces neither.

## Phase 1 — Capture Like a Forensic, Read Like a Critic

Capture using fable-site-replication Phase 1 discipline (3 widths, measured CSS). The ONLY difference: you're hunting for proportions and rules, not exact coordinates — so also record color-area ratios and which elements never animate. The goal is answering **"what makes this feel the way it feels?"** Write the answer as one sentence before extracting anything ("warm editorial confidence from oversized serifs, cream field, and slow reveals"). If your sentence could describe ten sites, look harder.

## Phase 2 — Extract the System (the style sheet)

For each layer, record the *rule*, not the instance:

| Layer | Extract this | Not this |
|---|---|---|
| Type | The logic: "high-contrast serif display at 8–12vw, tight leading, grotesque body at 16px" + measured sizes/weights | "Their H1 says 'Welcome'" |
| Color | Proportions: dominant field, neutral temperature, where the accent is spent, exact values | The palette dumped without roles |
| Space | The rhythm: section padding scale, container width, gap system, density | Individual margins |
| Shape | Radius language, border weight, shadow logic, image treatment (masks, duotone, grain) | One button's CSS |
| Motion | Personality: durations, easing family, what animates and what never does | A single keyframe |
| Layout habits | Recurring moves: asymmetric splits, breakout images, marquees, grid violations | Their exact page structure |

## Phase 3 — Apply to Your Content

- Restate your own content's structure first (fable-web-design message architecture) — then dress it in the extracted system.
- Follow the system's *rules* exactly, but make layout decisions from your content. If their hero is a product shot and yours is a manifesto, the type logic carries the resemblance, not the arrangement.
- Test: someone who loves the reference should feel the kinship; someone comparing them side-by-side should find no copied section.

## What Never Transfers

Logos, copy, photography/illustrations, mascots, brand names, and any element that IS the reference's identity rather than its craft. Style is learnable; identity is owned. If removing an element would make the reference unrecognizable, that element is identity — leave it.

## Common Mistakes

- Extracting the layout instead of the system — produces a legally-nervous clone with different words.
- Extracting from memory of the vibe — produces generic "inspired by" work with none of the reference's discipline. Measure, then apply.
- Blending three references without a hierarchy — pick one PRIMARY reference for the system; others may contribute single elements at most.
- Keeping your old spacing/type habits under their palette — a palette swap is not a style transfer; the rhythm is most of the feel.

## Worked Example

**Reference:** an editorial studio site. One-sentence read: *"warm editorial confidence."*

**Extracted sheet:**
- **Type** — high-contrast serif display 8–12vw / 0.95 leading; grotesque body 16–18px
- **Color** — 70% cream field (#F4EFE6), warm-neutral, accent #C6432A spent ONLY on links + one hero word
- **Space** — 120px section padding, 1100px container, 8px gap base
- **Motion** — 600ms ease-out reveals, nothing bounces

**Applied to a SaaS pricing page:** same type logic + cream/accent proportions + reveal timing, but a 3-column pricing grid the reference never had.

**Why:** kinship comes from the rules, not a borrowed section. Anyone who loves the reference feels it; side-by-side, no block is copied.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:
- [ ] One-sentence feel-read written and NOT generic (fails the "could describe ten sites" test)?
- [ ] Every extracted value measured from the reference, not recalled from memory?
- [ ] Zero copied sections or layout blocks — resemblance carried by rules, not arrangement?
- [ ] Identity elements (logo, copy, photography, mascots, brand names) all stripped?
