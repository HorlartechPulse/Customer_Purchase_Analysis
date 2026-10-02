# Customer Purchase Pattern & Revenue Analysis

**Business problem:** How can a business understand customer purchase patterns and identify changes in revenue?

| | |
|--|--|
| **Tools** | MySQL · Python · Power BI (Excel dashboard included) |
| **Process** | Ingestion → cleaning → transformation → analysis → visualization |

## Project resources

| Resource | Path |
|----------|------|
| SQL repository | `sql/` |
| Interactive dashboard | `dashboard/Customer_Analytics_Dashboard.xlsx` + `docs/power_bi_guide.md` |
| Documentation | `docs/` |
| Key findings | `docs/key_findings.md` |
| Data | `data/*.csv` |
| Python analysis | `python/analyze.py` |
| Metrics export | `output/` |

## Snapshot KPIs (2019-07)

- Active customers: **227**
- New customers: **47**
- Churned: **125** · Churn rate: **57.87%**
- Retention: **42.13%**
- LTV proxy: **$64,054**
- Repeat purchase rate: **89.2%**

## Quick start

```bash
cd Customer_Purchase_Analysis
python python/analyze.py
# Open dashboard/Customer_Analytics_Dashboard.xlsx
# Load data/ into MySQL using sql/01_schema_mysql.sql
```

## Author

Abdulwaheed Toheeb Olanrewaju — Customer Analytics Portfolio
