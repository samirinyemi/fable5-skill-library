---
name: fable-micro-interactions
description: Use when designing or building component-level feedback — button presses, toggles, checkboxes, form focus, success ticks, toasts, hover states, loading feedback — or when an interface works but feels dead, mushy, or unresponsive to touch.
---

# Micro-Interactions

## Overview

Micro-interactions are the sub-300ms layer where an interface stops being a picture and starts being a material. The rule: **every control acknowledges the user within 100ms, every state change animates from its current state, and nothing ever blocks input while performing.**

**REQUIRED BACKGROUND:** fable-motion-design supplies the physics personality — micro-interactions express it at component scale. Page-level choreography belongs to fable-animation-engineering.

## The State Inventory

Every interactive component ships felt feedback for: hover, press/active, focus-visible, selected, disabled, loading, success, error. A component missing press feedback feels broken on touch even when it works.

## Pattern Book

| Interaction | Recipe |
|---|---|
| Button press | scale(0.97) 100ms ease-out on active; release springs back |
| Toggle | thumb slides 180–220ms with slight overshoot; track color crossfades in sync |
| Checkbox | draw the checkmark (stroke-dashoffset) 150ms; box color 100ms first |
| Input focus | border color + 2px ring 150ms; floating label rises 150ms ease-out |
| Submit sequence | label → spinner (after 300ms delay) → checkmark 400ms → reset; button width morphs smoothly |
| Copy to clipboard | icon swaps to check 150ms, reverts after 1.5s — feedback at the click point, not a distant toast |
| Like/save | scale 1 → 1.25 → 1 with overshoot; particle burst only if the brand is playful |
| Toast | enter translateY(8px)+fade 250ms; exit 180ms; never stack more than 3 |
| Skeleton | shimmer 1.2–1.6s linear loop; matches final layout exactly |
| Drag | lift with shadow + scale(1.02) on grab; drop settles with a soft spring |

## Craft Rules

- **100ms acknowledgment:** press states are instant (≤100ms); anything slower and the user taps twice.
- **Interruptible always:** CSS transitions interrupt natively — keep them the default. JS sequences must handle re-trigger mid-flight (kill or reverse the tween, never queue).
- **Animate from current state,** not from a reset: a half-open toggle re-tapped reverses smoothly.
- **Loading feedback is staged:** nothing before 300ms (instant actions shouldn't flicker a spinner), spinner/skeleton after, explanation text after ~3s.
- **Personality budget:** overshoot and bounce for playful brands; crisp ease-out for serious ones — same physics as the product's motion personality, never mixed per-component.
- **Hover is an enhancement, never information:** every hover-revealed affordance has a visible or touch-native equivalent.

## Common Mistakes

- Delight on destructive actions — a bouncy delete confirmation reads as mockery.
- 400ms+ toggles and checkboxes: controls are reflexes, not scenes.
- Spinner for content loads where a skeleton preserves layout.
- Animating on every keystroke (validate on blur; animate on state change, not input).
- Toast confirmations for actions whose result is already visible on screen.
- Feedback far from the finger/cursor: acknowledge where the interaction happened.
