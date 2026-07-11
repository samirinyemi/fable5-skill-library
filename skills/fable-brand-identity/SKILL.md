---
name: fable-brand-identity
description: Use when defining a brand's core identity — positioning, tension/enemy, logo/wordmark idea, the one ownable color, signature element, and voice card — or when a brand feels interchangeable with competitors. Delegates palette-building to fable-color-craft, type craft to fable-typography, and copy to fable-ux-copywriting.
requires: [fable-design-dna]
pairs_with: [fable-typography, fable-color-craft, fable-ux-copywriting, fable-design-critique]
---

# Brand Identity

## Overview

A brand is a repeated, ownable decision. Fable's method: **find the one true tension in the brand's story, express it as a small set of non-negotiable assets, and prove the system in the ugliest real-world contexts — not just the pretty mockups.**

**REQUIRED BACKGROUND:** fable-design-dna.

**Pairs with (delegate the craft, keep the brand logic here):**
- Palette construction, ramps, theming → fable-color-craft (this skill only sets the emotional target + names the one ownable hit)
- Type casting, scale, pairing details → fable-typography (this skill only decides personality vs. trust)
- Voice sentences, banned words, microcopy → fable-ux-copywriting (this skill only fixes the 3 adjectives + one rewrite)
- Signature element as a reusable token → fable-design-systems
- **Final pass (required before done): fable-design-critique**

## Strategy Before Style

1. **Positioning sentence:** "For [audience], [brand] is the only [category] that [difference]." If "only" is a lie, keep digging.
2. **Tension pair:** every memorable brand holds two opposing qualities (precise + playful, ancient + digital, luxurious + blunt). Name the pair; it becomes the design brief.
3. **Enemy:** what does the brand refuse? (Clutter? Jargon? Beige?) Refusals guide harder than aspirations.

## The Identity Kit (minimum viable brand)

- **Wordmark/logo** with a real idea — a letterform modification, a spacing decision, a geometric logic — not a font typed out. Must survive at 16px favicon and on a billboard.
- **One ownable color** (the "brand hit") + a disciplined supporting palette. Test: shown only the color swatch, could a customer name the brand? That's the target.
- **Type pairing as voice:** display face = personality, text face = trust. Lock weights and use-cases now, or the brand fragments within a month.
- **A signature element** beyond logo/color: a grid habit, an underline, a corner cut, a photographic treatment, a punctuation habit in copy. This is what makes cropped, logo-free assets still recognizable.
- **Voice card:** 3 adjectives, 3 banned words, one example sentence rewritten from generic → branded.

## Prove It Dirty

A brand system is validated in hostile contexts, not hero mockups. Before calling it done, apply it to: a favicon, a social avatar at 40px, an invoice, a cluttered app store screenshot, a co-branded lockup, a black-and-white photocopy. Whatever breaks, redesign.

## Quick Reference

| Asset | Test |
|---|---|
| Logo | Works at 16px and 16ft; recognizable as silhouette |
| Palette | 1 ownable hit + neutrals; passes AA in UI use |
| Type | Personality face + trust face, licensed for web |
| Signature element | Recognizable with the logo cropped out |
| Voice | Sounds like a person you could pick from a lineup |

## Common Mistakes

| Tempting mistake | Do instead |
|---|---|
| 10 colors "for flexibility" | 1 ownable hit + neutrals; flexibility is decoration, constraint is equity |
| Moodboard-averaged identity | Design from the tension pair + enemy, not from references |
| Guidelines showing only perfection | Ship wrong-usage examples + the min-size floor |
| Visuals with generic copy | Lock the voice card before sign-off — a costume, not a character |

## Worked Example

One brand run from tension to asset, showing the core move — design from the pair, not from references:

> **Positioning:** "For overwhelmed founders, Ledger is the only bookkeeping app that closes your month while you sleep."
> **Tension pair:** clinical + reassuring. **Enemy:** spreadsheet dread.
> **Ownable color:** a single ink-green hit on cream (target set here; ramp built by fable-color-craft).
> **Voice rewrite:** generic "Manage your finances effortlessly" → branded "Your books are already closed. Go to bed."

Why: the branded line and the color both fall straight out of the tension pair and the enemy — no moodboard, no category average.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:
- [ ] The "only" in the positioning sentence is true, not a lie — and every asset traces back to the tension pair + enemy
- [ ] Exactly one ownable color hit; logo reads at 16px favicon and as a silhouette; signature element survives with the logo cropped out
- [ ] Voice card is locked (3 adjectives, 3 banned words, one generic→branded rewrite) — no generic copy on the visuals
- [ ] Run every row of the Quick Reference table and the full Prove It Dirty context list; if any dirty context breaks, the system is not done
