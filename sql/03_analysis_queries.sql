-- Customer purchase patterns & revenue change analysis (MySQL)

-- 1) Monthly revenue and orders
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS year_month,
       COUNT(DISTINCT o.order_id) AS orders,
       COUNT(DISTINCT o.customer_id) AS active_customers,
       ROUND(SUM(i.line_revenue), 2) AS revenue
FROM orders o
JOIN order_items i ON i.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY year_month;

-- 2) Month-over-month revenue change
WITH monthly AS (
  SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS ym,
         SUM(i.line_revenue) AS revenue
  FROM orders o
  JOIN order_items i ON i.order_id = o.order_id
  WHERE o.status = 'completed'
  GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT ym,
       ROUND(revenue, 2) AS revenue,
       ROUND(LAG(revenue) OVER (ORDER BY ym), 2) AS prev_revenue,
       ROUND(100 * (revenue - LAG(revenue) OVER (ORDER BY ym))
             / NULLIF(LAG(revenue) OVER (ORDER BY ym), 0), 2) AS mom_pct_change
FROM monthly
ORDER BY ym;

-- 3) Revenue by category
SELECT p.category,
       ROUND(SUM(i.line_revenue), 2) AS revenue,
       ROUND(100 * SUM(i.line_revenue) / SUM(SUM(i.line_revenue)) OVER (), 1) AS pct
FROM order_items i
JOIN products p ON p.product_id = i.product_id
JOIN orders o ON o.order_id = i.order_id
WHERE o.status = 'completed'
GROUP BY p.category
ORDER BY revenue DESC;

-- 4) Revenue by region
SELECT c.region,
       COUNT(DISTINCT o.customer_id) AS customers,
       ROUND(SUM(i.line_revenue), 2) AS revenue
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN order_items i ON i.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY c.region
ORDER BY revenue DESC;

-- 5) New customers by month (first completed order)
WITH first_orders AS (
  SELECT customer_id, MIN(order_date) AS first_order
  FROM orders WHERE status = 'completed'
  GROUP BY customer_id
)
SELECT DATE_FORMAT(first_order, '%Y-%m') AS cohort_month,
       COUNT(*) AS new_customers
FROM first_orders
GROUP BY DATE_FORMAT(first_order, '%Y-%m')
ORDER BY cohort_month;

-- 6) Repeat purchase rate
WITH oc AS (
  SELECT customer_id, COUNT(*) AS n_orders
  FROM orders WHERE status = 'completed'
  GROUP BY customer_id
)
SELECT
  ROUND(100 * AVG(CASE WHEN n_orders >= 2 THEN 1 ELSE 0 END), 2) AS repeat_purchase_rate_pct,
  SUM(CASE WHEN n_orders = 1 THEN 1 ELSE 0 END) AS one_time_buyers,
  SUM(CASE WHEN n_orders >= 2 THEN 1 ELSE 0 END) AS repeat_buyers
FROM oc;

-- 7) Quarterly active customers
SELECT CONCAT(YEAR(order_date), '-Q', QUARTER(order_date)) AS year_quarter,
       COUNT(DISTINCT customer_id) AS active_customers
FROM orders
WHERE status = 'completed'
GROUP BY YEAR(order_date), QUARTER(order_date)
ORDER BY year_quarter;
