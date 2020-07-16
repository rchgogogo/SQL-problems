CREATE PROCEDURE sunnyHolidays()
BEGIN
SELECT holiday_date AS ski_date FROM holidays
JOIN weather ON holidays.holiday_date = weather.sunny_date
ORDER BY ski_date;	
END