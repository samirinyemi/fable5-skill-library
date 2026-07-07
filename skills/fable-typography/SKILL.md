---
name: fable-typography
description: Use when choosing fonts, building type scales, setting headlines or body text, pairing typefaces, or when a design's typography feels default, flat, or unreadable. Applies to web, mobile, brand, and editorial work.
---

# Typography

## Overview

Typography is 90% of interface design and 100% of its tone. Fable's method: **cast typefaces like actors, size them on a dramatic scale, and sweat the invisible details (leading, tracking, rhythm) that separate set type from typed text.**

**REQUIRED BACKGROUND:** fable-design-dna.

## Casting, Not Choosing

- Two roles: a **display face** with genuine character (personality of the piece) and a **text face** built for its reading context (UI grotesque for products, high-x-height serif/sans for longform).
- The pairing needs contrast in one axis (serif/sans, wide/narrow, warm/cold) and harmony in another (similar x-height or era).
- **Never default to Inter/Roboto/Open Sans as the display face.** They are fine text faces; as the personality they say "no one decided."
- Characterful directions that work: high-contrast editorial serifs, extended/compressed grotesques, geometric sans with quirks, well-made monos for technical brands, variable fonts used for actual variation.

## Scale With Drama

- Build a modular scale (1.25–1.414 ratio for products; more aggressive for marketing) and stick to its steps.
- Hierarchy needs **jumps, not increments**: 16px body with a 20px "heading" reads as a mistake. Go 16 → 24 → 40 → 64+.
- Marketing/heroes: `clamp()` fluid sizing, display at 8–14vw. Products: fixed steps, fewer sizes (4–5 total).

## The Invisible Details

| Setting | Rule |
|---|---|
| Body line-height | 1.5–1.75 (longform higher) |
| Display line-height | 1.0–1.15 — big type with body leading looks broken |
| Display tracking | Slightly negative (-1% to -3%) for large sizes |
| Caps/labels tracking | +5% to +10%, smaller size, medium weight |
| Line length | 45–75ch; enforce with max-width, not luck |
| Weights | 2–3 per family; hierarchy via size+space first |
| Punctuation | Real quotes “ ”, en/em dashes, no fake ellipses |
| Numerals | Tabular in tables/timers, oldstyle in prose |

## Rhythm

Space around type belongs to the type: heading margins asymmetric (more above, less below — a heading binds to what follows). Baseline rhythm on a 4/8px grid. When type feels "off" and you can't say why, it's almost always leading or line length.

## Common Mistakes

- Expressing hierarchy with color/bold alone while every size is 14–18px.
- Six weights and five sizes on one screen — a scale exists to forbid this.
- Display font used for paragraphs (character becomes noise) or text font blown up to 96px (blandness becomes monumental blandness).
- Ignoring loading: self-host, `font-display: swap`, subset; a FOUT into the wrong fallback undoes the casting.
