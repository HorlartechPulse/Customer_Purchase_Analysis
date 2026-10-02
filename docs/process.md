# Process

1. **Data ingestion** — Load `customers`, `products`, `orders`, `order_items` (CSV → MySQL / pandas).  
2. **Cleaning** — Keep `status = completed`; parse dates; standardize region/channel.  
3. **Transformation** — Build monthly active, new, churned, retention, revenue, quarterly actives, LTV proxy.  
4. **Analysis** — SQL repository + Python `analyze.py` for patterns and MoM revenue change.  
5. **Visualization** — Excel dashboard (Power BI-ready model); publish KPI cards + quarterly trend.
