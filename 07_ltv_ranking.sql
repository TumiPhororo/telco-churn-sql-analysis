-- Customer lifetime value ranking
WITH customer_value AS (
  SELECT customerID,
         MonthlyCharges,
         tenure,
         ROUND(MonthlyCharges * tenure, 2) AS estimated_ltv,
         Churn
  FROM customers
)
SELECT *,
       RANK() OVER (ORDER BY estimated_ltv DESC) AS ltv_rank
FROM customer_value
ORDER BY ltv_rank;