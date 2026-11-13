#!/usr/bin/env bash
set -euo pipefail

APP_URL="${APP_URL:-http://localhost:8080/healthz}"

echo "===== APPLICATION HEALTH CHECK ====="
echo "Checking: $APP_URL"

if curl --fail --silent --show-error "$APP_URL"; then
    echo ""
    echo "Status: HEALTHY"
else
    echo ""
    echo "Status: UNHEALTHY"
    exit 1
fi
