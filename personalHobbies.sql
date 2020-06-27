CREATE PROCEDURE personalHobbies()
BEGIN
SELECT name FROM people_hobbies
WHERE FIND_IN_SET('reading', hobbies) AND FIND_IN_SET('sports', hobbies);
END