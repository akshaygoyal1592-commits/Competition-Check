# Competition Check — Bloom & Eduro

Weekly competitive-intelligence tracking for two Indian K-12 AI-tutoring competitors.

| | **Bloom** | **Eduro** |
|---|---|---|
| Legal entity | CMPN Technologies Pvt Ltd ("Companion Labs"), Bengaluru | Eduro Tutors Pvt Ltd (CIN U85499KA2025PTC208869), Bengaluru |
| Product | 1-on-1 voice AI maths tutor, Class 1–10, Hinglish, "Milind Sir" persona | Voice-first AI tutor on a live whiteboard, CBSE Class 6–12 + JEE/NEET |
| Target | Parents | Students |
| Offer | ₹9 demo → ₹799/month (UPI AutoPay mandate) | ₹1 for 3 days → ₹499/month "Topper" |
| Acquisition | Meta performance marketing → quiz funnel | Programmatic NCERT SEO + community seeding + referrals |
| Sites | [bloomclasses.in](https://bloomclasses.in/) (funnel) · [cmpntech.com](https://cmpntech.com/) (brand) | [eduro.live](https://eduro.live/) |
| Apps | [Play: com.cmpntech.tutor](https://play.google.com/store/apps/details?id=com.cmpntech.tutor) (no iOS) | [Play: com.eduro.app](https://play.google.com/store/apps/details?id=com.eduro.app) · [App Store](https://apps.apple.com/in/app/eduro/id6756362712) |
| Social | [FB page 61570708667478](https://www.facebook.com/people/Bloom-1-on-1-AI-Maths-Classes/61570708667478/) · [X](https://x.com/bloomclasses) | [Instagram @eduro_live](https://www.instagram.com/eduro_live/) · Discord · Reddit |
| Funding | $2.5M seed led by Peak XV's Surge (Feb 2026) | None disclosed; Antler India AI Residency finalist |

## Ad-library quick links (manual browser check)

Both ad libraries block server-side fetching, so these need a human with a browser. Two minutes each.

- **Bloom — sorted by total impressions** (the "which ads are scaling" view):
  https://www.facebook.com/ads/library/?active_status=active&ad_type=all&country=IN&is_targeted_country=false&media_type=all&search_type=page&sort_data[direction]=desc&sort_data[mode]=total_impressions&view_all_page_id=1042050025664721
  Also worth checking page ID `61570708667478`, which hosts their ad-style reels.
- **Eduro — keyword search** (expected empty; a non-empty result is the news):
  https://www.facebook.com/ads/library/?active_status=active&ad_type=all&country=IN&q=eduro&search_type=keyword_unordered
- Google Ads Transparency: [bloomclasses.in](https://adstransparency.google.com/?region=IN&domain=bloomclasses.in) · [eduro.live](https://adstransparency.google.com/?region=IN&domain=eduro.live)

## What each weekly report covers

1. **Ads** — active creatives, hooks, formats, landing pages, and which ads look like they are **scaling** (long-running, many variants, high impressions).
2. **CAC** — estimated cost per paying customer, built from India edtech benchmark CPL/CPI data and each company's actual funnel shape and ticket. Neither company publishes CAC, so these are always labelled estimates with the arithmetic shown.
3. **Funnel** — the full path (ad → landing → trial → paywall → paid), exact INR pricing, and week-over-week changes.
4. **Traction** — funding, hiring, install counts, ratings, social following, claimed metrics.

## Reliable weekly metrics

The Play Store's displayed download bucket ("10K+", "50K+") is too coarse to show weekly movement. Use the **embedded install counter** in the page's JSON instead — it's Google's own precise number:

```bash
./scripts/snapshot.sh
```

It appends a dated row per app to [`reports/metrics-history.csv`](reports/metrics-history.csv) and prints the week-over-week delta. The figure it records is Google's own precise counter, embedded in the Play page JSON as the third element of the installs array — e.g. `["10,000+",10000,30954,"10K+"]` → **30,954**. Baseline (2026-08-20): Bloom 30,954, Eduro 67,841.

**Growth needs two snapshots.** One row gives you a lifetime average and nothing else, so run this every week even if nothing else gets done.

⚠️ **Do not use review velocity as an install proxy for Bloom.** Their August 2026 review surge is substantially seeded — four identical "class 10 trigonometry" reviews on one day, a template praising the app "for science" on a maths-only product, and no 2★ or 3★ reviews at all in the month. The install counter is the only trustworthy volume metric for them. Eduro's reviews do look organic and can be read normally.

Bloom's live pricing is hardcoded in their production JS (`directAmount`), so a price test is detectable without going through the funnel:

```bash
curl -s https://bloomclasses.in/assets/index-DflCnpRI.js | grep -o 'directAmount:"[^"]*"'
```

Eduro's paid-channel status is detectable the same way — **a Meta pixel appearing here is the single highest-signal event to watch for**:

```bash
curl -s https://eduro.live/ | grep -c 'fbq(\|connect.facebook.net'   # 0 as of 2026-08-20
```

Bloom's live funnel A/B test and creative inventory are both readable from the same bundle. The variant pool is the thing to watch — they are testing collapsing the whole quiz to one question:

```bash
curl -s https://bloomclasses.in/assets/index-DflCnpRI.js > b.js
grep -o 'hc=\[[^]]*\]' b.js                      # variants in the random rotation
grep -oc 'bloomcdn\.cmpntech\.com' b.js           # creative inventory size (21 distinct as of 2026-08-20)
curl -s https://bloomclasses.in/assets/PaywallScreen-y7MolbTS.js | grep -o 'WebStartTrial[^;]*'
# ^ their Meta conversion event: custom, value ₹9, eventID dedup (Conversions API)
```

Note the bundle hash (`index-DflCnpRI.js`) changes on each deploy — re-read it from the page source first:

```bash
curl -s https://bloomclasses.in/ | grep -o 'assets/index-[A-Za-z0-9_-]*\.js'
```

## Known data-access limits

- `facebook.com/ads/library` returns HTTP 403 with a JS bot-challenge to server-side fetches; `adstransparency.google.com` is a CAPTCHA-walled JS app. Per-ad rows (Library IDs, start dates, impression ranges) can't be scraped — reports reconstruct creative strategy from production code, social feeds, and app-store data, and flag it as inference.
- `apps.apple.com`, `itunes.apple.com`, AppBrain, SimilarWeb, and Sensor Tower are blocked by the network egress proxy. iOS metrics and third-party install estimates are unavailable or snippet-derived.
- Neither company publishes CAC. Every CAC figure is an estimate with its arithmetic and benchmark sources shown.
- **Ad counts are the one thing this environment cannot get.** `www.facebook.com` tunnels fine, but Facebook serves a JS bot challenge to datacenter IPs that does not clear (the verify POST returns 302 and sets no cookie); headless Chromium can't use the session proxy at all; and `graph.facebook.com` (the official Ad Library API) is a gateway policy denial. A browser on a normal connection gets the number in seconds — hence the manual links above.

## Reports

| Date | Report |
|---|---|
| 2026-08-20 | [Week 1 — baseline](reports/2026-08-20-competition-check.md) |

New reports are generated every Monday ~09:00 IST by a scheduled task and follow [reports/TEMPLATE.md](reports/TEMPLATE.md).
