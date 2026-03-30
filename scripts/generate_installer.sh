#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

DIST_DIR="$ROOT_DIR/dist"
INSTALLER_PATH="$DIST_DIR/zlms-installer.sh"
PAYLOAD_PATH="$DIST_DIR/zlms-payload.tar.gz"

mkdir -p "$DIST_DIR"

echo "Creating payload archive..."
tar -czf "$PAYLOAD_PATH" \
  --exclude='.git' \
  --exclude='dist' \
  --exclude='app/bin' \
  --exclude='app/obj' \
  --exclude='app/phpMyAdmin/node_modules' \
  app db scripts README.md SECURITY_DEEP_DIVE.md UBUNTU_24_04_MANUAL.md installer.sh

cat > "$INSTALLER_PATH" <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <install_dir>"
  exit 1
fi

INSTALL_DIR="$1"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PAYLOAD="$SCRIPT_DIR/zlms-payload.tar.gz"

if [[ ! -f "$PAYLOAD" ]]; then
  echo "Missing payload archive: $PAYLOAD"
  exit 1
fi

mkdir -p "$INSTALL_DIR"

echo "Extracting payload to $INSTALL_DIR"
tar -xzf "$PAYLOAD" -C "$INSTALL_DIR"

echo "Running baseline readiness checks"
if [[ -x "$INSTALL_DIR/scripts/live_readiness_check.sh" ]]; then
  (cd "$INSTALL_DIR" && ./scripts/live_readiness_check.sh)
else
  echo "Warning: readiness script not found or not executable"
fi

echo "Installation complete."
SCRIPT

chmod +x "$INSTALLER_PATH"

echo "Installer generated: $INSTALLER_PATH"
echo "Payload generated:   $PAYLOAD_PATH"
