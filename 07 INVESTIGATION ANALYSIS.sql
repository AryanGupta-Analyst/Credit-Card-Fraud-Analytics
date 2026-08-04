/* =====================================================
SECTION 6 : INVESTIGATION ANALYSIS
===================================================== */

/* -----------------------------------------------------
Query 23 : Fraud Transactions by Country
----------------------------------------------------- */
SELECT Country,
count(*) AS Fraud_Transaction
FROM credit_card_transactions
WHERE Fraud_Flag =1 
GROUP BY Country
ORDER BY Fraud_transaction DESC;

/* ------------------------------------------------------------
Query 24 : Top 10 Suspicious Customers by Fraud Count
------------------------------------------------------------ */
SELECT Customer_ID,
	count(*) AS Fraud_Count
FROM credit_card_transactions
WHERE Fraud_Flag =1 
GROUP BY Customer_ID
HAVING count(*) >= 2 
ORDER BY Fraud_count DESC
LIMIT 10;

/* ---------------------------------------------------
Query 25 : Rank Countries by Fraud Amount
--------------------------------------------------- */
SELECT Country,
	 round(sum(Amount),2)AS Fraud_Amount,
     RANK() OVER (ORDER BY sum(Amount) DESC) AS Fraud_Rank
FROM credit_card_transactions
WHERE Fraud_Flag=1
GROUP BY Country;

/* ------------------------------------------------------
Query 26 : Dense Rank Countries by Fraud Amount
------------------------------------------------------ */
SELECT Country,
	 round(sum(Amount),2)AS Fraud_Amount,
     DENSE_RANK() OVER (ORDER BY sum(Amount) DESC) AS Fraud_Rank
FROM credit_card_transactions
WHERE Fraud_Flag=1
GROUP BY Country;

/* ------------------------------------------------------
Query 27 : Latest Fraud Transaction per Customer
------------------------------------------------------ */
SELECT *
FROM(
	SELECT Customer_ID,
	Transaction_Id,
	Transaction_Date,
	Amount,
	Country,
	ROW_NUMBER() OVER( PARTITION BY  Customer_ID ORDER BY Transaction_Date DESC) as Row_Num
    FROM credit_card_transactions
    WHERE Fraud_Flag =1
    ) X
    WHERE Row_Num =1;
    
    /* ------------------------------------------------------
Query 28 : Customers with Above-Average Fraud Count
---------------------------------------------------------- */
    SELECT Customer_ID,
		count(*) AS Fraud_Count
    FROM credit_card_transactions
    WHERE Fraud_Flag=1
    GROUP BY Customer_ID
    HAVING count(*) > 
	(				
		SELECT AVG(Fraud_Count) 
        FROM(
			SELECT count(*) AS Fraud_Count
    FROM credit_card_transactions
    WHERE Fraud_Flag=1
    GROUP BY Customer_ID
    ) x
    )
    ORDER BY Fraud_Count DESC;