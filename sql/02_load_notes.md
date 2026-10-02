# Load CSVs into MySQL

```bash
mysql -u root -p customer_analytics

LOAD DATA LOCAL INFILE 'data/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
IGNORE 1 LINES;

-- Repeat for products, orders, order_items (add order_item_id null / auto)
```

Or use Python: `python/load_mysql.py` (optional).
