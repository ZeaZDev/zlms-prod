#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "[dryrun] Starting full-project dry run checks..."

echo "[dryrun] 1/2 Running live readiness checks"
./scripts/live_readiness_check.sh

echo "[dryrun] 2/2 Running duplicate cleanup in dry-run mode"
./scripts/clean_duplicate_files.sh

echo "[dryrun] Completed full-project dry run successfully."
