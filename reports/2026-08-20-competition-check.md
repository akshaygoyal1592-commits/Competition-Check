# Weekly Competition Check — 2026-08-20

**Baseline report (week 1).** No prior week to compare against; everything here is the starting picture. Subsequent reports lead with week-over-week deltas.

## TL;DR

- **The two companies are running opposite playbooks.** Bloom buys growth with Meta performance marketing into a persona-segmented quiz funnel; Eduro compounds organic growth with programmatic NCERT SEO and student-community seeding, and has **no Meta pixel installed at all**.
- **Bloom's real offer is ₹9 for a demo class that silently becomes ₹799/month** via a Razorpay UPI AutoPay mandate after 3 days. This is hardcoded in their production JS, not inferred. The mandate is load-bearing for their unit economics — and is generating "scam" reviews on the Play Store.
- **Eduro is bigger on Android despite zero paid social**: ~67.8K installs vs Bloom's ~31K, 4.55★ from 543 ratings vs Bloom's 3.8★ from 45, launched 5 months earlier (Nov 2025 vs Apr 2026).
- **Bloom's creative operation is clearly scaling**: 16+ bespoke direct-response videos across 4 parent personas, persona-specific paywall videos, server-side paywall config (price testing), A/B onboarding routes, and adset/creative-level UTM capture. Nobody builds that without real ad volume behind it.
- **Eduro is instrumented for paid but barely spending**: a Google Ads conversion tag (AW-17634968559) is live site-wide, and the ₹1/3-day trial is the standard Indian performance-marketing device — but there is no Meta pixel, no growth-marketing hire, and no ad creative anywhere. They are paid-*ready*, not paid-*scaling*.
- **Estimated CAC**: Bloom ≈ **₹1,800–4,000 central** per first paying month (media only) against a ₹799/month ticket — roughly 2.5–5 months of subscription to pay back, i.e. break-even-to-underwater unless the autopay mandate extends lifetime. Eduro ≈ **₹2,900–8,600** per paying subscriber if acquired via paid installs against a ₹499/month ticket — which is why they *can't* buy growth and are right not to try.
- **Money is asymmetric**: Bloom's parent (Companion Labs) has a **$2.5M seed led by Peak XV's Surge**; Eduro has ₹5,000 paid-up capital, no disclosed funding, and 2 directors. Bloom can outspend Eduro at will — the question is whether the ₹799 ticket lets them.
- **Biggest thing to watch**: whether Eduro turns on Meta. A pixel appearing on eduro.live is the single highest-signal early warning that they've raised and are ready to scale.

---

## Bloom (bloomclasses.in / CMPN Technologies "Companion Labs")

### Ads

**Direct enumeration was not possible** — Meta Ad Library returns HTTP 403 with a JS bot-challenge to every server-side fetch, and Google Ads Transparency Center is a CAPTCHA-walled JS app. The picture below is reconstructed from their own production code, Play Store data, and their Facebook page. See *Sources & data-access notes* for the 2-minute manual check that closes this gap.

**Hard evidence they are running Meta at scale:**

| Signal | Evidence |
|---|---|
| Meta Pixel | `fbq('init','890261980731916')` + PageView in the site bundle |
| Ad-level attribution | Funnel captures `utm_source, utm_medium, utm_campaign, **utm_adset, utm_adcreative**` — adset/creative-level naming is Meta campaign convention |
| Creative volume | **16+ bespoke videos** on `bloomcdn.cmpntech.com`, organised by persona |
| Creative iteration | Assets versioned 1–4 per persona; one named `New Payment Page Video - Final (All White).mp4` |
| Price testing | Razorpay `subscriptions/paywall-config` — server-configurable paywall |
| A/B testing | Two hardcoded quiz variants plus an `/onboarding-test` route |
| Web-to-app intent | Play link carries `&listing=web2app` — a *custom Play Store listing* built for ad traffic |
| Hiring | Open **Growth Marketing Manager** role: "scale performance marketing for consumer apps" |
| No Google Ads | **No `AW-` conversion tag found** in the bundle — Meta is the channel, Google is not (yet) |

**The creative matrix (this is what's scaling).** One concept — a parent quiz — branched into 4 personas by the child's marks band, each with its own video playlist:

| Persona | Trigger (marks) | Creative angle |
|---|---|---|
| **A** | <50% | Foundation Building, Personal Teacher, Practice Worksheets, Concept Clarity |
| **B** | 50–70% | Confidence Building, Unlimited Doubt Support, Gap Finder |
| **C** | 70–90% | Mistake Fixer ("lost marks to silly mistakes — once those stopped, he scored 98%") |
| **D** | 90%+ | Extra Practice, **Olympiad Prep**, JEE-foundation angle |

**Hooks in market:** "₹9 demo class" · "created by IIT teachers" · "Trusted by 50,000+ parents" · "Milind Sir takes your child's first class personally" · Hinglish delivery · weekly WhatsApp progress reports · anchor discounts (₹2,400→₹99, ₹24,000→₹799).

**Format:** short vertical video / FB Reels. Confirmed reel on their page: *"1-on-1 AI Maths classes, only on Bloom!"* (id 1350408130265800).

**Targeting read:** squarely **parent-targeted** — "Which class is your child in?", parent WhatsApp reports, parent-wallet price anchors.

**Channel absence:** no Instagram handle, no YouTube channel, no iOS app found. Meta paid social + web funnel is effectively the entire acquisition stack.

### CAC (estimated)

> ⚠️ **All figures below are estimates** built from published India benchmarks and Bloom's observed funnel. Bloom publishes no CAC. The benchmark research initially assumed a ₹10k–50k ticket typical of demo-class edtech; **that is wrong for Bloom** — their actual ticket is ₹799/month, so the model below is rebuilt around a low-ticket subscription funnel.

Bloom's funnel has **no counselor call and no lead-nurture stage** — payment happens on the web before any human contact. So the right formula is a paid-trial chain, not a lead→demo→close chain:

**CAC = CPC ÷ (LP→phone %) ÷ (phone→₹9 trial %) ÷ (trial→retained payer %)**

| Input | Low | Central | High | Basis |
|---|---|---|---|---|
| Meta India education CPC | ₹7 | ₹12 | ₹21 | Superads India education CPC $0.079–0.241 |
| Quiz start → phone submitted | 35% | 25% | 15% | Estimate; quiz funnels convert well, they optimise heavily |
| → **cost per lead** | **₹20** | **₹48** | **₹140** | widened to **₹50 / ₹120 / ₹250** against Meta's ₹150–400 education CPL benchmark |
| Phone → ₹9 trial paid | 18% | 10% | 6% | Estimate; UPI mandate setup is real friction |
| → **cost per ₹9 trial** | **₹280** | **₹1,200** | **₹4,200** | |
| Trial → ₹799 charge collected & kept | 55% | 45% | 30% | Estimate; mandate auto-charges (mechanical), net of refunds they grant |
| **→ CAC per paying subscriber** | **≈₹500** | **≈₹2,700** | **≈₹14,000** | central band **₹1,800–4,000** |

**Payback:** ₹799/month gross ≈ ₹780 net of Razorpay fees. Central CAC ₹2,700 ⇒ **~3.5 months of retained subscription to break even**. Low-ticket Indian edtech monthly churn (est. 25–40%) implies an average lifetime of ~2.5–4 months. **Bloom sits right at the edge of paid-acquisition viability.**

**The strategic conclusion:** the UPI AutoPay mandate isn't a billing detail — it's the mechanism that makes their CAC work. Passive continuation (users must actively cancel a mandate) is what stretches lifetime past payback. That is also exactly what's generating their 1-star reviews. Their unit economics and their reputational risk are the same design decision.

### Funnel

```
Meta ad (persona video)
  → bloomclasses.in/  ← the root URL IS quiz question 1; there is no landing page
  → class (1–10) → marks band → struggles → solutions → testimonials → goal
  → persona assigned A/B/C/D from marks band
  → /login  — phone + OTP only (no email, no child name, no city)
  → /paywall — persona-specific sales video ("Mihir Sir"), then:
        Pay today  ₹9   |   After 3 days  ₹799/month (30 classes)
  → Razorpay SUBSCRIPTION checkout (UPI AutoPay mandate)
  → /get-app — "1. Download the app  2. Book Demo Timing on App"
  → Android app (com.cmpntech.tutor, listing=web2app) → demo class in-app
```

**Pricing — two coexisting frames (offer testing in progress):**

| Where | Offer | Price | Anchor |
|---|---|---|---|
| bloomclasses.in funnel | Demo class | **₹9** one-time | — |
| bloomclasses.in funnel | Auto-converts after 3 days | **₹799/month** ("30 classes") | recurring mandate |
| cmpntech.com/pricing | 3 classes, one-time | **₹99** | ~~₹2,400~~ (96% off) |
| cmpntech.com/pricing | 30 classes, one-time | **₹799** | ~~₹24,000~~ (97% off) |

Implied ₹26.6/class. No sibling offers, no annual plan, no coupons. Refunds: within 7 days, "at our discretion".

**App:** Android only — `com.cmpntech.tutor`, **3.8★ / 45 ratings, ~30,954 installs** (Play's embedded counter; displayed bucket "10K+"), released 24 Apr 2026, updated 18 Aug 2026. No iOS app (though their schema.org markup claims "iOS, Android" — watch for a launch).

### Traction signals

- **Funding: $2.5M seed led by Peak XV's Surge** (All In Capital, DeVC, UntitledVC + angels), announced Feb–Mar 2026. **Critical context: the round was raised for "Mello", a vernacular AI-companion entertainment app. Bloom is a pivot.** The careers page still lists a Content Manager for "immersive RPG worlds", so Mello likely still runs in parallel — meaning Bloom may not have the founders' full attention or the full $2.5M.
- **Founders:** Akshay Jhanwar (ex-CRED, BITS Pilani) and Ajit Pol (ex-Flipkart, Leap).
- **Team:** ~8 people (Tracxn, Apr–May 2026). 4 open Bangalore roles including the Growth Marketing Manager.
- **Install velocity:** review velocity roughly tripled in Jun–Jul 2026; AppBrain's (stale, ~June) snapshot showed ~350 installs/day. Consistent with always-on paid acquisition, not organic virality.
- **Unverified claim:** "Trusted by 50,000+ parents" — exceeds their ~31K Android installs and has no third-party validation.

### Credibility weak spots (usable competitive ammunition)

1. **Testimonials are synthetic** — the same 4 stock student photos (Ishaan, Rahul, Ananya, Darshan) are reused across all 4 personas with different grades and before/after marks, including quotes whose gender doesn't match the name on the card.
2. **The teacher persona has two names** — "Milind Sir" on cmpntech.com, but the live funnel ships `mihir-sir.jpeg` with alt text "Mihir Sir". No independent identity for either could be found.
3. **"Created by IIT teachers"** appears in their Facebook ad copy but nowhere on their own site.
4. **Play reviews allege undisclosed auto-debit:** *"they ask to pay 9/- for a trail class and started auto deduction of 799/- ... auto pay period for next 10 year that is 2036"*. Developer replies offer full refunds.
5. **Two Play reviews posted the same day are near-verbatim duplicates** of each other — templated or incentivised reviews.
6. Internal inconsistencies: Class 1–10 (web) vs 4th–10th (Play); "1000+ questions" vs "1 Lakh+ practice"; one-time packs vs auto-renewing subscription.

---

## Eduro (eduro.live / EDURO TUTORS PRIVATE LIMITED)

### Ads

**Assessment: organic-dominant, with Google Ads instrumented but no evidence of meaningful spend.**

| Signal | Finding |
|---|---|
| **Meta pixel** | **ABSENT** — grepped raw HTML of `/`, `/auth`, `/pricing` for `fbq(` / `connect.facebook.net`: zero hits. Strong negative evidence for Meta web campaigns. (Meta *app-install* campaigns need no pixel, so not fully excluded.) |
| **Google Ads** | **PRESENT** — `gtag('config','AW-17634968559')`, script id `"google-ads"`, site-wide in the Next.js root layout. Points to Search/PMax/Demand Gen landing on the web funnel. |
| Analytics | GA4 `G-TW33E0DLM1` + Microsoft Clarity (conversion-optimisation stack) |
| MMP (AppsFlyer/Adjust/Branch) | None found — no app-install attribution infrastructure |
| Apple Search Ads | No evidence; iOS footprint too small to matter |
| Growth hires | **None.** They were recruiting a "content creator who understands students and internet culture" — an organic content signal, not a performance-marketing one |

**Their acquisition engine is SEO + community, not ads:**

- **Programmatic NCERT SEO** — several hundred URLs in the sitemap, the large majority NCERT chapter pages, plus class/subject hubs, guides, sample papers, and 5 commercial `/ai-tutor/` money pages (`best-free-ai-tutor-india`, `class-10`, `class-12`, `jee`, `neet`). All actively regenerated (lastmod 2026-08-04). *Note: URL counts varied between 238 and 405 across three fetches this week — the sitemap appears to be actively growing; treat the count as approximate and track the trend.*
- **Community seeding** — posts into CBSE student Facebook groups ("A **Free** AI Tutor for Classes 6-12 🚀 Introducing **Eduro**"), plus a Discord server and a Reddit community linked from the footer.
- **Referral loop** — "Invite N friends, get 7 days free", WhatsApp-first sharing, `/install/referral` deep links, `referral_shared_whatsapp` events.

**Creative hooks (from owned copy — the likely angles if they do start advertising):** "Free AI tutor" (their #1 hook, both in group seeding and their top SEO money page) · "Built by alumni from IIT Madras & IIT Delhi" · "10-minute micro-sessions / learn smarter, not longer" · voice-first live whiteboard · board-exam and JEE/NEET prep.

**Targeting read: student-targeted**, not parent-targeted — exam anxiety, doubts, revision, streaks. The one parent-wallet line is "less than the price of one tuition class". This is the mirror image of Bloom.

### CAC (estimated)

> ⚠️ Estimates from category benchmarks. Eduro publishes nothing.

**CAC = CPI ÷ (install→paying %)**

| Method | Arithmetic | Result |
|---|---|---|
| Category median | India edtech CPI ₹40–120 ÷ 1.4% (RevenueCat 2026 median D35 download→paying for education apps, India/SEA) | **₹2,900–8,600** per payer |
| Funnel build-up (best) | ₹40 ÷ 8% install→trial ÷ 40% trial→paid | ₹1,250 |
| Funnel build-up (central) | ₹60–80 ÷ 4–5% ÷ 25–30% | ₹4,000–7,000 |
| Funnel build-up (worst) | ₹120 ÷ 2% ÷ 20% | ₹30,000 |

**Both methods agree on a central band of ~₹3,000–8,000 per paying subscriber from paid installs.**

**Payback at ₹499/month: 6–16 months.** Meanwhile RevenueCat puts median realised revenue-per-install for education apps in India/SEA at only ~$0.11 (₹9–10) by D60 — paying ₹40–120 per install against ₹10 of D60 revenue is 4–12× underwater on a two-month view.

**Conclusion: Eduro cannot buy growth at benchmark conversion rates, and appears to know it.** Their organic-first motion isn't a stylistic preference, it's the only model their ₹499 ticket supports. Their **blended** CAC — dominated by free SEO and referral installs — is plausibly ₹200–1,000 per payer (estimate), which is a genuinely strong position. This is the PhysicsWallah playbook (marketing <10% of revenue on organic reach), not the Byju's playbook.

### Funnel

```
Organic: NCERT/guide SEO page  ──┐
Community: FB group / Discord ───┤
Google Ads (AW- tag) ────────────┤
                                 ├→ /auth  (Continue with Google | Phone + OTP, Firebase)
                                 │
                                 → /get-started: goal (Board Exam/finals) → grade → stream
                                   → curriculum → language (English vs **Hinglish**)
                                 → study plan built around exam date (~20-min daily missions)
                                 → /home: live whiteboard tutor session
                                       metered in FREE MINUTES PER DAY
                                 → quota exhausted → "Unlock Pro Access" modal
                                 → ₹1 for 3 days (UPI AutoPay, Android) → ₹499/month "Topper"
```

**Retention mechanics (notably stronger than Bloom's):** daily streak + XP + weekly leaderboard, "free minutes doubled" bonus events, exam-date-driven study plans, refer-3-friends-get-7-days-free, weekly parent recaps.

**Pricing:**

| Plan | Price | Notes |
|---|---|---|
| Free | ₹0 "forever" | Metered in **minutes/day** (exact quota is server-side — unknown) |
| Trial | **₹1 for 3 days** | Full Topper access, UPI AutoPay on Android |
| Topper | **₹499/month** | Auto-renews, cancel anytime, no annual plan |
| iOS-only: Pro Student | **₹99/week** | Not advertised on the website |
| iOS-only: "Eduro" | **₹199** | Unclear whether current mid-tier or legacy SKU |

**App:** `com.eduro.app` — **4.55★ / 543 ratings, ~67,841 installs** (displayed "50K+"), released 26 Nov 2025, updated 19 Aug 2026 (v1.0.34, near-weekly cadence). Rating distribution: 387×5★, 103×4★, 25×3★, 15×2★, 10×1★. iOS listing exists but has too few ratings to display an overview.

**What users complain about (their exploitable weaknesses):**
- **Free tier too tight** — the dominant complaint: *"it's actually not free, u actually have to pay to study more"*, *"very low free study time"*.
- **Aggressive upgrade nagging** — one 1★ review describes a post-limit upgrade popup that froze the screen.
- **Hinglish leaks into English mode** — *"I chose English but the AI bot speaks in Hinglish"*.
- **Diagrams/figures don't render** — a real product gap for Science and Maths.
- **Pacing** — *"takes a long time to complete a chapter by the method the AI teaches"*.
- **No developer replies on any of 97 reviews pulled** — they aren't managing store reputation at all. (Contrast: Bloom actively replies offering refunds.)

### Traction signals

- **Funding: none disclosed.** No Crunchbase/Tracxn/Inc42/Entrackr coverage. Paid-up capital **₹5,000**.
- **Antler India AI Residency** — selected among 12 startups from 1,500+ applications; residency terms are ₹4 Cr for ~11%. **Whether the investment closed is unconfirmed.** If it did, they have ~$450–480K to deploy — enough to start real paid spend.
- **Entity:** EDURO TUTORS PRIVATE LIMITED, CIN U85499KA2025PTC208869, incorporated **22 Sep 2025**, Bangalore (a coworking address).
- **Founders/directors:** Siddharth Srivastava (siddharth@eduro.live) and Abhinav Kankane (INSEAD, ex-P&G/Urban Company/Zalando, IIT Madras).
- **Team:** effectively 2 directors; no LinkedIn company page, no job postings found.
- **Trajectory:** ~68K installs and 543 ratings in ~9 months, near-weekly shipping cadence, from a 2-person bootstrapped team with no paid social. That is a strong organic engine.

---

## Head-to-head read

| | **Bloom** | **Eduro** |
|---|---|---|
| Target | **Parents** (Class 1–10) | **Students** (Class 6–12, JEE/NEET) |
| Wedge | 1-on-1 AI maths tutor, Hinglish teacher persona | Voice-first AI tutor on a live whiteboard, micro-sessions |
| Acquisition | **Meta performance marketing** | **Programmatic SEO + community + referrals** |
| Paid infrastructure | Meta pixel, adset/creative UTMs, 16+ videos, web2app listing | Google Ads tag only; **no Meta pixel**, no MMP |
| Offer | ₹9 demo → **₹799/mo** (autopay mandate) | ₹1/3 days → **₹499/mo** |
| Android installs | ~30,954 | **~67,841** |
| Rating | 3.8★ (45) | **4.55★ (543)** |
| App age | Apr 2026 | Nov 2025 |
| Platforms | Android + web | Android + web + iOS |
| Est. paid CAC / payer | ₹1,800–4,000 central | ₹2,900–8,600 |
| Months to payback | ~3.5 | 6–16 |
| Funding | **$2.5M seed (Peak XV Surge)** | None disclosed (₹5K paid-up) |
| Team | ~8 | 2 |
| Retention design | WhatsApp parent reports; **autopay mandate** | Streaks, XP, leaderboard, referrals, study plans |
| Store reputation mgmt | Replies to reviews, offers refunds | **None** |

**What this means:**

1. **Bloom is buying a market Eduro is earning.** Bloom has 4× the funding and 8× the team but 45% of the installs and a full point lower rating. Their growth is rented; the moment spend stops, so does the funnel.

2. **Neither ticket comfortably supports paid acquisition.** ₹799 and ₹499 per month are both too low for Indian edtech CAC at benchmark conversion rates. Bloom solves this with an autopay mandate that extends lifetime by making cancellation an active step. That works until it becomes a trust problem — and the reviews suggest it already is.

3. **Eduro's 4.55★ from 543 ratings is the single most valuable asset either company holds.** It is Play Store ranking fuel, it lowers organic CPI, and it compounds. Bloom's 3.8★ actively taxes their paid funnel.

4. **The categorical price convention is ₹1-trial → ₹499/month.** A third competitor (EduLevel, edulevel.ai) runs exactly the same structure. Bloom is the outlier at ₹799 — worth watching whether they cut to ₹499.

5. **Opportunities against both:** against Bloom, honest billing and real testimonials are a differentiator, not table stakes — their synthetic testimonials, dual teacher-persona name, and auto-debit complaints are all documented. Against Eduro, the openings are a more generous free tier, working diagrams, true English mode, and *answering your store reviews*.

## Watchlist for next week

**High signal (check these first):**
1. **Does a Meta pixel appear on eduro.live?** Single best early warning that Eduro has raised and is turning on paid. Grep `/`, `/auth`, `/pricing` for `fbq(` / `connect.facebook.net`.
2. **Bloom's active-ad count and creative start dates** in Meta Ad Library (manual browser check — link below). Establishes whether spend is rising and which persona video is longest-running.
3. **Does Bloom's ₹799 hold?** Their paywall is server-configured, so a price test can appear any day. Re-read the funnel config for `directAmount`.
4. **Does an `AW-` Google Ads tag appear on bloomclasses.in?** Would mean channel diversification beyond Meta.

**Steady tracking:**
5. Install counters: Bloom ~30,954 → ?, Eduro ~67,841 → ? (Play embedded field; the displayed bucket is too coarse to show weekly movement).
6. Ratings: Bloom 3.8★/45 → ?, Eduro 4.55★/543 → ?. Watch whether Bloom's auto-debit complaints drag their average further.
7. **Confirmation of the Antler ₹4 Cr investment into Eduro** — any Inc42/Entrackr/YourStory coverage.
8. Bloom's Growth Marketing Manager role — filled? A hire means a spend step-change.
9. **Eduro iOS traction** — currently negligible; a push there would signal budget.
10. Whether Eduro starts replying to Play reviews (a sign they've hired ops).
11. Bloom iOS app launch — their schema.org markup already claims "iOS, Android".

---

## Addendum — Meta strategy teardown (added 2026-08-20, after follow-up)

A second pass tried harder to get the actual ad count, and failed for a reason worth recording precisely. What it *did* recover is a much sharper picture of how Bloom runs Meta, read directly from their shipped code.

### Ad count: still not obtainable from this environment

| Attempt | Result |
|---|---|
| `WebFetch` on Ad Library | HTTP 403 — JS bot challenge |
| `curl` with browser UA + full `Sec-Fetch-*` / `sec-ch-ua` headers | HTTP 403 — same challenge |
| Solving the challenge (POST `/__rd_verify_…?challenge=3`, cookie jar, 5 rounds) | Verify POST returns **302, sets no cookie**; a fresh challenge token is issued each round — never clears |
| Headless Chromium via Playwright (installed, pointed at the on-disk browser) | Chromium cannot reach **any** host through this session's egress proxy — a control fetch of eduro.live fails identically, so this is not a Facebook-specific block |
| Official Ad Library API (`graph.facebook.com/ads_archive`) | **Gateway policy denial** (403 to CONNECT) — not retried, per proxy policy |

Note the distinction: `www.facebook.com` *does* tunnel through the proxy — the 403 is Facebook's own anti-bot challenge against a datacenter IP, not an org policy denial. **A browser on a normal residential connection gets the number in seconds.** The count of active ads, their Library IDs, start dates and impression ranges remain the one genuinely open question in this report.

### Creative inventory: 21 videos, exactly

Enumerated from the production bundle rather than estimated. Previous report said "16+"; the precise figure is **21 distinct video assets** on `bloomcdn.cmpntech.com`:

- **16 persona solution videos** — 4 personas × 4 videos each (`Bloom Solutions - (Persona A–D) - …`)
- **4 persona paywall videos** — `Payment Page Video - (Persona A–D) - All Boards.mp4`
- **1 generic paywall video** — `New Payment Page Video - Final (All White).mp4`
- Plus a non-CDN app-intro asset, `/get-app-intro.mp4`

**Important caveat on interpretation:** these are *post-click funnel* videos, not Meta ad creatives. They tell you how much Bloom has invested in segmented conversion assets — which is a lot — but they are not the ads themselves and should never be quoted as an ad count.

### Four funnel variants, and a live test that guts the quiz

The bundle carries an experiment framework (`bloom_experiment` in localStorage, `?path=` URL parameter, `experiment_assigned` event) with **four** defined variants:

| Variant | Steps | Reading |
|---|---|---|
| `current_landing_page` *(default)* | class → struggles → goal → goal-projection → transformations | 5 steps, aspiration-led |
| `persona_text` | class → marks → struggles → solutions → testimonials | 5 steps, persona via text |
| `persona_video` | same 5 steps | persona via the 16 solution videos |
| `short_path` | **class only** | 1 step, straight to paywall |

Two mechanics matter here:

1. **The random rotation pool contains only two variants** — `['current_landing_page', 'short_path']` — and randomisation runs *only* on the `/onboarding-test` route. Plain `/` traffic defaults to `current_landing_page`.
2. **All four variants are addressable by URL** (`?path=persona_video`), so ad creatives can route traffic to a specific funnel variant directly.

**The strategic read:** their live A/B test is whether to **collapse the entire quiz into a single question**. `short_path` skips straight from "which class is your child in?" to the paywall. If short_path wins, the persona machinery — all 16 solution videos — becomes dead weight. The persona variants are currently *not* in the random rotation, which means that expensive creative library may already be dormant for most traffic.

That materially qualifies the week-1 claim that the persona matrix is "the scaled concept". It was built for scale; it may be being tested out of existence right now. **This is the single most important thing to re-check next week.**

### How they optimise Meta: a ₹9 conversion signal

From `PaywallScreen-y7MolbTS.js`, the pixel fires exactly one conversion:

```js
v(`WebStartTrial`, { value: 9, currency: `INR` }, { custom: true, eventID: e })
```

Four things follow from that one line:

1. **It's a custom event** (`trackCustom`), not a standard `Purchase` or `StartTrial`. No standard e-commerce event fires anywhere in the funnel.
2. **It carries `eventID`** — the deduplication key used when the same event is sent from both browser and server. That is strong evidence they also run **Meta's Conversions API server-side**, which is a mature setup, not a beginner one.
3. **The conversion value passed to Meta is ₹9** — parsed from `trialAmount`, not the ₹799 subscription. Meta's optimiser sees a ₹9 event.
4. **They optimise for trial starts, not retained payers.** Nothing fires when the ₹799 charge actually collects three days later.

**Why point 4 is a real weakness.** Meta's algorithm relentlessly finds the people cheapest to convert on the signal it's given. Optimising toward "starts a ₹9 trial" selects for price-sensitive, low-intent users — precisely the population most likely to cancel inside the 3-day window or demand a refund when ₹799 hits. Their own Play reviews describe exactly that outcome. Feeding back the ₹799 collection as the optimisation event, or passing true value, is the obvious fix — and until they make it, their paid funnel is structurally biased toward churn.

Also confirmed in the tracking stack: Meta Pixel `890261980731916` with `PageView`, Mixpanel, GA4 `G-1RZBBRMTZ3`, Microsoft Clarity, UTM capture down to `utm_adset` and `utm_adcreative`, and funnel events `funnel_step_viewed`, `class_selected`, `phone_number_entered`, `phone_number_submitted`, `paywall_seen`, `paywall_action_clicked` (carrying `trial_amount` and `direct_amount`), `bloom_payment_done`, `get_app_seen`, `get_app_download_clicked`. Still **no `AW-` Google Ads tag** — Meta remains their only paid channel.

### Eduro — re-verified today, unchanged

| Page | Meta pixel | Google Ads | GA4 |
|---|---|---|---|
| `/` | **0 hits** | `AW-17634968559` | `G-TW33E0DLM1` |
| `/auth` | **0 hits** | `AW-17634968559` | `G-TW33E0DLM1` |
| `/pricing` | **0 hits** | `AW-17634968559` | `G-TW33E0DLM1` |

Still no Meta presence of any kind. Bloom's pricing also re-checked and unchanged: `₹9` trial, `₹799/month` direct.

## Sources & data-access notes

**Method.** Most of the high-confidence findings here come from reading the companies' own shipped production JavaScript (both sites are SPAs whose bundles contain hardcoded pricing, funnel routes, persona logic, and analytics IDs) and from the raw HTML of their Play Store listings, including Play's embedded install counter and its public reviews RPC. These are primary sources, not inferences.

**What could NOT be accessed this week — and how that limits the numbers:**

| Blocked | Consequence |
|---|---|
| **Meta Ad Library** (403 + JS bot-challenge on every variant) | No ad counts, Library IDs, start dates, or per-ad landing URLs for either company. Bloom's "is scaling" read is inferred from creative infrastructure, not measured impressions. |
| **Google Ads Transparency Center** (JS-only; RPCs hit `/sorry` CAPTCHA) | Cannot confirm whether Eduro's AW- tag corresponds to live campaigns, or their creatives. |
| **apps.apple.com / itunes.apple.com** (egress-blocked) | No iOS ratings, versions, or release dates. Eduro's iOS IAP prices come from search snippets — treat as *plausible*, re-verify. |
| **Instagram** (login-walled) | @eduro_live follower count and cadence unknown. |
| **AppBrain / SimilarWeb / Sensor Tower / apkcombo** (egress-blocked) | No independent traffic or revenue estimates. AppBrain's Bloom figures came via search snippets and are **stale** (~June 2026) — Play's own embedded counter (~30,954) supersedes AppBrain's ~14K. |

**Closing the ads gap takes ~2 minutes in a browser:**
- Bloom (sorted by total impressions — the "what's scaling" view): https://www.facebook.com/ads/library/?active_status=active&ad_type=all&country=IN&is_targeted_country=false&media_type=all&search_type=page&sort_data[direction]=desc&sort_data[mode]=total_impressions&view_all_page_id=1042050025664721
  - *Note:* research also surfaced a second Bloom page, ID **61570708667478** ("Bloom: 1-on-1 AI Maths Classes"), which hosts their ad-style reels. Worth checking both IDs — if they're separate pages, one may hold older creative.
- Eduro (keyword search — expected to be empty; a non-empty result is the news): https://www.facebook.com/ads/library/?active_status=active&ad_type=all&country=IN&q=eduro&search_type=keyword_unordered

**Key primary sources:** [bloomclasses.in](https://bloomclasses.in/) (JS bundles `index-DflCnpRI.js`, `PaywallScreen-y7MolbTS.js`, `GetAppScreen-BGUDcahy.js`) · [cmpntech.com](https://cmpntech.com/) · [cmpntech.com/pricing](https://cmpntech.com/pricing) · [cmpntech.com/careers](https://cmpntech.com/careers) · [Bloom on Play](https://play.google.com/store/apps/details?id=com.cmpntech.tutor) · [eduro.live](https://eduro.live/) · [eduro.live/pricing](https://eduro.live/pricing) · [eduro.live/sitemap.xml](https://eduro.live/sitemap.xml) · [Eduro on Play](https://play.google.com/store/apps/details?id=com.eduro.app) · [Eduro on App Store](https://apps.apple.com/in/app/eduro/id6756362712)

**Funding/company sources:** [FinSMEs — Companion Labs $2.5M](https://www.finsmes.com/2026/03/companion-labs-raises-2-5m-in-seed-funding.html) · [Inc42 — Mello/Peak XV](https://inc42.com/buzz/exclusive-ai-companion-app-mello-in-talks-with-peak-xv-devc-to-raise-funding/) · [APN News](https://www.apnnews.com/companion-labs-raises-2-5-million-in-seed-funding-led-by-peak-xvs-surge-to-build-ai-native-entertainment-experiences-for-indias-vernacular-audiences/) · [Falcon eBiz — Eduro Tutors CIN](https://www.falconebiz.com/company/EDURO-TUTORS-PRIVATE-LIMITED-U85499KA2025PTC208869) · [Antler AI Residency](https://www.antler.co/blog/introducing-antlers-ai-residency)

**CAC benchmark sources:** [RevenueCat — State of Subscription Apps 2026 (Education)](https://www.revenuecat.com/state-of-subscription-apps-2026-education/) · [Superads — India education CPC](https://www.superads.ai/facebook-ads-costs/cpc-cost-per-click/education/india) · [OwlClaw — Meta ads benchmarks](https://owlclaw.com/benchmarks/meta-ads-benchmarks/) · [Gurob — India app install cost by vertical](https://gurob.in/blog-app-install-cost-india-vertical) · [Inc42 — WhiteHat Jr CAC $119](https://inc42.com/features/untangling-whitehat-jrs-150-mn-arr-is-coding-edtechs-new-holy-grail/) · [Inc42 — Byju's marketing spend](https://inc42.com/buzz/byjus-fy16-fy22-incurred-total-losses-of-inr-13000-cr-splurged-inr-8000-cr-on-ads/) · [Entrackr — Vedantu FY24](https://entrackr.com/fintrackr/vedantu-income-nears-rs-200-cr-in-fy24-losses-cut-by-58-8503390) · [Outlook Business — PhysicsWallah low CAC](https://www.outlookbusiness.com/markets/physicswallahs-acquisition-strategy-more-disciplined-than-peers-says-dam-capital)
