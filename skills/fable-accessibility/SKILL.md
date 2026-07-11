---
name: fable-accessibility
description: Use when making an interface usable by everyone — contrast, focus states, keyboard navigation, screen-reader semantics, accessible forms, and WCAG 2.2 — or as the accessibility ship-gate before delivering any design work.
requires: [fable-design-dna]
pairs_with: [fable-color-craft, fable-motion-design, fable-product-ui, fable-design-critique]
---

# Accessibility

## Overview

Accessibility is craft, not compliance paperwork: the same discipline that makes design good makes it usable by everyone. Fable's method: **build it in as you design (it's nearly free), audit before shipping (it's expensive after), and treat every requirement as a design constraint that usually improves the work.**

**REQUIRED BACKGROUND:** fable-design-dna.

**This skill is the single source of truth for contrast ratios and `prefers-reduced-motion` contracts** — fable-color-craft and the motion skills reference the numbers defined here rather than restating them. Hand off explicitly: for reduced-motion *fallback craft* see fable-motion-design; for *verifying* the 4.5:1 / 3:1 ratios and both-theme contrast see fable-color-craft; for form/modal/dropdown component mechanics see fable-product-ui; run fable-design-critique as the final pre-ship pass.

## The Non-Negotiables (design-time)

| Requirement | Target |
|---|---|
| Body text contrast | 4.5:1 minimum (AA); verify in BOTH themes |
| Large text / UI parts | 3:1 minimum |
| Focus state | Visible on EVERY interactive element — designed, not browser-default-suppressed. `:focus-visible` with 2px+ outline offset from the element |
| Touch targets | ≥44×44px with ≥8px gaps |
| Meaning | Never in color alone — pair hue with icon, weight, or label |
| Text zoom | Layout survives 200% zoom and user font-size overrides — use rem, not px, for type |
| Motion | `prefers-reduced-motion` honored: movement → fast opacity; feedback itself never removed |

## Structure Is the Screen-Reader UI

- One `<h1>`, headings in order without skips — the heading outline IS the blind user's page layout.
- Landmarks: `<header> <nav> <main> <footer>`; `<button>` for actions, `<a>` for navigation — never a div with a click handler.
- Images: alt text is editorial writing — what the image *means* here, not what it contains ("Revenue doubled after the redesign", not "chart"). Decorative images get `alt=""` explicitly.
- Forms: every input has a real `<label>`; errors are announced (`aria-live`), named next to the field, and never communicated by red alone.
- Custom components (dropdowns, modals, tabs) follow the WAI-ARIA pattern for that widget: correct roles, keyboard model, and focus trap/return. If the ARIA pattern feels heavy, use the native element instead — it's free.

## The Keyboard Test (five minutes, catches most failures)

Unplug the mouse. Tab through the page: Can you reach everything interactive, in a sensible order? See where you are at all times? Operate menus/modals with Enter, Space, arrows, and Escape? Get past repeated nav (skip link)? Any "no" is a P1 bug, not a polish item.

## Vestibular & Cognitive Safety

- No parallax/scale/spin on large surfaces without reduced-motion fallback; nothing flashes more than 3×/second.
- Autoplaying carousels and videos get pause controls — or better, don't autoplay.
- Timeouts warn and extend; instructions don't rely on shape or position alone ("click the round button on the right").

## Common Mistakes

| Never | Do instead |
|---|---|
| Suppress the focus outline because it's "ugly" | Design a 2px+ `:focus-visible` outline — that IS the assignment |
| `aria-label` over div soup as a fix-all | Native semantics first; ARIA only to fill genuine gaps |
| Test only the happy visual path | Test error / loading / empty / keyboard-open states |
| Retrofit focus order and semantics at the end | Build them in as you design — retrofitting costs 10× |

## Worked Example

The single most important move: real semantics + named, non-color-only feedback.

```html
<!-- BEFORE -->
<div class="btn" onclick="del()">Delete</div>
<span style="color:red">Invalid</span>          <!-- outline:none somewhere in CSS -->

<!-- AFTER -->
<button type="button" onclick="del()">Delete</button>   <!-- :focus-visible outline in CSS -->
<label for="email">Email</label>
<input id="email" aria-describedby="email-err">
<p id="email-err" aria-live="polite">⚠ Email is missing an @ — try name@site.com</p>
```

Why: the `<button>` is keyboard-operable and focus-visible for free; the `<label>` names the field for screen readers; the error is announced (`aria-live`), tied to its input, and carries an icon + text so it survives color blindness. The BEFORE fails all three silently.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:
- [ ] Contrast verified in BOTH themes (4.5:1 body, 3:1 large/UI); meaning never carried by color alone
- [ ] Visible `:focus-visible` outline on every interactive element; Keyboard Test passed (reach, order, escape, skip link)
- [ ] Real semantics — one `<h1>`, ordered headings, `<button>`/`<a>` not div soup; every input labeled with announced errors
- [ ] States tested (error / loading / empty / keyboard-open) and `prefers-reduced-motion` honored
