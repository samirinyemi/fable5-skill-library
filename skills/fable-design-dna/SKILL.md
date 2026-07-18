---
name: fable-design-dna
description: Use when starting ANY Fable design task — before layout, color, or code — to set concept-first direction and kill generic/"AI-made"/template output; the mindset layer every other fable-* skill builds on and hands craft rules to.
requires: [(none)]
pairs_with: [fable-design-research, fable-design-critique]
---

# Fable Design DNA

## Overview

This is how Fable 5 thinks before it designs. Every strong design decision flows from one committed idea, executed with restraint and obsessive detail. **Concept first, pixels second, critique always.**

## The Operating Loop

Every design task runs this loop — no exceptions:

1. **INTERROGATE** — Who is this for? What single feeling must it produce (trust, desire, calm, urgency)? What will make someone remember it tomorrow?
2. **SWEEP** (when web access exists) — Before committing, run fable-design-research's multi-source sweep (Awwwards, Cosmos, Pinterest, Godly, Mobbin — ≥2 sources, at most one move per reference). The board calibrates the bar and feeds COMMIT and CONSTRAIN; it never replaces your concept. No web access? Say so and proceed — never cite a reference you didn't fetch.
3. **COMMIT** — Choose ONE bold aesthetic direction and write it down in a sentence ("brutalist confidence with editorial warmth"). Every later decision is tested against this sentence.
4. **CONSTRAIN** — Before designing, fix one committed system per axis (type, color, space, radius, motion) — **derived from the swept board, not from defaults.** Every committed value must trace to a reference on the board or to a deliberate rejection of it; a random font next to a researched board is the tell of generic work. Defer the exact values to the domain skill for that axis: type pairing → fable-typography; palette → fable-color-craft; spacing/radius system → fable-design-systems.
5. **EXECUTE** — Build with the system. When tempted to add variety, add depth instead.
6. **CRITIQUE** — Look at the result as a skeptical creative director. Find the weakest element. Fix it. Repeat until nothing embarrasses you.

Do not declare done until you have run the Red Flags checklist below AND invoked fable-design-critique on the output. If any red flag fires, return to COMMIT.

## Worked Example

> **Brief:** landing page for a sleep-tracking app.
> **INTERROGATE** → feeling = calm trust, for anxious late-night users.
> **COMMIT** → "clinical serenity: editorial whitespace, one deep-night accent."
> **CONSTRAIN** → type: Fraunces display + Inter body. Space: 8pt scale. Color: ink `#0B1220` dominant, warm off-white ground, single glow-teal accent. Radius: 4px. Motion: slow ease-out only.
> **GENERIC version rejected:** purple gradient hero, 3 feature cards, everything centered.
> **RESULT:** asymmetric hero, oversized headline, one teal moment on the CTA; features as a left-aligned editorial list, not cards.

The concept sentence propagates into every axis — that is the move.

## The Anti-Generic Contract

Generic output is the failure mode. These are hard bans unless the brief demands them:

| Never (default AI look) | Instead |
|---|---|
| Purple-to-blue gradient on white | Committed palette from the concept sentence |
| Inter/Roboto/system font as the "choice" | A distinctive display face + a workhorse body face |
| Hero + 3 feature cards + testimonial + CTA template | Layout derived from the content's actual structure |
| Everything centered, everything symmetric | Intentional asymmetry, editorial grids |
| Emoji as icons | Drawn/coherent icon language or none |
| 8 colors doing nothing | 1 dominant + neutrals + 1 accent doing everything |
| Same border-radius + shadow on every element | One elevation logic, used sparingly |
| Lorem ipsum / "Feature One" | Real, specific, voiced copy — copy IS design |

## Taste Heuristics

- **Restraint reads as expensive.** Remove until it hurts, then stop.
- **One hero moment per screen.** Decide what the eye lands on first; everything else supports it.
- **Contrast creates hierarchy** — in size, weight, space, and color. If everything is medium, nothing matters.
- **Whitespace is a material,** not leftover space. Double your first instinct.
- **Details are the design:** focus states, hover states, empty states, the 320px viewport, the 4K viewport.
- **Would this win an award, or fill a slot?** If you can imagine 1,000 other sites shipping it, start over.

## When NOT to push boldness

Utility-dense surfaces (admin tables, settings, forms mid-flow) earn clarity over expression. Boldness lives in identity moments (heroes, onboarding, marketing); calm lives in work moments. Misplacing boldness is as generic as having none.

## Companion Skills

This skill sets the mindset. Pair it with the domain skill for the task: fable-web-design, fable-mobile-ui, fable-editorial-design, fable-brand-identity, fable-typography, fable-color-craft, fable-motion-design, fable-design-systems, fable-product-ui, fable-award-winning-web. Finish every piece with fable-design-critique.

## Red Flags — Start Over

This is a fast generative self-check, not the full rubric — fable-design-critique owns the complete evaluative rubric. If any fires, return to COMMIT; then hand the finished piece to fable-design-critique.

- You picked a layout before you picked an idea
- Your one-sentence direction could describe any product
- You added a gradient because the section "felt empty"
- You can't say what the user should look at first
- You're satisfied after the first render
