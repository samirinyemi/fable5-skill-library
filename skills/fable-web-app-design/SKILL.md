---
name: fable-web-app-design
description: Use when designing or elevating the interface of a web APPLICATION (dashboard, tool/editor, developer console, CRM/records, chat, admin) — naming its archetype and spending a small expression budget to move it from generic-template to fast, crafted, owned. For marketing sites use fable-web-design; for calm/density fundamentals use fable-product-ui.
requires: [fable-design-dna]
pairs_with: [fable-product-ui, fable-design-systems, fable-onboarding-empty-states, fable-design-critique, fable-design-research]
---

# Web App Design

## Overview

Most web apps ship the same shell: a grey sidebar, Bootstrap-blue buttons, a table, and a modal. It works, and it is forgettable. This skill is about the gap between *functional* and *elevated* — how the best products (Linear, Vercel, Raycast, Stripe, Arc, Height, Family) make an application feel fast, modern, and **owned** without sacrificing the thousandth-session usability that product design demands.

**REQUIRED BACKGROUND:** fable-design-dna. This is the elevation layer; pair it with **fable-product-ui** (the calm/clarity/density fundamentals it builds on), fable-design-systems (tokens), and fable-micro-interactions (the feedback that sells "fast").

This skill owns **archetype selection and elevation direction only**. The interior fundamentals — calm, density zones, the five states, tabular numerals, motion timing — are owned by **fable-product-ui** and only summarized here as a pointer; do not re-teach them, defer the interior craft to it.

**The core idea:** you do not "style" a web app. You **name its archetype**, honour that archetype's center of gravity, then spend a tiny, deliberate expression budget on the two or three moments that make it yours.

## Reference Sweep (before designing, when web access exists)

Don't design from defaults — sweep first. Run fable-design-research's multi-source sweep (≥2 sources, at most one move per reference) with this domain's vectors: "web app ui", "developer console design", "crm interface" — Mobbin + Godly + the best-in-archetype live products. Fold the findings into the system you commit BEFORE any pixel: the values this skill owns must trace to the swept board or to a deliberate rejection of it — a random pick next to a researched board is the tell of generic work. No web access? Say so and design from this skill's rules — never cite a reference you didn't fetch.

## Phase 1 — Name the Archetype

Style before typology is how generic happens. Each archetype has a different hero and a different rule for where expression is allowed:

| Archetype | The hero (loudest thing) | Elevation lives in |
|---|---|---|
| **Dashboard / analytics** | The data and its one takeaway | Chart craft, number typography, a calm shell |
| **Tool / editor / canvas** (docs, design, issues) | The artifact being made | Invisible chrome, spatial stability, buttery selection/drag |
| **Console / developer** (deploys, infra, logs) | Status truth, density, speed | Mono accents, monochrome + one signal color, keyboard-first |
| **Workflow / CRM / records** | The record and its next action | Scannable rows, inline edit, pipeline motion |
| **Communication** (chat, inbox) | Message velocity and presence | Threading rhythm, optimistic sends, unread logic |
| **Commerce / marketplace admin** | The catalog and the money | Table density, bulk actions, trustworthy state |
| **Settings / config** | Findability and safety | Clear sections, honest destructive states, no surprises |

Write one line: *"This is a console-type app; the hero is deploy status; expression budget goes to the command bar and the live-log motion."* Every later decision is tested against it.

## Phase 2 — What Actually Separates Elevated from Generic

Not gradients. These moves:

- **Speed you can feel.** Optimistic UI, instant view transitions, prefetch on hover, sub-100ms interaction feedback. The single biggest driver of "premium" in an app is perceived speed — Linear's whole reputation is latency.
- **Keyboard-first.** A real command palette (⌘K), shortcuts for every frequent action, focus states designed not defaulted. Power surfaces reward the tenth visit.
- **Quiet chrome, loud content.** The shell (nav, toolbars, headers) recedes to near-monochrome; the content and one accent carry all the color. Generic apps paint the chrome; elevated apps paint the work.
- **One signature accent, spent like money.** A single loaded color on primary actions and selected/active state only — ≤5 hits per view. Rainbow status pills are the generic tell.
- **Typographic craft.** A real type scale, tabular-lining numerals in every table and metric, `-webkit-font-smoothing`, a distinctive-but-legible face, mono for IDs/code/timestamps. Numbers that don't align are the amateur giveaway.
- **All five states, designed.** Empty, loading (skeletons that match the real layout, not spinners), partial, error (with the fix), full. Generic apps design only the full state and bolt the rest on.
- **Motion as feedback, never decoration.** Layout shifts animate so the eye keeps its place; panels slide from their origin; nothing bounces for fun on a work surface. 150–250ms, ease-out, transform/opacity only.
- **Spatial consistency.** Persistent layout, stable scroll positions, panels that open from where you clicked. The app should feel like a *place*, not a slideshow of screens.

## Phase 3 — The Modern Shell

- **Navigation model fits the archetype:** left sidebar for record/workflow depth; top bar for shallow tool apps; command-first for power/console apps. Don't default to a sidebar because every template has one.
- **Content still gets a max-width.** Even in apps — a 1600px-wide form is not "using the space", it is unreadable. Give reading/editing zones a measure; let data tables use the width.
- **One radius language, one elevation logic.** Pick a corner personality (sharp/console vs soft/consumer) and one way to show elevation (a hairline, a subtle shadow, or a background step — not all three).
- **Dark mode as a designed second palette**, not an inversion: dark chromatic surfaces, elevation by lighter surface, accents desaturated 10–20%. Many app users live in dark mode — it is not optional polish.
- **Density zones.** 13–14px in data-dense tables, 15–16px in reading/forms. Different jobs, different densities, on one scale.

## Phase 4 — Steal the Move, Not the Skin

Study exemplars for the *mechanic*, then apply it to your archetype (this is fable-style-extraction discipline for apps):

- **Linear** → keyboard-first speed + monochrome restraint + one purple accent. Steal the latency and the shortcut coverage, not the purple.
- **Vercel** → mono type, black-on-white, geometric calm, one accent on action. Steal the confident monochrome.
- **Raycast / ⌘K palettes** → the command bar as the primary navigation. Steal command-first IA for power tools.
- **Stripe dashboard** → trustworthy data density, quiet chrome, immaculate number formatting. Steal the number craft.
- **Arc / Family** → consumer warmth and playful motion *where the archetype permits it*. Steal the restraint about *where* delight is allowed.

The generic trap is copying a look (someone's palette) instead of a mechanic (their speed, their keyboard model, their number craft).

## Quick Reference

| Decision | Elevated default |
|---|---|
| Accent colors | 1, on actions + selection only |
| Table/metric numerals | Tabular-lining, always |
| Loading | Layout-matched skeletons, not spinners |
| Primary nav (power app) | Command palette + shortcuts |
| Motion | 150–250ms feedback, transform/opacity |
| Chrome color | Near-monochrome; content carries color |
| Empty state | Designed as the feature's first impression |
| Dark mode | Separate designed palette |

## Common Mistakes

- **Styling before naming the archetype** — a dashboard dressed like a marketing site, or an editor with loud chrome fighting the artifact.
- **Mistaking decoration for elevation** — gradients, glassmorphism, and shadows are not speed. The elevation users feel is latency and keyboard flow.
- **Rainbow status** — eight semantic colors and multi-hue charts. One accent, greys for the rest, hue never the only signal.
- **Only the full state exists** — no empty, no skeleton, no error-with-a-fix. The unhappy paths are most of real usage.
- **Copying Linear's paint, not its engine** — the purple without the sub-100ms feel is just another template.
- **Marketing boldness on work surfaces (and vice versa)** — save expression for identity moments (auth, onboarding, empty states, the command bar); keep the work calm. Misplaced boldness is as generic as having none.

## When NOT to push

Utility-dense cores — a data grid mid-task, a settings form, a log stream — earn clarity and speed over expression. The elevation there *is* the speed and the craft, not visual flourish. Spend the expression budget on the identity moments and let the work be quiet.

## Worked Example

The core move: name the archetype first, then let the hero dictate every choice.

| Generic CRM | Elevated (named: *records app; hero = the record and its next action*) |
|---|---|
| Grey sidebar, blue Bootstrap buttons | Near-monochrome chrome, one accent on the primary action only |
| Rainbow status pills (8 colors) | Status by shape + one hue; grey for the rest |
| Amount column mis-aligned | Tabular-lining numerals, right-aligned |
| Spinner while loading | Skeleton rows matching the table layout |
| Row opens a modal to edit | Scannable rows with inline edit in place |

Why: naming the hero (the record, its next action) turned six unrelated "styling" decisions into one coherent direction — the interior craft (states, density, numerals) is then executed via fable-product-ui.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:
- [ ] Archetype named in one line, and every screen honors its hero and expression budget.
- [ ] One accent, spent like money — ≤5 hits per view, on actions + selection only; chrome reads near-monochrome.
- [ ] Elevation is speed and craft (optimistic UI, keyboard-first, tabular numerals, layout-matched skeletons), not decoration (gradients/glass/shadows).
- [ ] Exemplars studied for the mechanic, not the paint — no copied palette standing in for a copied engine.
