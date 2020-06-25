CREATE PROCEDURE marketReport()
BEGIN
SELECT IFNULL(country, 'Total:') AS country, COUNT(competitor) AS competitors 
FROM foreignCompetitors
GROUP BY country WITH ROLLUP;
#ORDER BY country;
END
