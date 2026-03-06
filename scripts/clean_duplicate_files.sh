#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

APPLY=0
if [[ "${1:-}" == "--apply" ]]; then
  APPLY=1
fi

# Focus on duplicate-like backup/copy artifacts that frequently drift from real source.
mapfile -d '' CANDIDATES < <(
  find app -type f \( \
    -iname '* - copy*' -o \
    -iname '*.bak' -o \
    -iname '*.backup' -o \
    -iname '*.old' -o \
    -iname '*.tmp' -o \
    -iname '*.orig' -o \
    -iname '*.mini' -o \
    -iname '*.may' \
  \) \
  ! -path 'app/bin/*' ! -path 'app/obj/*' -print0
)

if [[ ${#CANDIDATES[@]} -eq 0 ]]; then
  echo "No duplicate-style backup files found."
  exit 0
fi

declare -A HASH_TO_PATHS
for file in "${CANDIDATES[@]}"; do
  hash="$(sha256sum "$file" | awk '{print $1}')"
  HASH_TO_PATHS["$hash"]+="$file"$'\n'
done

REMOVED=0
REPORTED=0
for hash in "${!HASH_TO_PATHS[@]}"; do
  mapfile -t all_paths <<<"${HASH_TO_PATHS[$hash]}"
  paths=()
  for p in "${all_paths[@]}"; do
    [[ -n "$p" ]] && paths+=("$p")
  done

  # Need at least two real files with identical content.
  [[ ${#paths[@]} -lt 2 ]] && continue

  printf '\nDuplicate content group (%s):\n' "$hash"
  for p in "${paths[@]}"; do
    echo "  $p"
  done

  ((REPORTED+=1))
  # Keep shortest path as likely canonical and remove remaining entries.
  keep="$(printf '%s\n' "${paths[@]}" | awk '{ print length, $0 }' | sort -n | head -n1 | cut -d" " -f2-)"
  echo "  -> keeping: $keep"

  for p in "${paths[@]}"; do
    [[ "$p" == "$keep" ]] && continue
    if [[ $APPLY -eq 1 ]]; then
      git rm -f -- "$p" >/dev/null 2>&1 || rm -f -- "$p"
      echo "  removed: $p"
      ((REMOVED+=1))
    else
      echo "  dry-run remove: $p"
    fi
  done
done

if [[ $REPORTED -eq 0 ]]; then
  echo "No identical duplicate backup files detected."
  exit 0
fi

if [[ $APPLY -eq 1 ]]; then
  echo "Done. Removed $REMOVED duplicate file(s)."
else
  echo "Dry-run complete. Re-run with --apply to remove duplicates."
fi
