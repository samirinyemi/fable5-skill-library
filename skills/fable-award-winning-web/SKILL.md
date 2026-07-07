---
name: fable-award-winning-web
description: Use when the goal is an Awwwards/FWA-caliber web experience — portfolio sites, product launches, agency sites, campaign pages — or when the user asks for "award-winning", "premium", "high-end", or "cinematic" web design.
---

# Award-Winning Web

## Overview

Award-level sites win on three axes: **a singular concept, typography as the star, and motion that feels directed rather than decorated.** Jurors scroll for 30 seconds — the site must announce its idea in the first viewport and keep paying it off.

**REQUIRED BACKGROUND:** fable-design-dna sets the operating loop. This skill is the web-experience execution layer.

## The Award Formula

1. **One unforgettable opening.** The hero is a statement, not a summary: oversized type (10–20vw display sizes), a strange-but-right image treatment, or an interactive moment. No "headline + subhead + two buttons" default.
2. **Typography carries the show.** Display face with real character (high-contrast serif, extended grotesque, or expressive variable font). Body stays disciplined. Scale jumps are dramatic: 16px body against 120px+ display.
3. **Scroll is the narrative spine.** Design the page as scenes, not sections. Each viewport-height beat reveals one idea. Use pinning, parallax (subtle, ≤10% offset), and scroll-triggered reveals to pace the story.
4. **A signature interaction.** One memorable mechanic the site owns: magnetic buttons, an image trail, a custom cursor, a marquee that reacts, a WebGL touch. ONE — three signature moves cancel each other.
5. **Craft in the last 10%:** custom selection color, considered 404, favicon, load sequence (curtain/counter/logo beat under 2s), footer designed as well as the hero.

## Motion Direction

- Entrances: 400–800ms, `cubic-bezier(0.16, 1, 0.3, 1)` (ease-out-expo family), staggered 60–100ms between siblings.
- Reveal text by masked line (`overflow:hidden` + translateY), not by fading whole paragraphs.
- Everything scroll-linked should feel weighted — use scrub/lerp smoothing, never linear jumps.
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
