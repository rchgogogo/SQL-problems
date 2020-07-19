CREATE PROCEDURE dancingCompetition()
BEGIN
SELECT s.* FROM scores s, 
(SELECT 
MAX(first_criterion) AS max1, 
MIN(first_criterion) AS min1, 
MAX(second_criterion) AS max2, 
MIN(second_criterion) AS min2, 
MAX(third_criterion) AS max3, 
MIN(third_criterion) AS min3
FROM scores) AS extrems
WHERE
IF (s.first_criterion = max1 OR s.first_criterion = min1, 1, 0) + 
IF (s.second_criterion = max2 OR s.second_criterion = min2, 1, 0) +
IF (s.third_criterion = max3 OR s.third_criterion = min3, 1, 0) < 2;	
END