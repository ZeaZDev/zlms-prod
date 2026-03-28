#!/usr/bin/env bash
set -euo pipefail

TARGET_URL="${1:-http://5.249.157.111:8080/}"
TMP_HEADERS="$(mktemp)"
TMP_BODY="$(mktemp)"
trap 'rm -f "$TMP_HEADERS" "$TMP_BODY"' EXIT

HTTP_CODE="$(curl -sS -D "$TMP_HEADERS" -o "$TMP_BODY" -w '%{http_code}' "$TARGET_URL")"

echo "[probe] URL: $TARGET_URL"
echo "[probe] HTTP status: $HTTP_CODE"

CONTENT_TYPE="$(grep -i '^content-type:' "$TMP_HEADERS" | tail -n1 | cut -d: -f2- | sed 's/^[[:space:]]*//' | tr -d '\r')"
if [[ -n "$CONTENT_TYPE" ]]; then
  echo "[probe] Content-Type: $CONTENT_TYPE"
fi

if [[ "$HTTP_CODE" == "200" ]]; then
  echo "[result] Endpoint is reachable; no obvious missing content from status code."
else
  echo "[result] Missing accessibility detected: endpoint does not return HTTP 200."
  if [[ "$HTTP_CODE" == "403" ]]; then
    echo "[result] Likely missing requirement: authentication, allowlist, or proxy route permission."
  fi
fi

echo "[probe] Response preview:"
head -c 200 "$TMP_BODY"; echo
