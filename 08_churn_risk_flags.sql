-- High-value customers at risk of churning
SELECT customerID,
       MonthlyCharges,
       tenure,
       Contract,
       Churn,
       CASE
         WHEN MonthlyCharges > 70 AND Contract = 'Month-to-month' AND tenure < 12 THEN 'High Risk'
         WHEN MonthlyCharges > 50 AND Contract = 'Month-to-month' THEN 'Medium Risk'
         ELSE 'Low Risk'
       END AS churn_risk_flag
FROM customers
ORDER BY MonthlyCharges DESC;