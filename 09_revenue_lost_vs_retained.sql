-- Monthly revenue lost to churn vs retained
SELECT 
  ROUND(SUM(CASE WHEN Churn = 'Yes' THEN MonthlyCharges ELSE 0 END), 2) AS monthly_revenue_lost,
  ROUND(SUM(CASE WHEN Churn = 'No' THEN MonthlyCharges ELSE 0 END), 2) AS monthly_revenue_retained
FROM customers;