#!/bin/bash
# Shark Tank launcher (Linux). Works from any folder.
DIR="$(cd "$(dirname "$0")" && pwd)"
URL="file://$DIR/shark_tank.html"
URL="${URL// /%20}"
PROFILE="${TMPDIR:-/tmp}/SharkTankProfile"
for B in google-chrome google-chrome-stable chromium chromium-browser microsoft-edge brave-browser; do
  if command -v "$B" >/dev/null 2>&1; then
    "$B" --app="$URL" --window-size=1280,760 --autoplay-policy=no-user-gesture-required --ignore-gpu-blocklist --user-data-dir="$PROFILE" >/dev/null 2>&1 &
    exit 0
  fi
done
xdg-open "$DIR/shark_tank.html" 2>/dev/null || echo "Open shark_tank.html in your browser."
