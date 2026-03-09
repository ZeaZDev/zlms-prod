#!/usr/bin/env bash
set -euo pipefail

# Installer for zlms-prod legacy ASP.NET WebForms project (app/lms.csproj).
# Target OS: Ubuntu 22.04+/Debian-based distributions.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$SCRIPT_DIR"
APP_DIR="$PROJECT_ROOT/app"

if [[ ! -f "$APP_DIR/lms.csproj" ]]; then
  echo "Error: app/lms.csproj not found. Run this script from repository root." >&2
  exit 1
fi

if [[ "${EUID}" -ne 0 ]]; then
  SUDO="sudo"
else
  SUDO=""
fi

echo "==> Installing system dependencies"
$SUDO apt-get update
$SUDO apt-get install -y \
  mono-complete \
  mono-xsp4 \
  msbuild \
  nuget \
  unzip

echo "==> Restoring NuGet packages"
if [[ -f "$APP_DIR/packages.config" ]]; then
  nuget restore "$APP_DIR/packages.config" -PackagesDirectory "$PROJECT_ROOT/packages"
else
  nuget restore "$APP_DIR/lms.csproj" || true
fi

echo "==> Validating external binary prerequisites"
MISSING=0
for dll in \
  DevExpress.Web.v14.2.dll \
  DevExpress.Data.v14.2.dll \
  DevExpress.XtraReports.v14.2.dll; do
  if ! find "$PROJECT_ROOT" -maxdepth 4 -name "$dll" | grep -q .; then
    echo "  [WARN] Missing required vendor DLL: $dll"
    MISSING=1
  fi
done

echo "==> Building project"
msbuild "$APP_DIR/lms.csproj" /p:Configuration=Release

cat <<MSG

Installation complete.

Run locally with:
  cd app
  xsp4 --port 8080

If vendor DLL warnings appeared, place licensed DevExpress 14.2 binaries
under the path expected by lms.csproj (e.g. ../../lms-library).
MSG

if [[ "$MISSING" -eq 1 ]]; then
  echo "Completed with warnings about missing vendor DLLs."
fi
