-- Online Retail sales analysis (Jul-Sep 2011)
-- Dataset: UCI Online Retail (541,909 rows), SQLite
-- Dashboard: Tableau Public

-- Query 0: sanity check
SELECT COUNT(*) FROM online_retail;
SELECT MIN(InvoiceDate), MAX(InvoiceDate) FROM online_retail;

-- Query 1: monthly sales
SELECT substr(InvoiceDate, 1, 7) AS month,
       ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM online_retail
WHERE InvoiceDate >= '2011-07-01'
  AND InvoiceDate <= '2011-09-30 23:59:59'
  AND InvoiceNo NOT LIKE 'C%'
  AND Quantity > 0
GROUP BY month
ORDER BY month;

-- Query 2: monthly cancellations
SELECT substr(InvoiceDate, 1, 7) AS month,
       ROUND(SUM(Quantity * UnitPrice * -1), 2) AS cancelled_value
FROM online_retail
WHERE InvoiceDate >= '2011-07-01'
  AND InvoiceDate <= '2011-09-30 23:59:59'
  AND InvoiceNo LIKE 'C%'
GROUP BY month
ORDER BY month;

-- Query 3: sales, cancellations and cancellation rate together
SELECT substr(InvoiceDate, 1, 7) AS month,
       ROUND(SUM(CASE WHEN InvoiceNo NOT LIKE 'C%' THEN Quantity * UnitPrice ELSE 0 END), 2) AS sales,
       ROUND(SUM(CASE WHEN InvoiceNo LIKE 'C%' THEN Quantity * UnitPrice * -1 ELSE 0 END), 2) AS cancellations,
       ROUND(SUM(CASE WHEN InvoiceNo LIKE 'C%' THEN Quantity * UnitPrice * -1 ELSE 0 END) * 100.0
             / SUM(CASE WHEN InvoiceNo NOT LIKE 'C%' THEN Quantity * UnitPrice ELSE 0 END), 1) AS cancellation_rate_pct
FROM online_retail
WHERE InvoiceDate >= '2011-07-01'
  AND InvoiceDate <= '2011-09-30 23:59:59'
GROUP BY month
ORDER BY month;
