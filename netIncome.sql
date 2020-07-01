CREATE PROCEDURE netIncome()
BEGIN
SELECT YEAR(date) AS year, QUARTER(date) AS quarter, (SUM(profit)-SUM(loss)) AS net_profit
FROM accounting
GROUP BY year, quarter; 	
END