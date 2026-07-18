---
name: fable-color-craft
description: Use when building or fixing a color palette — dominant field, neutrals, and the single accent — plus light/dark theming and functional colors; reach for this when color feels muddy, clashing, arbitrary, or default-purple. (Contrast checks live in fable-accessibility; multi-hue chart palettes in fable-data-viz.)
requires: [fable-design-dna]
pairs_with: [fable-typography, fable-brand-identity, fable-accessibility, fable-design-critique, fable-design-research]
---

# Color Craft

## Overview

Color is a budget: you get one dominant statement, and everything else pays for it. Fable's method: **derive the palette from the concept's emotional temperature, spend saturation in exactly one place, and build neutrals with a soul.**

**REQUIRED BACKGROUND:** fable-design-dna.

## Reference Sweep (before designing, when web access exists)

Don't design from defaults — sweep first. Run fable-design-research's multi-source sweep (≥2 sources, at most one move per reference) with this domain's vectors: "editorial color palette", "duotone website", "warm neutral palette" — Cosmos/Pinterest, plus palettes measured from live award sites. Fold the findings into the system you commit BEFORE any pixel: the values this skill owns must trace to the swept board or to a deliberate rejection of it — a random pick next to a researched board is the tell of generic work. No web access? Say so and design from this skill's rules — never cite a reference you didn't fetch.

## The Palette Recipe

1. **Dominant field** — the background world (60–70% of every screen). Almost never pure #FFF or #000: warm paper (#FAF8F5-family), cold slate, deep ink. This sets the temperature.
2. **Structural neutrals** — 5–7 steps tinted *toward* the dominant hue (warm grays with warm paper, blue-grays with slate). Pure gray next to a temperature-committed background looks dirty.
3. **One loaded accent** — the only high-saturation voice. It marks actions and identity moments exclusively. If the accent appears more than ~5 times per viewport, it's no longer an accent.
4. **Functional colors** (success/warn/error) tuned to sit in the same temperature — desaturate them toward the palette so alerts feel native, not bolted on.

## Where Fable Spends Color

- Interactive elements and brand moments get the accent. Decoration never does.
- Large surfaces stay quiet; small elements may be loud. A saturated 4px underline beats a saturated section background.
- Depth via layered lightness of the SAME hue family (bg → surface → raised surface), not via gray + shadows alone.

## Dark Mode Is a Second Palette

- Don't invert — re-derive. Dark backgrounds: very dark chromatic tones (#12141A-family), never #000.
- Desaturate accents 10–20% on dark (saturated colors vibrate on dark fields) and raise their lightness.
- Elevation = lighter surface, not bigger shadow. Text: 87%/60%/38% opacity tiers of near-white, not pure white.

## Contrast Discipline

- Contrast ratios and colorblind checks are owned by **fable-accessibility** — every palette must pass its checks in both themes. Don't restate the numbers here; go there.
- Color-specific note: desaturate functional colors toward the field WITHOUT dropping below AA.

## Quick Reference

| Slot | Budget | Example logic |
|---|---|---|
| Dominant field | 60–70% | Warm paper / deep ink |
| Neutrals | 25–35% | 5–7 steps, hue-tinted |
| Accent | ≤5% | One saturated voice, actions only |
| Functional | As needed | Desaturated toward palette |

## Common Mistakes

- The reflex purple-blue gradient — the universal signature of "no decision was made."
- Three competing saturated colors: each steals the others' meaning. One accent, promoted; others demoted or cut.
- Pure-gray neutrals on a temperature-committed background (reads muddy).
- Choosing colors on the artboard, not in context — judge color only in the real layout at real proportions.

## Worked Example

**BEFORE** — bg `#FFFFFF`, text `#333333`, three accents: `#6D5EF5` buttons / `#10B981` badges / `#F59E0B` links.
**AFTER** — dominant warm paper `#FAF8F5`; neutrals tinted warm (`#2A2724` text → `#B8B2A8` muted); ONE accent `#C2410C` for actions and identity only; success/warn desaturated toward the field (`#5C7A5A`, `#B8863A`).
**Why** — white + three saturated colors = "no decision was made." Promote one accent, demote the rest, and give the neutrals a temperature so nothing reads muddy.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:
- [ ] Accent appears ≤5× per viewport (count it) and lands only on actions/identity, never decoration.
- [ ] No pure `#FFF`/`#000`/pure-gray anywhere — neutrals are tinted toward the dominant hue.
- [ ] Dark mode was re-derived, not inverted; accents desaturated 10–20% and contrast verified in BOTH themes via fable-accessibility.
- [ ] Palette judged in the real layout at real proportions, not on an artboard.
