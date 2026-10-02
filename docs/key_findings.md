# Key Findings — Customer Purchase & Revenue Analysis

**Business problem:** How can the business understand customer purchase patterns and identify changes in revenue?

**Focus month:** 2019-07 (vs prior month)

## Executive KPIs

| KPI | Value | vs prior |
|-----|------:|----------|
| Active customers | **227** | — |
| New customers | **47** | prev 62 |
| Customers churned | **125** | prev 95 |
| LTV proxy (rev / active) | **$64,054.32** | prev $61,383.26 |
| Churn rate | **57.87%** | prev 52.78% |
| Retention rate | **42.13%** | prev 47.22% |
| Repeat purchase rate | **89.2%** | — |
| Total revenue (period) | **₦124,814,025.21** | — |
| Revenue in focus month | **₦14,540,330.88** | — |

## Purchase patterns

1. **Category concentration** — Top category by revenue: **Electronics**.  
   Mix (% of revenue):  
   - Electronics: 44.3%\n   - Fashion: 27.8%\n   - Home: 19.7%\n   - Grocery: 8.2%\n
2. **Regional performance** — Top region: **Port Harcourt**.  
   - Port Harcourt: ₦29,051,549\n   - Ibadan: ₦26,970,189\n   - Abuja: ₦24,502,923\n   - Lagos: ₦23,229,263\n   - Kano: ₦21,060,101\n
3. **Channel mix**  
   - store: ₦43,692,134\n   - web: ₦42,070,806\n   - mobile: ₦39,051,085\n
4. **Quarterly active customer trend** — Active base expands from early cohorts through 2019; growth rate decelerates as the base scales (see dashboard quarterly chart).

## Revenue change signals

- Month-over-month revenue % changes are exported in analysis outputs; large negative MoM months warrant promo/seasonality review.
- LTV proxy movement month-to-month indicates whether revenue is keeping pace with the active base.
- Rising churn rate with falling retention is an early warning for lifecycle campaigns.

## Recommendations

| Priority | Action | Metric to move |
|----------|--------|----------------|
| P1 | Win-back journey for churned prior-month actives | Churn rate ↓, Retention ↑ |
| P2 | Second-order incentive for one-time buyers | Repeat purchase rate ↑ |
| P3 | Protect share in top category & region | Category/region revenue |
| P4 | Reallocate spend toward channels with higher revenue density | Revenue by channel |
| P5 | Monthly exec review of KPI strip vs prior month | All dashboard KPIs |

## Process traceability

Data ingestion (CSV) → cleaning (completed orders only) → transformation (monthly/quarterly aggregates, churn/retention) → analysis (Python + SQL) → visualization (Excel/Power BI dashboard).
