---
name: fable-data-viz
description: Use when designing charts, graphs, KPIs, sparklines, or data-heavy dashboards and reports — or when existing charts are cluttered, misleading, rainbow-colored, or fail to make their point at a glance.
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
