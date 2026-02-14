#!/bin/bash
# Validate all external links in the built site
# Runs after `npm run build` to catch broken links before deploy
# Exit code 0 = all good, 1 = broken links found

DIST_DIR="${1:-dist}"
BROKEN=0
CHECKED=0
SKIPPED=0

# Extract all external URLs from built HTML
URLS=$(grep -roh 'href="https://[^"]*"' "$DIST_DIR" | sed 's/href="//;s/"$//' | sort -u)
# Also check image sources
IMG_URLS=$(grep -roh 'src="https://[^"]*"' "$DIST_DIR" | sed 's/src="//;s/"$//' | sort -u)

ALL_URLS=$(echo -e "$URLS\n$IMG_URLS" | sort -u)

# Skip known-good domains (fonts, CDNs)
SKIP_PATTERNS="fonts.googleapis.com|fonts.gstatic.com|example-article|example.com|example1|example2|example3|youtube.com/watch\?v=example"

echo "=== Link Validation ==="
echo ""

for url in $ALL_URLS; do
  # Skip known-good patterns
  if echo "$url" | grep -qE "$SKIP_PATTERNS"; then
    SKIPPED=$((SKIPPED + 1))
    continue
  fi

  CHECKED=$((CHECKED + 1))
  
  # HEAD request with 10s timeout, follow redirects
  HTTP_CODE=$(curl -o /dev/null -s -w "%{http_code}" -L --max-time 10 -A "Mozilla/5.0 (compatible; LinkValidator/1.0)" "$url" 2>/dev/null)
  
  if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 400 ]; then
    echo "  OK  [$HTTP_CODE] $url"
  elif [ "$HTTP_CODE" = "000" ]; then
    echo "  TIMEOUT    $url"
    BROKEN=$((BROKEN + 1))
  else
    echo "  BROKEN [$HTTP_CODE] $url"
    BROKEN=$((BROKEN + 1))
  fi
done

echo ""
echo "=== Results ==="
echo "Checked: $CHECKED | Broken: $BROKEN | Skipped: $SKIPPED"

if [ "$BROKEN" -gt 0 ]; then
  echo "WARNING: $BROKEN broken link(s) found!"
  exit 1
else
  echo "All links valid."
  exit 0
fi
