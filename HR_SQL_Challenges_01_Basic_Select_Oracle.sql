/* HackerRank - SQL - Challenges - I - Basic Select - Oracle */


/* 1. Basic Select - Revising the Select Query I */
/*
Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

The CITY table is described as follows:

[/data/CITY.jpg]

(https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)
*/
/* Solution */

SELECT *
FROM CITY
WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA';


/* 2. Basic Select - Revising the Select Query II */
/*
Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

The CITY table is described as follows:

[/data/CITY.jpg]

(https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)
*/
/* Solution */

SELECT NAME
FROM CITY
WHERE POPULATION > 120000 AND COUNTRYCODE = 'USA';


/* 3. Basic Select - Select All */
/*
Query all columns (attributes) for every row in the CITY table.

The CITY table is described as follows:

[/data/CITY.jpg]

(https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)
*/
/* Solution */

SELECT *
FROM CITY;


/* 4. Basic Select - Select By ID */
/*
Select all columns for a city in CITY with the ID 1661.
Query all columns (attributes) for every row in the CITY table.

The CITY table is described as follows:

[/data/CITY.jpg]

(https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)
*/
/* Solution */

SELECT *
FROM CITY
WHERE ID = '1661';


/* 5. Basic Select - Japanese Cities' Attributes */
/*
Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

The CITY table is described as follows:

[/data/CITY.jpg]

(https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)
*/
/* Solution */

SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';


/* 6. Basic Select - Japanese Cities' Names  */
/*
Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

The CITY table is described as follows:

[/data/CITY.jpg]

(https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)
*/
/* Solution */

SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';


/* 7. Basic Select - Weather Observation Station 1 */
/*
Query a list of CITY and STATE from the STATION table.

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT CITY, STATE
FROM STATION;


/* 8. Basic Select - Weather Observation Station 3 */
/*
Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID,2)=0;


/* 9. Basic Select - Weather Observation Station 4 */
/*
Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.

For example, if there are three records in the table with CITY values 'New York', 'New York', 'Bengalaru', there are 2 different city names: 'New York' and 'Bengalaru'. The query returns 1, because
total number of records - number of unique city names = 3 - 2 = 1.
*/
/* Solution */

SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;


/* 10. Basic Select - Weather Observation Station 5 */
/*
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.

Sample Input

For example, CITY has four entries: DEF, ABC, PQRS and WXY.

Sample Output

 ABC 3 
 PQRS 4 

Explanation

When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths 3,3,4, and 3. The longest name is PQRS, but there are 3 options for shortest named city. Choose ABC, because it comes first alphabetically.

Note

You can write two separate queries to get the desired output. It need not be a single query.
*/
/* Solution */

SELECT * FROM (SELECT DISTINCT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) ASC, CITY ASC) WHERE ROWNUM = 1   
UNION  
SELECT * FROM (SELECT DISTINCT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY ASC) WHERE ROWNUM = 1;


/* 11. Basic Select - Weather Observation Station 6 */
/*
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT DISTINCT CITY
FROM STATION
WHERE REGEXP_LIKE (CITY, '^[AEIOU]', 'i');


/* 12. Basic Select - Weather Observation Station 7 */
/*
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT DISTINCT CITY
FROM STATION
WHERE REGEXP_LIKE (CITY, '[aeiou]$', 'i');


/* 13. Basic Select - Weather Observation Station 8 */
/*
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT DISTINCT CITY
FROM STATION
WHERE REGEXP_LIKE (CITY, '^[AEIOU]', 'i') AND REGEXP_LIKE (CITY, '[aeiou]$', 'i');


/* 14. Basic Select - Weather Observation Station 9 */
/*
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT DISTINCT CITY
FROM STATION
WHERE NOT REGEXP_LIKE (CITY, '^[AEIOU]', 'i');


/* 15. Basic Select - Weather Observation Station 10 */
/*
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT DISTINCT CITY
FROM STATION
WHERE NOT REGEXP_LIKE (CITY, '[aeiou]$', 'i');


/* 16. Basic Select - Weather Observation Station 11 */
/*
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT DISTINCT CITY
FROM STATION
WHERE NOT REGEXP_LIKE (CITY, '^[AEIOU]', 'i') OR NOT REGEXP_LIKE (CITY, '[aeiou]$', 'i');


/* 17. Basic Select - Weather Observation Station 12 */
/*
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT DISTINCT CITY
FROM STATION
WHERE NOT REGEXP_LIKE (CITY, '^[AEIOU]', 'i') AND NOT REGEXP_LIKE (CITY, '[aeiou]$', 'i');


/* 18. Basic Select - Higher Than 75 Marks */
/*
Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

Input Format

The STUDENTS table is described as follows:

[/data/STUDENTS.png]

(https://s3.amazonaws.com/hr-challenge-images/12896/1443815243-94b941f556-1.png)

The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.

Sample Input

[/data/STUDENTS_Input.png]

(https://s3.amazonaws.com/hr-challenge-images/12896/1443815209-cf4b260993-2.png)

Sample Output

 Ashley 
 Julia 
 Belvet 

Explanation

Only Ashley, Julia, and Belvet have Marks > 75. If you look at the last three characters of each of their names, there are no duplicates and 'ley' < 'lia' < 'vet'.
*/
/* Solution */

SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY SUBSTR(Name,-3), ID;


/* 19. Basic Select - Employee Names */
/*
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

Input Format

The Employee table containing employee data for a company is described as follows:

[/data/EMPLOYEE.png]

(https://s3.amazonaws.com/hr-challenge-images/19629/1458557872-4396838885-ScreenShot2016-03-21at4.27.13PM.png)

where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.

Sample Input

[/data/EMPLOYEE_Input.png]

(https://s3.amazonaws.com/hr-challenge-images/19629/1458558202-9a8721e44b-ScreenShot2016-03-21at4.32.59PM.png)

Sample Output

 Angela 
 Bonnie 
 Frank 
 Joe 
 Kimberly 
 Lisa 
 Michael 
 Patrick 
 Rose 
 Todd 
*/
/* Solution */

SELECT name
FROM Employee
ORDER BY name;


/* 20. Basic Select - Employee Salaries */
/*
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less 10 than months. Sort your result by ascending employee_id.

Input Format

The Employee table containing employee data for a company is described as follows:

[/data/EMPLOYEE.png]

(https://s3.amazonaws.com/hr-challenge-images/19629/1458557872-4396838885-ScreenShot2016-03-21at4.27.13PM.png)

where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.

Sample Input

[/data/EMPLOYEE_Input.png]

(https://s3.amazonaws.com/hr-challenge-images/19629/1458558202-9a8721e44b-ScreenShot2016-03-21at4.32.59PM.png)

Sample Output

 Angela 
 Michael 
 Todd 
 Joe 

Explanation

Angela has been an employee for 1 month and earns $3443 per month.
Michael has been an employee for 6 months and earns $2017 per month.
Todd has been an employee for 5 months and earns $3396 per month.
Joe has been an employee for 9 months and earns $3573 per month.

We order our output by ascending employee_id.
*/
/* Solution */

SELECT name
FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC;


