# Component Architecture Reference

Complete component templates for premium web experiences with Next.js or React+Vite, Tailwind CSS, and GSAP.

## Table of Contents
1. [Project Setup](#project-setup)
2. [Navigation Component](#navigation-component)
3. [Hero Section](#hero-section)
4. [Scroll-Triggered Feature Section](#scroll-triggered-feature-section)
5. [Bento Grid Section](#bento-grid-section)
6. [Visual Showcase (Horizontal Scroll)](#visual-showcase)
7. [Metrics Section](#metrics-section)
8. [Testimonials / Social Proof](#testimonials)
9. [CTA and Footer](#cta-and-footer)
10. [Page Assembly](#page-assembly)

---

## Project Setup

### Option A: Next.js (App Router)
```bash
npx create-next-app@latest project-name --typescript --tailwind --app --src-dir
cd project-name
npm install gsap @gsap/react lucide-react
```

### Option B: React + Vite
```bash
npm create vite@latest project-name -- --template react-ts
cd project-name
npm install tailwindcss @tailwindcss/vite gsap @gsap/react lucide-react
```

For Vite, configure Tailwind in `vite.config.ts`:
```ts
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  plugins: [react(), tailwindcss()],
});
```

Then add `@import "tailwindcss";` to your `src/index.css`.

All components below work in both setups. The only difference: Next.js components need `"use client"` at the top; Vite components do not.

### GSAP Provider (app/providers.tsx)
```tsx
"use client";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

if (typeof window !== "undefined") {
  gsap.registerPlugin(ScrollTrigger);
}

export function Providers({ children }: { children: React.ReactNode }) {
  return <>{children}</>;
}
```

### Root Layout Integration
```tsx
// app/layout.tsx
import { Providers } from "./providers";
import localFont from "next/font/local";
// Or: import { Syne, DM_Sans } from "next/font/google";

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en" className="scroll-smooth">
      <body>
        <Providers>{children}</Providers>
      </body>
    </html>
  );
}
```

### Global CSS Foundation
```css
/* globals.css — add alongside Tailwind directives */
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --color-primary: #0a0a0a;
    --color-accent: #3b82f6;
    --color-surface: #fafafa;
    --color-muted: #6b7280;
  }

  html {
    scroll-behavior: smooth;
  }

  body {
    background-color: var(--color-surface);
    color: var(--color-primary);
    overflow-x: hidden;
  }

  /* Prevent FOUC on animated elements */
  .gsap-hidden {
    visibility: hidden;
  }
}
```

---

## Navigation Component

### Glassmorphism Sticky Header
```tsx
"use client";
import { useRef, useState } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";

export function Navigation() {
  const navRef = useRef<HTMLElement>(null);
  const [isScrolled, setIsScrolled] = useState(false);

  useGSAP(() => {
    // Fade in nav items on load
    gsap.from(".nav-item", {
      y: -20,
      opacity: 0,
      duration: 0.6,
      stagger: 0.1,
      ease: "power3.out",
      delay: 0.3,
    });

    // Scroll-aware background change
    ScrollTrigger.create({
      start: "top -80",
      onUpdate: (self) => setIsScrolled(self.progress > 0),
    });
  }, { scope: navRef });

  return (
    <nav
      ref={navRef}
      className={`fixed top-0 left-0 right-0 z-50 transition-all duration-300 ${
        isScrolled
          ? "bg-white/70 backdrop-blur-xl border-b border-gray-200/50 shadow-sm"
          : "bg-transparent"
      }`}
    >
      <div className="max-w-7xl mx-auto px-6 h-20 flex items-center justify-between">
        <a href="/" className="nav-item text-xl font-bold tracking-tight">
          Logo
        </a>
        <div className="hidden md:flex items-center gap-8">
          <a href="#features" className="nav-item text-sm hover:text-accent transition-colors">
            Features
          </a>
          <a href="#showcase" className="nav-item text-sm hover:text-accent transition-colors">
            Showcase
          </a>
          <a href="#contact" className="nav-item text-sm hover:text-accent transition-colors">
            Contact
          </a>
          <button className="nav-item px-5 py-2.5 bg-primary text-white text-sm rounded-full hover:bg-primary/90 transition-colors">
            Get Started
          </button>
        </div>
      </div>
    </nav>
  );
}
```

### Scroll-Hide Navigation (Alternative)
```tsx
useGSAP(() => {
  const showNav = gsap.from(navRef.current, {
    yPercent: -100,
    paused: true,
    duration: 0.3,
    ease: "power2.out",
  }).progress(1);

  ScrollTrigger.create({
    start: "top top",
    end: "max",
    onUpdate: (self) => {
      self.direction === -1 ? showNav.play() : showNav.reverse();
    },
  });
}, { scope: navRef });
```

---

## Hero Section

### Cinematic Hero with Background Scale
```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";

export function Hero() {
  const container = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    const tl = gsap.timeline({ defaults: { ease: "power3.out" } });

    // Background image scale-in
    tl.from(".hero-bg", {
      scale: 1.3,
      opacity: 0,
      duration: 2,
      ease: "power2.out",
    })
    // Headline clip-reveal
    .from(".hero-title-line", {
      y: "110%",
      duration: 1,
      stagger: 0.12,
      ease: "power4.out",
    }, "-=1.2")
    // Subtitle fade
    .from(".hero-subtitle", {
      y: 40,
      opacity: 0,
      duration: 0.8,
    }, "-=0.4")
    // CTA button
    .from(".hero-cta", {
      y: 30,
      opacity: 0,
      duration: 0.6,
    }, "-=0.3")
    // Scroll indicator
    .from(".scroll-indicator", {
      opacity: 0,
      y: -10,
      duration: 0.5,
    });

    // Parallax on scroll
    gsap.to(".hero-bg", {
      yPercent: 30,
      ease: "none",
      scrollTrigger: {
        trigger: container.current,
        start: "top top",
        end: "bottom top",
        scrub: true,
      },
    });
  }, { scope: container });

  return (
    <section ref={container} className="relative h-screen overflow-hidden flex items-center justify-center">
      {/* Background */}
      <div className="hero-bg absolute inset-0">
        <img
          src="/hero-bg.jpg"
          alt=""
          className="w-full h-full object-cover"
        />
        <div className="absolute inset-0 bg-black/40" />
      </div>

      {/* Content */}
      <div className="relative z-10 text-center text-white max-w-4xl px-6">
        <h1 className="text-5xl md:text-7xl lg:text-8xl font-bold tracking-tight leading-[0.95]">
          <span className="block overflow-hidden">
            <span className="hero-title-line block">Crafting Digital</span>
          </span>
          <span className="block overflow-hidden">
            <span className="hero-title-line block">Experiences</span>
          </span>
        </h1>
        <p className="hero-subtitle mt-6 text-lg md:text-xl text-white/80 max-w-2xl mx-auto">
          Premium web experiences that blend performance with cinematic design.
        </p>
        <button className="hero-cta mt-10 px-8 py-4 bg-white text-black text-sm font-medium rounded-full hover:bg-white/90 transition-colors">
          Explore Our Work
        </button>
      </div>

      {/* Scroll indicator */}
      <div className="scroll-indicator absolute bottom-8 left-1/2 -translate-x-1/2 text-white/60">
        <div className="w-6 h-10 border-2 border-white/40 rounded-full flex justify-center pt-2">
          <div className="w-1 h-2 bg-white/60 rounded-full animate-bounce" />
        </div>
      </div>
    </section>
  );
}
```

---

## Scroll-Triggered Feature Section

### Pinned Left / Scrolling Right Layout
```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

const features = [
  { title: "Lightning Fast", description: "Built on Next.js for instant page loads.", image: "/feature-1.jpg" },
  { title: "Pixel Perfect", description: "Every detail considered and refined.", image: "/feature-2.jpg" },
  { title: "Fully Animated", description: "GSAP-powered scroll interactions.", image: "/feature-3.jpg" },
];

export function Features() {
  const container = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    // Pin the left text column
    ScrollTrigger.create({
      trigger: container.current,
      start: "top top",
      end: "bottom bottom",
      pin: ".features-text",
      pinSpacing: false,
    });

    // Reveal each feature image on scroll
    features.forEach((_, i) => {
      gsap.from(`.feature-image-${i}`, {
        opacity: 0,
        y: 80,
        duration: 1,
        ease: "power3.out",
        scrollTrigger: {
          trigger: `.feature-block-${i}`,
          start: "top 60%",
          toggleActions: "play none none reverse",
        },
      });
    });
  }, { scope: container });

  return (
    <section ref={container} className="relative">
      <div className="grid grid-cols-1 md:grid-cols-2">
        {/* Pinned left column */}
        <div className="features-text h-screen flex flex-col justify-center px-8 md:px-16">
          <span className="text-sm font-medium text-accent uppercase tracking-widest">Features</span>
          <h2 className="mt-4 text-4xl md:text-5xl font-bold tracking-tight">
            Built for the modern web
          </h2>
          <p className="mt-4 text-muted text-lg max-w-md">
            Every component engineered for performance, accessibility, and visual impact.
          </p>
        </div>

        {/* Scrolling right column */}
        <div className="py-[50vh]">
          {features.map((feature, i) => (
            <div key={i} className={`feature-block-${i} min-h-screen flex items-center px-8 md:px-16`}>
              <div className={`feature-image-${i} w-full`}>
                <div className="aspect-[4/3] rounded-2xl overflow-hidden bg-gray-100">
                  <img src={feature.image} alt={feature.title} className="w-full h-full object-cover" />
                </div>
                <h3 className="mt-6 text-2xl font-semibold">{feature.title}</h3>
                <p className="mt-2 text-muted">{feature.description}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
```

### Alternative: Stacked Card Reveal
```tsx
useGSAP(() => {
  const cards = gsap.utils.toArray<HTMLElement>(".feature-card");

  const tl = gsap.timeline({
    scrollTrigger: {
      trigger: container.current,
      start: "top top",
      end: `+=${cards.length * 100}vh`,
      pin: true,
      scrub: 1,
    },
  });

  cards.forEach((card, i) => {
    if (i > 0) {
      tl.fromTo(card,
        { yPercent: 100, opacity: 0 },
        { yPercent: 0, opacity: 1, duration: 1 },
      );
    }
    if (i < cards.length - 1) {
      tl.to(card, { scale: 0.9, opacity: 0.5, duration: 0.5 });
    }
  });
}, { scope: container });
```

---

## Bento Grid Section

A grid of mixed-size cards with staggered scroll-reveal animations and subtle hover effects. The flat aesthetic avoids heavy shadows — relying on borders, background shifts, and radius for visual separation.

### Bento Grid with Stagger Reveal
```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

const bentoItems = [
  { title: "Analytics", description: "Real-time insights into your performance.", span: "md:col-span-2 md:row-span-2" },
  { title: "Integrations", description: "Connect your favorite tools.", span: "" },
  { title: "Security", description: "Enterprise-grade protection.", span: "" },
  { title: "Collaboration", description: "Work together seamlessly.", span: "md:col-span-2" },
  { title: "Automation", description: "Set it and forget it.", span: "" },
];

export function BentoGrid() {
  const container = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    gsap.from(".bento-card", {
      y: 60,
      opacity: 0,
      duration: 0.8,
      stagger: 0.1,
      ease: "power3.out",
      scrollTrigger: {
        trigger: container.current,
        start: "top 75%",
        toggleActions: "play none none reverse",
      },
    });
  }, { scope: container });

  return (
    <section ref={container} className="py-32 px-6 md:px-16">
      <div className="max-w-7xl mx-auto">
        <span className="text-xs font-semibold uppercase tracking-widest text-neutral-500">
          Features
        </span>
        <h2 className="mt-4 text-4xl md:text-5xl font-light tracking-tight">
          Everything you need
        </h2>

        <div className="mt-16 grid grid-cols-1 md:grid-cols-3 gap-4">
          {bentoItems.map((item, i) => (
            <div
              key={i}
              className={`bento-card group bg-white rounded-3xl border border-neutral-200 p-8 transition-colors duration-300 hover:bg-neutral-50 ${item.span}`}
            >
              {/* Optional: image or icon area */}
              <div className="aspect-video rounded-2xl bg-neutral-100 mb-6 overflow-hidden">
                <img
                  src={`/bento-${i + 1}.jpg`}
                  alt={item.title}
                  className="w-full h-full object-cover group-hover:scale-105 transition-all duration-700"
                />
              </div>
              <h3 className="text-xl font-semibold">{item.title}</h3>
              <p className="mt-2 text-neutral-500 text-sm">{item.description}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
```

Design notes for the bento grid aesthetic:
- Cards use `bg-white`, `rounded-3xl`, and `border border-neutral-200` — no drop shadows
- Hover state shifts background to `neutral-50` for subtle feedback
- Images inside cards use `object-cover` with `rounded-2xl` containers
- The large featured card spans 2 columns and 2 rows via `md:col-span-2 md:row-span-2`
- Gap is tight (`gap-4`) to create a cohesive mosaic feel

---

## Visual Showcase

### Horizontal Scroll Gallery
```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

const projects = [
  { title: "Project Alpha", category: "Web Design", image: "/project-1.jpg" },
  { title: "Project Beta", category: "Branding", image: "/project-2.jpg" },
  { title: "Project Gamma", category: "Development", image: "/project-3.jpg" },
  { title: "Project Delta", category: "UI/UX", image: "/project-4.jpg" },
];

export function Showcase() {
  const container = useRef<HTMLDivElement>(null);
  const wrapperRef = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    const cards = gsap.utils.toArray<HTMLElement>(".showcase-card");

    gsap.to(cards, {
      xPercent: -100 * (cards.length - 1),
      ease: "none",
      scrollTrigger: {
        trigger: wrapperRef.current,
        start: "top top",
        end: () => `+=${wrapperRef.current!.scrollWidth - window.innerWidth}`,
        pin: true,
        scrub: 1,
        invalidateOnRefresh: true,
      },
    });

    // Parallax effect on each card's image
    cards.forEach((card) => {
      const img = card.querySelector("img");
      gsap.fromTo(img,
        { xPercent: -15 },
        {
          xPercent: 15,
          ease: "none",
          scrollTrigger: {
            trigger: card,
            containerAnimation: gsap.getById("horizontal") || undefined,
            start: "left right",
            end: "right left",
            scrub: true,
          },
        }
      );
    });
  }, { scope: container });

  return (
    <section ref={container} className="bg-primary text-white">
      <div className="py-20 px-8 md:px-16 max-w-7xl mx-auto">
        <span className="text-sm font-medium text-accent uppercase tracking-widest">
          Showcase
        </span>
        <h2 className="mt-4 text-4xl md:text-5xl font-bold tracking-tight">
          Selected Work
        </h2>
      </div>
      <div ref={wrapperRef} className="flex w-max">
        {projects.map((project, i) => (
          <div
            key={i}
            className="showcase-card w-[80vw] md:w-[50vw] h-screen flex-shrink-0 px-4 flex items-center"
          >
            <div className="w-full">
              <div className="aspect-[16/10] rounded-2xl overflow-hidden">
                <img
                  src={project.image}
                  alt={project.title}
                  className="w-[130%] h-full object-cover"
                />
              </div>
              <div className="mt-6 flex items-center justify-between">
                <h3 className="text-2xl font-semibold">{project.title}</h3>
                <span className="text-sm text-white/50">{project.category}</span>
              </div>
            </div>
          </div>
        ))}
      </div>
    </section>
  );
}
```

---

## Metrics Section

Large numbers that count up from 0 when scrolled into view. Pairs well with the tiny uppercase micro-copy style for labels.

### Animated Metrics Row
```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

const metrics = [
  { value: 2500, suffix: "+", label: "Projects Delivered" },
  { value: 99, suffix: "%", label: "Client Satisfaction" },
  { value: 15, suffix: "M+", label: "Users Reached" },
  { value: 50, suffix: "+", label: "Team Members" },
];

export function Metrics() {
  const container = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    const counters = gsap.utils.toArray<HTMLElement>(".metric-number");

    counters.forEach((counter) => {
      const target = parseInt(counter.dataset.target || "0", 10);
      const suffix = counter.dataset.suffix || "";
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
          counter.textContent = Math.round(obj.value).toLocaleString() + suffix;
        },
      });
    });

    // Stagger the entire section
    gsap.from(".metric-item", {
      y: 40,
      opacity: 0,
      duration: 0.8,
      stagger: 0.15,
      ease: "power3.out",
      scrollTrigger: {
        trigger: container.current,
        start: "top 75%",
      },
    });
  }, { scope: container });

  return (
    <section ref={container} className="py-32 px-6 md:px-16 bg-white border-y border-neutral-200">
      <div className="max-w-7xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-12">
        {metrics.map((metric, i) => (
          <div key={i} className="metric-item text-center">
            <span
              className="metric-number text-5xl md:text-6xl font-light tracking-tight"
              data-target={metric.value}
              data-suffix={metric.suffix}
            >
              0
            </span>
            <p className="mt-3 text-xs font-semibold uppercase tracking-widest text-neutral-500">
              {metric.label}
            </p>
          </div>
        ))}
      </div>
    </section>
  );
}
```

Design notes: The massive `font-light` numbers paired with tiny `text-xs uppercase tracking-widest` labels creates strong typographic contrast — a hallmark of the premium minimalist aesthetic.

---

## Testimonials

### Staggered Card Reveal
```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";

export function Testimonials() {
  const container = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    gsap.from(".testimonial-card", {
      y: 60,
      opacity: 0,
      duration: 0.8,
      stagger: 0.15,
      ease: "power3.out",
      scrollTrigger: {
        trigger: container.current,
        start: "top 70%",
        toggleActions: "play none none reverse",
      },
    });
  }, { scope: container });

  return (
    <section ref={container} className="py-32 px-8 md:px-16">
      <div className="max-w-7xl mx-auto">
        <h2 className="text-4xl md:text-5xl font-bold tracking-tight text-center">
          What people say
        </h2>
        <div className="mt-16 grid grid-cols-1 md:grid-cols-3 gap-8">
          {/* Repeat testimonial-card pattern */}
          <div className="testimonial-card p-8 rounded-2xl bg-gray-50 border border-gray-100">
            <p className="text-lg text-muted leading-relaxed">
              &ldquo;Testimonial text here.&rdquo;
            </p>
            <div className="mt-6 flex items-center gap-3">
              <div className="w-10 h-10 rounded-full bg-gray-200" />
              <div>
                <p className="text-sm font-medium">Name</p>
                <p className="text-xs text-muted">Role, Company</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
```

---

## CTA and Footer

### Animated CTA Section
```tsx
"use client";
import { useRef } from "react";
import { useGSAP } from "@gsap/react";
import gsap from "gsap";

export function CTAFooter() {
  const container = useRef<HTMLDivElement>(null);

  useGSAP(() => {
    // CTA reveal
    const tl = gsap.timeline({
      scrollTrigger: {
        trigger: ".cta-section",
        start: "top 70%",
        toggleActions: "play none none reverse",
      },
    });

    tl.from(".cta-title", { y: 60, opacity: 0, duration: 1, ease: "power3.out" })
      .from(".cta-button", { y: 40, opacity: 0, duration: 0.6 }, "-=0.4");

    // Footer links stagger
    gsap.from(".footer-col", {
      y: 30,
      opacity: 0,
      duration: 0.6,
      stagger: 0.1,
      ease: "power3.out",
      scrollTrigger: {
        trigger: ".footer-grid",
        start: "top 85%",
      },
    });
  }, { scope: container });

  return (
    <div ref={container}>
      {/* CTA */}
      <section className="cta-section py-32 px-8 text-center">
        <div className="max-w-3xl mx-auto">
          <h2 className="cta-title text-4xl md:text-6xl font-bold tracking-tight">
            Ready to build something extraordinary?
          </h2>
          <button className="cta-button mt-10 px-10 py-4 bg-primary text-white text-sm font-medium rounded-full hover:bg-primary/90 transition-all hover:scale-105">
            Start Your Project
          </button>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-gray-200 py-16 px-8 md:px-16">
        <div className="footer-grid max-w-7xl mx-auto grid grid-cols-2 md:grid-cols-4 gap-8">
          <div className="footer-col">
            <h4 className="text-sm font-semibold uppercase tracking-wider mb-4">Product</h4>
            <ul className="space-y-2 text-sm text-muted">
              <li><a href="#" className="hover:text-primary transition-colors">Features</a></li>
              <li><a href="#" className="hover:text-primary transition-colors">Pricing</a></li>
              <li><a href="#" className="hover:text-primary transition-colors">Changelog</a></li>
            </ul>
          </div>
          <div className="footer-col">
            <h4 className="text-sm font-semibold uppercase tracking-wider mb-4">Company</h4>
            <ul className="space-y-2 text-sm text-muted">
              <li><a href="#" className="hover:text-primary transition-colors">About</a></li>
              <li><a href="#" className="hover:text-primary transition-colors">Blog</a></li>
              <li><a href="#" className="hover:text-primary transition-colors">Careers</a></li>
            </ul>
          </div>
          <div className="footer-col">
            <h4 className="text-sm font-semibold uppercase tracking-wider mb-4">Resources</h4>
            <ul className="space-y-2 text-sm text-muted">
              <li><a href="#" className="hover:text-primary transition-colors">Docs</a></li>
              <li><a href="#" className="hover:text-primary transition-colors">Support</a></li>
              <li><a href="#" className="hover:text-primary transition-colors">Status</a></li>
            </ul>
          </div>
          <div className="footer-col">
            <h4 className="text-sm font-semibold uppercase tracking-wider mb-4">Legal</h4>
            <ul className="space-y-2 text-sm text-muted">
              <li><a href="#" className="hover:text-primary transition-colors">Privacy</a></li>
              <li><a href="#" className="hover:text-primary transition-colors">Terms</a></li>
            </ul>
          </div>
        </div>
        <div className="max-w-7xl mx-auto mt-12 pt-8 border-t border-gray-100 flex items-center justify-between text-sm text-muted">
          <p>&copy; 2024 Brand. All rights reserved.</p>
          <div className="flex gap-4">
            <a href="#" className="hover:text-primary transition-colors">Twitter</a>
            <a href="#" className="hover:text-primary transition-colors">GitHub</a>
            <a href="#" className="hover:text-primary transition-colors">LinkedIn</a>
          </div>
        </div>
      </footer>
    </div>
  );
}
```

---

## Page Assembly

### Composing the Full Page
```tsx
// app/page.tsx
import { Navigation } from "@/components/Navigation";
import { Hero } from "@/components/Hero";
import { Features } from "@/components/Features";
import { Showcase } from "@/components/Showcase";
import { Testimonials } from "@/components/Testimonials";
import { CTAFooter } from "@/components/CTAFooter";

export default function Home() {
  return (
    <main>
      <Navigation />
      <Hero />
      <Features />
      <Showcase />
      <Testimonials />
      <CTAFooter />
    </main>
  );
}
```

Each component is fully self-contained with its own refs, animations, and cleanup. ScrollTrigger instances are scoped to their respective containers and will not conflict.
