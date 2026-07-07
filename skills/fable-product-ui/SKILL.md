---
name: fable-product-ui
description: Use when designing product interfaces — dashboards, admin panels, SaaS apps, settings, tables, forms, data-heavy tools — or when a working UI feels cluttered, noisy, or exhausting to use daily.
---

# Product UI

## Overview

Product UI is design for the thousandth use, not the first impression. Fable's method: **calm surfaces, ruthless information hierarchy, and interfaces that get out of the way of work.** Expression lives in marketing; here, restraint IS the personality.

**REQUIRED BACKGROUND:** fable-design-dna. For the token layer, fable-design-systems.

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
