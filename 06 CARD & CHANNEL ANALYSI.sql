/* =====================================================
SECTION 5 : CARD & CHANNEL ANALYSIS
===================================================== */

/* -----------------------------------------------------
Query 18 : Fraud Rate by Card Type
----------------------------------------------------- */
SELECT Card_Type,
	count(CASE WHEN Fraud_Flag=1 THEN 1 END) AS fraud_transations,
    count(*) AS Total_transactions,
    round(count(CASE WHEN Fraud_Flag =1 THEN 1 END)*100/count(*),2) AS Fraud_rate_percent
FROM credit_card_transactions
GROUP BY Card_Type
ORDER BY Fraud_rate_percent DESC;

/* -----------------------------------------------------
Query 19 : International vs Domestic Fraud Rate
----------------------------------------------------- */
SELECT 
CASE
	WHEN Is_International = 1 THEN 'International'
    ELSE 'Domestic'
    END AS Transaction_Scope,
    count(CASE WHEN Fraud_Flag=1 THEN 1 END) AS Fraud_Transaction,
    count(*) AS Total_Transaction,
    round(count(CASE WHEN Fraud_Flag =1 THEN 1 END)*100/Count(*),2) AS Fraud_Rate_Percent 
FROM credit_card_transactions
GROUP BY Transaction_Scope
ORDER BY fraud_rate_percent DESC;

/* -----------------------------------------------------
Query 20 : Fraud Rate by Device Type
----------------------------------------------------- */
SELECT Device_Type,
count(CASE WHEN Fraud_Flag=1 THEN 1 END) AS Fraud_Transaction,
count(*) AS Total_Transaction,
round(Count(CASE WHEN Fraud_Flag=1 THEN 1 END)*100/count(*),2)AS Fraud_Rate_Percent
FROM credit_card_transactions
GROUP BY Device_Type
ORDER BY Fraud_rate_percent DESC;

/* -----------------------------------------------------
Query 21 : Fraud Rate by Chip Usage
----------------------------------------------------- */
SELECT
CASE
	WHEN Is_Chip =1 THEN 'Chip Used'
    ELSE 'No Chip'
    END AS Chip_Status,
    count(CASE WHEN Fraud_Flag=1 THEN 1 END) AS Fraud_Transaction,
    count(*) AS Total_Transaction,
    round(count(CASE WHEN Fraud_Flag=1 THEN 1 END)*100/count(*),2) AS Fraud_Rate_Percent
FROM credit_card_transactions
GROUP BY Chip_Status
ORDER BY Fraud_rate_percent DESC;

/* -----------------------------------------------------
Query 22 : Fraud Rate by Pin Usage
----------------------------------------------------- */
SELECT 
CASE
	WHEN Is_Pin_Used =1 THEN 'Pin Used'
    ELSE 'No Pin'
    END AS Pin_Status,
    count(CASE WHEN Fraud_Flag=1 THEN 1 END) AS Fraud_Transaction,
    count(*) AS Total_Transaction,
    round(count(CASE WHEN Fraud_Flag=1 THEN 1 END)*100/count(*),2) AS Fraud_Rate_Percent
FROM credit_card_transactions
GROUP BY Pin_Status
ORDER BY  Fraud_rate_percent DESC;