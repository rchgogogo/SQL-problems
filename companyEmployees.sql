CREATE PROCEDURE companyEmployees()
BEGIN
SELECT * FROM departments JOIN employees
ORDER BY dep_name, emp_name;	
END