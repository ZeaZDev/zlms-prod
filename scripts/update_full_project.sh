#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

APPLY_DUPLICATES=0
REBUILD_INSTALLER=0

usage() {
  cat <<'USAGE'
Usage: ./scripts/update_full_project.sh [options]

Runs a safe full-project maintenance update pipeline.

Options:
  --apply-duplicates   Remove duplicate backup/copy files (destructive; uses clean_duplicate_files.sh --apply)
  --rebuild-installer  Regenerate install payloads in dist/ (runs generate_installer.sh)
  -h, --help           Show this help message
USAGE
}

while (($#)); do
  case "$1" in
    --apply-duplicates)
      APPLY_DUPLICATES=1
      ;;
    --rebuild-installer)
      REBUILD_INSTALLER=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

echo "[update] Starting full-project update pipeline..."

echo "[update] 1/5 Running live readiness checks"
./scripts/live_readiness_check.sh

echo "[update] 2/5 Running duplicate scan"
if [[ "$APPLY_DUPLICATES" -eq 1 ]]; then
  echo "[update] Applying duplicate cleanup"
  ./scripts/clean_duplicate_files.sh --apply
else
  ./scripts/clean_duplicate_files.sh
fi

echo "[update] 3/5 Verifying project structure"
[[ -f app/lms.csproj ]] || { echo "FAIL: missing app/lms.csproj"; exit 1; }
[[ -f app/Web.config ]] || { echo "FAIL: missing app/Web.config"; exit 1; }
[[ -d scripts ]] || { echo "FAIL: missing scripts/"; exit 1; }
echo "PASS: core project files are present"

echo "[update] 4/5 Checking DevExpress dependency readiness"
./scripts/check_devexpress_references.sh

echo "[update] 5/5 Final git status snapshot"
git status --short -- . \
  ':(exclude)app/phpMyAdmin/node_modules/**' \
  ':(exclude)app/phpMyAdmin/.yarn/**' \
  ':(exclude)app/phpMyAdmin/.yarnrc.yml' \
  ':(exclude)app/phpMyAdmin/yarn.lock'

if [[ "$REBUILD_INSTALLER" -eq 1 ]]; then
  echo "[update] Rebuilding installer artifacts"
  ./scripts/generate_installer.sh
fi

echo "[update] Full-project update pipeline completed."
