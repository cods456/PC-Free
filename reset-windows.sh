#!/bin/bash

echo "========================================"
echo "       WINDOWS 10 FACTORY RESET"
echo "========================================"
echo
echo "WARNING: ALL WINDOWS DATA WILL BE DELETED."
echo "The dockurr/windows image will be kept."
echo
read -p "Type RESET to continue: " CONFIRM

if [ "$CONFIRM" != "RESET" ]; then
    echo "Reset cancelled."
    exit 0
fi

echo
echo "Removing Windows VM and its storage..."
docker compose -f windows10.yml down -v

echo
echo "Creating fresh Windows VM..."
docker compose -f windows10.yml up -d

echo
echo "Windows VM reset complete."
echo "Open port 8006 in the Codespaces PORTS tab."