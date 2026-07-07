---
name: fable-design-research
description: Use when hunting for design references, patterns, or inspiration — "find me examples of...", "search Pinterest/Cosmos/Awwwards for...", "what are current patterns for..." — before committing to a direction, or when the user wants to choose from curated visual options in chat.
---

# Design Research

## Overview

Reference hunting on autopilot: sweep the web for how the best work solves this exact problem, **curate hard, annotate every pick with the one pattern it earns its place for, and present a selectable board** — then pipe the chosen direction into fable-style-extraction. The skill is the curation, not the collecting: thirty raw links is a search result; six annotated picks is research.

**REQUIRED BACKGROUND:** fable-design-dna. Downstream: fable-style-extraction turns the chosen reference into a buildable system.

## Phase 1 — Frame the Hunt

Before searching, write three lines: the **job** (hero for a fintech app), the **feeling** (trustworthy but not boring), and the **enemy** (what the user is tired of seeing). Search without a frame and you'll collect pretty things that solve someone else's problem.

Derive 3–4 search vectors: by aesthetic ("brutalist editorial landing"), by component ("pricing table interactions"), by industry ("fintech dashboard design"), by technique ("scroll-driven storytelling").

## Phase 2 — Sweep the Sources

**Check for a connected visual MCP FIRST.** If the session has a design-inspiration MCP, it returns real screenshots and structured metadata — far better than scraping. Prefer it over web search. The Mobbin MCP is the common one; its tools are shaped `search_screens`, `search_flows`, `search_sections` (server name varies). Use ToolSearch with a query like `mobbin screens flows` or `design inspiration screens` to surface it, then call it with the framed vectors from Phase 1. Other connected MCPs (Figma community search, Dribbble, etc.) count too. A connected visual MCP is used ON ITS OWN by design — this skill only adds framing, curation, and the selectable board around whatever it returns; it never wraps or replaces it.

If no visual MCP is present, use whatever else the session offers — web search, page fetching, browser tools. Hit these sources by URL; don't guess addresses.

| Source | URL | Best for | Search entry |
|---|---|---|---|
| **Pinterest** | https://www.pinterest.com/ | Broad aesthetic boards, any visual query | `https://www.pinterest.com/search/pins/?q=QUERY` · or web search `site:pinterest.com QUERY` |
| **Cosmos** | https://www.cosmos.so/ | Curated taste-forward inspiration | `https://www.cosmos.so/search?q=QUERY` · often login-walled — use browser tools |
| **Awwwards** | https://www.awwwards.com/ | Award-tier full sites & live interactions | `https://www.awwwards.com/websites/?text=QUERY` · category pages e.g. `/inspiration/scroll-animations` |
| Mobbin | https://mobbin.com/ | Real product UI screens & flows | Browse by app / pattern; screenshot library |
| Godly | https://godly.website/ | Modern web design, sortable by section | Filter by tag |
| Land-book · SiteInspire | https://land-book.com/ · https://www.siteinspire.com/ | Landing pages & categorized sites | Filter by style/type |
| Dribbble · Behance | https://dribbble.com/ · https://www.behance.net/ | Visual direction, brand, illustration | Concepts — verify buildability |
| Savee | https://savee.it/ | Aesthetic boards, image-first | Login-walled — browser tools |
| Live sites | the real URL | The truth | Fetch and inspect directly |

Replace `QUERY` with URL-encoded terms (spaces → `%20` or `+`). Pinterest/Cosmos/Savee gate content behind login — reach them with browser tools when available; otherwise fall back to `site:` web search and fetch whatever is public. If a source is unreachable, say so and route around it — never fake a reference you didn't see.

## Phase 3 — Curate the Board

- **5–8 picks maximum.** Each earns its place for ONE nameable pattern; cut duplicates that demonstrate the same move.
- Annotate every pick: source + link, **the pattern it demonstrates** ("nav that collapses into a pill on scroll"), **what to steal** (the mechanic), **what to ignore** (their palette, their content).
- Note recency — a 2019 pattern may read as dated; say when something is a classic vs. a current wave.
- Pull or screenshot images into the chat when the environment allows; otherwise link + a one-line visual description precise enough to choose by.

## Phase 4 — Present for Selection

Match the presentation to what the environment can render:

- **When images are available** (visual MCP results, browser screenshots, or fetchable image URLs): build a **visual gallery artifact** — a responsive grid of cards, one per pick, each showing the image + a caption (source, the pattern it demonstrates, what to steal / what to ignore) and a number. This is the Mobbin-in-chat experience: the user scans the grid and picks by number. Embed images as data URIs or direct URLs; keep it one self-contained HTML file. Lead with a one-line recommendation above the grid.
- **When images can't render inline** (plain terminal, login-walled sources): fall back to a numbered text board — each pick as source link + one-line visual description precise enough to choose by, plus the same annotations.

Either way, end with a one-line recommendation ("№3 fits your enemy-list best — cleanest path to 'trustworthy, not boring'") and make selection explicit: the user picks a number. The chosen pick goes to fable-style-extraction (system, not pixels) or becomes the brief for fable-design-dna's commit step. Dribbble-concept picks get a buildability check before promising them.

## Common Mistakes

- Dumping raw search results — the user asked for judgment, not a search engine.
- Choosing by prettiness instead of by the framed job.
- Averaging the whole board into mush — selection feeds ONE primary reference (style-extraction's rule).
- Presenting references from memory without fetching — patterns drift; verify they look like you claim today.
- Treating a reference board as license to copy identity — logos, mascots, copy stay with their owners (per fable-style-extraction).
