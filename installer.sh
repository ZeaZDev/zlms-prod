#!/usr/bin/env bash
set -euo pipefail

# Installer for zlms-prod legacy ASP.NET WebForms project (app/lms.csproj).
# Target OS: Ubuntu 22.04+/Debian-based distributions.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$SCRIPT_DIR"
APP_DIR="$PROJECT_ROOT/app"
DEVEXPRESS_TARGET_DIR="$(cd "$PROJECT_ROOT/../.." && pwd)/lms-library"

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

package_available() {
  local pkg="$1"
  local candidate
  candidate="$(apt-cache policy "$pkg" | awk -F': ' '/Candidate:/ {print $2; exit}')"
  [[ -n "$candidate" && "$candidate" != "(none)" ]]
}

PKGS=(mono-complete mono-xsp4 unzip curl)
if package_available msbuild; then
  PKGS+=(msbuild)
fi
if package_available nuget; then
  PKGS+=(nuget)
fi

$SUDO apt-get install -y "${PKGS[@]}"

if command -v msbuild >/dev/null 2>&1; then
  BUILD_TOOL="msbuild"
elif command -v xbuild >/dev/null 2>&1; then
  BUILD_TOOL="xbuild"
  echo "[WARN] msbuild is unavailable on this distro; falling back to xbuild."
else
  echo "Error: neither msbuild nor xbuild is available after dependency installation." >&2
  exit 1
fi

if command -v nuget >/dev/null 2>&1; then
  NUGET_CMD=(nuget)
else
  echo "[WARN] nuget package is unavailable; bootstrapping nuget.exe locally."
  TOOLS_DIR="$PROJECT_ROOT/.tools"
  NUGET_EXE="$TOOLS_DIR/nuget.exe"
  mkdir -p "$TOOLS_DIR"
  if [[ ! -f "$NUGET_EXE" ]]; then
    curl -fsSL https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -o "$NUGET_EXE"
  fi
  NUGET_CMD=(mono "$NUGET_EXE")
fi

echo "==> Restoring NuGet packages"
if [[ -f "$APP_DIR/packages.config" ]]; then
  "${NUGET_CMD[@]}" restore "$APP_DIR/packages.config" -PackagesDirectory "$PROJECT_ROOT/packages"
else
  "${NUGET_CMD[@]}" restore "$APP_DIR/lms.csproj" || true
fi

place_devexpress_binaries() {
  local source_path="$1"
  mkdir -p "$DEVEXPRESS_TARGET_DIR"

  if [[ -d "$source_path" ]]; then
    find "$source_path" -maxdepth 2 -type f -name 'DevExpress*.dll' -exec cp -f {} "$DEVEXPRESS_TARGET_DIR/" \;
    return
  fi

  case "$source_path" in
    *.zip)
      unzip -o -j "$source_path" '*/DevExpress*.dll' 'DevExpress*.dll' -d "$DEVEXPRESS_TARGET_DIR" >/dev/null
      ;;
    *)
      echo "[WARN] DEVEXPRESS_SOURCE is not a directory or zip file: $source_path"
      ;;
  esac
}

if [[ -n "${DEVEXPRESS_SOURCE:-}" ]]; then
  echo "==> Importing DevExpress binaries from DEVEXPRESS_SOURCE"
  place_devexpress_binaries "$DEVEXPRESS_SOURCE"
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

if [[ "$MISSING" -eq 0 ]]; then
  echo "  [OK] Required vendor DLLs were found."
fi

echo "==> Building project"
"$BUILD_TOOL" "$APP_DIR/lms.csproj" /p:Configuration=Release

cat <<MSG

Installation complete.

Run locally with:
  cd app
  xsp4 --port 8080

If vendor DLL warnings appeared, place licensed DevExpress 14.2 binaries
under the path expected by lms.csproj: $DEVEXPRESS_TARGET_DIR

Tip: you can automate placement by running:
  DEVEXPRESS_SOURCE=/path/to/devexpress-folder-or-zip ./installer.sh
MSG

if [[ "$MISSING" -eq 1 ]]; then
  echo "Completed with warnings about missing vendor DLLs."
fi
