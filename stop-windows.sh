#!/bin/bash
docker compose -f windows10.yml down
echo "Windows VM stopped."
echo "Your Windows data remains محفوظ in the Docker volume."
