/* =====================================================
SECTION 3 : TIME ANALYSIS
===================================================== */

/* -----------------------------------------------------
Query 9 : Monthly Fraud Trend
----------------------------------------------------- */
SELECT SUBSTRING(Transaction_Date, 4, 2) AS Month_Number, 
	COUNT(*) AS Fraud_Transactions
FROM credit_card_transactions 
WHERE Fraud_Flag = 1 
GROUP BY SUBSTRING(Transaction_Date, 4, 2) 
ORDER BY Month_Number;

/* -----------------------------------------------------
Query 10 : Fraud by Hour of Day
----------------------------------------------------- */
SELECT Hour_of_Day,
	count(*) AS Fraud_Transaction
FROM credit_card_transactions
WHERE Fraud_Flag = 1
GROUP BY Hour_of_Day
ORDER BY Hour_of_Day;

/* -----------------------------------------------------
Query 11 : Night Fraud Transactions
----------------------------------------------------- */
SELECT count(*) As Fraud_Transactions
FROM credit_card_transactions
WHERE Fraud_Flag =1 
AND Hour_of_Day BETWEEN 0 AND 5;

/* -----------------------------------------------------
Query 12 : Peak Fraud Hour
----------------------------------------------------- */
SELECT Hour_of_Day,
	count(*) AS Fraud_Transaction
FROM credit_card_transactions
WHERE Fraud_Flag =1
GROUP BY Hour_of_Day
ORDER BY Fraud_Transaction DESC
LIMIT 1;

/* -----------------------------------------------------
Query 13 : Fraud Rate by Transaction Type
----------------------------------------------------- */
SELECT Transaction_Type,
	count(CASE WHEN Fraud_Flag =1 THEN 1 END ) as Fraud_Count,
    count(*) AS Total_Transaction,
    round(count(CASE WHEN Fraud_Flag =1 THEN 1 END)*100/count(*),2) AS Fraud_Rate_Percent
FROM credit_card_transactions
GROUP BY Transaction_Type
ORDER BY Fraud_Rate_Percent DESC;

