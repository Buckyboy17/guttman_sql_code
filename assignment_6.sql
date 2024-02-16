SELECT m.name Name, c.committee_name AS 'Committee Assignment'
FROM    members m
JOIN    committees c
ON      m.committee_id = c.committee_id;

SELECT m.name Name, c.committee_name AS 'Committee Assignment'
FROM    members m
INNER JOIN  committees c
ON    m.committee_id = c.committee_id;

SELECT m.name Name, c.committee_name AS 'Committee Assignment'
FROM    members m
LEFT JOIN  committees c
ON    m.committee_id = c.committee_id;

SELECT m.name Name, c.committee_name AS 'Committee Assignment'
FROM    members m
RIGHT JOIN  committees c
ON    m.committee_id = c.committee_id;

SELECT m.name Name, c.committee_name AS 'Committee Assignment'
FROM    members m
LEFT JOIN  committees c
ON    m.committee_id = c.committee_id
WHERE c.committee_id IS NULL;

SELECT m.name Name, c.committee_name AS 'Committee Assignment'
FROM    members m
RIGHT JOIN  committees c
ON    m.committee_id = c.committee_id
WHERE m.committee_id IS NULL;

SELECT m.name Name, c.committee_name AS 'Committee Assignment'
FROM    members m
CROSS JOIN  committees c;
