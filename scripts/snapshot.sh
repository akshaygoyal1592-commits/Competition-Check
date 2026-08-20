#!/usr/bin/env bash
# Appends one row per app to reports/metrics-history.csv.
# Run weekly. Two rows a week apart give a real growth rate; a single row gives none.
#
# The "installs" figure is Google's own precise counter, embedded in the Play page
# JSON as the third element of the installs array, e.g. ["10,000+",10000,30954,"10K+"].
# The user-visible bucket ("10K+", "50K+") is far too coarse to show weekly movement.
set -euo pipefail
cd "$(dirname "$0")/.."
python3 - "$@" <<'PY'
import csv, collections, datetime, os, re, urllib.request

APPS = [("Bloom", "com.cmpntech.tutor"), ("Eduro", "com.eduro.app")]
OUT = "reports/metrics-history.csv"
DATE = datetime.datetime.utcnow().date().isoformat()
UA = ("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 "
      "(KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36")

def snapshot(pkg):
    url = (f"https://play.google.com/store/apps/details?id={pkg}&hl=en_IN&gl=IN")
    html = urllib.request.urlopen(
        urllib.request.Request(url, headers={"User-Agent": UA}), timeout=60
    ).read().decode("utf-8", errors="replace")
    # ["10,000+", 10000, 30954, "10K+"] -> the third element is Google's precise count
    m = re.search(r'\["[\d,]+\+",\s*\d+,\s*(\d+),\s*"[\dKMB+]+"\]', html)
    rating = re.search(r'"ratingValue":\s*"?([\d.]+)', html)
    count = re.search(r'"ratingCount":\s*"?(\d+)', html)
    return (m.group(1) if m else "",
            f"{float(rating.group(1)):.3f}" if rating else "",
            count.group(1) if count else "")

with open(OUT, "a", newline="") as fh:
    w = csv.writer(fh)
    for name, pkg in APPS:
        installs, rating, count = snapshot(pkg)
        w.writerow([DATE, name, pkg, installs, rating, count, "", ""])
        print(f"{name}: installs={installs or '?'} rating={rating or '?'} ({count or '?'})")

print("\nGrowth since previous snapshot:")
rows = [r for r in csv.DictReader(open(OUT)) if r["installs"]]
by = collections.defaultdict(list)
for r in rows:
    by[r["app"]].append(r)
for app, rs in by.items():
    rs.sort(key=lambda r: r["date"])
    if len(rs) < 2:
        print(f"  {app}: baseline only — no growth rate until the next run")
        continue
    a, b = rs[-2], rs[-1]
    days = (datetime.date.fromisoformat(b["date"])
            - datetime.date.fromisoformat(a["date"])).days or 1
    delta = int(b["installs"]) - int(a["installs"])
    print(f"  {app}: {delta:+,} installs over {days}d = {delta/days:,.0f}/day "
          f"({delta/int(a['installs'])*100:+.1f}% vs previous)")
PY
