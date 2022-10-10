/* HACKERRANK - SQL - MySQL - CHALLENGES - Aggregation */

/* Revising Aggregations - The Count Function
Query a count of the number of cities in CITY with populations larger than 100,000. */

SELECT COUNT(POPULATION)
FROM CITY
WHERE POPULATION > 100000;

/* Revising Aggregations - The Sum Function
Query the total population of all cities in CITY where District is California. */

SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';

/* Revising Aggregations - Averages
Query the average population of all cities in CITY where District is California. */

SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';

/* Average Population
Query the average population for all cities in CITY, rounded down to the nearest integer. */

SELECT FLOOR(AVG(POPULATION))
FROM CITY;

/*Japan Population
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN. */

SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';

/* Population Density Difference
Query the difference between the maximum and minimum populations in CITY. */

SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;

/* Weather Observation Station 2
Query the following two values from the STATION table:
1. The sum of all values in LAT_N rounded to a scale of 2 decimal places.
2. The sum of all values in LONG_W rounded to a scale of 2 decimal places. */

SELECT CAST(ROUND(SUM(LAT_N), 2) AS DECIMAL(10, 2)), CAST(ROUND(SUM(LONG_W), 2) AS DECIMAL(10, 2))
FROM STATION;

/* Weather Observation Station 13
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places. */

SELECT TRUNCATE(SUM(LAT_N), 4)
FROM STATION
WHERE LAT_N BETWEEN 38.7880 AND 137.2345;

/* Weather Observation Station 14
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places. */

SELECT TRUNCATE(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

/* Weather Observation Station 15
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places. */

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);

/* Weather Observation Station 16
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places. */

SELECT ROUND(MIN(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7780;

/* Weather Observation Station 17
Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places. */

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780);

/* Weather Observation Station 19
Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits. */

SELECT ROUND(SQRT(POWER(MAX(LAT_N) - MIN(LAT_N), 2) + POWER(MAX(LONG_W) - MIN(LONG_W), 2)), 4)
FROM STATION;

/* Weather Observation Station 20
A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places. */

SELECT ROUND(S1.LAT_N, 4) 
    FROM STATION AS S1 
    WHERE (SELECT ROUND(COUNT(S1.ID)/2) - 1 
           FROM STATION) = 
          (SELECT COUNT(S2.ID) 
           FROM STATION AS S2 
           WHERE S2.LAT_N > S1.LAT_N);
           
/* Weather Observation Station 18
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.
*/

SELECT ROUND(ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W)), 4)
FROM STATION;
