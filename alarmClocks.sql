CREATE PROCEDURE alarmClocks()
BEGIN
SET @date := (SELECT input_date FROM userinput);
SET @initial := @date;

DROP TABLE IF EXISTS alarmlist;
CREATE TABLE alarmlist
(alarm_date DATETIME);

WHILE YEAR(@date) = YEAR(@initial) DO
INSERT INTO alarmlist (alarm_date)
SELECT @date;
SET @date := @date + INTERVAL 7 DAY;
END WHILE;

SELECT * FROM alarmlist;
END