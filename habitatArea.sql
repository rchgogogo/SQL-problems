CREATE PROCEDURE habitatArea()
BEGIN
SELECT ST_AREA(ST_ConvexHull(ST_GeomFromText(CONCAT('Multipoint(', GROUP_CONCAT(x,' ',y), ')'))))
AS area
FROM places;
END