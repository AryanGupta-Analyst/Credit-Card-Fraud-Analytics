/* =====================================================
SECTION 4 : AMOUNT & RISK ANALYSIS
===================================================== */

/* -----------------------------------------------------
Query 14 : Fraud Distribution by Amount Bucket
----------------------------------------------------- */
SELECT 
CASE
	WHEN Amount < 100 THEN 'Low'
    WHEN Amount BETWEEN 100 and 500 THEN 'Medium'
    WHEN Amount BETWEEN 500 and 1000 THEN 'High'
    ELSE 'Very High' 
    END AS Amount_Bucket,
    count(*) AS Total_Transaction
FROM credit_card_transactions
WHERE Fraud_Flag = 1
GROUP BY Amount_Bucket
ORDER BY Total_Transaction DESC; 

/* -----------------------------------------------------
Query 15 : Fraud Rate by Amount Bucket
----------------------------------------------------- */
SELECT 
CASE 
	WHEN Amount < 100 THEN 'Low'
    WHEN Amount BETWEEN 100 AND 500 THEN 'Medium'
    WHEN Amount BETWEEN 500 and 1000 THEN 'High'
    ELSE 'Very High' 
    END AS Amount_Bucket,
    count( CASE WHEN Fraud_Flag =1 THEN 1 END) AS Fraud_Transaction,
    count(*) AS Total_Transaction,
    round(count(CASE WHEN Fraud_Flag =1 THEN 1 END)*100/Count(*),2) AS Fraud_Rate_Percent
FROM credit_card_transactions
GROUP BY Amount_Bucket
ORDER BY Fraud_Rate_Percent DESC;

/* -----------------------------------------------------
Query 16 : High-Value Fraud Transactions
----------------------------------------------------- */
SELECT Customer_ID,
	   Amount,
       Merchant_Category, 
       Country
FROM credit_card_transactions
WHERE Fraud_Flag =1 AND Amount > 500
ORDER BY Amount DESC;

/* ----------------------------------------------------------------
Query 17 : Fraud Transactions Above Average Fraud Amount
---------------------------------------------------------------- */
SELECT Transaction_Id,
	   Customer_ID,
       Amount,
       Merchant_Category
FROM credit_card_transactions
WHERE Fraud_Flag = 1 
AND Amount > (
SELECT AVG(Amount) AS Average_Amount
FROM credit_card_transactions
WHERE Fraud_Flag=1)
ORDER BY Amount DESC;
