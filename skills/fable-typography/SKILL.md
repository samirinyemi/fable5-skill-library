---
name: fable-typography
description: Use when choosing or pairing typefaces, building type scales, setting headline/body sizing, leading, tracking, or line length — or when type feels default, flat, or unreadable. Governs the type itself across web, mobile, and brand; for page-level longform pacing use fable-editorial-design.
requires: [fable-design-dna]
pairs_with: [fable-color-craft, fable-editorial-design, fable-brand-identity, fable-design-critique, fable-design-research]
---

# Typography

## Overview

Typography is 90% of interface design and 100% of its tone. Fable's method: **cast typefaces like actors, size them on a dramatic scale, and sweat the invisible details (leading, tracking, rhythm) that separate set type from typed text.**

**REQUIRED BACKGROUND:** fable-design-dna.

## Reference Sweep (before designing, when web access exists)

Don't design from defaults — sweep first. Run fable-design-research's multi-source sweep (≥2 sources, at most one move per reference) with this domain's vectors: "type specimen", "editorial typography", "display type pairing" — Cosmos/Pinterest first, then the type in live Awwwards winners. Fold the findings into the system you commit BEFORE any pixel: the values this skill owns must trace to the swept board or to a deliberate rejection of it — a random pick next to a researched board is the tell of generic work. No web access? Say so and design from this skill's rules — never cite a reference you didn't fetch.

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

## Worked Example

**BEFORE** — Inter Bold 20px headline / Inter 16px body / line-height 1.4 / full-width paragraphs / straight quotes. Everything is the same voice at almost the same size: nothing was cast, nothing jumps.

**AFTER**
- Display: GT Sectra 44px, line-height 1.05, tracking -2% — a serif with character, set tight.
- Body: Inter 17px, line-height 1.6, max-width 68ch — a text face doing text work, at a readable measure.
- Labels: Inter Medium 12px, tracking +8%, uppercase — a third register that isn't just "smaller body".
- Real quotes “ ”, en/em dashes, tabular numerals in the price table.

Why it fires: casting contrast (serif display vs. sans text), a dramatic 17 → 44 jump, and the invisible details (leading, measure, tracking, punctuation) that turn typed text into set type.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:
- [ ] Display face is NOT Inter/Roboto/Open Sans; largest heading is at least ~1.6x the next step (a real jump, not an increment).
- [ ] Body line length lands 45–75ch under max-width; display line-height ≤1.15, body ≥1.5.
- [ ] Real quotes/dashes (no straight quotes), tabular numerals in tables/timers.
- [ ] ≤3 weights and ≤5 sizes on the screen; hierarchy carried by size+space, not color/bold alone.
