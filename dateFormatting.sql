CREATE PROCEDURE dateFormatting()
BEGIN
SELECT CONVERT(date_str, date) AS date_iso
FROM documents
ORDER BY id;
END