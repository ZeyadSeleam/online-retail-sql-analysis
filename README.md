# Online Retail Sales Analysis (Jul-Sep 2011)

SQL analysis of 541,909 transactions from the UCI Online Retail dataset, with results visualized in an interactive Tableau Public dashboard.

## What I did
- Cleaned raw US-format dates into proper timestamps in SQL (SQLite)
- Separated true sales from cancellations using conditional aggregation (CASE WHEN)
- Calculated monthly revenue, cancellation value and cancellation rate

## Results
- Monthly revenue grew from 719K in July to 1.06M in September
- Cancellation rate peaked at 7.4% in August before dropping to 3.7% in September

## Files
- online_retail_analysis.sql: all queries used in the analysis

## Dashboard
Interactive Tableau Public dashboard:
https://public.tableau.com/app/profile/zeyad.seleam/viz/OnlineRetailSalesvsCancellations/OnlineRetailSalesvsCancellationsJul-Sep2011

## Tools
SQL (SQLite), Excel, Tableau Public
