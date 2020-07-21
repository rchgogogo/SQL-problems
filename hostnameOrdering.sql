CREATE PROCEDURE hostnamesOrdering()
BEGIN
SELECT id, hostname FROM
(
SELECT id, hostname,
SUBSTRING_INDEX(hostname, '.', -1) AS c1,
SUBSTRING_INDEX(hostname, '.', -2) AS c2,
SUBSTRING_INDEX(hostname, '.', -3) AS c3
FROM hostnames
) AS temp
ORDER BY c1, 
IF(c1 = c2, '', c2), 
IF(c2 = c3, '', c3);
END