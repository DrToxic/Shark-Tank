#!/bin/bash
# Shark Tank launcher (macOS). Works from any folder.
DIR="$(cd "$(dirname "$0")" && pwd)"
URL="file://$DIR/shark_tank.html"
URL="${URL// /%20}"
PROFILE="${TMPDIR:-/tmp}/SharkTankProfile"
FLAGS=(--app="$URL" --window-size=1280,760 --autoplay-policy=no-user-gesture-required --ignore-gpu-blocklist --user-data-dir="$PROFILE")
for APP in "Google Chrome" "Microsoft Edge" "Brave Browser" "Chromium"; do
  BIN="/Applications/$APP.app/Contents/MacOS/$APP"
  if [ -x "$BIN" ]; then "$BIN" "${FLAGS[@]}" >/dev/null 2>&1 & exit 0; fi
done
open "$DIR/shark_tank.html"
