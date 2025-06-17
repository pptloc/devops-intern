#!/bin/bash

echo "=== SYSTEM MONITORING ==="
echo " "

echo "--CPU Load Average --"
uptime | awk -F'load average:' '{print $2}'

echo ""
echo "-- Memory Usage (MB) --"
free -m

echo ""
echo "--Disk Usage --"
df -h | grep ' /$'

echo ""
echo "============================"
