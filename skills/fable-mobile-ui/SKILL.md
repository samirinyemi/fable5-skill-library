---
name: fable-mobile-ui
description: Use when designing native or mobile-first app screens, flows, navigation, and touch interactions (iOS/Android/React Native/Flutter) — thumb ergonomics, one-job screens, platform physics — or when a mobile UI feels cramped, desktop-shrunk, or fights the platform. For responsive scaling of a marketing/web layout use fable-web-design.
requires: [fable-design-dna]
pairs_with: [fable-product-ui, fable-onboarding-empty-states, fable-accessibility, fable-design-critique, fable-design-research]
---

# Mobile UI

## Overview

Mobile design is choreography for one thumb and eight seconds of attention. Fable's method: **one job per screen, thumb-first ergonomics, platform-native physics, and typography that survives sunlight.**

**REQUIRED BACKGROUND:** fable-design-dna.

## Reference Sweep (before designing, when web access exists)

Don't design from defaults — sweep first. Run fable-design-research's multi-source sweep (≥2 sources, at most one move per reference) with this domain's vectors: "ios app design", "mobile navigation patterns" — Mobbin screens are the primary source here. Fold the findings into the system you commit BEFORE any pixel: the values this skill owns must trace to the swept board or to a deliberate rejection of it — a random pick next to a researched board is the tell of generic work. No web access? Say so and design from this skill's rules — never cite a reference you didn't fetch.

## One Job Per Screen

Name each screen's single job in a verb phrase ("choose a plan", "confirm the send"). Anything not serving that job moves to another screen or a progressive disclosure. Mobile fails by addition.

## Thumb Ergonomics

- Primary actions live in the bottom third; destructive/rare actions live at the top (deliberately harder to reach).
- Touch targets ≥44×44pt with ≥8pt gaps. Full-width list rows are tappable — not just their text.
- Bottom nav: 3–5 destinations max, labeled. If you need more, the IA is wrong, not the nav.
- Reachability beats density: a second screen is cheaper than a cramped one.

## Type & Space on Small Screens

- Body 16–17pt minimum; never below 13pt for anything users must read.
- Screen titles 28–34pt bold — mobile hierarchy needs bigger jumps than desktop because there's no peripheral context.
- Horizontal margins 20–24pt, consistent everywhere. Vertical rhythm on a 4pt grid.
- One column. Side-by-side content on a phone is almost always two half-designs.

## Platform Physics

- Respect the platform's motion grammar: iOS springs and edge-swipe back; Android's shared-axis transitions and system back.
- Sheets/modals for interruptions, push navigation for progress. Never stack two modals.
- Skeletons over spinners for content loads; optimistic UI for user actions (apply, then reconcile).
- Design the keyboard-open state for every input screen — it's half the screen gone.

## Quick Reference

| Element | Spec |
|---|---|
| Touch target | ≥44pt, ≥8pt spacing |
| Body text | 16–17pt |
| Screen margin | 20–24pt |
| Bottom nav items | 3–5 |
| Transition | 250–350ms platform curve |
| Safe areas | Respect notch + home indicator always |

## States Are the Design

Ship all five states for every screen: loading, empty, error (with recovery), partial (1 item), full (1,000 items). For the empty and first-run states specifically, hand off to fable-onboarding-empty-states — do not reinvent them here.

## Common Mistakes

| Never | Instead |
|---|---|
| Shrink a desktop layout to fit | Re-choreograph: one column, one thumb, one job |
| Hamburger menu as primary IA | 3–5 labeled destinations on the bottom bar |
| Hover-only affordance (mobile has no hover) | State visible or discoverable by touch |
| Ignore keyboard, notch, or Android back | Design keyboard-open + safe-area + system-back state per screen |

## Worked Example

Desktop settings page → mobile. The cardinal sin is shrinking; re-choreograph instead.

```
BEFORE (shrunk desktop)          AFTER (re-choreographed)
├ left nav rail + right form     ├ job: "edit one setting group"
├ hamburger for the rail         ├ single column; groups = full-width
├ two columns, 12pt labels       │   tappable rows → detail screens
└ Save button top-right corner   ├ 16pt labels, one thumb reach
                                 └ Save = bottom-third full-width;
                                    top-right reserved for rare Reset
```

Why: the mobile version names one job and puts the primary action under the thumb, instead of cramming a two-column IA onto a phone.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:
- [ ] Each screen names one job; nothing off-job survives on it.
- [ ] Primary action in the bottom third; touch targets ≥44pt with ≥8pt gaps; no hover-only affordances.
- [ ] All five states drawn (loading, empty, error, partial, full), plus keyboard-open and safe-area/notch states.
- [ ] Layout was re-choreographed to one column, not a shrunk desktop; platform-native transitions and back behavior.
