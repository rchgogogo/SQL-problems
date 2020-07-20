CREATE PROCEDURE trackingSystem()
BEGIN
SELECT t1.anonymous_id AS anonym_id, t1.event_name AS last_null, t2.event_name AS first_notnull FROM
(SELECT anonymous_id, event_name FROM tracks a 
WHERE user_id IS NULL AND received_at >= ALL(SELECT received_at FROM tracks b WHERE a.anonymous_id = b.anonymous_id AND user_id IS NULL)) t1
LEFT JOIN
(SELECT anonymous_id, event_name FROM tracks a 
WHERE user_id IS NOT NULL AND received_at <= ALL(SELECT received_at FROM tracks b WHERE a.anonymous_id = b.anonymous_id AND user_id IS NOT NULL)) t2
ON t1.anonymous_id = t2.anonymous_id
ORDER BY t1.anonymous_id;
        
    
END