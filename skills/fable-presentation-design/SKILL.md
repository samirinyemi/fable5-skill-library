---
name: fable-presentation-design
description: Use when designing slides, pitch decks, keynotes, or any deck (.pptx, Canva, Google Slides, HTML slides) — turning topic-title, text-dense slides into billboard-clear ones read in three seconds from across a room.
requires: [fable-design-dna]
pairs_with: [fable-typography, fable-data-viz, fable-portfolio-case-study, fable-design-critique, fable-design-research]
---

# Presentation Design

## Overview

A slide is a billboard, not a document: it's read in three seconds from across a room while someone talks over it. Fable's method: **one idea per slide, the idea stated as the headline, and detail moved to the voice (or the appendix) where it belongs.**

**REQUIRED BACKGROUND:** fable-design-dna. Type and color rules come from fable-typography and fable-color-craft, tightened for distance.

## Reference Sweep (before designing, when web access exists)

Don't design from defaults — sweep first. Run fable-design-research's multi-source sweep (≥2 sources, at most one move per reference) with this domain's vectors: "pitch deck design", "keynote slide layout" — Pinterest/Behance boards. Fold the findings into the system you commit BEFORE any pixel: the values this skill owns must trace to the swept board or to a deliberate rejection of it — a random pick next to a researched board is the tell of generic work. No web access? Say so and design from this skill's rules — never cite a reference you didn't fetch.

## The Headline Carries the Slide

- Write every slide title as the **takeaway, not the topic**: "Churn is concentrated in month 2" — never "Churn Analysis". Someone flipping through only the titles should get the whole argument.
- Storyboard first: write all headlines in order as a plain list before designing anything. If the list doesn't persuade, no layout will.
- The arc is narrative: situation → tension → resolution → ask. Every deck has an ask; put it on its own slide, plainly.

## Billboard Rules

| Element | Rule |
|---|---|
| Words per slide | ≤40; if it needs more, it's two slides or a handout |
| Body text floor | 24pt — if it doesn't fit at 24pt, cut words, not point size |
| Ideas per slide | One. Two ideas = two slides; slides are free |
| Bullets | ≤4, one line each — or better, kill the bullets and say it as one sentence |
| Data slides | One number huge + one sentence of meaning; the full chart goes to appendix |
| Images | Full-bleed or precisely placed — never clip-art floating in whitespace |

## The System (decks drift faster than websites)

- Fix the grid before slide one: title zone, content zone, consistent margins. Every slide snaps to it.
- One display face + one text face, 3 sizes total. One accent color on the dominant field — same budget as fable-color-craft, spent on the takeaway.
- Build 4–5 master layouts (statement, big number, image + point, comparison, section break) and reuse them; 40 bespoke slides read as chaos even when each is pretty.
- Section-break slides pace the room — near-empty, one phrase, a breath.

## Data Without Lies or Fog

Strip chart junk (gridlines to 10% opacity, no 3D, no legend if labels fit on the data). Highlight the one series that matters in accent; grey the rest. Title the chart with its conclusion. Axis starts at zero for bars, always.

## Common Mistakes

- The speaker-notes-on-screen deck: if the deck works without you talking, it's a document — send a memo instead and use slides for the moments that need a wall.
- Topic titles ("Q3 Results") that make the audience do the analysis — that's your job.
- Shrinking type to fit content instead of cutting content to fit type.
- Deck-wide template amnesia: logo swaps, drifting margins, three shades of the accent by slide 20. The system is the professionalism.

## Worked Example

Storyboard the titles alone — they must persuade before any layout exists.

```
BEFORE (topic titles)        AFTER (takeaway headlines — the storyboard)
1. Market Overview           1. Support tickets doubled while headcount stayed flat   (situation)
2. Current Support Metrics   2. Agents now close 40% fewer tickets per shift          (tension)
3. Proposed Solution         3. One AI triage layer clears the repetitive 60%         (resolution)
4. Financials                4. $1.2M saved in year one, live in 6 weeks              (ask)
```

Why: read AFTER top-to-bottom and the argument lands with the deck muted. The BEFORE column makes the audience do the analysis — that was your job.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:
- [ ] Read only the slide titles top to bottom — do they alone tell the situation → tension → resolution → ask and land the ask? If not, the headlines aren't carrying the deck.
- [ ] No slide breaks the billboard rules: >40 words, >1 idea, body <24pt, or bullets shrunk to fit instead of content cut.
- [ ] One accent, one grid, 4–5 reused master layouts — no second accent shade, drifting margins, or bespoke one-off slides.
- [ ] Every chart is one number huge + one sentence with the full chart in the appendix; craft deferred to fable-data-viz.
