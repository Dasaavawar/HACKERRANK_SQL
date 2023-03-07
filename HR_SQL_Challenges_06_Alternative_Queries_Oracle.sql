/* HackerRank - SQL - Challenges - VI - Alternative Queries - Oracle */


/* 1. Alternative Queries - Draw The Triangle 1 */
/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

 * * * * * 
 * * * * 
 * * * 
 * * 
 * 

Write a query to print the pattern P(20). 
*/
/* Solution */

SELECT SYS_CONNECT_BY_PATH(NULL, '* ') FROM DUAL CONNECT BY ROWNUM <= 20 ORDER BY 1 DESC;


/* 2. Alternative Queries - Draw The Triangle 2 */
/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

 * 
 * * 
 * * * 
 * * * * 
 * * * * * 

Write a query to print the pattern P(20).
*/
/* Solution */

SELECT SYS_CONNECT_BY_PATH(NULL, '* ') FROM DUAL CONNECT BY ROWNUM <= 20 ORDER BY 1 ASC;


/* 3. Alternative Queries - Print Prime Numbers */
/*
Write a query to print all prime numbers less than or equal to 1000. Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).

For example, the output for all prime numbers ≤ 10 would be:

 2&3&5&7 
*/
/* Solution */

SELECT listagg(Prime_Number,'&') within GROUP(ORDER BY Prime_Number)
FROM (SELECT L Prime_Number FROM
     (SELECT LEVEL L 
     FROM Dual
     CONNECT BY LEVEL <= 1000),
     (SELECT LEVEL M
     FROM Dual
     CONNECT BY LEVEL <= 1000)
     WHERE M <= L
     GROUP BY L
     HAVING COUNT(CASE WHEN L/M = TRUNC(L/M) THEN 'Y' END) = 2
     ORDER BY L);


