-- Check if everything imported correctly
SELECT * FROM customers LIMIT 10;

-- 1. Check total row count
SELECT COUNT(*) FROM customers;

-- 2. Check for blank TotalCharges
SELECT COUNT(*) FROM customers WHERE TotalCharges = '';

-- 3. Check for duplicate customerIDs
SELECT customerID, COUNT(*) 
FROM customers 
GROUP BY customerID 
HAVING COUNT(*) > 1;

-- 4. Fix the blank TotalCharges (convert blanks to NULL)
UPDATE customers SET TotalCharges = NULL WHERE TotalCharges = '';

-- 5. Confirm the fix worked
SELECT COUNT(*) FROM customers WHERE TotalCharges IS NULL;