#!/usr/bin/env bash
set -euo pipefail

# Ubuntu 24.04-focused installer for zlms-prod legacy ASP.NET Web Forms project.
# It installs Mono toolchain dependencies, restores NuGet packages,
# optionally imports licensed DevExpress binaries, then builds Release.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$SCRIPT_DIR"
APP_DIR="$PROJECT_ROOT/app"
VENDOR_DIR="$(realpath -m "$APP_DIR/../../lms-library")"

SKIP_BUILD=0
ASSUME_YES=0

usage() {
  cat <<USAGE
Usage: $0 [--skip-build] [--yes]

Options:
  --skip-build   Install dependencies and restore packages, but skip msbuild.
  --yes          Non-interactive apt installs (-y).
  --help         Show this help text.

Environment variables:
  DEVEXPRESS_SOURCE  Optional path to a directory or .zip containing licensed
                     DevExpress 16.2 DLLs referenced by app/lms.csproj.
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --skip-build)
      SKIP_BUILD=1
      ;;
    --yes)
      ASSUME_YES=1
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 2
      ;;
  esac
  shift
done

if [[ ! -f "$APP_DIR/lms.csproj" ]]; then
  echo "Error: app/lms.csproj not found. Run this script from repository root." >&2
  exit 1
fi

if [[ "${EUID}" -ne 0 ]]; then
  SUDO="sudo"
else
  SUDO=""
fi

APT_FLAGS=()
if [[ "$ASSUME_YES" -eq 1 ]]; then
  APT_FLAGS+=("-y")
fi

OS_PRETTY_NAME="$(. /etc/os-release && echo "${PRETTY_NAME:-unknown}")"
echo "==> Host OS: $OS_PRETTY_NAME"
if [[ -f /etc/os-release ]]; then
  . /etc/os-release
  if [[ "${ID:-}" != "ubuntu" || "${VERSION_ID:-}" != "24.04" ]]; then
    echo "[WARN] This installer is tuned for Ubuntu 24.04 and is running on ${PRETTY_NAME:-unknown}."
  fi
fi

echo "==> Resolving DevExpress DLL requirements from app/lms.csproj"
mapfile -t DEVEXPRESS_DLLS < <(
  awk '/<HintPath>/ && /lms-library/ && /.dll<\/HintPath>/ { line=$0; sub(/^.*lms-library\\/, "", line); sub(/<\/HintPath>.*/, "", line); print line }' "$APP_DIR/lms.csproj" | sort -u
)

if [[ "${#DEVEXPRESS_DLLS[@]}" -eq 0 ]]; then
  echo "Error: no DevExpress DLL references were found in $APP_DIR/lms.csproj." >&2
  exit 1
fi

echo "==> Installing system dependencies"
$SUDO apt-get update

package_available() {
  local pkg="$1"
  local candidate
  candidate="$(apt-cache policy "$pkg" | awk -F': ' '/Candidate:/ {print $2; exit}')"
  [[ -n "$candidate" && "$candidate" != "(none)" ]]
}

PKGS=()
REQ_PKGS=(mono-complete ca-certificates curl unzip)
OPT_PKGS=(mono-xsp4 msbuild nuget)

for pkg in "${REQ_PKGS[@]}"; do
  if package_available "$pkg"; then
    PKGS+=("$pkg")
  else
    echo "Error: required package '$pkg' is unavailable in configured apt repositories." >&2
    exit 1
  fi
done

for pkg in "${OPT_PKGS[@]}"; do
  if package_available "$pkg"; then
    PKGS+=("$pkg")
  else
    echo "[WARN] Optional package '$pkg' is unavailable; continuing with fallback behavior."
  fi
done

$SUDO apt-get install "${APT_FLAGS[@]}" "${PKGS[@]}"

if command -v msbuild >/dev/null 2>&1; then
  BUILD_TOOL="msbuild"
elif command -v xbuild >/dev/null 2>&1; then
  BUILD_TOOL="xbuild"
  echo "[WARN] msbuild is unavailable; falling back to xbuild."
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

import_devexpress_binaries() {
  local source_path="$1"

  if [[ ! -e "$source_path" ]]; then
    echo "[WARN] DEVEXPRESS_SOURCE does not exist: $source_path"
    return 0
  fi

  mkdir -p "$VENDOR_DIR"

  if [[ -d "$source_path" ]]; then
    for dll in "${DEVEXPRESS_DLLS[@]}"; do
      local match
      match="$(find "$source_path" -maxdepth 8 -type f -name "$dll" -print -quit || true)"
      if [[ -n "$match" ]]; then
        cp -f "$match" "$VENDOR_DIR/$dll"
      fi
    done
    echo "  [INFO] Directory import attempt complete: $source_path"
    return 0
  fi

  if [[ -f "$source_path" && "$source_path" == *.zip ]]; then
    local tmp_dir
    tmp_dir="$(mktemp -d)"
    unzip -oqq "$source_path" '*.dll' -d "$tmp_dir"
    for dll in "${DEVEXPRESS_DLLS[@]}"; do
      local match
      match="$(find "$tmp_dir" -type f -name "$dll" -print -quit || true)"
      if [[ -n "$match" ]]; then
        cp -f "$match" "$VENDOR_DIR/$dll"
      fi
    done
    rm -rf "$tmp_dir"
    echo "  [INFO] Zip import attempt complete: $source_path"
    return 0
  fi

  echo "[WARN] DEVEXPRESS_SOURCE is neither a directory nor a .zip: $source_path"
}

if [[ -n "${DEVEXPRESS_SOURCE:-}" ]]; then
  echo "==> Importing DevExpress binaries from DEVEXPRESS_SOURCE"
  import_devexpress_binaries "$DEVEXPRESS_SOURCE"
fi

echo "==> Restoring NuGet packages"
if [[ -f "$APP_DIR/packages.config" ]]; then
  "${NUGET_CMD[@]}" restore "$APP_DIR/packages.config" -PackagesDirectory "$PROJECT_ROOT/packages"
else
  "${NUGET_CMD[@]}" restore "$APP_DIR/lms.csproj" || true
fi

echo "==> Validating external binary prerequisites"
MISSING=0
for dll in "${DEVEXPRESS_DLLS[@]}"; do
  if [[ ! -f "$VENDOR_DIR/$dll" ]]; then
    echo "  [WARN] Missing required vendor DLL: $dll"
    MISSING=1
  fi
done

if [[ "$MISSING" -eq 0 ]]; then
  echo "  [OK] All required DevExpress DLLs were found under: $VENDOR_DIR"
fi

if [[ "$SKIP_BUILD" -eq 0 ]]; then
  echo "==> Building project (Release)"
  "$BUILD_TOOL" "$APP_DIR/lms.csproj" /p:Configuration=Release
else
  echo "==> Skipping build because --skip-build was provided"
fi

cat <<MSG

Installer run complete.

Run locally (development smoke test):
  cd app
  xsp4 --port 8080

DevExpress path expected by app/lms.csproj:
  $VENDOR_DIR

You can rerun with automated DevExpress import:
  DEVEXPRESS_SOURCE=/path/to/devexpress-folder-or-zip ./installer.sh --yes
MSG

if [[ "$MISSING" -eq 1 ]]; then
  echo "Completed with warnings about missing vendor DLLs."
fi
