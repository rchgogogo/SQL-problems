CREATE PROCEDURE salaryDifference()
BEGIN
SELECT IFNULL((total_max.salary - total_min.salary), 0) AS difference FROM 
(SELECT SUM(employees.salary) AS salary FROM employees, 
(SELECT MAX(salary) AS salary FROM employees) AS maximum
WHERE employees.salary = maximum.salary) AS total_max, 
(SELECT SUM(employees.salary) AS salary FROM employees, 
(SELECT MIN(salary) AS salary FROM employees) AS minimum
WHERE employees.salary = minimum.salary) AS total_min;
END