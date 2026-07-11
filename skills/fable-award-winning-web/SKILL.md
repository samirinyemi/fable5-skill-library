---
name: fable-award-winning-web
description: Use for prestige-tier, Awwwards/FWA-caliber web experiences — portfolio, product-launch, agency, or campaign sites — or when the user asks for "award-winning", "premium", "high-end", or "cinematic" web. Escalate here from fable-web-design when the job is a showpiece, not a conversion page.
requires: [fable-design-dna]
pairs_with: [fable-web-design, fable-signature-effects, fable-motion-design, fable-design-critique]
---

# Award-Winning Web

## Overview

Award-level sites win on three axes: **a singular concept, typography as the star, and motion that feels directed rather than decorated.** Jurors scroll for 30 seconds — the site must announce its idea in the first viewport and keep paying it off.

**REQUIRED BACKGROUND:** fable-design-dna (operating loop). This skill is the web-experience execution layer.
**Chains with:** fable-signature-effects (build the one signature mechanic) · fable-motion-design + fable-animation-engineering (entrance/scroll choreography) · fable-typography (display-face selection) · fable-editorial-design (asymmetric grid breakouts).
**Finish with:** fable-design-critique — REQUIRED before shipping.

## The Award Formula

1. **One unforgettable opening.** The hero is a statement, not a summary: oversized type (10–20vw display sizes), a strange-but-right image treatment, or an interactive moment. No "headline + subhead + two buttons" default.
2. **Typography carries the show.** Display face with real character (high-contrast serif, extended grotesque, or expressive variable font). Body stays disciplined. Scale jumps are dramatic: 16px body against 120px+ display.
3. **Scroll is the narrative spine.** Design the page as scenes, not sections. Each viewport-height beat reveals one idea. Use pinning, parallax (subtle, ≤10% offset), and scroll-triggered reveals to pace the story.
4. **A signature interaction.** One memorable mechanic the site owns. ONE — three signature moves cancel each other. Choose and build it in **fable-signature-effects** (derive it from the concept sentence, never a trends list).
5. **Craft in the last 10%:** custom selection color, considered 404, favicon, load sequence (curtain/counter/logo beat under 2s), footer designed as well as the hero.

## Motion Direction

Award-specific constraints only — defer curves, durations, and scroll physics to **fable-motion-design**.

- Stagger siblings 60–100ms so entrances read as choreographed, not simultaneous.
- Reveal text by masked line (`overflow:hidden` + translateY), not by fading whole paragraphs.
- Parallax stays subtle: ≤10% offset. More reads as effect-soup, not craft.
- Respect `prefers-reduced-motion`: deliver the same hierarchy with opacity-only transitions.

## Quick Reference

| Element | Award-level default |
|---|---|
| Hero type size | clamp(4rem, 12vw, 12rem) |
| Grid | 12-col with deliberate breakouts/asymmetry |
| Palette | Near-mono + one loaded accent |
| Images | Treated (duotone, grain, masks) — never raw stock |
| Easing | ease-out-expo entrances, ease-in-out for loops |
| Load time feel | Instant or choreographed — nothing in between |

## Common Mistakes

- **Effect soup:** parallax + particles + 3D + cursor + marquee = student work. Pick the signature move.
- **Motion without content:** animation revealing weak copy amplifies the weakness. Fix words first.
- **Desktop-only bravado:** the mobile version must carry the same concept, translated (type still oversized, interactions become touch-native).
- **Slow hero:** if the opening statement isn't visible in ~1s, the concept never lands.

## Worked Example

**BEFORE:** `<h1>` 48px "Build better products", a subhead line, `[Get started][Learn more]`, stock hero photo. Reads as a summary — a jury has seen it a thousand times.

**AFTER:** `clamp(4rem, 14vw, 13rem)` extended grotesque reading "MAKING / MOTION" across two lines, a duotone-and-grain treated image bleeding off-grid behind it, one magnetic primary CTA, masked-line reveal on load (curtain lifts under 1.2s).

Why: the type *is* the concept, not a label for it; the off-grid treated image announces a point of view instead of decorating; a single signature mechanic (the magnet) owns the interaction; the choreographed reveal makes the idea land before the fold. Every move states the concept — nothing merely fills a slot.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to **fable-design-critique** for an independent pass:
- [ ] Concept is legible in the first viewport in <1s — screenshot the hero and squint.
- [ ] Exactly ONE signature interaction, not two or three.
- [ ] Mobile carries the same concept (type still oversized, interactions touch-native) — not a stripped grid.
- [ ] The last-10% craft exists: custom selection color, considered 404, choreographed load, `prefers-reduced-motion` path verified.
