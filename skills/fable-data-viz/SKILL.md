---
name: fable-data-viz
description: Use when choosing a chart/KPI/sparkline's form, emphasis, honesty, and decluttering so it makes one clear claim — or when fixing charts that are cluttered, misleading, or rainbow-colored. (Chart-rendering code → dataviz skill; full dashboard layout → fable-product-ui.)
requires: [fable-design-dna]
pairs_with: [fable-color-craft, fable-product-ui, fable-presentation-design, fable-design-critique]
---

# Data Visualization

## Overview

A chart is a sentence: it makes ONE claim, and everything on it either supports the claim or is noise. Fable's method: **choose the form from the claim, strip everything that isn't evidence, and spend the accent on the one series that carries the point.**

**REQUIRED BACKGROUND:** fable-design-dna. Color budget from fable-color-craft; dashboard context from fable-product-ui.

## Form Follows Claim

| Claim type | Form |
|---|---|
| Change over time | Line (areas for volume feel; max 3–4 lines before it's spaghetti) |
| Comparison between things | Bar — horizontal when labels are long |
| Part of a whole | Stacked bar; donut only with ≤4 slices; pie almost never |
| Distribution | Histogram / box plot |
| Relationship | Scatter (add trend line if the claim is the trend) |
| Single KPI | Big number + delta vs. previous period + sparkline |
| Flow/funnel | Funnel or sankey — label absolute AND percentage |

Title every chart with its conclusion ("Signups doubled after launch"), never its topic ("Signups over time") — same law as fable-presentation-design headlines.

## The Declutter Ritual

Gridlines to 6–10% opacity or gone; axis lines lighter than data; direct-label series and delete the legend when they fit; round axis numbers; `tabular-nums` everywhere digits align; no 3D, no shadows, no gradients on data. Ink spent on non-data is ink stolen from the claim.

## Emphasis & Color

- ONE series in accent; competitors/context in 2–3 greys. If everything is colored, nothing is the point.
- Annotate the moment that matters ON the chart ("price change here") — don't make readers cross-reference prose.
- Palettes by data type: sequential (light→dark of one hue) for magnitude, diverging (two hues through neutral) for above/below, categorical (max 6, colorblind-safe) for kinds. Semantic good/bad colors stay reserved for status, per fable-color-craft.
- Meaning never in hue alone — vary lightness too, and label directly.
- **Ownership:** the multi-series categorical/sequential/diverging chart palette is the sanctioned EXCEPTION to fable-color-craft's one-accent rule; this skill owns the chart palette and chart-transition timing end-to-end.

## Dashboard Numbers

KPI tiles: value (largest), label, delta with direction, sparkline with emphasized endpoint. Thresholds drawn as background bands, not extra lines. Charts get loading skeletons and empty states like any component ("No data yet for this range → change range").

## Honesty Rules

Bar axes start at zero, always (truncated bars are lies with gridlines). Line axes may zoom but say so. No dual-axis charts implying correlation. Label estimates as estimates. If the honest chart is boring, the claim is boring — find the real story, don't inflate the visual.

## Common Mistakes

- Rainbow categorical palettes making 8 series equally "important."
- Legend-hunting: eyes ping-ponging between legend and lines — direct-label instead.
- The 9-slice pie where five slices are unreadable slivers.
- Animating charts on every data refresh — animate on first load, then change values quietly.
- Decorating weak data with strong styling; the declutter ritual exposes this immediately, which is the point.

## Worked Example

**Before:** 8-series line chart, 8 rainbow hues, a legend below, gridlines at 100%, titled "Regional revenue over time." Every line shouts; nothing is the point.

**After:** Keep the one series the claim is about in accent, push the other 7 to a single grey. Direct-label the accent line and delete the legend. Retitle "EU revenue overtook US in Q3." Gridlines to 8%.

Why: the claim now lives in the title and the accent; the greys are context, not competitors for attention.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:
- [ ] Title is the conclusion ("Signups doubled"), not the topic ("Signups over time").
- [ ] Accent is on exactly one series; everything else is grey context — cover the legend and you can still tell what the point is.
- [ ] Bar axes touch zero; any zoomed line axis says so; no dual-axis correlation implied.
- [ ] Declutter ritual done: gridlines ≤10%, no legend where direct labels fit, no 3D/shadows/gradients on data.
