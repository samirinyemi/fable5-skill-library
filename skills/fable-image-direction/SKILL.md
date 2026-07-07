---
name: fable-image-direction
description: Use when choosing, treating, or generating imagery — photography, illustration, AI-generated images, hero visuals, product shots — or when a page's images look like they came from five different projects.
---

# Image Direction

## Overview

Imagery is a system, not a per-slot decision: one treatment, repeated, becomes identity — five styles on one page become noise. Fable's method: **pick one image language from the concept, define its treatment as written rules, and reject anything off-system no matter how good it looks alone.**

**REQUIRED BACKGROUND:** fable-design-dna. Palette temperature from fable-color-craft; alt text from fable-accessibility.

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

- "Every section needs an image" — no. An image earns its slot as evidence or emotion; filler images dilute the real ones.
- Baking headlines into images — breaks translation, accessibility, and responsive crops.
- One gorgeous AI hero in a different universe from the inline photos.
- Choosing images before the layout knows what the text needs (negative space, direction of gaze).
- Treating the treatment as optional: the grade IS the brand; skipping it on one image breaks the set.
