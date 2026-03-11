#!/usr/bin/env bash
set -euo pipefail

# Installer for zlms-prod legacy ASP.NET WebForms project (app/lms.csproj).
# Target OS: Ubuntu 22.04+/Debian-based distributions.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$SCRIPT_DIR"
APP_DIR="$PROJECT_ROOT/app"
VENDOR_DIR="$(realpath -m "$APP_DIR/../../lms-library")"

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

PKGS=()
REQ_PKGS=(mono-complete unzip curl)
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

$SUDO apt-get install -y "${PKGS[@]}"

if ! command -v xsp4 >/dev/null 2>&1; then
  echo "[WARN] xsp4 command is unavailable (mono-xsp4 package missing on this distro)."
  echo "       Build can still proceed, but local hosting via xsp4 will not be available."
fi

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

  if [[ ! -e "$source_path" ]]; then
    echo "[WARN] DEVEXPRESS_SOURCE does not exist: $source_path"
    return
  fi

  mkdir -p "$DEVEXPRESS_TARGET_DIR"

  if [[ -d "$source_path" ]]; then
    local copied=0
    local dll
    for dll in "${REQUIRED_VENDOR_DLLS[@]}"; do
      local match
      match="$(find "$source_path" -type f -name "$dll" -print -quit)"
      if [[ -n "$match" ]]; then
        cp -f "$match" "$DEVEXPRESS_TARGET_DIR/$dll"
        copied=$((copied + 1))
      fi
    done
    echo "  [INFO] Imported $copied required DevExpress DLL(s) from directory source."
    return
  fi

  case "$source_path" in
    *.zip)
      python3 - "$source_path" "$DEVEXPRESS_TARGET_DIR" "${REQUIRED_VENDOR_DLLS[@]}" <<'PY'
import os
import shutil
import sys
import tempfile
import zipfile

zip_path = sys.argv[1]
out_dir = sys.argv[2]
required = set(sys.argv[3:])

copied = 0
with zipfile.ZipFile(zip_path) as zf:
    infos = [i for i in zf.infolist() if not i.is_dir()]
    by_basename = {}
    for info in infos:
        base = os.path.basename(info.filename)
        if base in required and base not in by_basename:
            by_basename[base] = info

    with tempfile.TemporaryDirectory() as td:
        for dll in sorted(required):
            info = by_basename.get(dll)
            if info is None:
                continue
            extracted = zf.extract(info, path=td)
            dest = os.path.join(out_dir, dll)
            shutil.copyfile(extracted, dest)
            copied += 1

print(f"  [INFO] Imported {copied} required DevExpress DLL(s) from zip source.")
PY
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
mapfile -t DEVEXPRESS_DLLS < <(
  awk '/<HintPath>/ && /lms-library/ && /.dll<\/HintPath>/ { line=$0; sub(/^.*lms-library\\/, "", line); sub(/<\/HintPath>.*/, "", line); print line }' "$APP_DIR/lms.csproj" | sort -u
)

if [[ "${#DEVEXPRESS_DLLS[@]}" -eq 0 ]]; then
  echo "Error: no DevExpress DLL references were found in $APP_DIR/lms.csproj." >&2
  exit 1
fi

if [[ -n "${DEVEXPRESS_SOURCE:-}" ]]; then
  mkdir -p "$VENDOR_DIR"
  if [[ -d "$DEVEXPRESS_SOURCE" ]]; then
    for dll in "${DEVEXPRESS_DLLS[@]}"; do
      src_dll="$(find "$DEVEXPRESS_SOURCE" -maxdepth 4 -type f -name "$dll" | head -n 1 || true)"
      if [[ -n "$src_dll" ]]; then
        cp -f "$src_dll" "$VENDOR_DIR/$dll"
      fi
    done
  elif [[ -f "$DEVEXPRESS_SOURCE" && "$DEVEXPRESS_SOURCE" == *.zip ]]; then
    unzip -oqq "$DEVEXPRESS_SOURCE" "*.dll" -d "$VENDOR_DIR/.extract_tmp"
    for dll in "${DEVEXPRESS_DLLS[@]}"; do
      src_dll="$(find "$VENDOR_DIR/.extract_tmp" -type f -name "$dll" | head -n 1 || true)"
      if [[ -n "$src_dll" ]]; then
        cp -f "$src_dll" "$VENDOR_DIR/$dll"
      fi
    done
    rm -rf "$VENDOR_DIR/.extract_tmp"
  else
    echo "  [WARN] DEVEXPRESS_SOURCE is set but is neither a directory nor a .zip file: $DEVEXPRESS_SOURCE"
  fi
fi

MISSING=0
for dll in "${DEVEXPRESS_DLLS[@]}"; do
  if [[ ! -f "$VENDOR_DIR/$dll" ]]; then
    echo "  [WARN] Missing required vendor DLL: $dll"
    MISSING=1
  fi
done

if [[ "$MISSING" -eq 0 ]]; then
  echo "  [OK] Required vendor DLLs were found in $DEVEXPRESS_TARGET_DIR"
fi

echo "==> Building project"
"$BUILD_TOOL" "$APP_DIR/lms.csproj" /p:Configuration=Release

cat <<MSG

Installation complete.

Run locally with:
  cd app
  xsp4 --port 8080

If vendor DLL warnings appeared, place licensed DevExpress binaries referenced by app/lms.csproj
under the path expected by lms.csproj: $VENDOR_DIR
(relative HintPath from app/lms.csproj: ../../lms-library)

Tip: you can automate placement by running:
  DEVEXPRESS_SOURCE=/path/to/devexpress-folder-or-zip ./installer.sh
MSG

if [[ "$MISSING" -eq 1 ]]; then
  echo "Completed with warnings about missing vendor DLLs."
fi
