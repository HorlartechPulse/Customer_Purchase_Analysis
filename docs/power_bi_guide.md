# Interactive Dashboard (Power BI)

1. Get Data → Text/CSV folder `data/`.  
2. Relationships: customers 1→* orders 1→* order_items *→1 products.  
3. Measures examples:
   - `Revenue = SUM(order_items[line_revenue])`
   - `Active Customers = DISTINCTCOUNT(orders[customer_id])`
4. Build page matching **Customer Analytics Dashboard**:
   - 6 KPI cards (Active, New, Churned, LTV, Churn %, Retention %)
   - Clustered column + line: Quarterly active & growth %
   - Gauge: QoQ growth
   - Bar: New customers in latest quarter
5. Optional: import `output/monthly_customer_metrics.csv` as an aggregated table for churn/retention.
