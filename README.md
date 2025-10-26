# Enterprise Monitoring Dashboard

This repository contains collectors, processors, dashboards, alerts and documentation to stand up a simple, reviewable monitoring stack.

---

## ⚡ How to review in 2 minutes
1) Generate Windows metrics
```
powershell -ExecutionPolicy Bypass -File .\collectors\windows_metrics.ps1
```
2) Generate Linux metrics
```
bash ./collectors/linux_metrics.sh
```
3) Normalize metrics
```
python3 ./processors/normalize_metrics.py
```
4) Import Grafana dashboard
- Open Grafana → Dashboards → Import
- Select grafana/dashboards/infra_overview.json

---

## 📊 Screenshots
![Infra Overview](docs/screenshots/infra_overview_dashboard.png)
![SLA & KPI](docs/screenshots/sla_kpi_dashboard.png)

---

## 📁 Structure
- collectors/: Windows and Linux sample collectors
- processors/: Normalization to unified CSV
- grafana/: Dashboard JSON + alert rules
- docs/: Runbook, KPIs, screenshots

## 👤 Author
**Julien Chevallier** — Senior IT Manager

---

⭐ Star this repo if these patterns help your monitoring practice.
