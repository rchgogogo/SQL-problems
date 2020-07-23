CREATE PROCEDURE queriesExecution()
BEGIN
SET @code := (
SELECT 
         group_concat(
            concat('SELECT "',query_name,'" AS query_name, (', code,') AS val')
         SEPARATOR ' UNION ')
     FROM queries);
     
prepare query from @code;
execute query;
	
END