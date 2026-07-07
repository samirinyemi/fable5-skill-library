---
name: fable-animation-engineering
description: Use when implementing animation in code — GSAP, ScrollTrigger, scroll-driven narratives, pinned sections, timelines, page transitions, text reveals — or when animations exist but feel janky, laggy, or amateur. The execution half of fable-motion-design.
---

# Animation Engineering

## Overview

fable-motion-design decides what moves and when; this skill builds it without jank. The craft: **choreograph in timelines, render on the compositor, and let content live without JavaScript.** An animation that drops frames is worse than no animation — it converts "premium" into "broken."

**REQUIRED BACKGROUND:** fable-motion-design for timing/personality. For component-level feedback use fable-micro-interactions; for the one showpiece effect, fable-signature-effects.

## Pick the Right Engine

| Need | Tool |
|---|---|
| State transitions (hover, open/close) | CSS transitions — free, interruptible |
| One-shot entrances | CSS animation or Web Animations API |
| Sequenced scenes, scroll narratives | GSAP + ScrollTrigger (or Motion for React) |
| Touch-driven, physical | Springs (Motion/react-spring); springs take velocity, not duration |
| Vector/character animation | Lottie/Rive — never hand-recreate |

Don't import GSAP for a hover; don't build a scroll narrative from raw scroll listeners.

## Scroll Choreography Patterns

- **Reveal on enter:** IntersectionObserver (threshold ~0.15) adds a class; CSS does the rest. Reveal once, don't re-hide on scroll-up.
- **Masked text reveal:** split to lines, wrap in `overflow:hidden`, translateY(110%) → 0, stagger 60–100ms. Split by LINES not letters for body-size text.
- **Pinned scene:** ScrollTrigger `pin: true, scrub: 0.5–1` — scrub smoothing makes it feel weighted. One pinned scene per page is a statement; three is a theme park.
- **Parallax:** ≤10% offset, background layers only.
- **Counters/progress:** scrub-linked, tabular numerals so digits don't dance.
- Build each scene as ONE labeled timeline — beats are readable and retunable. `setTimeout` chains are not choreography.

## The Performance Contract

- Animate ONLY `transform` and `opacity`. Width/height/top/margin trigger layout — if a layout property must move, animate a transform standing in for it (or FLIP it).
- `will-change` applied just before animating, removed after — permanent will-change on 50 elements is a memory leak wearing a performance costume.
- Test on a real mid-range phone with 6× CPU throttle; 60fps or the effect gets cut. The DevTools Performance panel is the diff loop of animation.
- Scroll work runs off `IntersectionObserver`/ScrollTrigger — never raw `scroll` handlers doing layout reads.

## Progressive Enhancement (non-negotiable)

Content is visible and readable with JavaScript disabled or failed. Set initial hidden states from JS (or a `js`-class gate), never in base CSS — otherwise a CDN hiccup ships a blank page. `prefers-reduced-motion`: swap movement for fast opacity via `gsap.matchMedia()`/media queries; the content and feedback remain.

## Common Mistakes

- Scroll-jacking: overriding native scroll speed/direction. Scrub with smoothing instead — users own their scroll.
- Animating on every scroll pixel what should fire once on entry.
- Desktop-tuned triggers broken by mobile viewport height — test trigger points at 375px.
- 20 IntersectionObservers when one with multiple targets works.
- Shipping the demo easing: linear scrub with no smoothing reads mechanical; add `scrub: 0.5+` or a lerp.
