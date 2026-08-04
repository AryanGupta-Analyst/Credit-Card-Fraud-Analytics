/* =====================================================
SECTION 1 : EXECUTIVE SUMMARY
===================================================== */

/* -----------------------------------------------------
Query 1 : Total Number of Transactions
----------------------------------------------------- */
SELECT COUNT(*) As Total_Transaction
FROM credit_card_transactions;

/* -----------------------------------------------------
Query 2 : Total Fraud Transactions
----------------------------------------------------- */
SELECT count(*) As Total_Fraud_Transaction
FROM credit_card_transactions
WHERE Fraud_Flag = 1;

/* -----------------------------------------------------
Query 3 : Fraud Rate Percentage
----------------------------------------------------- */
SELECT 
	round(count(CASE WHEN Fraud_Flag =1 THEN 1 END) *100/ count(*),2) AS Fraud_Rate_Percent
FROM credit_card_transactions;

/* -----------------------------------------------------
Query 4 : Total Fraud Amount
----------------------------------------------------- */
SELECT round(sum(amount),2) AS Total_Fraud_Amount
FROM credit_card_transactions
WHERE Fraud_Flag = 1;

/* -----------------------------------------------------
Query 5 : Average Fraud Amount
----------------------------------------------------- */
SELECT round(AVG(amount),2) AS Average_Fraud_Amount
FROM credit_card_transactions
WHERE Fraud_Flag = 1;














