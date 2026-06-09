# OMS Website — Round 2 Improvements (2026-06-09)

**What to fix next, ranked by conversion impact × effort.**
*Not a bug list — a "would this make someone call OMS?" list.*

---

## 🔴 HIGH IMPACT — do these first

### 1. Wire the contact form to a real backend
**Impact:** Every visitor who hits "Get a quote" right now fills in 5 steps and gets a fake "Message sent!" — lead vanishes.
**Effort:** 10 min once you give me an email + choose Formspree vs Web3Forms.
**Why it matters:** This is the single most broken thing on the site. Pretty much every other improvement is wasted if leads are going to /dev/null.

### 2. Replace the 4 stock "Our Work" images with a "Portfolio coming soon" CTA
**Impact:** Visitors see a project labelled "Calacatta marble kitchen worktop" with a Framer stock image of someone else's kitchen. Anyone searching for "OMS Oxford reviews" will instantly clock this. The trust cost is high.
**Effort:** 30 min.
**Options:**
- (a) Replace the 4 project panels with a single "Book a workshop visit to see our portfolio in person" CTA (most honest, preserves the gold-on-dark aesthetic)
- (b) Keep the panel layout, swap each image for a real OMS project photo (you'd need to send me 4 photos)
- (c) Add a "Sample portfolio — real client photos coming soon" disclaimer to the section

**My pick:** (a). Workshop visits are a high-value lead anyway — turns the section from a trust liability into a CTA.

### 3. Either real social URLs or remove the 3 fake icons
**Impact:** Footer has 3 social circles (Instagram, Facebook, Twitter-looking) that are `<div>` not `<a>`. Visitors will click and nothing happens. Worse than not having them.
**Effort:** 5 min.
**Options:**
- (a) Drop the 3 icons entirely — cleaner, honest
- (b) Replace with "Follow our work-in-progress on Instagram: @oms.stone" once you set up an account
- (c) Link to the WhatsApp button + email instead

**My pick:** (a) for now, add real socials later when accounts exist.

---

## 🟠 MEDIUM IMPACT — would noticeably lift conversion

### 4. Add a phone number to the hero
**Impact:** The hero has "Get a quote" but the phone is buried in the FAQ. People browsing on a phone want to call, not fill a 5-step form. Add a secondary "or call 07716 534984" right under the primary CTA. Same number the WhatsApp button uses.
**Effort:** 5 min.

### 5. Add an email link
**Impact:** No `mailto:` anywhere on the site. Some people prefer email over forms and WhatsApp. Once you share an email, drop a `mailto:` in the contact section + footer.
**Effort:** 2 min.

### 6. Strip or label the 6 fabricated testimonials
**Impact:** 6 testimonials with first-name + area ("Charlotte H., Chelsea"), no last names, no matching project photos, all in the same voice. ASA / Google reviews compliance risk. Also: a real Chelsea customer will Google "OMS Chelsea" and find a testimonial they didn't give.
**Effort:** 10 min.
**Options:**
- (a) Add a banner above the marquee: "Sample testimonials — we'll feature real client reviews here once projects complete"
- (b) Delete the section entirely, replace with "As featured in / accredited by" trust badges (once you have any)
- (c) Wait for 3-5 real reviews before showing the section
**My pick:** (a) + mark the data attribute on the carousel so it's clear in dev tools. Or (b) for cleanest look.

### 7. Add "Areas we cover" section
**Impact:** The page mentions "Oxfordshire, London and the Home Counties" but doesn't list the towns. Real customers search "marble worktop Bicester" or "granite worktop Marlow" — show those explicit service area chips. The service area strip pattern works well on Fair Crest / Hayat Care already.
**Effort:** 20 min.
**My pick:** list 12-20 towns OMS actually serves (Abingdon, Oxford, Bicester, Witney, Didcot, Banbury + London boroughs OMS travels to).

### 8. Add a process timeline section
**Impact:** FAQ mentions a 4-step process. That's worth its own section — visual timeline with the 4 stages (Consult → Template → Fabricate → Install) and typical 2-4 week timeline. Builders and homeowners both want to know "how long will my kitchen be out of action?"
**Effort:** 30 min.

### 9. "Free site visit" CTA banner
**Impact:** Top of page or sticky banner saying "Free, no-obligation home visit within 48 hours." Removes the friction of wondering if there's a callout fee. High-converting pattern for trades businesses.
**Effort:** 15 min.

---

## 🟡 Polish

11. ~~Footer year 2025 → 2026 + auto-update~~ — **DONE** (auto-updates via JS)
12. ~~24 testimonial cards duplicated via marquee animation~~ — **N/A** (marquee needs duplication for seamless loop)
13. ~~6 testimonial avatar URLs return 0×0~~ — **DONE** (replaced with gold gradient + initials fallback, 24 cards all render)
14. ~~Cookie banner Decline should clear cookies~~ — **DONE** (clears `oms_*`/`_ga`/`plausible` cookies if present; no-op now since no analytics)
15. ~~WhatsApp button overlaps cookie banner on mobile~~ — **DONE** (WA repositions to `bottom: 200px` while banner is up, animates to `bottom: 24px` after user chooses)
16. ~~No `prefers-reduced-motion` support~~ — **DONE** (kills all animations for users with motion sensitivity)
17. ~~No aria-current on nav as you scroll~~ — **DONE** (IntersectionObserver watches sections, adds `aria-current="page"` + visual dot indicator)

## What I'd do in the next 30 minutes

1. **Wire the form** (1, after you give me email + backend choice) — biggest single win
2. **Strip stock "Our Work" → workshop visit CTA** (2) — biggest trust win
3. **Remove the 3 fake social icons** (3) — 5-min honesty fix
4. **Add phone to hero** (4) — quick conversion lift
5. **Add `mailto:` in footer** (5, after you give email) — quick
6. **Mark testimonials as samples** (6) — quick

That's a 30-min pass that gets the site to 7/10 launchable.

**Bigger build next:** real process timeline section (8) + service area chips (7) + free site visit banner (9) — about 1 hour total, would get to 8.5/10.
