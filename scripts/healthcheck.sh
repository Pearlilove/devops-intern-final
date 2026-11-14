#!/usr/bin/env bash
set -euo pipefail

APP_URL="${1:-http://localhost:8080}"

echo "===== APPLICATION HEALTH CHECK ====="
echo "Checking: $APP_URL"

if HTTP_STATUS=$(curl --silent --output /dev/null --write-out "%{http_code}" "$APP_URL"); then
    if [ "$HTTP_STATUS" = "200" ]; then
        echo "Status: HEALTHY (HTTP $HTTP_STATUS)"
        exit 0
    fi
fi

echo "Status: UNHEALTHY (HTTP request failed or returned a non-200 status)"
exit 1
