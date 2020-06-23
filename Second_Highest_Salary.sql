SELECT ISNULL((SELECT TOP 1 salary 
FROM employee
WHERE salary < (SELECT MAX(salary) 
FROM employee)
ORDER BY salary DESC), NULL) AS SecondHighestSalary;
