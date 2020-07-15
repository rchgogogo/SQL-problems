CREATE PROCEDURE emptyDepartments()
BEGIN
SELECT dep_name FROM departments d
LEFT JOIN employees e
ON d.id = e.department
WHERE d.id NOT IN (SELECT department FROM employees)
ORDER BY d.id;

END