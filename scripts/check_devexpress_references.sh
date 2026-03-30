#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_DIR="$ROOT_DIR/app"
PROJECT_FILE="$APP_DIR/lms.csproj"
VENDOR_DIR="$(realpath -m "$APP_DIR/../../lms-library")"
BUNDLED_DIR="$APP_DIR/devexpress"

if [[ ! -f "$PROJECT_FILE" ]]; then
  echo "FAIL: missing project file: $PROJECT_FILE" >&2
  exit 1
fi

mapfile -t DEVEXPRESS_DLLS < <(
  awk '/<HintPath>/ && /lms-library/ && /.dll<\/HintPath>/ { line=$0; sub(/^.*lms-library\\/, "", line); sub(/<\/HintPath>.*/, "", line); print line }' "$PROJECT_FILE" | sort -u
)

if [[ "${#DEVEXPRESS_DLLS[@]}" -eq 0 ]]; then
  echo "FAIL: no DevExpress references found in app/lms.csproj"
  exit 1
fi

echo "Checking DevExpress dependencies required by app/lms.csproj"
echo "Primary vendor folder: $VENDOR_DIR"
echo "Bundled fallback folder: $BUNDLED_DIR"

missing=0
for dll in "${DEVEXPRESS_DLLS[@]}"; do
  if [[ -f "$VENDOR_DIR/$dll" ]]; then
    echo "  PASS: $dll (from lms-library)"
  elif [[ -f "$BUNDLED_DIR/$dll" ]]; then
    echo "  PASS: $dll (from app/devexpress fallback)"
  else
    echo "  FAIL: missing $dll"
    missing=1
  fi
done

if [[ "$missing" -ne 0 ]]; then
  cat <<'MSG'

One or more DevExpress 16.2 binaries are missing.
Provide binaries by setting DEVEXPRESS_SOURCE and re-running installer:
  DEVEXPRESS_SOURCE=/path/to/devexpress-folder-or-zip ./installer.sh --yes
Or place them under app/devexpress as a repository-local fallback source.
MSG
  exit 1
fi

echo "PASS: all required DevExpress 16.2 binaries are available (lms-library or app/devexpress)."
