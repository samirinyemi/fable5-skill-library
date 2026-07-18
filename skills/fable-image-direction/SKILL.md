---
name: fable-image-direction
description: Use when choosing, grading, or AI-generating a page's imagery as one consistent system — photography, illustration, 3D, hero and product shots — especially when images clash, look stock, or came from five different projects. (Color grade values come from fable-color-craft; page-wide grain/effects from fable-signature-effects.)
requires: [fable-design-dna]
pairs_with: [fable-editorial-design, fable-color-craft, fable-design-critique, fable-design-research]
---

# Image Direction

## Overview

Imagery is a system, not a per-slot decision: one treatment, repeated, becomes identity — five styles on one page become noise. Fable's method: **pick one image language from the concept, define its treatment as written rules, and reject anything off-system no matter how good it looks alone.**

**REQUIRED BACKGROUND:** fable-design-dna. Palette temperature from fable-color-craft; alt text from fable-accessibility.

**BOUNDARY:** fable-color-craft owns the palette and what a duotone/tint *is*; this skill owns applying that grade *consistently across the image set*. Grain as a page-wide signature belongs to fable-signature-effects; grain as per-image texture is here.

## Reference Sweep (before designing, when web access exists)

Don't design from defaults — sweep first. Run fable-design-research's multi-source sweep (≥2 sources, at most one move per reference) with this domain's vectors: "art direction photography", "editorial duotone", "3d render style" — Cosmos/Pinterest/Savee boards. Fold the findings into the system you commit BEFORE any pixel: the values this skill owns must trace to the swept board or to a deliberate rejection of it — a random pick next to a researched board is the tell of generic work. No web access? Say so and design from this skill's rules — never cite a reference you didn't fetch.

## Choose ONE Language

From the concept sentence, commit to a primary: documentary photography, staged/art-directed photography, one illustration style, 3D renders, or abstract/generative. A secondary language is allowed only with a strict role split (photos for humans, abstract for concepts) — never mixed within a role.

## The Treatment Sheet (write it down)

- **Grade:** how images bend toward the palette — duotone, tint overlay, lifted blacks, desaturation level. Ungraded images next to graded ones read as a bug.
- **Crop & composition:** fixed aspect ratios per slot; subject rules (eye-lines toward content, negative space where text overlays).
- **Texture:** grain amount, blur usage, mask shapes (sharp rect vs. arch vs. blob — pick one family).
- **What never appears:** the enemy list (stock handshakes, lightbulbs, generic laptops-on-desks, forced diversity grids, glossy 3D people).

## AI Generation Craft

- Write a **style contract prompt** once — medium, lighting, palette, mood, lens/render style — and reuse it verbatim, swapping only the subject. Consistency comes from the contract, not from luck.
- Generate in sets, judge as a set: pick the frames that look like siblings; a stunning off-system image is still a reject.
- Plan the crop before generating (aspect ratio, negative space for headlines) — don't crop meaning away after.
- Retouch the tells: hands, text-in-image, logos, warped geometry. Never ship generated text inside an image; set real type over it instead.
- Grade generated images with the same treatment sheet as everything else — that's what makes them yours.

## Stock Discipline

Stock is raw material, not a finished asset: crop hard, grade harder, and avoid any image the reader has seen selling something else. If a competitor could run the same photo, keep looking or generate instead.

## Technical Floor

Aspect-ratio boxes reserve space (zero layout shift); responsive sizes; modern formats (WebP/AVIF); compress heroes under ~200–300KB; alt text written as meaning, not description (per fable-accessibility).

## Common Mistakes

| Never | Instead |
|---|---|
| An image per section as filler | Image earns its slot as evidence or emotion; filler dilutes the real ones |
| Baking headlines into images | Set real type over negative space planned pre-generation |
| One gorgeous AI hero in a different universe from inline photos | Regenerate the hero on the same style contract |
| Choosing images before layout knows what the text needs | Plan negative space and gaze direction first, then generate |
| Ungraded stock next to graded shots (the grade IS the brand) | Crop hard, apply the treatment-sheet grade to every asset |

## Worked Example

**Concept:** "a field guide to modern finance." **Language:** documentary photography, single source.

**Style contract prompt** (reuse verbatim, swap `{SUBJECT}`):
```
{SUBJECT}, 35mm documentary photo, overcast north light, muted
slate-and-ochre palette, shallow depth, faint film grain, no text, no logos.
```

**Grade:** −15% saturation, lifted blacks (#141414 floor), warm-tint overlay 8%. **Crop:** 3:2 hero, subject on right third, negative space left for headline.

**Before:** three AI heroes — one glossy 3D, one stock-blue, one grainy film — three universes. **After:** regenerate all three on the contract, apply the grade → they read as siblings. *Why: consistency comes from the written contract and one grade, not from picking prettier individual frames.*

## Ship Gate

Before calling it done, self-check against this skill's own non-negotiables, then hand to fable-design-critique for an independent pass:
- [ ] Every image passes the same treatment sheet — one grade, one crop family, one texture; no ungraded asset in the set.
- [ ] No baked-in headline text; real type sits over pre-planned negative space.
- [ ] No image would fit a competitor's site (stock is cropped hard and graded, or regenerated).
- [ ] Aspect-ratio boxes reserve space (zero CLS); heroes under ~300KB in WebP/AVIF.
