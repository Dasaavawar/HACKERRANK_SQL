/* HACKERRANK - SQL - MySQL - CHALLENGES - Advanced Select */

/*
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
Equilateral: It's a triangle with sides of equal length.
Isosceles: It's a triangle with sides of equal length.
Scalene: It's a triangle with sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle. */

SELECT
  CASE 
    WHEN A + B <= C or A + C <= B or B + C <= A THEN 'Not A Triangle'
    WHEN A = B and B = C THEN 'Equilateral'
    WHEN A = B or A = C or B = C THEN 'Isosceles'
    WHEN A <> B and B <> C THEN 'Scalene'
  END tuple
FROM TRIANGLES;

/* The PADS
Generate the following two result sets:
1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
2. Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format: There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically. */

SELECT CONCAT(NAME,'(',UPPER(SUBSTRING(OCCUPATION,1,1)),')') FROM OCCUPATIONS
ORDER BY NAME;

SELECT CONCAT('There are a total of', ' ', COUNT(OCCUPATION), ' ', LOWER(OCCUPATION), 's', '.') FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(OCCUPATION) ASC;

/* Occupations
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively. */

SET @r1=0, @r2=0, @r3=0, @r4=0;
SELECT MIN(Doctor), MIN(Professor), MIN(Singer), MIN(Actor)
FROM(SELECT CASE WHEN OCCUPATION='Doctor' THEN (@r1:=@r1+1)
     WHEN OCCUPATION='Professor' THEN (@r2:=@r2+1)
     WHEN OCCUPATION='Singer' THEN (@r3:=@r3+1)
     WHEN OCCUPATION='Actor' THEN (@r4:=@r4+1) END AS RowNumber,
     CASE WHEN OCCUPATION='Doctor' THEN NAME END AS Doctor,
     CASE WHEN OCCUPATION='Professor' THEN NAME end as Professor,
     CASE WHEN OCCUPATION='Singer' THEN NAME END AS Singer,
     CASE WHEN OCCUPATION='Actor' THEN NAME END AS Actor
     FROM OCCUPATIONS ORDER BY NAME
) Temp GROUP BY RowNumber;

/* Binary Tree Nodes
You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:
Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node. */

SELECT N,
IF(P IS NULL, 'Root', IF((SELECT COUNT(*) FROM BST WHERE P = B.N)> 0, 'Inner', 'Leaf')) 
FROM BST AS B 
ORDER BY N;

/* New Companies
Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code. */

SELECT c.company_code, c.founder, COUNT(DISTINCT lm.lead_manager_code), COUNT(DISTINCT sm.senior_manager_code), COUNT(DISTINCT m.manager_code), COUNT(DISTINCT e.employee_code) FROM Company c, Lead_Manager lm, Senior_Manager sm, Manager m, Employee e
WHERE c.company_code = lm.company_code AND lm.lead_manager_code = sm.lead_manager_code AND sm.senior_manager_code = m.senior_manager_code AND m.manager_code = e.manager_code GROUP BY c.company_code, c.founder
ORDER BY c.company_code
