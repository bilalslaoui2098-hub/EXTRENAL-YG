#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
OUTPUT="${1:-$ROOT/ThreeOneOSFive-project.zip}"

test -d "$ROOT/ThreeOneOSFive.xcodeproj" || {
  echo "Missing ThreeOneOSFive.xcodeproj" >&2
  exit 1
}
test -f "$ROOT/ThreeOneOSFive.xcodeproj/project.pbxproj" || {
  echo "Missing ThreeOneOSFive.xcodeproj/project.pbxproj" >&2
  exit 1
}

rm -f "$OUTPUT"
(
  cd "$ROOT"
  zip -qry "$OUTPUT" \
    ThreeOneOSFive \
    ThreeOneOSFive.xcodeproj \
    build_unsigned.sh \
    build_esign_ready_ipa.sh
)

unzip -l "$OUTPUT" | grep -Eq 'ThreeOneOSFive\.xcodeproj/project\.pbxproj([[:space:]]|$)'
echo "$OUTPUT"