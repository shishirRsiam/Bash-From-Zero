#!/bin/bash

host=$1

echo "Scanning $host from ports 1 to 1300..."

for port in {1..1300}; do
  (echo >/dev/tcp/$host/$port) >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Port $port is open"
  fi
done

echo "Scan complete."
