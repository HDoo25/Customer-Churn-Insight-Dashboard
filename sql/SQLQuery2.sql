SELECT DB_NAME() AS CurrentDatabase;

-- Count total rows
SELECT COUNT(*) AS total_rows
FROM Churn..raw_data;

-- Count NULLs
SELECT
	SUM(CASE WHEN CreditScore IS NULL THEN 1 ELSE 0 END) AS missing_creditScore,
	SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS missing_age,
	SUM(CASE WHEN Tenure IS NULL THEN 1 ELSE 0 END) AS missing_tenure,
	SUM(CASE WHEN Balance IS NULL THEN 1 ELSE 0 END) AS missing_balance,
	SUM(CASE WHEN NumOfProducts IS NULL THEN 1 ELSE 0 END) AS missing_products,
	SUM(CASE WHEN HasCrCard IS NULL THEN 1 ELSE 0 END) AS missing_HasCrCard,
	SUM(CASE WHEN IsActiveMember IS NULL THEN 1 ELSE 0 END) AS missing_member,
	SUM(CASE WHEN EstimatedSalary IS NULL THEN 1 ELSE 0 END) AS missing_salary,
	SUM(CASE WHEN Exited IS NULL THEN 1 ELSE 0 END) AS missing_exited
FROM Churn..raw_data;

-- Check customerID for duplicates
SELECT CustomerId, COUNT(*)
FROM Churn..raw_data
GROUP BY CustomerID
HAVING COUNT(*) > 1;

-- Check for suspicious values
-- Numeric ranges
SELECT
	MIN(Age) AS min_age,
	MAX(Age) AS max_age,
	MIN(CreditScore) AS min_crScore,
	MAX(CreditScore) AS max_crScore,
	MIN(Tenure) AS min_tenure,
	MAX(Tenure) AS max_tenure
FROM Churn..raw_data;

-- Category levels
SELECT DISTINCT Geography FROM Churn..raw_data;
SELECT DISTINCT Gender FROM Churn..raw_data;
SELECT DISTINCT IsActiveMember FROM Churn..raw_data;
SELECT DISTINCT Exited FROM Churn..raw_data;

-- Remove unnecessary columns
ALTER TABLE Churn..raw_data
DROP COLUMN Surname, CustomerId, RowNumber;


-- END