# GSAP Animation Patterns Reference

Comprehensive patterns for GSAP + ScrollTrigger in Next.js React applications.

## Table of Contents
1. [Plugin Registration](#plugin-registration)
2. [useGSAP Hook Patterns](#usegsap-hook-patterns)
3. [ScrollTrigger Configurations](#scrolltrigger-configurations)
4. [Timeline Sequencing](#timeline-sequencing)
5. [Horizontal Scroll](#horizontal-scroll)
6. [Pin Effects](#pin-effects)
7. [Parallax](#parallax)
8. [Stagger Patterns](#stagger-patterns)
9. [Text Animations](#text-animations)
10. [Sticky Stacking Cards](#sticky-stacking-cards)
11. [Number Counters](#number-counters)
12. [Interactive / Magnetic Typography](#interactive-magnetic-typography)
13. [Performance Optimization](#performance-optimization)

---

## Plugin Registration

Register all GSAP plugins once at the application root level. In Next.js App Router, place this in the root layout or a client-side provider component.

```tsx
// app/providers.tsx
"use client";
import { useEffect } from "react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

export function GSAPProvider({ children }: { children: React.ReactNode }) {
  return <>{children}</>;
}
```

Never register plugins inside individual components — this causes redundant registration and potential race conditions.

---

## useGSAP Hook Patterns

### Basic Scoped Animation
```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";

export function FadeInSection() {
  const container = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    gsap.from(".fade-item", {
      y: 60,
      opacity: 0,
      duration: 1,
      ease: "power3.out",
      stagger: 0.15,
    });
  }, { scope: container }); // Scopes all selectors to this container

  return (
    <div ref={container}>
      <h2 className="fade-item">Title</h2>
      <p className="fade-item">Description</p>
    </div>
  );
}
```

### With Dependencies (Re-run on State Change)
```tsx
useGSAP(() => {
  gsap.to(".element", { x: activeIndex * 100 });
}, { scope: container, dependencies: [activeIndex] });
```

### Manual Context for Complex Setups
```tsx
useGSAP(() => {
  const tl = gsap.timeline({
    scrollTrigger: {
      trigger: container.current,
      start: "top top",
      end: "+=3000",
      scrub: 1,
      pin: true,
    },
  });

  tl.from(".step-1", { opacity: 0, y: 40 })
    .from(".step-2", { opacity: 0, y: 40 })
    .from(".step-3", { opacity: 0, y: 40 });

  // No manual cleanup needed — useGSAP handles it
}, { scope: container });
```

---

## ScrollTrigger Configurations

### Standard Reveal on Scroll
```tsx
gsap.from(element, {
  scrollTrigger: {
    trigger: element,
    start: "top 80%",     // When top of element hits 80% of viewport
    end: "top 20%",       // When top of element hits 20% of viewport
    toggleActions: "play none none reverse",
  },
  y: 80,
  opacity: 0,
  duration: 1,
  ease: "power3.out",
});
```

### Scrub (Animation Tied to Scroll Position)
```tsx
gsap.to(".progress-bar", {
  scrollTrigger: {
    trigger: ".section",
    start: "top top",
    end: "bottom bottom",
    scrub: true,       // Boolean: directly linked to scroll
    // scrub: 0.5,     // Number: smooth catch-up (seconds of lag)
  },
  scaleX: 1,
});
```

### toggleActions Reference
Format: `"onEnter onLeave onEnterBack onLeaveBack"`

| Value | Effect |
|-------|--------|
| `play` | Play the animation forward |
| `pause` | Pause the animation |
| `resume` | Resume from paused state |
| `reverse` | Play animation backward |
| `restart` | Jump to start and play |
| `reset` | Jump to start without playing |
| `complete` | Jump to end |
| `none` | Do nothing |

Common patterns:
- `"play none none reverse"` — Plays in, reverses out (good for reveals)
- `"play none none none"` — Plays once, stays (one-shot)
- `"play pause resume reverse"` — Full bidirectional

### Markers for Debugging
```tsx
scrollTrigger: {
  markers: true, // Shows start/end markers — remove before production
}
```

---

## Timeline Sequencing

### Hero Entrance Timeline
```tsx
useGSAP(() => {
  const tl = gsap.timeline({ defaults: { ease: "power3.out" } });

  tl.from(".hero-bg", { scale: 1.2, opacity: 0, duration: 1.5 })
    .from(".hero-title", { y: 100, opacity: 0, duration: 1 }, "-=0.8")
    .from(".hero-subtitle", { y: 60, opacity: 0, duration: 0.8 }, "-=0.5")
    .from(".hero-cta", { y: 40, opacity: 0, duration: 0.6 }, "-=0.3")
    .from(".hero-scroll-indicator", { opacity: 0, duration: 0.5 });
}, { scope: container });
```

Position parameters:
- `"-=0.5"` — Start 0.5s before previous tween ends (overlap)
- `"+=0.3"` — Start 0.3s after previous tween ends (gap)
- `2` — Start at absolute time 2s on the timeline
- `"<"` — Start at same time as previous tween
- `">+0.2"` — Start 0.2s after previous tween starts

### Nested Timelines
```tsx
const masterTl = gsap.timeline();

const introTl = gsap.timeline();
introTl.from(".logo", { scale: 0, duration: 0.6 })
  .from(".nav-item", { y: -20, opacity: 0, stagger: 0.1 });

const heroTl = gsap.timeline();
heroTl.from(".hero-text", { y: 100, opacity: 0, duration: 1 })
  .from(".hero-image", { scale: 0.8, opacity: 0, duration: 1 }, "-=0.5");

masterTl.add(introTl).add(heroTl, "-=0.3");
```

---

## Horizontal Scroll

### Cards Scrolling Horizontally on Vertical Scroll
```tsx
useGSAP(() => {
  const cards = gsap.utils.toArray<HTMLElement>(".card");
  const scrollContainer = container.current!.querySelector(".cards-wrapper");

  gsap.to(cards, {
    xPercent: -100 * (cards.length - 1),
    ease: "none",
    scrollTrigger: {
      trigger: scrollContainer,
      start: "top top",
      end: () => `+=${scrollContainer!.scrollWidth - window.innerWidth}`,
      pin: true,
      scrub: 1,
      snap: 1 / (cards.length - 1), // Optional: snap to each card
      invalidateOnRefresh: true,
    },
  });
}, { scope: container });
```

```tsx
// JSX structure
<section ref={container} className="overflow-hidden">
  <div className="cards-wrapper flex w-max">
    {cards.map((card, i) => (
      <div key={i} className="card w-screen h-screen flex-shrink-0 p-8">
        {/* Card content */}
      </div>
    ))}
  </div>
</section>
```

### Fan-Out Cards from Center
```tsx
useGSAP(() => {
  const cards = gsap.utils.toArray<HTMLElement>(".fan-card");

  cards.forEach((card, i) => {
    const angle = (i - (cards.length - 1) / 2) * 15; // Spread angle
    const xOffset = (i - (cards.length - 1) / 2) * 120;

    gsap.fromTo(card,
      { rotation: 0, x: 0, y: 100, opacity: 0 },
      {
        rotation: angle,
        x: xOffset,
        y: 0,
        opacity: 1,
        ease: "power3.out",
        scrollTrigger: {
          trigger: container.current,
          start: "top 60%",
          end: "top 10%",
          scrub: 1,
        },
      }
    );
  });
}, { scope: container });
```

---

## Pin Effects

### Pin Left Column, Scroll Right Column
```tsx
useGSAP(() => {
  ScrollTrigger.create({
    trigger: container.current,
    start: "top top",
    end: "bottom bottom",
    pin: ".left-column",
    pinSpacing: false,
  });
}, { scope: container });
```

```tsx
// JSX structure
<section ref={container} className="relative">
  <div className="grid grid-cols-2 min-h-[300vh]">
    <div className="left-column h-screen flex items-center p-16">
      <h2>Pinned Content</h2>
    </div>
    <div className="right-column py-[50vh]">
      <div className="feature-1 min-h-screen">Feature 1</div>
      <div className="feature-2 min-h-screen">Feature 2</div>
      <div className="feature-3 min-h-screen">Feature 3</div>
    </div>
  </div>
</section>
```

### Step-Through Pin (Content Swaps)
```tsx
useGSAP(() => {
  const steps = gsap.utils.toArray<HTMLElement>(".step");

  const tl = gsap.timeline({
    scrollTrigger: {
      trigger: container.current,
      start: "top top",
      end: `+=${steps.length * 100}%`,
      pin: true,
      scrub: 1,
    },
  });

  steps.forEach((step, i) => {
    if (i > 0) {
      tl.fromTo(step,
        { opacity: 0, y: 40 },
        { opacity: 1, y: 0 },
        i
      );
    }
    if (i < steps.length - 1) {
      tl.to(step,
        { opacity: 0, y: -40 },
        i + 0.8
      );
    }
  });
}, { scope: container });
```

---

## Parallax

### Multi-Layer Parallax
```tsx
useGSAP(() => {
  const layers = [
    { selector: ".parallax-bg", speed: 0.3 },
    { selector: ".parallax-mid", speed: 0.6 },
    { selector: ".parallax-fg", speed: 1.0 },
  ];

  layers.forEach(({ selector, speed }) => {
    gsap.to(selector, {
      yPercent: -50 * speed,
      ease: "none",
      scrollTrigger: {
        trigger: container.current,
        start: "top bottom",
        end: "bottom top",
        scrub: true,
      },
    });
  });
}, { scope: container });
```

### Image Parallax Inside Container
```tsx
gsap.to(".parallax-img", {
  yPercent: -20,
  ease: "none",
  scrollTrigger: {
    trigger: ".img-container",
    start: "top bottom",
    end: "bottom top",
    scrub: true,
  },
});
```

Apply `overflow-hidden` on the container and scale the image slightly larger (110-120%) to prevent gaps.

---

## Stagger Patterns

### Grid Reveal
```tsx
gsap.from(".grid-item", {
  scrollTrigger: { trigger: ".grid", start: "top 75%" },
  y: 60,
  opacity: 0,
  duration: 0.8,
  stagger: {
    amount: 0.8,        // Total stagger time
    grid: [3, 4],       // 3 rows, 4 columns
    from: "start",      // "start", "end", "center", "edges", "random"
    ease: "power2.out",
  },
});
```

### Stagger from Center
```tsx
stagger: {
  each: 0.1,
  from: "center",
}
```

### Random Stagger
```tsx
stagger: {
  each: 0.08,
  from: "random",
}
```

---

## Text Animations

### Split Text Character Reveal
For character-level animations, split text into spans first:

```tsx
function SplitText({ text, className }: { text: string; className?: string }) {
  return (
    <span className={className} aria-label={text}>
      {text.split("").map((char, i) => (
        <span key={i} className="split-char inline-block" aria-hidden="true">
          {char === " " ? "\u00A0" : char}
        </span>
      ))}
    </span>
  );
}
```

```tsx
useGSAP(() => {
  gsap.from(".split-char", {
    y: "100%",
    opacity: 0,
    duration: 0.6,
    ease: "power3.out",
    stagger: 0.03,
    scrollTrigger: { trigger: ".text-container", start: "top 80%" },
  });
}, { scope: container });
```

Wrap the text container in `overflow-hidden` for a clip-reveal effect.

### Line-by-Line Reveal
```tsx
gsap.from(".text-line", {
  y: "110%",
  duration: 0.8,
  ease: "power4.out",
  stagger: 0.12,
});
```

Wrap each line in a `div` with `overflow-hidden` for the mask effect.

---

## Sticky Stacking Cards

Cards stack on top of each other as the user scrolls. Background cards scale down and blur out as new cards cover them. Uses CSS `position: sticky` for the base stacking, with GSAP ScrollTrigger for the scale/blur transitions.

### CSS Sticky + GSAP Blur/Scale
```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

const insights = [
  { title: "Insight One", body: "First card content.", color: "bg-white" },
  { title: "Insight Two", body: "Second card content.", color: "bg-neutral-50" },
  { title: "Insight Three", body: "Third card content.", color: "bg-neutral-100" },
];

export function StickyStack() {
  const container = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    const cards = gsap.utils.toArray<HTMLElement>(".stack-card");

    cards.forEach((card, i) => {
      if (i < cards.length - 1) {
        // As the NEXT card scrolls over this one, scale down and blur
        ScrollTrigger.create({
          trigger: cards[i + 1],
          start: "top bottom",
          end: "top 10%",
          scrub: 1,
          onUpdate: (self) => {
            const progress = self.progress;
            gsap.set(card, {
              scale: 1 - progress * 0.08,       // Scale to 0.92
              filter: `blur(${progress * 12}px)`, // Blur to 12px
              opacity: 1 - progress * 0.3,        // Fade slightly
            });
          },
        });
      }
    });
  }, { scope: container });

  return (
    <section ref={container} className="py-32 px-6">
      <div className="max-w-3xl mx-auto">
        {insights.map((item, i) => (
          <div
            key={i}
            className={`stack-card sticky rounded-3xl border border-neutral-200 p-10 ${item.color}`}
            style={{ top: `${10 + i * 4}vh` }} // Offset each card's sticky position
          >
            <h3 className="text-2xl font-semibold">{item.title}</h3>
            <p className="mt-4 text-muted leading-relaxed">{item.body}</p>
          </div>
        ))}
      </div>
    </section>
  );
}
```

The key insight: each card uses CSS `sticky` with an incrementing `top` value so they naturally stack. GSAP only handles the blur/scale transitions — the stacking behavior is CSS-native and more performant.

---

## Number Counters

Animate numbers counting up from 0 to a target value when scrolled into view. GSAP can tween a proxy object and update the DOM on each frame.

### Basic Counter
```tsx
useGSAP(() => {
  const counters = gsap.utils.toArray<HTMLElement>(".counter");

  counters.forEach((counter) => {
    const target = parseInt(counter.dataset.target || "0", 10);
    const suffix = counter.dataset.suffix || "";
    const prefix = counter.dataset.prefix || "";

    gsap.from(counter, {
      innerText: 0,
      duration: 2,
      ease: "power2.out",
      snap: { innerText: 1 }, // Snap to whole numbers
      scrollTrigger: {
        trigger: counter,
        start: "top 80%",
        toggleActions: "play none none none",
      },
      onUpdate: function () {
        counter.textContent = prefix + Math.round(parseFloat(counter.textContent || "0")).toLocaleString() + suffix;
      },
    });
  });
}, { scope: container });
```

```tsx
// JSX usage
<div className="grid grid-cols-2 md:grid-cols-4 gap-8">
  <div className="text-center">
    <span className="counter text-5xl font-bold" data-target="2500" data-suffix="+">0</span>
    <p className="mt-2 text-xs font-semibold uppercase tracking-widest text-muted">Projects Delivered</p>
  </div>
  <div className="text-center">
    <span className="counter text-5xl font-bold" data-target="99" data-suffix="%">0</span>
    <p className="mt-2 text-xs font-semibold uppercase tracking-widest text-muted">Client Satisfaction</p>
  </div>
  <div className="text-center">
    <span className="counter text-5xl font-bold" data-target="15" data-prefix="" data-suffix="M+">0</span>
    <p className="mt-2 text-xs font-semibold uppercase tracking-widest text-muted">Users Reached</p>
  </div>
  <div className="text-center">
    <span className="counter text-5xl font-bold" data-target="50" data-suffix="+">0</span>
    <p className="mt-2 text-xs font-semibold uppercase tracking-widest text-muted">Team Members</p>
  </div>
</div>
```

### Proxy Object Approach (Cleaner)
```tsx
counters.forEach((counter) => {
  const target = parseInt(counter.dataset.target || "0", 10);
  const obj = { value: 0 };

  gsap.to(obj, {
    value: target,
    duration: 2,
    ease: "power2.out",
    scrollTrigger: {
      trigger: counter,
      start: "top 80%",
      toggleActions: "play none none none",
    },
    onUpdate: () => {
      counter.textContent = Math.round(obj.value).toLocaleString() + (counter.dataset.suffix || "");
    },
  });
});
```

---

## Interactive / Magnetic Typography

Mouse-driven text effects where individual lines or words respond to cursor proximity. Creates a "magnetic" or "focus" effect — the hovered line brightens/shifts while others dim.

### Magnetic List Items
```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";

const items = ["Strategy", "Design", "Development", "Launch"];

export function MagneticText() {
  const container = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    const lines = gsap.utils.toArray<HTMLElement>(".mag-line");

    lines.forEach((line) => {
      line.addEventListener("mouseenter", () => {
        // Highlight hovered line
        gsap.to(line, {
          color: "#0F0F0F",
          x: 12,
          duration: 0.4,
          ease: "power3.out",
        });
        // Dim all other lines
        gsap.to(lines.filter((l) => l !== line), {
          color: "#d4d4d4",
          x: 0,
          duration: 0.4,
          ease: "power3.out",
        });
      });

      line.addEventListener("mouseleave", () => {
        // Reset all lines
        gsap.to(lines, {
          color: "#0F0F0F",
          x: 0,
          duration: 0.4,
          ease: "power3.out",
        });
      });
    });
  }, { scope: container });

  return (
    <div ref={container} className="py-20">
      {items.map((item, i) => (
        <div
          key={i}
          className="mag-line text-5xl md:text-7xl font-light tracking-tight cursor-pointer py-4 border-b border-neutral-200 transition-none"
        >
          {item}
        </div>
      ))}
    </div>
  );
}
```

### Magnetic Button (Cursor Follow)
```tsx
useGSAP(() => {
  const btn = container.current!.querySelector(".magnetic-btn") as HTMLElement;
  const strength = 0.3; // 0-1, how strongly it follows cursor

  btn.addEventListener("mousemove", (e) => {
    const rect = btn.getBoundingClientRect();
    const x = (e.clientX - rect.left - rect.width / 2) * strength;
    const y = (e.clientY - rect.top - rect.height / 2) * strength;
    gsap.to(btn, { x, y, duration: 0.3, ease: "power3.out" });
  });

  btn.addEventListener("mouseleave", () => {
    gsap.to(btn, { x: 0, y: 0, duration: 0.5, ease: "elastic.out(1, 0.5)" });
  });
}, { scope: container });
```

The elastic ease on mouse leave gives the button a satisfying "snap back" feel. Adjust `strength` to control how aggressively the button follows the cursor.

---

## Performance Optimization

### Do
- Use `transform` and `opacity` exclusively for animations (GPU-composited)
- Use `will-change: transform` only on elements about to animate, remove after
- Use `gsap.set()` for initial states instead of CSS to avoid FOUC
- Use `invalidateOnRefresh: true` on ScrollTriggers that depend on layout measurements
- Debounce or throttle window resize handlers
- Use `ScrollTrigger.refresh()` after dynamic content loads

### Avoid
- Animating `width`, `height`, `top`, `left`, `margin`, `padding` (causes layout reflows)
- Animating `box-shadow` or `filter` on many elements simultaneously
- Creating ScrollTriggers inside loops without proper scoping
- Forgetting `pin: true` requires the pinned element to be a direct child or carefully positioned
- Using `scrub: true` (boolean) on long sections — prefer `scrub: 0.5` to `scrub: 2` for smoother feel

### ScrollTrigger Batch for Many Elements
```tsx
ScrollTrigger.batch(".reveal-item", {
  onEnter: (batch) => gsap.to(batch, { opacity: 1, y: 0, stagger: 0.1 }),
  start: "top 85%",
});

// Set initial state
gsap.set(".reveal-item", { opacity: 0, y: 40 });
```

This is more efficient than creating individual ScrollTriggers for dozens of elements.

### Responsive ScrollTrigger
```tsx
ScrollTrigger.matchMedia({
  "(min-width: 768px)": function () {
    // Desktop animations
    gsap.from(".desktop-element", { x: -100, opacity: 0 });
  },
  "(max-width: 767px)": function () {
    // Mobile animations (simpler)
    gsap.from(".mobile-element", { y: 40, opacity: 0 });
  },
});
```

Each callback creates its own scope — animations are automatically cleaned up when the media query no longer matches.
