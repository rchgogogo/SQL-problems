CREATE PROCEDURE closestCells()
BEGIN
SELECT p1.id AS id1, p2.id AS id2
FROM positions p1 JOIN positions p2
ON p1.id != p2.id JOIN 
(SELECT p1.id AS id, MIN(ST_DISTANCE(POINT(p1.x, p1.y), POINT(p2.x,p2.y))) AS distance
FROM positions p1 JOIN positions p2
ON p1.id != p2.id
GROUP BY p1.id) AS minimum
ON p1.id = minimum.id
WHERE p1.id != p2.id AND ST_DISTANCE(POINT(p1.x, p1.y), POINT(p2.x,p2.y)) = minimum.distance
ORDER BY p1.id;
	
END