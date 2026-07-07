---
name: fable-accessibility
description: Use when building or auditing any interface for accessibility — WCAG compliance, screen readers, keyboard navigation, color blindness, motion sensitivity — or as a pre-ship pass on any design work meant for real users or client delivery.
---

# Accessibility

## Overview

Accessibility is craft, not compliance paperwork: the same discipline that makes design good makes it usable by everyone. Fable's method: **build it in as you design (it's nearly free), audit before shipping (it's expensive after), and treat every requirement as a design constraint that usually improves the work.**

**REQUIRED BACKGROUND:** fable-design-dna.

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

- Suppressing focus outlines because "they're ugly" — design a beautiful one instead; that's the actual assignment.
- `aria-label` sprinkled as a fix-all while the underlying markup is div soup — semantics first, ARIA to fill gaps only.
- Testing only the happy visual path: accessibility failures live in states — errors, loading, empty, keyboard-open.
- Treating it as a final checklist item: retrofitting focus order and semantics costs 10× building them in.
