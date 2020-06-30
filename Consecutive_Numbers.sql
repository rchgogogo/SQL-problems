/* Write your T-SQL query statement below */
SELECT DISTINCT l1.num AS consecutiveNums
FROM logs l1, logs l2, logs l3
WHERE l1.num = l2.num
AND l2.num = l3.num
AND l3.id - l2.id = 1
AND l2.id - l1.id = 1;