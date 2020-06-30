CREATE PROCEDURE validPhoneNumbers()
BEGIN
SELECT * FROM phone_numbers
WHERE phone_number RLIKE '^(1-|\\(1\\))([0-9]{3}-)([0-9]{3}-)[0-9]{4}$'
ORDER BY surname;	
END