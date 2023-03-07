/* HackerRank - SQL - Challenges - VI - Alternative Queries - MySQL */


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

SET @NUMBER = 21;
SELECT REPEAT('* ', @NUMBER := @NUMBER - 1)
    FROM information_schema.tables LIMIT 20;


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

SET @NUMBER = 0;
SELECT REPEAT('* ', @NUMBER := @NUMBER + 1)
    FROM information_schema.tables LIMIT 20;


/* 3. Alternative Queries - Print Prime Numbers */
/*
Write a query to print all prime numbers less than or equal to 1000. Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).

For example, the output for all prime numbers ≤ 10 would be:

 2&3&5&7 
*/
/* Solution */

SET @range = 1000;

SELECT GROUP_CONCAT(R2.n SEPARATOR '&')
FROM (
        SELECT @ctr2:=@ctr2+1 "n"
        FROM information_schema.tables R2IS1,
        information_schema.tables R2IS2,
        (SELECT @ctr2:=1) TI
        WHERE @ctr2<@range
     ) R2
WHERE NOT EXISTS (
                SELECT R1.n
                FROM (
                    SELECT @ctr1:=@ctr1+1 "n"
                    FROM information_schema.tables R1IS1,
                    information_schema.tables R1IS2,
                    (SELECT @ctr1:=1) I1
                    WHERE @ctr1<@range
                ) R1
                WHERE R2.n%R1.n=0 AND R2.n>R1.n
        )


