CREATE PROCEDURE checkExpenditure()
BEGIN
SELECT allowable_expenditure.id AS id, 
(CASE WHEN temp.res <= value THEN 0 ELSE temp.res-allowable_expenditure.value END) AS loss 
FROM allowable_expenditure, 
(SELECT id, SUM(expenditure_sum) AS res
FROM allowable_expenditure, expenditure_plan
WHERE WEEK(expenditure_plan.monday_date) BETWEEN left_bound AND right_bound
GROUP BY id) AS temp
WHERE allowable_expenditure.id = temp.id;	
END