CREATE PROCEDURE giftPackaging()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
    SELECT package_type, COUNT(*) AS number
    FROM(
    SELECT id, package_type FROM
    (
        SELECT id, package_type, volumn 
    FROM gifts g JOIN 
    (SELECT *, (length+width+height) AS volumn FROM packages) AS temp
    WHERE temp.length >= g.length
    AND temp.width >= g.width
    AND temp.height >= g.height
    ) AS t1
    WHERE t1.volumn <= ALL(SELECT volumn FROM 
    (
        SELECT id, package_type, volumn 
    FROM gifts g JOIN 
    (SELECT *, (length+width+height) AS volumn FROM packages) AS temp
    WHERE temp.length >= g.length
    AND temp.width >= g.width
    AND temp.height >= g.height
    ) AS t2 WHERE t1.id = t2.id)
    ) AS t3
    GROUP BY package_type
    ORDER BY package_type;
    
END