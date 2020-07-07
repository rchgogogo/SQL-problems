CREATE PROCEDURE userCountries()
BEGIN
SELECT id, IFNULL(country, 'unknown') AS country
FROM users LEFT JOIN cities c 
ON users.city = c.city
ORDER BY id;
END