-- Average revenue: churned vs retained customers
SELECT Churn,
       COUNT(*) AS total_customers,
       ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
       ROUND(AVG(CAST(TotalCharges AS REAL)), 2) AS avg_total_charges
FROM customers
WHERE TotalCharges IS NOT NULL
GROUP BY Churn;