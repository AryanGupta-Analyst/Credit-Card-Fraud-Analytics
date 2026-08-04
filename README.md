# Credit-Card-Fraud-Analytics
End-to-end fraud analytics project analyzing banking transactions using Excel, Power BI, and MySQL — built to identify fraud patterns and support fraud detection & investigation through interactive dashboards and SQL-based analysis.

## Dashboard Screenshot
![Excel Dashboard](Excel%20Dashboard.png)
![Power BI Page 1](Power%20Bi%20Dashboard%201.png)
![Power BI Page 2](Power%20Bi%20Dashboard%202.png)
![Power BI Page 3](Power%20Bi%20Dashboard%203.png)

## Objective
- Analyze banking transactions to identify fraud patterns across merchant categories, card types, countries, transaction time, amount buckets, and customer          behavior. 
- using three different tools to demonstrate the same analysis from multiple angles: Excel (data cleaning & dashboarding), Power BI (interactive visual              analytics), and MySQL (structured querying & investigation).

## Tools Used
- Excel — Data cleaning, Pivot Tables, Interactive Dashboard
- Power BI — 3-page Interactive Dashboard with DAX measures
- MySQL — 28 structured queries across 7 analysis sections

## Key Findings
- Overall Fraud Rate: 1.50%
- Night transactions highest fraud rate: 1.54%
- Very high-value transactions most risky: 2.04%
- Online Services and Travel top fraud categories: 1.56%

## Excel Dashboard
- 500,000 transactions analyzed
- 4 custom columns — Fraud_Label, Risk_Flag, Amount_Bucket, Time_Slot
- 15 KPI metrics
- 5 Pivot Tables
- 3 Interactive Slicers
- Professional dark-theme dashboard

## Power BI Dashboard
- 3 pages — Executive Summary, Fraud Deep Analysis, Transaction Details
- 8 DAX measures — COUNT, CALCULATE, DIVIDE, SUM, AVERAGE, MAX
- Map Visual, Line Chart, Bar Chart, Donut Chart
- Page Navigation buttons
- Rule-based HIGH, MEDIUM, LOW risk classification

## SQL Analysis (MySQL)

- The full 500,000-row dataset exceeded MySQL's practical upload size for this project, so the SQL analysis was performed on a 90,000-row representative sample of   the same dataset 
- preserving the same fraud patterns and distributions for consistent, comparable analysis.
  
## SQL Section	Description
- 1	Project Header -	Dataset & objective overview
- 2	Executive Summary -	Total transactions, fraud count, fraud rate, fraud amount
- 3	Merchant Analysis -	Fraud by merchant category, top 5 high-risk categories
- 4	Time Analysis -	Monthly trend, hourly trend, night fraud, transaction type
- 5	Amount & Risk Analysis -	Fraud by amount bucket, high-value & above-average fraud
- 6	Card & Channel Analysis -	Card type, international vs domestic, device, chip, PIN usage
- 7	Investigation Analysis -	Fraud by country, repeat offenders, ranking, latest transactions
- 8	Key Insights & Recommendations -	Business insights mapped to action items

## SQL Skills Used:
- Aggregation: COUNT, SUM, AVG, ROUND
- Conditional Logic: CASE WHEN
- Grouping & Filtering: GROUP BY, HAVING, WHERE
- Sorting & Limiting: ORDER BY, LIMIT
- String Handling: SUBSTRING
- Subqueries
- Window Functions: ROW_NUMBER, RANK, DENSE_RANK.

## Key Insights & Business Recommendations
- High fraud in Online Services	  - Apply stronger authentication and real-time monitoring.
- Fraud higher during late-night hours  - Increase alert sensitivity and strengthen overnight monitoring.
- High-value transactions create higher loss  - Introduce additional verification and manual review.
- International transactions show higher risk  - Apply country-based risk scoring for cross-border transactions.
- Some customers show repeated fraud activity  - Prioritize for investigation, consider temporary restrictions.

- ## Full Interactive Workbook
Due to file size, the complete Excel and Power BI workbook (with pivot tables, charts and slicers) is available as a ZIP file:
[Download Full Excel File (ZIP)](https://drive.google.com/file/d/1t5EJh1dqrdzs5Ppq0M_tbangSaMDe_l-/view?usp=sharing)
[Download Full Power BI File (ZIP)](https://drive.google.com/file/d/1YfmxvJTn238LJcWCwLHLvUUZeLDo9KXv/view?usp=sharing)
