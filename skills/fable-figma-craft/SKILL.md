---
name: fable-figma-craft
description: Use when designing or building inside Figma — file structure, auto-layout, variables, components, variants, prototyping, dev handoff — or when a Figma file has become canvas soup: detached instances, hardcoded values, unnavigable pages.
---

# Figma Craft

## Overview

A Figma file is a product other people use: engineers, clients, future-you. Fable's method: **the file's structure mirrors the design system, auto-layout mirrors the code, and nothing carries a value that isn't bound to a variable.** A beautiful screen in a chaotic file is half-finished work.

**REQUIRED BACKGROUND:** fable-design-dna. Token architecture from fable-design-systems — Figma variables implement it.

## File Structure

Pages in a fixed order: **Cover** (project, status, owner) → **✅ Ready** (source of truth) → **🚧 Exploring** → **🧩 Components** → **🗄 Archive**. Frames named as screens/routes ("Checkout / Payment"), grouped in sections per flow. The test: a stranger finds the current design in 30 seconds without asking.

## Auto-Layout Discipline

- Everything is auto-layout except intentional canvas art. If dragging a text box breaks the layout, the layout was never built.
- Spacing and padding values come ONLY from the scale (4/8/12/16/24/32…) — auto-layout with arbitrary 13px gaps is drift with extra steps.
- Set resizing intent deliberately: fill / hug / fixed per element, min/max widths on responsive components. A frame that behaves correctly when resized is the Figma equivalent of working responsive code.
- Absolute position is a flag, not a tool — reserved for badges/overlays pinned on purpose.

## Variables & Styles

Two collections mirroring fable-design-systems: **Primitives** (raw values, no opinions) and **Semantic** (roles — `color/action`, `color/surface-raised`, `space/section`) with light/dark modes. Screens consume semantic only. Type and effect styles named by role, not appearance ("text/heading-lg", never "Bold 24"). The audit: select-all on a Ready screen — any unbound fill or raw hex is a bug.

## Components

- Componentize on the third use (rule of three, same as code).
- Variants model states (default/hover/focus/disabled/loading/error) and intents — not twelve near-copies. Booleans for toggles (icon on/off), instance-swap for slots.
- Every component carries a one-line description: what it's for, when not to use it.
- Detaching an instance is an incident: either the component was too rigid (fix the component) or the design is drifting (fix the design).

## Prototype & Handoff

Prototype the golden path only — enough to feel the flow; smart-animate state transitions matching the product's motion personality (fable-motion-design). Handoff-ready means: variables bound, auto-layout honest (paddings/gaps ARE the redlines), all interactive states present on the component sheet, and edge-case content (longest German string, empty, error) shown once per template.

## Common Mistakes

- Canvas soup: 200 unnamed frames on one page, three of them current.
- Hardcoded hex/pixel values "just to move fast" — pay-later drift, same as inline styles in code.
- The 40-variant monster component nobody can use — split by role instead.
- Prototyping every edge case (weeks of wiring, minutes of value) instead of the one path that sells the flow.
- Treating Figma structure as beneath the craft: the file IS the studio others visit.
