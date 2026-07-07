---
name: fable-mobile-ui
description: Use when designing mobile app interfaces (iOS/Android/React Native/Flutter) or mobile-first web apps — screens, flows, navigation, touch interactions — or when a mobile design feels cramped, desktop-shrunk, or fights the platform.
---

# Mobile UI

## Overview

Mobile design is choreography for one thumb and eight seconds of attention. Fable's method: **one job per screen, thumb-first ergonomics, platform-native physics, and typography that survives sunlight.**

**REQUIRED BACKGROUND:** fable-design-dna.

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

For every screen ship all five: loading, empty (with a next action, not a shrug), error (with recovery), partial (1 item), full (1,000 items). The empty state is the first impression of every feature — design it like a hero.

## Common Mistakes

- Shrinking a desktop layout instead of re-choreographing for one column and one thumb.
- Hamburger menu as IA surrender — primary destinations belong on the bottom bar.
- Hover-dependent affordances; mobile has no hover. State must be visible or discoverable by touch.
- Ignoring the keyboard, the notch, or Android back — platform amnesia reads as cheapness instantly.
