CREATE PROCEDURE stringsStatistics()
BEGIN
	/* Write your SQL here. Terminate each statement with a semicolon. */
   DROP TABLE IF EXISTS letters;
   CREATE TEMPORARY TABLE letters(letter CHAR(1));
   INSERT INTO letters(letter) VALUES
   ('a'), ('b'), ('c'), ('d'),('e'),('f'),('g'),('h'),('i'),('j'),('k'),('l'),('m'),('n'),('o'), ('p'),('q'),('r'),('s'),('t'),('u'),('v'),('w'),('x'),('y'),('z');
   
   SELECT letter, total, occurrence, max_occurrence, COUNT(*) max_occurrence_reached 
   FROM strs JOIN
   (
   SELECT letter, SUM(occ) total, COUNT(*) occurrence, MAX(occ) max_occurrence
   FROM
   (SELECT letter, str, LENGTH(str) - LENGTH(REPLACE(str, letter, '')) AS occ FROM letters l JOIN strs s) AS temp
   WHERE occ > 0
   GROUP BY letter
   ) AS temp2
   ON max_occurrence = LENGTH(str) - LENGTH(REPLACE(str, letter, ''))
   GROUP BY letter
   ORDER BY letter
    ;
END