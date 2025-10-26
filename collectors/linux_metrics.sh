#!/usr/bin/env bash
# Linux metrics collector (starter)
TS=$(date -Iseconds)
CPU=$(top -bn1 | grep 'Cpu(s)' | awk '{print 100-$8}')
MEM_PCT=$(free | awk '/Mem:/ {printf "%.2f", ($3/$2)*100}')
DISKS=$(df -h --output=source,avail -x tmpfs -x devtmpfs | tail -n +2)
echo "timestamp,cpu_pct,mem_pct,disk,free" > linux_metrics.csv
while read -r line; do
  DEV=$(echo "$line" | awk '{print $1}')
  FREE=$(echo "$line" | awk '{print $2}')
  echo "$TS,$CPU,$MEM_PCT,$DEV,$FREE" >> linux_metrics.csv
done <<< "$DISKS"
echo "Wrote metrics to linux_metrics.csv"
