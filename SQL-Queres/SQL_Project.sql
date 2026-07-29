-- ============================================================
-- Project: Bank Customer Data Analysis using SQL
-- Dataset: Bank Personal Loan Modelling
-- ============================================================

---------------------------------------------------------------
-- 1. Total Customers
---------------------------------------------------------------

SELECT COUNT(*) AS Total_Customers
FROM Bank_Customer_Data_Cleaned;

---------------------------------------------------------------
-- 2. Customer Age Statistics
---------------------------------------------------------------

SELECT
MIN(Age) AS Minimum_Age,
MAX(Age) AS Maximum_Age,
ROUND(AVG(Age),2) AS Average_Age
FROM Bank_Customer_Data_Cleaned;

---------------------------------------------------------------
-- 3. Income Statistics
---------------------------------------------------------------

SELECT
MIN(Income) AS Minimum_Income,
MAX(Income) AS Maximum_Income,
ROUND(AVG(Income),2) AS Average_Income
FROM Bank_Customer_Data_Cleaned;

---------------------------------------------------------------
-- 4. Loan Distribution
---------------------------------------------------------------

SELECT
"Personal Loan",
COUNT(*) AS Customer_Count
FROM Bank_Customer_Data_Cleaned
GROUP BY "Personal Loan";

---------------------------------------------------------------
-- 5. Loan Acceptance Rate
---------------------------------------------------------------

SELECT
ROUND(
SUM("Personal Loan")*100.0/COUNT(*),2
) AS Loan_Acceptance_Rate
FROM Bank_Customer_Data_Cleaned;

---------------------------------------------------------------
-- 6. Customers by Education
---------------------------------------------------------------

SELECT
Education,
COUNT(*) AS Customers
FROM Bank_Customer_Data_Cleaned
GROUP BY Education
ORDER BY Customers DESC;

---------------------------------------------------------------
-- 7. Loan Customers by Education
---------------------------------------------------------------

SELECT
Education,
COUNT(*) AS Loan_Customers
FROM Bank_Customer_Data_Cleaned
WHERE "Personal Loan"=1
GROUP BY Education
ORDER BY Loan_Customers DESC;

---------------------------------------------------------------
-- 8. Average Income by Education
---------------------------------------------------------------

SELECT
Education,
ROUND(AVG(Income),2) AS Average_Income
FROM Bank_Customer_Data_Cleaned
GROUP BY Education;

---------------------------------------------------------------
-- 9. Family Size Distribution
---------------------------------------------------------------

SELECT
Family,
COUNT(*) AS Customers
FROM Bank_Customer_Data_Cleaned
GROUP BY Family
ORDER BY Family;

---------------------------------------------------------------
-- 10. Average Income of Loan Customers
---------------------------------------------------------------

SELECT
ROUND(AVG(Income),2) AS Average_Income
FROM Bank_Customer_Data_Cleaned
WHERE "Personal Loan"=1;

---------------------------------------------------------------
-- 11. Average Income by Loan Status
---------------------------------------------------------------

SELECT
"Personal Loan",
ROUND(AVG(Income),2) AS Average_Income
FROM Bank_Customer_Data_Cleaned
GROUP BY "Personal Loan";

---------------------------------------------------------------
-- 12. Average Mortgage by Loan Status
---------------------------------------------------------------

SELECT
"Personal Loan",
ROUND(AVG(Mortgage),2) AS Average_Mortgage
FROM Bank_Customer_Data_Cleaned
GROUP BY "Personal Loan";

---------------------------------------------------------------
-- 13. Online Banking Usage
---------------------------------------------------------------

SELECT
Online,
COUNT(*) AS Customers
FROM Bank_Customer_Data_Cleaned
GROUP BY Online;

---------------------------------------------------------------
-- 14. Credit Card Usage
---------------------------------------------------------------

SELECT
CreditCard,
COUNT(*) AS Customers
FROM Bank_Customer_Data_Cleaned
GROUP BY CreditCard;

---------------------------------------------------------------
-- 15. Securities Account Holders
---------------------------------------------------------------

SELECT
"Securities Account",
COUNT(*) AS Customers
FROM Bank_Customer_Data_Cleaned
GROUP BY "Securities Account";

---------------------------------------------------------------
-- 16. CD Account Holders
---------------------------------------------------------------

SELECT
"CD Account",
COUNT(*) AS Customers
FROM Bank_Customer_Data_Cleaned
GROUP BY "CD Account";

---------------------------------------------------------------
-- 17. Customers with Credit Card and Loan
---------------------------------------------------------------

SELECT COUNT(*) AS CreditCard_Loan_Customers
FROM Bank_Customer_Data_Cleaned
WHERE CreditCard=1
AND "Personal Loan"=1;

---------------------------------------------------------------
-- 18. Customers with CD Account and Loan
---------------------------------------------------------------

SELECT COUNT(*) AS CD_Loan_Customers
FROM Bank_Customer_Data_Cleaned
WHERE "CD Account"=1
AND "Personal Loan"=1;

---------------------------------------------------------------
-- 19. High Income Customers
---------------------------------------------------------------

SELECT
ID,
Age,
Income,
Education
FROM Bank_Customer_Data_Cleaned
WHERE Income>100
ORDER BY Income DESC;

---------------------------------------------------------------
-- 20. Top 10 Highest Income Customers
---------------------------------------------------------------

SELECT
ID,
Age,
Income,
Mortgage
FROM Bank_Customer_Data_Cleaned
ORDER BY Income DESC
LIMIT 10;

---------------------------------------------------------------
-- 21. Customers Above Average Income
---------------------------------------------------------------

SELECT
ID,
Age,
Income
FROM Bank_Customer_Data_Cleaned
WHERE Income>(
SELECT AVG(Income)
FROM Bank_Customer_Data_Cleaned
);

---------------------------------------------------------------
-- 22. Customers with Mortgage Above Average
---------------------------------------------------------------

SELECT
ID,
Income,
Mortgage
FROM Bank_Customer_Data_Cleaned
WHERE Mortgage>(
SELECT AVG(Mortgage)
FROM Bank_Customer_Data_Cleaned
);

---------------------------------------------------------------
-- 23. Income Group Segmentation
---------------------------------------------------------------

SELECT
CASE
WHEN Income<50 THEN 'Low Income'
WHEN Income BETWEEN 50 AND 100 THEN 'Medium Income'
ELSE 'High Income'
END AS Income_Group,
COUNT(*) AS Customers
FROM Bank_Customer_Data_Cleaned
GROUP BY Income_Group;

---------------------------------------------------------------
-- 24. Average Credit Card Spending by Education
---------------------------------------------------------------

SELECT
Education,
ROUND(AVG(CCAvg),2) AS Average_CC_Spending
FROM Bank_Customer_Data_Cleaned
GROUP BY Education;

---------------------------------------------------------------
-- 25. Final Business Summary
---------------------------------------------------------------

SELECT
COUNT(*) AS Total_Customers,
SUM("Personal Loan") AS Loan_Customers,
ROUND(AVG(Income),2) AS Average_Income,
ROUND(AVG(Mortgage),2) AS Average_Mortgage
FROM Bank_Customer_Data_Cleaned;