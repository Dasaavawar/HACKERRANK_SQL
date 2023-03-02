/* HackerRank - SQL - Challenges - III - Aggregations - Oracle */


/* 1. Aggregations - Revising Aggregations - The Count Function */
/*
Query a count of the number of cities in CITY with populations larger than 100,000. 

Input Format

The CITY table is described as follows:

[/data/CITY.jpg]

(https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)
*/
/* Solution */

SELECT COUNT(POPULATION)
FROM CITY
WHERE POPULATION > 100000;


/* 2. Aggregations - Revising Aggregations - The Sum Function */
/*
Query the total population of all cities in CITY where District is California.

Input Format

The CITY table is described as follows:

[/data/CITY.jpg]

(https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)
*/
/* Solution */

SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';


/* 3. Aggregations - Revising Aggregations - Averages */
/*
Query the average population of all cities in CITY where District is California.

Input Format

The CITY table is described as follows:

[/data/CITY.jpg]

(https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg) */
/* Solution */

SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';


/* 4. Aggregations - Average Population */
/*
Query the average population for all cities in CITY, rounded down to the nearest integer.

Input Format

The CITY table is described as follows:

[/data/CITY.jpg]

(https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)
*/
/* Solution */

SELECT FLOOR(AVG(POPULATION))
FROM CITY;


/* 5. Aggregations - Japan Population */
/*
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

Input Format

The CITY table is described as follows:

[/data/CITY.jpg]

(https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)
*/
/* Solution */

SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';


/* 6. Aggregations - Population Density Difference */
/*
Query the difference between the maximum and minimum populations in CITY.

Input Format

The CITY table is described as follows:

[/data/CITY.jpg]

(https://s3.amazonaws.com/hr-challenge-images/8137/1449729804-f21d187d0f-CITY.jpg)
*/
/* Solution */

SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;


/* 7. Aggregations - The Blunder */

/*
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it up to the next integer.

Input Format

The EMPLOYEE table is described as follows:

[/data/EMPLOYEE_02.png]

(https://s3.amazonaws.com/hr-challenge-images/12893/1443817108-adc2235c81-1.png)

Note: Salary is per month.

Constraints

 1000 < Salary < 10^5 

Sample Input

[/data/EMPLOYEE_02_Input.png]

(https://s3.amazonaws.com/hr-challenge-images/12893/1443817161-299cc6eb7f-2.png)

Sample Output

 2061 

Explanation

The table below shows the salaries without zeros as they were entered by Samantha:

[/data/EMPLOYEE_02_Explanation.png]

(https://s3.amazonaws.com/hr-challenge-images/12893/1443817229-eb00d44a3b-3.png)

Samantha computes an average salary of 98.00. The actual average salary is 2159.00.

The resulting error between the two calculations is 2159.00 - 98.00 = 2061.00. Since it is equal to the integer 2061, it does not get rounded up. 
*/
/* Solution */

SELECT CEIL(AVG(Salary) - AVG(CAST(REPLACE(Salary,'0','') AS DECIMAL)))
FROM EMPLOYEES;


/* 8. Aggregations - Top Earners */
/* 
We define an employee's total earnings to be their monthly salary x months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.

Input Format

The EMPLOYEE table containing employee data for a company is described as follows:

[/data/EMPLOYEE.png]

(https://s3.amazonaws.com/hr-challenge-images/19629/1458557872-4396838885-ScreenShot2016-03-21at4.27.13PM.png)

where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is the their monthly salary.

Sample Input

[/data/EMPLOYEE_Input.png]

(https://s3.amazonaws.com/hr-challenge-images/19631/1458559098-23bf583125-ScreenShot2016-03-21at4.32.59PM.png)

Sample Output

 69952 1 

Explanation

The table and earnings data is depicted in the following diagram:

[/data/EMPLOYEE_Explanation.png]

(https://s3.amazonaws.com/hr-challenge-images/19631/1458559218-9f37585c7a-ScreenShot2016-03-21at4.49.23PM.png)

The maximum earnings value is 69952. The only employee with earnings = 69952 is Kimberly, so we print the maximum earnings value (69952) and a count of the number of employees who have earned $69952 (which is 1) as two space-separated values.
*/
/* Solution */

SELECT * FROM (SELECT MAX(months * salary), COUNT(*)FROM EMPLOYEE GROUP BY months * salary ORDER BY months * salary DESC)
WHERE ROWNUM <= 1 ;


/* 9. Aggregations - Weather Observation Station 2 */
/*
Query the following two values from the STATION table:

  1.  The sum of all values in LAT_N rounded to a scale of 2 decimal places.
  2.  The sum of all values in LONG_W rounded to a scale of 2 decimal places.

Input Format

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.

Output Format

Your results must be in the form:

 lat lon 

where lat is the sum of all values in LAT_N and lon is the sum of all values in LONG_W. Both results must be rounded to a scale of 2 decimal places.
*/
/* Solution */

SELECT CAST(ROUND(SUM(LAT_N), 2) AS DECIMAL(10, 2)), CAST(ROUND(SUM(LONG_W), 2) AS DECIMAL(10, 2))
FROM STATION;


/* 10. Aggregations - Weather Observation Station 13 */
/*
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.

Input Format

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT ROUND(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;


/* 11. Aggregations - Weather Observation Station 14 */
/*
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.

Input Format

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT ROUND(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;


/* 12. Aggregations - Weather Observation Station 15 */
/*
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.

Input Format

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);


/* 13. Aggregations - Weather Observation Station 16 */
/*
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.

Input Format

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT ROUND(MIN(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7780;


/* 14. Aggregations - Weather Observation Station 17 */
/*
Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.

Input Format

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780);


/* 15. Aggregations - Weather Observation Station 18 */
/*
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

  1.  a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
  2.  b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
  3.  c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
  4.  d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places. (https://xlinux.nist.gov/dads/HTML/manhattanDistance.html)

Input Format

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT ROUND(ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W)), 4)
FROM STATION;


/* 16. Aggregations - Weather Observation Station 19 */
/*
Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits. (https://en.wikipedia.org/wiki/Euclidean_distance)

Input Format

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT ROUND(SQRT(POWER(ABS(MAX(LONG_W) - MIN(LONG_W)), 2) + POWER(ABS(MAX(LAT_N) - MIN(LAT_N)), 2)), 4)
FROM STATION;


/* 17. Aggregations - Weather Observation Station 20 */
/*
A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places. (https://en.wikipedia.org/wiki/Median)

Input Format

The STATION table is described as follows:

[/data/STATION.jpg]

(https://s3.amazonaws.com/hr-challenge-images/9336/1449345840-5f0a551030-Station.jpg)

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/
/* Solution */

SELECT ROUND(MEDIAN(LAT_N), 4)
FROM STATION;


