#!/usr/bin/env bash

# rAthena container healthcheck
# Checks that the configured ports are accepting TCP connections.

set -euo pipefail

HOST="${HEALTHCHECK_HOST:-127.0.0.1}"

PORTS=()
PORTS+=("${CHAR_SERVER_PORT:-6121}")
PORTS+=("${MAP_SERVER_PORT:-5121}")
PORTS+=("${LOGIN_SERVER_PORT:-6900}")

if [[ ${#PORTS[@]} -eq 0 ]]; then
  echo "[healthcheck] No ports defined; set CHAR_SERVER_PORT, MAP_SERVER_PORT, LOGIN_SERVER_PORT to enable checks."
  exit 0
fi

for p in "${PORTS[@]}"; do
  # Skip obviously invalid values (non-numeric)
  if ! [[ "$p" =~ ^[0-9]+$ ]]; then
    echo "[healthcheck] Skipping non-numeric port value: $p"
    continue
  fi
  # Use a short timeout per port to avoid long hangs (2s)
  if timeout 2 bash -c "</dev/tcp/${HOST}/${p}" >/dev/null 2>&1; then
    echo "[healthcheck] Port ${HOST}:${p} is open."
  else
    echo "[healthcheck] Port ${HOST}:${p} is NOT open."
    exit 1
  fi
done

exit 0
