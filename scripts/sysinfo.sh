#!/usr/bin/env bash
set -euo pipefail

echo "===== SYSTEM INFORMATION ====="

echo ""
echo "Current User:"
id -un

echo ""
echo "Effective UID:"
id -u

echo ""
echo "Hostname:"
hostname

echo ""
echo "Kernel Release:"
uname -r

echo ""
echo "System Date (ISO-8601):"
date --iso-8601=seconds

echo ""
echo "Disk Usage:"
df -h /

echo ""
echo "Memory Usage:"
free -h

echo ""
echo "Docker Daemon Status:"
if docker info >/dev/null 2>&1; then
    echo "Docker daemon is running"
else
    echo "Docker daemon is not running or is inaccessible"
fi

echo ""
echo "===== END OF SYSTEM INFORMATION ====="
