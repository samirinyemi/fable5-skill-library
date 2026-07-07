---
name: fable-motion-design
description: Use when adding animation, transitions, micro-interactions, hover/scroll effects, loading choreography, or when an interface feels static and dead — or conversely janky, floaty, and over-animated.
---

# Motion Design

## Overview

Motion is the interface's body language. Fable's method: **every animation answers a question (where did this come from? what just happened? what can I do?), obeys one physical personality, and disappears from conscious notice.**

**REQUIRED BACKGROUND:** fable-design-dna. This skill sets direction; for implementation use fable-animation-engineering (page/scroll choreography), fable-micro-interactions (component feedback), and fable-signature-effects (the one showpiece).

## The Three Legitimate Jobs

1. **Orientation** — show where things come from/go (page transitions, drawer slides, shared-element moves).
2. **Feedback** — confirm the system heard you (press states, success ticks, optimistic updates).
3. **Personality** — a small number of signature moments (hero entrance, brand loader). Budget: 1–2 per product.

An animation doing none of these jobs is a delay wearing a costume. Cut it.

## One Physics Personality

Decide the product's "material" once and apply it everywhere:

- **Crisp/professional:** 150–250ms, ease-out, minimal overshoot.
- **Warm/friendly:** 250–400ms, soft springs (damping ~0.8), slight overshoot on entrances.
- **Cinematic/premium:** 400–800ms, ease-out-expo, staggered reveals.

Mixing personalities per-component is how apps feel "off" without users knowing why.

## Timing Table

| Interaction | Duration | Easing |
|---|---|---|
| Hover/press feedback | 100–150ms | ease-out |
| Small element (toast, tooltip) | 200ms | ease-out |
| Panel/modal/drawer | 250–350ms | ease-out entrance, ease-in exit (exits ~20% faster) |
| Page transition | 300–500ms | ease-in-out |
| Hero/marketing reveal | 400–800ms | cubic-bezier(0.16,1,0.3,1) |
| Stagger between siblings | 40–80ms | — |

## Craft Rules

- Animate only `transform` and `opacity` (compositor-friendly); never layout properties in interaction paths.
- Enter ≠ reverse of exit: entrances announce (slower, from 8–16px offset), exits get out of the way (faster, shorter).
- Reveal text by masked lines; move elements by small offsets (8–24px) — 100px slides feel like a slideshow.
- Loading: skeletons that match final layout; choreograph the content arrival (stagger in) instead of popping.
- `prefers-reduced-motion`: replace movement with fast opacity; never remove the feedback itself.

## Common Mistakes

- Animating everything on scroll — after the third fade-up the effect inverts and reads as sluggishness. Reserve reveals for genuinely new content moments.
- 500ms UI feedback: interface responses over ~200ms feel like lag, not luxury. Cinematic timing is for storytelling, not buttons.
- Bounce on serious actions (payments, deletes) — physics personality must match emotional stakes.
- Motion added at the end as garnish. Choreography is designed with the layout, not sprinkled on it.
