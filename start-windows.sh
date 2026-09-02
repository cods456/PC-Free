#!/bin/bash
docker compose -f windows10.yml up -d
echo "Windows VM started."
echo "Open port 8006 in the Codespaces PORTS tab."
