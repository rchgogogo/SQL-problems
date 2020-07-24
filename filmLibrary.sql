CREATE PROCEDURE filmLibrary()
BEGIN
SELECT a.actor AS actor, age
FROM actor_ages a JOIN starring_actors s JOIN movies m 
ON a.actor = s.actor AND m.movie = s.movie_name
WHERE genre = 
(SELECT genre FROM movies
GROUP BY genre
ORDER BY count(*) DESC
LIMIT 1)
ORDER BY age DESC, actor;