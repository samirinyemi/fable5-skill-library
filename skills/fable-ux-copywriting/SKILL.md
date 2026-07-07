---
name: fable-ux-copywriting
description: Use when writing any words that appear in an interface or on a page — headlines, buttons, labels, error messages, empty states, onboarding, marketing copy — or when a design is strong but the words are vague, hypey, or robotic.
---

# UX Copywriting

## Overview

Copy is design material, not filler poured into design. A generic headline drags down a great layout faster than a bad font. Fable's method: **write from the reader's side of the screen, be specific to the point of discomfort, and make every interactive word state its consequence.**

**REQUIRED BACKGROUND:** fable-design-dna — the voice comes from the same one-sentence direction as the visuals.

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
| Empty states | The next action, not a shrug | "No invoices yet. Send your first one →" |
| Forms | Labels name the answer ("Work email"), helper text prevents the error before it happens | |
| Destructive | Name the stakes plainly | "Delete 34 files? This can't be undone." |
| Loading | Say what's happening if >2s | "Importing 1,204 contacts…" |

## Voice Discipline

- Define the voice as 3 adjectives + 3 banned words (from fable-brand-identity), then audit every string against it.
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
