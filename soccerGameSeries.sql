CREATE PROCEDURE soccerGameSeries()
BEGIN
SELECT (CASE
WHEN first_team_wins > second_team_wins THEN 1
WHEN first_team_wins < second_team_wins THEN 2
WHEN goal_diff > 0 THEN 1
WHEN goal_diff < 0 THEN 2
WHEN first_team_points > second_team_points THEN 1
WHEN first_team_points < second_team_points THEN 2
ELSE 0 END) AS winner
FROM
(SELECT
            SUM(scores.`first_team_score` > scores.`second_team_score`) `first_team_wins`,
            SUM(scores.`first_team_score` < scores.`second_team_score`) `second_team_wins`,
            SUM(scores.`first_team_score` - scores.`second_team_score`) `goal_diff`,
            (SELECT SUM(first_team_score) FROM scores WHERE match_host = 2) 'first_team_points',
            (SELECT SUM(second_team_score) FROM scores WHERE match_host = 1) 'second_team_points'
            
        FROM
            scores) AS temp;
END
