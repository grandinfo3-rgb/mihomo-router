#!/bin/sh

CONFIG="/etc/mihomo/config.yaml"

echo "=================================="
echo " PandaTech Mihomo Router Edition "
echo "=================================="

echo "Using config: $CONFIG"

if [ ! -f "$CONFIG" ]; then
    echo "ERROR: config.yaml not found!"
    exit 1
fi

echo
echo "===== CONFIG TEST ====="

/mihomo -t -f "$CONFIG"

if [ $? -ne 0 ]; then
    echo
    echo "Configuration FAILED"
    exit 1
fi

echo
echo "Configuration OK"

echo
echo "===== STARTING MIHOMO ====="

exec /mihomo -f "$CONFIG"
