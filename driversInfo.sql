CREATE PROCEDURE driversInfo()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
   SELECT summary FROM (
        SELECT CONCAT(' Total miles driven by all drivers combined: ', 
             SUM(miles_logged)) summary, '                        ' extra, 0 ord
             FROM inspections
        UNION SELECT CONCAT(' Name: ',driver_name,
             '; number of inspections: ',COUNT(miles_logged),
             '; miles driven: ',SUM(miles_logged)), driver_name, 1 
             FROM inspections GROUP BY driver_name
        UNION SELECT CONCAT('  date: ',date,'; miles covered: ',miles_logged),
             CONCAT(driver_name, date), 2 
              FROM inspections ) AS union_table
     ORDER BY extra, ord;


END