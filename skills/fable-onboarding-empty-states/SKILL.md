---
name: fable-onboarding-empty-states
description: Use when designing onboarding, first-run/signup flows, setup checklists, or empty states (lists, dashboards, no-results, error, cleared) — or when new users drop off before first value, or empty screens are a dead-end "No data" + sad illustration.
requires: [fable-design-dna]
pairs_with: [fable-product-ui, fable-ux-copywriting, fable-mobile-ui, fable-design-critique]
---

# Onboarding & Empty States

## Overview

Empty is the default state of every new account, and first-run is the product's first argument. Fable's method: **find the activation moment, build the shortest honest path to it, and design every empty state as the hero of its feature — because for a new user, that's exactly what it is.**

**REQUIRED BACKGROUND:** fable-design-dna. Copy is the main material here — fable-ux-copywriting applies to every string.

## Onboarding = Path to Activation

1. **Name the activation moment:** the first time the user gets real value (first invoice sent, first deploy, first insight seen). Everything in onboarding is judged by whether it shortens the path to it.
2. **Do, don't tour:** guide the user through performing their first real task with training wheels — not a 5-step modal tour describing the interface they can't touch. Tours are skipped; first tasks are remembered.
3. **Defer every question that doesn't personalize the path.** Ask team size later; ask nothing you can infer; never gate value behind a 12-field profile.
4. **Progressive disclosure:** advanced features stay invisible until their prerequisite behavior appears. An interface that shows everything on day one is optimized for the demo, not the user.
5. **Sample data is a bridge:** pre-populate with clearly-labeled example content the first real action replaces — an empty dashboard teaches nothing; a sample one teaches the whole product.

## The Setup Checklist Pattern

3–5 tasks max, ordered by value not by system logic, one pre-checked ("Account created ✓" — endowed progress is real), dismissible forever, and it celebrates completion once, briefly. A checklist that nags is churn with a progress bar.

## Empty States Are Heroes

Every list, table, feed, and dashboard gets a designed empty state with three parts:

1. **What this will be** — one line painting the filled state ("Your invoices will live here").
2. **Why it matters** — optional, one clause, benefit not feature.
3. **ONE next action** — a real button doing the real thing ("Send your first invoice"), not "Learn more."

And the four empties are different designs: **first-run** (aspirational + CTA), **cleared** ("Inbox zero 🎉" — celebrate, don't console), **no-results** ("Nothing matches — clear filters?"), **error** ("Couldn't load — retry"). Shipping one shrug for all four is the most common empty-state bug.

## Tone

Encouraging, specific, never blaming, and matched to stakes (per fable-ux-copywriting): playful in a first-run empty state, plain in an error one. No confetti before the user has done anything — unearned celebration reads as marketing, not warmth.

## Common Mistakes

- The modal tour nobody reads, followed by an interface with no guidance at all.
- "No data" + sad illustration — a dead end where a next action belongs.
- Demanding setup (integrations, imports, team invites) before showing any value.
- The same empty component for first-run and error states.
- Measuring onboarding by completion of onboarding — measure activation; the flow is scaffolding, not the building.

## Worked Example

**BEFORE:** centered gray box, sad-cloud illustration, "No data yet." Dead end.

**AFTER:**
- heading: "Your invoices will live here"
- subtext: "Sent invoices and their status show up in this list."
- primary button: "Send your first invoice"
- muted secondary: "Import from Stripe"

Same component — but now it teaches the feature and offers the real first action instead of a shrug.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:
- [ ] I can name the activation moment in one sentence, and every onboarding step shortens the path to it.
- [ ] first-run, cleared, no-results, and error are four distinct empty designs — not one "No data" shrug.
- [ ] Each first-run empty state has exactly ONE real-action CTA (the real thing, not "Learn more").
- [ ] No question is asked that doesn't personalize the path, and no celebration fires before the user has done anything.
