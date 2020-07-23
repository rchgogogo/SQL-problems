CREATE PROCEDURE findTable()
BEGIN
SELECT table_name AS tab_name, 
column_name AS col_name, 
data_type AS data_type
FROM information_schema.columns
WHERE table_name LIKE BINARY 'e%s' 
AND table_schema = 'ri_db'
ORDER BY tab_name, col_name;
	
END