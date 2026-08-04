/* =====================================================
SECTION 2 : MERCHANT ANALYSIS
===================================================== */

/* -----------------------------------------------------
Query 6 : Fraud Transactions By Merchant Category
----------------------------------------------------- */
SELECT Merchant_Category,
	count(*) AS Fraud_Transactions
FROM credit_card_transactions
WHERE Fraud_Flag = 1
GROUP BY Merchant_Category
ORDER BY Fraud_Transactions DESC;

/* -----------------------------------------------------
Query 7 : Fraud Rate By Merchant Category
----------------------------------------------------- */
SELECT Merchant_Category,
	count(CASE WHEN Fraud_Flag =1 THEN 1 END) AS Fraud_Count,
	count(*) AS Total_Transactions,
    round(count(CASE WHEN Fraud_Flag = 1 THEN 1 END) * 100/ Count(*),2) AS Fraud_Rate_Percent
FROM credit_card_transactions
GROUP BY  Merchant_Category
ORDER BY Fraud_Rate_Percent DESC;

/* -----------------------------------------------------
Query 8 : Top 5 High-Risk Merchant Categories
----------------------------------------------------- */
SELECT Merchant_Category,
	round(count(CASE WHEN Fraud_Flag = 1 THEN 1 END) *100 / count(*),2) AS Fraud_Rate_Percent
FROM credit_card_transactions
GROUP BY Merchant_Category
HAVING count(*) > 100
ORDER BY Fraud_Rate_Percent DESC 
LIMIT 5;








