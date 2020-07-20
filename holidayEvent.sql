CREATE PROCEDURE holidayEvent()
BEGIN
SELECT DISTINCT buyer_name AS winners FROM
(SELECT buyer_name, RANK()OVER(ORDER BY timestamp) AS rank_ FROM purchases) AS temp 
WHERE MOD(temp.rank_, 4) = 0
ORDER BY buyer_name;	
END