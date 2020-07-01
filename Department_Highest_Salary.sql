#method1 --MS SQL Server
SELECT d.name AS 'Department', temp.name AS 'Employee', temp.Salary AS Salary
FROM department d JOIN
(SELECT name, salary, departmentid FROM employee e1
WHERE salary >= ALL(SELECT salary FROM employee e2
                  WHERE e1.departmentid = e2.departmentid)) temp
ON temp.departmentid = d.id;


#method2 --MS SQL Server
SELECT department, employee, salary FROM 
(SELECT d.name as 'department', e.name as 'employee', salary,
RANK() OVER (PARTITION BY departmentid ORDER BY salary DESC) AS 'rank_'
FROM employee e JOIN department d ON e.departmentid = d.id) AS temp
WHERE temp.rank_=1;


#method3 --MySQL
SELECT d.name AS 'Department', e.name AS 'Employee', salary
FROM department d JOIN employee e ON d.id = e.departmentid
WHERE (departmentid, salary) 
IN 
(SELECT departmentid, MAX(salary) 
FROM employee GROUP BY departmentid);
