CREATE PROCEDURE scholarshipsDistribution()
BEGIN
SELECT candidate_id AS student_id from candidates
WHERE candidate_id NOT IN (SELECT student_id FROM detentions)
ORDER BY candidate_id;
END