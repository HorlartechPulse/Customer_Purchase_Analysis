"""Customer purchase pattern & revenue change analysis."""
from pathlib import Path
import pandas as pd
import json

ROOT = Path(__file__).resolve().parents[1]

def main():
    customers = pd.read_csv(ROOT/"data/customers.csv", parse_dates=["signup_date"])
    orders = pd.read_csv(ROOT/"data/orders.csv", parse_dates=["order_date"])
    items = pd.read_csv(ROOT/"data/order_items.csv")
    products = pd.read_csv(ROOT/"data/products.csv")

    orders = orders[orders["status"] == "completed"]
    fact = (
        items.merge(orders, on="order_id")
        .merge(customers, on="customer_id")
        .merge(products, on="product_id")
    )
    fact["year_month"] = fact["order_date"].dt.to_period("M").astype(str)

    monthly_rev = fact.groupby("year_month")["line_revenue"].sum()
    mom = monthly_rev.pct_change()
    print("Monthly revenue MoM % change (tail):")
    print((mom * 100).tail())
    print("\nCategory mix %:")
    print((fact.groupby("category")["line_revenue"].sum() / fact["line_revenue"].sum() * 100).round(1))
    print("\nKPIs:", json.loads((ROOT/"output/kpi_snapshot.json").read_text()))

if __name__ == "__main__":
    main()
