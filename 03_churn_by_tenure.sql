-- Churn rate by tenure band
SELECT 
  CASE 
    WHEN tenure BETWEEN 0 AND 12 THEN '0-12 Months'
    WHEN tenure BETWEEN 13 AND 24 THEN '13-24 Months'
    WHEN tenure BETWEEN 25 AND 48 THEN '25-48 Months'
    ELSE '49+ Months'
  END AS tenure_band,
  COUNT(*) AS total_customers,
  ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY tenure_band
ORDER BY churn_rate_pct DESC;