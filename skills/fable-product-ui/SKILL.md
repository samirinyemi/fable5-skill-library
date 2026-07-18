---
name: fable-product-ui
description: Use when refining the interior craft of a data-heavy product — tables, forms, settings, admin panels, dashboards — for calm, scannable, low-fatigue daily use; when a working UI feels cluttered or noisy. For picking an app's overall archetype/elevation, use fable-web-app-design first.
requires: [fable-design-dna]
pairs_with: [fable-web-app-design, fable-design-systems, fable-onboarding-empty-states, fable-accessibility, fable-design-critique, fable-design-research]
---

# Product UI

## Overview

Product UI is design for the thousandth use, not the first impression. Fable's method: **calm surfaces, ruthless information hierarchy, and interfaces that get out of the way of work.** Expression lives in marketing; here, restraint IS the personality.

## Reference Sweep (before designing, when web access exists)

Don't design from defaults — sweep first. Run fable-design-research's multi-source sweep (≥2 sources, at most one move per reference) with this domain's vectors: "dashboard ui", "data table design", "settings page" — Mobbin screens first, then live products. Fold the findings into the system you commit BEFORE any pixel: the values this skill owns must trace to the swept board or to a deliberate rejection of it — a random pick next to a researched board is the tell of generic work. No web access? Say so and design from this skill's rules — never cite a reference you didn't fetch.

## Chain

- requires: fable-design-dna (foundation), fable-design-systems (token layer)
- pairs_with: fable-micro-interactions (the Micro-Feedback Contract belongs there in depth), fable-onboarding-empty-states (the empty/error of the five states)
- verify_with: fable-design-critique (MANDATORY final pass before declaring done)

**Boundary vs fable-web-app-design:** web-app-design picks the app ARCHETYPE and elevation direction (which kind of app, how expressive); product-ui owns the INTERIOR density/calm craft — the five states, tables, forms, working screens. Do not re-teach archetype selection here.

## Calm by Default

- Chrome (nav, headers, toolbars) recedes: muted, compact, consistent. Content is the loudest thing on screen.
- Color budget stricter than marketing: neutrals everywhere, accent ONLY on primary actions and selected states, functional colors only for status.
- Borders are the last resort for separation — try spacing first, then background shift, then a border at 6–10% opacity.
- Density is a feature for pros: 13–14px in data tables is correct; 16px+ for reading surfaces. Different zones, different densities.

## Hierarchy of a Working Screen

1. **What needs my attention?** (alerts, anomalies — the ONLY place loud color belongs)
2. **What's the state of things?** (key numbers/statuses, scannable in 3 seconds)
3. **What can I do?** (one visually primary action per view; the rest are quiet)
4. **Everything else** (navigation, meta, settings — findable, never shouting)

If a screen can't be read in that order, re-weight it.

## Tables & Forms (the real product)

- Tables: left-align text, right-align numbers (tabular figures), 12–16px row padding, sticky header, row hover, actions revealed on hover/focus. Kill zebra stripes unless rows exceed ~8 columns.
- Forms: one column, labels above fields, group by meaning with real section headings, inline validation on blur (not on keystroke), primary button states what it does ("Create project", never "Submit").
- Every list/table designed in all five states: loading (skeleton), empty (with CTA), one item, many, error.

## Micro-Feedback Contract

Every action gets an acknowledgment within 100ms (press state), a result within 1s or a progress indicator, and an undo instead of a confirmation dialog wherever destructive-ish. Toasts confirm, they never ask.

## Quick Reference

| Element | Spec |
|---|---|
| Table text | 13–14px, tabular numerals |
| Form width | 400–560px single column |
| Primary action | One per view, accent color |
| Section spacing | 24–32px; 8–12px within groups |
| Status colors | Only on status, with icon/label |

## Common Mistakes

- Marketing energy in work surfaces: gradients and hero moments in a dashboard read as noise by day three.
- Ten equal buttons: when everything is a primary action, users do arithmetic on every click.
- Cards around everything — card-in-card-in-card is the boxed water of layout. Whitespace groups better.
- Designing only the "full and healthy" state; real products live in empty, partial, and error.

## Worked Example

A dashboard metrics row:

- **BEFORE:** 6 stat cards, each a bordered box with a colored gradient header, every number in accent blue, a "View" button on each. Six equal shouts — nothing lands.
- **AFTER:** borderless tiles separated by 32px whitespace; numbers in neutral-900 tabular figures, labels in neutral-500; one number turns red ONLY when it breaches threshold; a single row-level "View report" link, not six buttons.

Why: it reads in 3 seconds and the one red number is the only thing that grabs you — calm surface, ruthless hierarchy.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:

- [ ] Squint test: content is the loudest thing, chrome the quietest; exactly one visually-primary action per view.
- [ ] Accent color appears ONLY on primary action, selected state, and status — never as decoration.
- [ ] Every table/list is drawn in all five states: loading, empty (with CTA), one, many, error.
- [ ] Separation earned by spacing/background before any border; no card-in-card nesting.
- [ ] Ran fable-design-critique — do not declare done until it passes.
