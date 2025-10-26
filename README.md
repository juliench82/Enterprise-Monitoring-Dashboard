# Enterprise Monitoring Dashboard

This repository contains collectors, processors, dashboards, alerts and documentation to stand up a simple, reviewable monitoring stack.

## How to review in 2 minutes
1) Generate sample Windows metrics
```
powershell -ExecutionPolicy Bypass -File .\collectors\windows_metrics.ps1
```
2) Generate sample Linux metrics (on Linux)
```
bash ./collectors/linux_metrics.sh
```
3) Normalize to a single CSV
```
python3 ./processors/normalize_metrics.py
```
4) Open Grafana and import dashboards/grafana/dashboards/infra_overview.json

## Screenshots
See docs/screenshots for example panels.
