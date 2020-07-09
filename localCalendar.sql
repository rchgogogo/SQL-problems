CREATE PROCEDURE localCalendar()
BEGIN
SELECT event_id, (CASE
WHEN hours = 24 
THEN DATE_FORMAT(DATE_ADD(date, INTERVAL timeshift MINUTE), '%Y-%m-%d %H:%i')
ELSE DATE_FORMAT(DATE_ADD(date, INTERVAL timeshift MINUTE), '%Y-%m-%d %h:%i %p')
END) AS formatted_date
FROM events JOIN settings
ON events.user_id = settings.user_id
ORDER BY event_id;
END