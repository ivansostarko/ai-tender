#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../postal/config" && pwd)"
KEY_PATH="$CONFIG_DIR/signing.key"

if [[ -f "$KEY_PATH" ]]; then
  echo "signing.key already exists: $KEY_PATH"
  exit 0
fi

echo "Generating Postal signing.key at: $KEY_PATH"
docker run --rm -v "$CONFIG_DIR:/out" alpine:3.20 sh -lc "apk add --no-cache openssl >/dev/null && openssl genrsa -out /out/signing.key 2048"

chmod 600 "$KEY_PATH" || true
echo "Done."
