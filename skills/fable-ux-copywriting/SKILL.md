---
name: fable-ux-copywriting
description: Use when writing or fixing the actual words in a UI — headlines, button labels, error messages, form helper text, microcopy — or when a layout is strong but the copy reads vague, hypey, or robotic. (Flow/layout for onboarding and empty states: pair with fable-onboarding-empty-states.)
requires: [fable-design-dna, fable-brand-identity]
pairs_with: [fable-onboarding-empty-states, fable-design-critique, fable-design-research]
---

# UX Copywriting

## Overview

Copy is design material, not filler poured into design. A generic headline drags down a great layout faster than a bad font. Fable's method: **write from the reader's side of the screen, be specific to the point of discomfort, and make every interactive word state its consequence.**

**REQUIRED BACKGROUND:** fable-design-dna — the voice comes from the same one-sentence direction as the visuals.

## Reference Sweep (before designing, when web access exists)

Don't design from defaults — sweep first. Run fable-design-research's multi-source sweep (≥2 sources, at most one move per reference) with this domain's vectors: "onboarding copy", "empty state microcopy" — Mobbin screens + real product sites; steal voice patterns, never sentences. Fold the findings into the system you commit BEFORE any pixel: the values this skill owns must trace to the swept board or to a deliberate rejection of it — a random pick next to a researched board is the tell of generic work. No web access? Say so and design from this skill's rules — never cite a reference you didn't fetch.

## Headlines

- Specificity beats aspiration: "Deploy in 4 minutes" beats "Ship faster" beats "Unlock your potential."
- Write 5 options minimum; the first is always the most generic. Vary the mechanism: a claim, a question, a number, an enemy ("No more timesheets"), a customer's sentence.
- **Banned openers:** Unlock, Empower, Elevate, Supercharge, Seamless, Revolutionize, "Welcome to". These are the purple gradient of language.
- The subhead does the explaining so the headline can do the arresting.

## Interface Copy

| Element | Rule | Example |
|---|---|---|
| Buttons | Verb + object, states what happens | "Create project", never "Submit" / "OK" |
| Confirmations | Echo the outcome | Toast: "Project created" |
| Errors | What went wrong + how to fix, no apology theater | "That email is already registered — sign in instead?" |
| Empty states | The next action, not a shrug (hand full-flow copy to fable-onboarding-empty-states) | "No invoices yet. Send your first one →" |
| Forms | Labels name the answer ("Work email"), helper text prevents the error before it happens | |
| Destructive | Name the stakes plainly | "Delete 34 files? This can't be undone." |
| Loading | Say what's happening if >2s | "Importing 1,204 contacts…" |

## Voice Discipline

- Consume the voice — its 3 adjectives and banned words — from fable-brand-identity; don't re-derive it here. Then audit every string against it.
- One register per surface: marketing may charm; settings may not. Playfulness in an error message reads as mockery.
- People do things; systems don't "handle" them. "You're in" beats "Authentication successful." Name things by what users call them, not what the backend calls them ("notifications", not "webhook events").
- Cut the throat-clearing: "Please note that", "In order to", "Simply". Every sentence starts as close to the verb as it can.

## Microcopy Is Trust

The 12px strings carry the relationship: a specific error message says someone cared; "Something went wrong" says nobody did. Budget real design time for the strings nobody screenshots — password rules, permission asks, unsubscribe flows, 404s.

## Common Mistakes

- Lorem ipsum "to be replaced later" — layout decisions made on fake copy break on real copy. Write real words first; they're cheaper than reflowing a design.
- Clever over clear at decision points: puns belong in empty states, not on payment buttons.
- Apologizing instead of helping ("Oops! Sorry about that!") — users want the fix, not the feelings.
- Writing the interface in the company's org chart ("Manage entitlements") instead of the user's vocabulary ("Change your plan").

## Worked Example

Surface: signup error when the email already exists. Write 5, then audit against the voice (say, *plain, warm, direct*):

1. "Oops! Something went wrong." ← generic; names nothing
2. "Error 409: duplicate resource." ← backend's org chart
3. "This email can't be used." ← blames, no path
4. "That email is already registered." ← true but dead-ends
5. "That email is already registered — sign in instead?" ✅

**Shipped #5.** It names the exact problem and hands over the fix (the sign-in path) in the user's words — plain, warm, direct. #1 fails every adjective; #5 passes all three.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass on the copy layer:
- [ ] Every button reads verb + object — no "Submit" / "OK" / "Save".
- [ ] Every error names the fix, not the feeling — no apology theater.
- [ ] No banned opener (Unlock, Empower, Elevate, Supercharge, Seamless, Revolutionize, "Welcome to").
- [ ] Read each string aloud in the voice's 3 adjectives; delete any that fail. No lorem ipsum remains.
