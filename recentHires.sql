CREATE PROCEDURE recentHires()
BEGIN
SELECT name AS names FROM 
((SELECT 1 AS department, name FROM pr_department
ORDER BY date_joined DESC
LIMIT 5) 
UNION ALL
(SELECT 2 AS department, name FROM it_department
ORDER BY date_joined DESC
LIMIT 5) 
UNION ALL
(SELECT 3 AS department, name FROM sales_department
ORDER BY date_joined DESC
LIMIT 5)) AS uniontable
ORDER BY department, name;

END