---
name: fable-design-systems
description: Use when building the reusable token + component layer — design tokens, semantic theming, component-library API and states, drift audits — that other screens consume; NOT for one-off screen visuals (fable-product-ui) or the Figma-file mechanics of variables/instances (fable-figma-craft).
requires: [fable-design-dna]
pairs_with: [fable-figma-craft, fable-typography, fable-color-craft, fable-product-ui, fable-design-critique]
---

# Design Systems

## Overview

A design system is taste made enforceable. Fable's method: **tokens encode the decisions, components encode the behaviors, and the system stays smaller than the product it serves.** A system that tries to cover everything covers nothing well.

**REQUIRED BACKGROUND:** fable-design-dna. The token values themselves come from fable-typography, fable-color-craft, fable-motion-design.

## Token Architecture (two layers, no more)

1. **Primitives** — raw values, named by fact: `blue-600`, `space-4`, `radius-md`, `font-display`. No opinions here.
2. **Semantic** — decisions, named by role: `color-action`, `color-surface-raised`, `text-danger`, `space-section`. Components consume ONLY this layer.

The semantic layer is where the brand lives; retheme = remap semantics, touch nothing else. Three+ alias layers is architecture cosplay — two is enough.

### Token Set Quick Reference

| Category | Typical count | Naming pattern |
|---|---|---|
| Color semantic | 15–25 | `color-{role}-{variant}-{state}` |
| Spacing | 8–10 steps (4px base) | `space-{1..12}` |
| Type styles | 8–12 composites | `text-{role}-{size}` |
| Radius | 3–4 | `radius-{sm,md,lg,full}` |
| Elevation | 3–4 | `shadow-{low,mid,high}` |
| Motion | 3 durations + 2 easings | `motion-{fast,base,slow}` |

## Component Rules

- A component enters the system after its **third** real use — before that it's a pattern, not a promise.
- API = props for variants (`intent`, `size`), never for style overrides (`color=`, `padding=` props are drift with a doorbell).
- Every interactive component ships all states: default, hover, active, focus-visible, disabled, loading, error. A button without a focus state is unfinished, not minimal.
- Document with real content and the "wrong usage" gallery — people copy examples, not rules.

## Keeping the System Alive

- **Drift audit ritual:** grep for raw hex/px in product code; every hit is either a missing token or a violation. Zero raw values is the win condition.
- The system has a front door: one place to request/propose additions, with the "used 3× already?" test at the gate.
- Version and changelog like software — silent token changes break trust faster than breaking changes.

## Common Mistakes

- Building the system before the product has taste — systemizing mediocrity scales mediocrity. Get 3 screens beautiful first, then extract.
- 40 grays and 12 blues in primitives "just in case" — unused tokens are decisions nobody made.
- Components that forbid nothing: if every property is overridable, the system is a suggestion.
- Treating the system as a museum: it exists to make the NEXT screen faster and consistent, not to be admired.

## Worked Example

The drift-to-system transform — five hand-tuned buttons collapse into two token layers + one component:

```
BEFORE (drift)          AFTER (system)
#2563eb, #2f6bff,   →   primitive:  blue-600: #2563eb
#1d4ed8 ...             semantic:   color-action: blue-600
padding:11px 18px,  →   primitive:  space-3, space-4
padding:12px 20px      component:  <Button intent="primary" size="md">
```

Retheme the entire product from one line — `color-action: blue-600 → violet-600` — because every button consumes the semantic token, never the hex. That single edit is the whole payoff of the two-layer model.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:
- [ ] Components consume ONLY semantic tokens — grep primitives (raw hex/px) in component files returns 0 hits.
- [ ] Retheme works by remapping semantics alone; no component file is touched.
- [ ] Every interactive component ships all 7 states: default, hover, active, focus-visible, disabled, loading, error.
- [ ] No token exists without 3+ real uses, and the change has a changelog entry.
