CREATE PROCEDURE orderingEmails()
BEGIN
SELECT id, email_title, (CASE
WHEN size < POWER(2, 20) THEN CONCAT(FLOOR(size/POWER(2, 10)),' Kb')
ELSE CONCAT(FLOOR(size/POWER(2, 20)), ' Mb')	
END) AS short_size
FROM emails
ORDER BY size desc;
END
