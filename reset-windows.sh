#!/bin/bash
set -e

VOLUME="pc-free_windows-data"
SNAPSHOT="pc-free_windows-baseline"

if ! docker volume inspect "$SNAPSHOT" >/dev/null 2>&1; then
    echo "ERROR: No Windows baseline exists."
    echo "Run ./snapshot-windows.sh first."
    exit 1
fi

echo "Stopping Windows..."
docker compose -f windows10.yml down

echo "Restoring clean Windows baseline..."

docker run --rm \
  -v "$VOLUME":/target \
  -v "$SNAPSHOT":/backup:ro \
  alpine sh -c 'find /target -mindepth 1 -delete && cp -a /backup/. /target/'

echo
echo "======================================"
echo " Windows VM has been reset."
echo " Clean baseline restored."
echo "======================================"
echo
echo "Start it with: ./start-windows.sh"

