---
name: fable-signature-effects
description: Use when building the one showpiece interactive effect — custom cursors, magnetic buttons, WebGL/canvas moments, gradient meshes, image trails, distortion hovers, grain — or when a site needs a memorable mechanic it can own.
---

# Signature Effects

## Overview

From fable-award-winning-web's law: one signature interaction per site — three cancel each other. This skill is the execution catalog. The bar: **the effect expresses the brand's idea, runs at 60fps on a mid-range phone or degrades away, and the site remains excellent with the effect deleted.**

**REQUIRED BACKGROUND:** fable-design-dna — the effect is derived from the concept sentence, never chosen from a trends list. Timing/physics from fable-motion-design.

## Choosing the Effect

Write the concept sentence, then ask: what mechanic IS this idea? Precision brand → magnetic snap. Organic brand → flowing gradient mesh. Editorial brand → image trail or text scramble. Tech brand → subtle WebGL distortion. If the effect would fit any brand, it's decoration, not signature.

## The Catalog

| Effect | Execution notes |
|---|---|
| Custom cursor | A dot/ring LERPing after the real cursor (never replace it); grows/labels over interactive elements; `display:none` on touch |
| Magnetic elements | Within a radius, translate toward pointer at ~30% of distance, spring back on leave; buttons and nav only |
| Image trail | Pointer movement spawns images that scale/fade out 600–900ms; cap the pool (~10 nodes, recycled) |
| Gradient mesh / aurora | 3–4 blurred radial blobs drifting slowly (20–40s loops) on canvas or CSS; brand hues only, subtle enough to read text over |
| Grain | SVG turbulence overlay at 3–5% opacity, `pointer-events:none` — instant analog warmth |
| WebGL distortion hover | Displacement shader on images (Three.js/OGL); ship a CSS-filter fallback |
| Text scramble / split reveal | Characters cycle to resolve or masked-lines rise; hero + section heads only, never body text |
| Reactive marquee | Infinite loop whose speed/direction eases with scroll velocity |

## The LERP Rule

Everything pointer-driven interpolates — `pos += (target - pos) * 0.1` in a rAF loop (factor 0.08–0.15). Direct 1:1 tracking reads as a system cursor; lag with easing reads as physics. This one line is most of the "expensive" feel.

## Degradation Contract

- Touch devices: pointer effects OFF (`matchMedia('(hover: none)')`), replaced by touch-native equivalents or nothing.
- `prefers-reduced-motion`: ambient loops pause, distortions become crossfades.
- No WebGL / low-power: static or CSS fallback — feature-detect, don't error.
- The effect NEVER gates content: canvas layers are `pointer-events:none` or z-indexed under UI; text remains selectable, links clickable.
- Kill switch test: delete the effect — if the site stops being good, the design was leaning on it. Fix the design first.

## Common Mistakes

- Effect soup: cursor + particles + parallax + distortion at once — the definition of trying too hard.
- A laggy custom cursor: worse than none; if it can't LERP at 60fps, cut it.
- Hiding the system cursor entirely and breaking form fields, text selection, resize handles.
- Canvas intercepting clicks on the hero CTA — the effect literally costing conversions.
- Choosing the effect from an Awwwards clone list instead of the brand's own idea.
