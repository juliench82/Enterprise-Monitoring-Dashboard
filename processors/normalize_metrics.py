import csv
import sys
from datetime import datetime

# Normalize Windows and Linux collectors into a common schema
# Input CSVs: windows_metrics.csv, linux_metrics.csv

def normalize():
    rows = []
    try:
        with open('windows_metrics.csv', newline='') as f:
            r = csv.DictReader(f)
            for row in r:
                rows.append({
                    'timestamp': row.get('Timestamp'),
                    'host': 'windows-host',
                    'cpu_pct': row.get('CPU'),
                    'mem_pct': row.get('MemoryPct'),
                    'disk': row.get('Disk'),
                    'free': row.get('FreeGB')
                })
    except FileNotFoundError:
        pass
    try:
        with open('linux_metrics.csv', newline='') as f:
            r = csv.DictReader(f)
            for row in r:
                rows.append({
                    'timestamp': row.get('timestamp'),
                    'host': 'linux-host',
                    'cpu_pct': row.get('cpu_pct'),
                    'mem_pct': row.get('mem_pct'),
                    'disk': row.get('disk'),
                    'free': row.get('free')
                })
    except FileNotFoundError:
        pass
    with open('normalized_metrics.csv', 'w', newline='') as f:
        w = csv.DictWriter(f, fieldnames=['timestamp','host','cpu_pct','mem_pct','disk','free'])
        w.writeheader()
        w.writerows(rows)
    print('Wrote normalized_metrics.csv with', len(rows), 'rows')

if __name__ == '__main__':
    normalize()
