CREATE PROCEDURE correctIPs()
BEGIN
SELECT * FROM ips
WHERE is_ipv4(ip) AND (ip LIKE ('%.%.__.%') OR ip LIKE ('%.%.%.__'))
ORDER BY id;	
END