CREATE PROCEDURE top5AverageGrade()
BEGIN
SELECT ROUND(AVG(students.grade), 2) AS average_grade FROM students,
(SELECT student_id, grade FROM students
ORDER BY grade DESC LIMIT 5) AS topfive
WHERE students.student_id = topfive.student_id;	
END