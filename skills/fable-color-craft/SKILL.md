---
name: fable-color-craft
description: Use when building color palettes, theming (light/dark modes), choosing accents, fixing muddy or clashing colors, or when a design's color feels arbitrary, timid, or default-purple.
---

# Color Craft

## Overview

Color is a budget: you get one dominant statement, and everything else pays for it. Fable's method: **derive the palette from the concept's emotional temperature, spend saturation in exactly one place, and build neutrals with a soul.**

**REQUIRED BACKGROUND:** fable-design-dna.

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

- Body text AA (4.5:1) minimum, headlines 3:1, interactive states verified in BOTH themes.
- Never encode meaning in hue alone — pair with icon, weight, or label (8% of men can't see the difference you're relying on).

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
