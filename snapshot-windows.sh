#!/bin/bash
set -e

VOLUME="pc-free_windows-data"
SNAPSHOT="pc-free_windows-baseline"

echo "Stopping Windows..."
docker compose -f windows10.yml down

echo "Removing old baseline..."
docker volume rm "$SNAPSHOT" 2>/dev/null || true

echo "Creating new baseline volume..."
docker volume create "$SNAPSHOT" >/dev/null

echo "Copying Windows installation..."
docker run --rm \
  -v "$VOLUME":/source:ro \
  -v "$SNAPSHOT":/backup \
  alpine sh -c 'cp -a /source/. /backup/'

echo
echo "======================================"
echo " Windows baseline created successfully"
echo "======================================"
echo
echo "You can now use ./reset-windows.sh"
