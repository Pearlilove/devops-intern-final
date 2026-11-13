#!/usr/bin/env bash
set -euo pipefail

echo "===== SYSTEM INFORMATION ====="

echo ""
echo "Hostname:"
hostname

echo ""
echo "Operating System:"
uname -s

echo ""
echo "Kernel Version:"
uname -r

echo ""
echo "System Uptime:"
uptime

echo ""
echo "Memory Usage:"
free -h

echo ""
echo "Disk Usage:"
df -h /

echo ""
echo "===== END OF SYSTEM INFORMATION ====="
