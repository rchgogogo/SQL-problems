CREATE PROCEDURE bugsInComponent()
BEGIN
SELECT t1.bug_title, t2.component_title, t2.bugs_in_component
FROM bugcomponent bc JOIN
(SELECT bug_num, bug_title FROM 
(SELECT b.title AS bug_title, b.num AS bug_num, c.id AS component_id, c.title AS component_title
    FROM bug b JOIN component c JOIN bugcomponent bc
    ON bc.bug_num = b.num AND bc.component_id = c.id
     ) AS temp1
GROUP BY bug_title
HAVING count(*) > 1) AS t1 
JOIN
(SELECT component_id, component_title, COUNT(bug_num) AS bugs_in_component
    FROM
    (SELECT b.title AS bug_title, b.num AS bug_num, c.id AS component_id, c.title AS component_title
    FROM bug b JOIN component c JOIN bugcomponent bc
    ON bc.bug_num = b.num AND bc.component_id = c.id
     ) AS temp1
    GROUP BY component_title) AS t2
    ON bc.bug_num = t1.bug_num AND bc.component_id = t2.component_id
    ORDER BY t2.bugs_in_component DESC, t2.component_id, t1.bug_num;

END

#better solution
CREATE PROCEDURE bugsInComponent()
BEGIN
	SELECT bt.title bug_title, ct.title component_title, 
        (SELECT COUNT(*) FROM BugComponent 
         WHERE component_id = id) bugs_in_component 
    FROM Bug bt, Component ct, BugComponent
    WHERE id = component_id && bug_num = num &&
        (SELECT COUNT(*) FROM BugComponent WHERE bug_num = num) > 1
    ORDER BY bugs_in_component DESC, id, num;
END