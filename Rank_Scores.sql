/* Write your T-SQL query statement below */
SELECT score, DENSE_RANK() OVER (ORDER BY score DESC) AS 'Rank'
FROM scores;
