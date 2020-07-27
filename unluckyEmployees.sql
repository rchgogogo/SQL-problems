CREATE PROCEDURE unluckyEmployees()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
   SET @row = 0;
   SELECT * FROM
    (SELECT name AS dep_name, count(e.id) AS emp_number, IFNULL(SUM(salary), 0) AS total_salary 
FROM department d 
LEFT JOIN employee e 
ON e.department = d.id
    GROUP BY d.id
    HAVING count(e.id) < 6
    ORDER BY total_salary DESC, emp_number DESC, e.department) AS t1 
   
   WHERE MOD(@row := @row + 1, 2) = 1;


END