#!/bin/bash
# Fetch LIVE external URLs of sites currently featured on awwwards.com.
# Usage:
#   ./awwwards-live-urls.sh                          # latest winners gallery
#   ./awwwards-live-urls.sh 8                        # limit (default 6)
#   ./awwwards-live-urls.sh 6 "portfolio"            # search query
#   ./awwwards-live-urls.sh 6 "" "/websites/sites_of_the_day/"   # winners (Site of the Day)
#   ./awwwards-live-urls.sh 6 "" "/websites/nominees/"             # NOMINEES — freshest work, submitted daily, pre-win
# Output: one line per winner ->  slug | https://live-site.com
set -euo pipefail
LIMIT="${1:-6}"; QUERY="${2:-}"; GALLERY_PATH="${3:-/websites/}"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0 Safari/537.36"
BASE="https://www.awwwards.com"
URL="$BASE$GALLERY_PATH"
[ -n "$QUERY" ] && URL="$BASE/websites/?text=$(python3 -c "import urllib.parse,sys;print(urllib.parse.quote(sys.argv[1]))" "$QUERY")"

curl -sL --max-time 20 -A "$UA" "$URL" \
| grep -o 'href="/sites/[^"]*"' | sed 's|href="/sites/||;s|"||' | awk '!seen[$0]++' | head -"$LIMIT" \
| while read -r SLUG; do
    LIVE=$(curl -sL --max-time 20 -A "$UA" "$BASE/sites/$SLUG" \
      | python3 -c "
import re,sys
from collections import Counter
t=sys.stdin.read()
block=['awwwards','google','facebook','twitter','instagram','linkedin','pinterest','apple.com','fonts.','youtube','vimeo','x.com','behance','dribbble']
urls=[u for u in re.findall(r'href=\"(https?://[^\"]+)\"',t) if not any(b in u for b in block)]
print(Counter(urls).most_common(1)[0][0] if urls else 'NOT_FOUND')")
    echo "$SLUG | $LIVE"
  done
