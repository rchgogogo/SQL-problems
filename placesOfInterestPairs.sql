#Method1
CREATE PROCEDURE placesOfInterestPairs()
BEGIN

SELECT s1.name AS place1, s2.name AS place2
FROM sights s1 JOIN sights s2
ON s1.name < s2.name
WHERE POWER((s1.x-s2.x), 2) + POWER((s1.y-s2.y), 2) < 25
ORDER BY place1, place2;

END



#Method2
CREATE PROCEDURE placesOfInterestPairs()
BEGIN

SELECT s1.name AS place1, s2.name AS place2
FROM sights s1 JOIN sights s2
ON s1.name < s2.name
WHERE ST_Distance(POINT(s1.x, s1.y), POINT(s2.x, s2.y)) < 5
ORDER BY place1, place2;

END