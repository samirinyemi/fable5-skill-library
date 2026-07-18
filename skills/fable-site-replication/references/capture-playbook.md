# Capture Playbook — stack-agnostic recipes

Load when executing Phases 0–2 of fable-site-replication. The principle behind every recipe: **replicate the rendered output, not the source code.** Computed styles and the post-load DOM look the same no matter what framework produced them — that is what makes replication work on ANY stack.

## 1. Fingerprint the stack (30 seconds, decides the capture route)

View source (`curl -s URL | head -200`) and look for:

| Marker in HTML | Stack | Capture route |
|---|---|---|
| `__NEXT_DATA__`, `/_next/` | Next.js (SSR) | curl HTML OK; browser for hydrated behavior |
| `<div id="root"></div>` + near-empty body | CSR SPA (React/Vue/Vite) | curl is BLIND — browser-rendered DOM only |
| `data-wf-page`, `webflow.js` | Webflow | curl OK; interactions live in webflow.js — transcribe the behavior, don't port the code |
| `data-framer-*`, `framerusercontent.com` | Framer | browser-rendered DOM; animations are runtime — record them |
| `wp-content/` | WordPress | curl OK; capture per-template, not per-page |
| `cdn.shopify.com` | Shopify | curl OK; section-based templates |
| `__GATSBY`, `gatsby-*` | Gatsby | curl OK |
| `__NUXT__` | Nuxt | curl OK; hydrated behavior in browser |
| full HTML, none of the above | static / server-rendered | curl is enough |

**If the body is near-empty in view-source, everything below MUST go through a real browser** — fetching the HTML tells you nothing.

## 2. Rendered DOM + computed styles (the ground truth)

In browser tools, after the page fully loads — and AGAIN after opening menus/modals:

- **Snapshot the DOM:** `document.documentElement.outerHTML` — the real markup the framework produced.
- **Computed styles per text role / component** (framework-proof: Tailwind, CSS-in-JS, styled-components all collapse to this):

```js
const el = document.querySelector('h1');
const c = getComputedStyle(el);
({fontFamily: c.fontFamily, fontSize: c.fontSize, fontWeight: c.fontWeight,
  lineHeight: c.lineHeight, letterSpacing: c.letterSpacing, color: c.color,
  margin: c.margin, padding: c.padding, maxWidth: c.maxWidth})
```

Run for every distinct role: h1/h2/body/nav link/button/caption, each section container (padding, max-width, gap), and one instance of each repeating component (card, row, tile).

- **Box-model truth:** `el.getBoundingClientRect()` for real rendered dimensions and positions.
- **Design tokens:** dump `--*` custom properties from `getComputedStyle(document.documentElement)` — if the site uses variables, you get its whole palette/scale in one shot.

## 3. Asset harvest

- Network requests: filter fonts (`.woff2`), images, videos, `.json` (Lottie), `.glb` (3D).
- **Fonts:** list every family + weight actually loaded. Licensed foundry (Klim, Commercial Type, GT, Pangram…)? Substitute the closest free face and SAY SO in the deliverable.
- **@font-face rules:**

```js
[...document.styleSheets].flatMap(s => {try{return [...s.cssRules]}catch{return []}})
  .filter(r => r instanceof CSSFontFaceRule).map(r => r.cssText)
```

- **Images:** intrinsic size, rendered size, `object-fit`, and any filter/mask/blend treatment.

## 4. Motion + behavior transcription

Minified bundles are unreadable — **measure the behavior, not the code:**

- Transitions: computed `transition` / `animation` values per interactive element.
- Scroll-driven: scroll slowly; per reveal note the trigger point (~% of viewport), property animated (transform/opacity), duration feel, and stagger. Screenshot mid-animation.
- Canvas/WebGL/Lottie: you cannot lift proprietary shader or vector code — recreate the visual result (colors, density, speed, cursor/scroll response) to pixel-level similarity and label it a recreation.
- Sticky/pinned sections: note pin start/end scroll offsets.

## 5. What can never be 100% — declare, don't hide

| Can't clone | Do instead |
|---|---|
| Licensed fonts | Closest metrics-compatible free face + a note |
| Server data / auth-walled content | Static fixture data shaped identically |
| Proprietary WebGL shaders | Visual recreation, labeled as such |
| Backend behavior (search, checkout, auth) | Front-end simulation of every visible state |
| Copyrighted assets for public reuse | Placeholder at identical dimensions + treatment |

A "1:1" claim with silent substitutions is a failed replication. List every substitution in the deliverable.
