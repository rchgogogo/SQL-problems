CREATE PROCEDURE pastEvents()
BEGIN
SELECT name, event_date FROM events
WHERE DATEDIFF((SELECT MAX(event_date) FROM events), event_date) BETWEEN 1 AND 7
ORDER BY event_date DESC;
END
