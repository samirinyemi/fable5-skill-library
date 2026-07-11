---
name: fable-signature-effects
description: Use when building the ONE showpiece web mechanic a site owns — custom cursor, magnetic elements, image trail, gradient mesh, grain, WebGL distortion hover, reactive marquee, text scramble. Not per-component feedback (fable-micro-interactions) or timeline/scroll plumbing (fable-animation-engineering).
requires: [fable-design-dna, fable-motion-design]
pairs_with: [fable-animation-engineering, fable-award-winning-web, fable-design-critique]
---

# Signature Effects

## Overview

From fable-award-winning-web's law: one signature interaction per site — three cancel each other. This skill is the execution catalog. The bar: **the effect expresses the brand's idea, runs at 60fps on a mid-range phone or degrades away, and the site remains excellent with the effect deleted.**

**REQUIRED BACKGROUND:** fable-design-dna — the effect is derived from the concept sentence, never chosen from a trends list. Timing/physics from fable-motion-design.

**Boundary:** component-level feedback (button press, toggle) is fable-micro-interactions; the render/timeline/scroll plumbing is fable-animation-engineering. This skill owns ONLY the single showpiece mechanic.

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

## Worked Example

Concept sentence: *"A typography studio that treats letterforms as physical objects."*

- **BEFORE:** picked a custom cursor because it looked cool on an Awwwards clone. Fits any brand → decoration, not signature.
- **AFTER:** candidates were magnetic nav vs. WebGL displacement on the specimen grid. Chose the displacement hover — it literally makes letters behave like matter (idea-expressive), where a magnetic button would suit any brand. Ship: OGL displacement shader on the specimens, CSS-filter blur fallback, `hover:none` → static.
- **Why:** kill-switch check — delete the effect and the oversized specimens still carry the site. PASS.

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:
- [ ] The concept sentence names the mechanic — it would NOT fit any other brand (not picked from a trends/Awwwards list).
- [ ] 60fps on a throttled mid-range phone; every pointer-driven value LERPs (no 1:1 tracking).
- [ ] `hover:none` and `prefers-reduced-motion` paths both tested; no WebGL degrades to a static/CSS fallback instead of erroring.
- [ ] Canvas layers are `pointer-events:none` / z-indexed under UI — hero CTA still clickable, text selectable; delete the effect and the site is still excellent.
