CREATE PROCEDURE placesOfInterest()
BEGIN
SELECT country, 
SUM(CASE
WHEN leisure_activity_type = 'adventure park' THEN number_of_places ELSE 0 END) 
AS 'adventure_park',
SUM(CASE
WHEN leisure_activity_type = 'golf' THEN number_of_places ELSE 0 END) 
AS 'golf',
SUM(CASE
WHEN leisure_activity_type = 'river cruise' THEN number_of_places ELSE 0 END) 
AS 'river_cruise',
SUM(CASE
WHEN leisure_activity_type = 'kart racing' THEN number_of_places ELSE 0 END) 
AS 'kart_racing'
FROM countryactivities
GROUP BY country
ORDER BY country;
END