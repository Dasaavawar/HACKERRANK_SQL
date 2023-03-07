/* HackerRank - SQL - Challenges - V - Advanced Join - MySQL */


/* 1. Advanced Join - SQL Project Planning */
/*
You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.

[/data/Projects.png]

(https://s3.amazonaws.com/hr-challenge-images/12894/1443819551-639948acc0-1.png)

If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.

Sample Input

[/data/Projects_Input.png]

(https://s3.amazonaws.com/hr-challenge-images/12894/1443819440-1c40e943a1-2.png)

Sample Output

 2015-10-28 2015-10-29 
 2015-10-30 2015-10-31 
 2015-10-13 2015-10-15 
 2015-10-01 2015-10-04 

Explanation

The example describes following four projects:

Project 1: Tasks 1, 2 and 3 are completed on consecutive days, so these are part of the project. Thus start date of project is 2015-10-01 and end date is 2015-10-04, so it took 3 days to complete the project.

Project 2: Tasks 4 and 5 are completed on consecutive days, so these are part of the project. Thus, the start date of project is 2015-10-13 and end date is 2015-10-15, so it took 2 days to complete the project.

Project 3: Only task 6 is part of the project. Thus, the start date of project is 2015-10-28 and end date is 2015-10-29, so it took 1 day to complete the project.

Project 4: Only task 7 is part of the project. Thus, the start date of project is 2015-10-30 and end date is 2015-10-31, so it took 1 day to complete the project.
*/
/* Solution */

SELECT T1.Start_Date, T2.End_date
FROM (
    SELECT Start_Date, row_number() OVER( ORDER BY Start_Date ASC) AS rn 
    FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) AS T1
JOIN 
(SELECT End_Date, row_number() OVER(ORDER BY Start_Date ASC) AS rn FROM Projects WHERE End_Date NOT IN (Select Start_Date from Projects)) AS T2 
ON T1.rn = T2.rn 
ORDER BY DATEDIFF(T2.End_Date, T1.Start_Date) ASC, T1.Start_Date ASC;


/* 2. Advanced Join - Placements */
/*
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

[/data/Placements.png]

(https://s3.amazonaws.com/hr-challenge-images/12895/1443820186-2a9b4939a8-1.png)

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

Sample Input

[/data/Placements_Students_Input.png]

(https://s3.amazonaws.com/hr-challenge-images/12895/1443820079-9bd1e231b1-2_1.png)

[/data/Placements_Friends_&_Packages_Input.png]

(https://s3.amazonaws.com/hr-challenge-images/12895/1443820100-adb691b2f5-2_2.png)

Sample Output

 Samantha 
 Julia 
 Scarlet 

Explanation

See the following table:

[/data/Placements_Explanation.png]

(https://s3.amazonaws.com/hr-challenge-images/12895/1443819966-c37c146d27-3.png)

Now,

Samantha's best friend got offered a higher salary than her at 11.55

Julia's best friend got offered a higher salary than her at 12.12

Scarlet's best friend got offered a higher salary than her at 15.2

Ashley's best friend did NOT get offered a higher salary than her

The name output, when ordered by the salary offered to their friends, will be:

 Samantha 
 Julia 
 Scarlet 
*/
/* Solution */

SELECT Students.name
FROM Students
JOIN Friends on Friends.ID = Students.ID
JOIN Packages Sp on Sp.ID = Students.ID
JOIN Packages Fp on Fp.ID = Friends.Friend_ID
WHERE Fp.Salary > Sp.Salary
ORDER BY Fp.Salary;


/* 3. Advanced Join - Symmetric Pairs */
/*
You are given a table, Functions, containing two columns: X and Y.

[/data/Functions.png]

(https://s3.amazonaws.com/hr-challenge-images/12892/1443818798-51909e977d-1.png)

Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.

Sample Input

[/data/Functions_Input.png]

(https://s3.amazonaws.com/hr-challenge-images/12892/1443818693-b384c24e35-2.png)

Sample Output

 20 20 
 20 21 
 22 23 
*/
/* Solution */

SELECT A.X, A.Y
FROM FUNCTIONS A
JOIN FUNCTIONS B
ON A.X = B.Y AND B.X=A.Y
GROUP BY A.X, A.Y HAVING COUNT(A.X)>1 OR A.X<A.Y
ORDER BY A.X


/* 4. Advanced Join - Interviews */
/*
Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are 0.

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds 1 screening contest.

Input Format

The following tables hold interview data:

  1.  Contests: The contest_id is the id of the contest, hacker_id is the id of the hacker who created the contest, and name is the name of the hacker.

[/data/Contests.png]

(https://s3.amazonaws.com/hr-challenge-images/19596/1458517426-e017c3460e-ScreenShot2016-03-21at4.57.47AM.png)

  2.  Colleges: The college_id is the id of the college, and contest_id is the id of the contest that Samantha used to screen the candidates.

[/data/Colleges.png]

(https://s3.amazonaws.com/hr-challenge-images/19596/1458517503-fd4aa63111-ScreenShot2016-03-21at4.57.56AM.png)

  3.  Challenges: The challenge_id is the id of the challenge that belongs to one of the contests whose contest_id Samantha forgot, and college_id is the id of the college where the challenge was given to candidates.

[/data/Challenges.png]

(https://s3.amazonaws.com/hr-challenge-images/19596/1458517661-a642f750ce-ScreenShot2016-03-21at4.58.04AM.png)

  4.  View_Stats: The challenge_id is the id of the challenge, total_views is the number of times the challenge was viewed by candidates, and total_unique_views is the number of times the challenge was viewed by unique candidates.

[/data/View_Stats.png]

(https://s3.amazonaws.com/hr-challenge-images/19596/1458517983-b4302286a8-ScreenShot2016-03-21at4.58.15AM.png)

  5.  Submission_Stats: The challenge_id is the id of the challenge, total_submissions is the number of submissions for the challenge, and total_accepted_submission is the number of submissions that achieved full scores.

[/data/Submission_Stats.png]
  
(https://s3.amazonaws.com/hr-challenge-images/19596/1458518090-80983c916a-ScreenShot2016-03-21at4.58.27AM.png)

Sample Input

Contests Table:

[/data/Contests_Input.png]

(https://s3.amazonaws.com/hr-challenge-images/19596/1458519044-d788f8a6ee-ScreenShot2016-03-21at4.58.39AM.png)

Colleges Table:

[/data/Colleges_Input.png]

(https://s3.amazonaws.com/hr-challenge-images/19596/1458519098-912836d6ac-ScreenShot2016-03-21at4.59.22AM.png)

Challenges Table:

[/data/Challenges_Input_04.png]

(https://s3.amazonaws.com/hr-challenge-images/19596/1458519120-c531743caf-ScreenShot2016-03-21at4.59.32AM.png)

View_Stats Table:

[/data/View_Stats_Input.png]

(https://s3.amazonaws.com/hr-challenge-images/19596/1458519152-107a67866b-ScreenShot2016-03-21at4.59.43AM.png)

Submission_Stats Table:

[/data/Submission_Stats_Input.png]

(https://s3.amazonaws.com/hr-challenge-images/19596/1458519173-091aba871a-ScreenShot2016-03-21at4.59.55AM.png)

Sample Output

 66406 17973 Rose 111 39 156 56 
 66556 79153 Angela 0 0 11 10 
 94828 80275 Frank 150 38 41 15 

Explanation

The contest 66406 is used in the college 11219. In this college 11219, challenges 18765 and 47127 are asked, so from the view and submission stats:

Sum of total submissions = 27 + 56 + 28 = 111

Sum of total accepted submissions = 10 + 18 + 11 = 39

Sum of total views = 43 + 72 + 26 + 15 = 156

Sum of total unique views = 10 + 13 + 19 + 14 = 56

Similarly, we can find the sums for contests 66556 and 94828.
*/
/* Solution */

SELECT cont.contest_id, cont.hacker_id, cont.name, SUM(ss.ts), SUM(ss.tas), SUM(vs.tv), SUM(vs.tuv)
FROM Contests cont
LEFT JOIN Colleges col ON cont.contest_id = col.contest_id
LEFT JOIN Challenges ch ON col.college_id = ch.college_id
LEFT JOIN ( SELECT challenge_id, SUM(total_views) as tv, SUM(total_unique_views) as tuv FROM View_Stats GROUP BY challenge_id ) vs ON ch.challenge_id = vs.challenge_id
LEFT JOIN ( SELECT challenge_id, SUM(total_submissions) as ts, SUM(total_accepted_submissions) as tas FROM Submission_Stats GROUP BY challenge_id ) ss ON ch.challenge_id = ss.challenge_id
GROUP BY cont.contest_id, cont.hacker_id, cont.name HAVING(SUM(vs.tv) + SUM(vs.tuv) + SUM(ss.ts) + SUM(ss.tas)) > 0 ORDER BY cont.contest_id


/* 5. Advanced Join - 15 Days of Learning SQL */
/*
Julia conducted a 15 days of learning SQL contest. The start date of the contest was March 01, 2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least 1 submission each day (starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number of submissions each day. If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.

Input Format

The following tables hold contest data:

  1.  Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.

[/data/Hackers.png]

(https://s3.amazonaws.com/hr-challenge-images/19597/1458511164-12adec3b8b-ScreenShot2016-03-21at3.26.47AM.png)

  2.  Submissions: The submission_date is the date of the submission, submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, and score is the score of the submission.

[/data/Submissions.png]

(https://s3.amazonaws.com/hr-challenge-images/19597/1458511251-0b534030b9-ScreenShot2016-03-21at3.26.56AM.png)

Sample Input

For the following sample input, assume that the end date of the contest was March 06, 2016.

Hackers Table:

[/data/Hackers_Input_05.png]

(https://s3.amazonaws.com/hr-challenge-images/19597/1458511957-814a2c7bf2-ScreenShot2016-03-21at3.27.06AM.png)

Submissions Table:

[/data/Submissions_Input_03.png]

(https://s3.amazonaws.com/hr-challenge-images/19597/1458512015-ff6a708164-ScreenShot2016-03-21at3.27.21AM.png)

Sample Output

 2016-03-01 4 20703 Angela 
 2016-03-02 2 79722 Michael 
 2016-03-03 2 20703 Angela 
 2016-03-04 2 20703 Angela 
 2016-03-05 1 36396 Frank 
 2016-03-06 1 20703 Angela 

Explanation

On March 01, 2016 hackers 20703, 36396, 53473, and 79722 made submissions. There are 4 unique hackers who made at least one submission each day. As each hacker made one submission, 20703 is considered to be the hacker who made maximum number of submissions on this day. The name of the hacker is Angela.

On March 02, 2016 hackers 15758, 20703, and 79722 made submissions. Now 20703 and 79722 were the only ones to submit every day, so there are 2 unique hackers who made at least one submission each day. 79722 made 2 submissions, and name of the hacker is Michael.

On March 03, 2016 hackers 20703, 36396, and 79722 made submissions. Now 20703 and 79722 were the only ones, so there are 2 unique hackers who made at least one submission each day. As each hacker made one submission so 20703 is considered to be the hacker who made maximum number of submissions on this day. The name of the hacker is Angela.

On March 04, 2016 hackers 20703, 44065, 53473, and 79722 made submissions. Now 20703 and 79722 only submitted each day, so there are 2 unique hackers who made at least one submission each day. As each hacker made one submission so 20703 is considered to be the hacker who made maximum number of submissions on this day. The name of the hacker is Angela.

On March 05, 2016 hackers 20703, 36396, 38289 and 62529 made submissions. Now 20703 only submitted each day, so there is only 1 unique hacker who made at least one submission each day. 36396 made 2 submissions and name of the hacker is Frank.

On March 06, 2016 only 20703 made submission, so there is only 1 unique hacker who made at least one submission each day. 20703 made 1 submission and name of the hacker is Angela.
*/
/* Solution */

SELECT 
    b.submission_date, COALESCE(a.contSub,0), b.id, c.name
FROM (
    SELECT o.submission_date, MIN(o.hacker_id) AS id
    FROM (
        SELECT n.submission_date, n.hacker_id,COUNT(n.submission_id)
        FROM Submissions n
        GROUP BY submission_date, hacker_id
        HAVING COUNT(submission_id)>= ALL(
              SELECT COUNT(m.submission_id)
              FROM Submissions m
              GROUP BY m.submission_date, m.hacker_id
              HAVING m.submission_date=n.submission_date
          )
    ) AS o
    GROUP BY submission_date
    ) AS b
LEFT JOIN (
    SELECT aa.submission_date, COUNT(DISTINCT aa.hacker_id) AS contSub
    FROM Submissions AS aa
    WHERE aa.submission_date='2016-03-01' 
    OR submission_date<ALL(
        SELECT bb.submission_date
        FROM (
            SELECT tdy.hacker_id, tdy.submission_date, ytd.submission_date AS SubmittedYtd
            FROM Submissions tdy LEFT JOIN Submissions ytd
            ON DATE_ADD(tdy.submission_date, INTERVAL -1 DAY)= ytd.submission_date 
            AND ytd.hacker_id=tdy.hacker_id    
        ) AS bb
        WHERE aa.hacker_id=bb.hacker_id AND bb.submission_date<> STR_TO_DATE('2016-03-01', '%Y-%m-%d') AND bb.SubmittedYtd IS NULL
    )
    GROUP BY aa.submission_date
) AS a 
ON a.submission_date=b.submission_date
JOIN Hackers c ON b.id=c.hacker_id
ORDER BY a.submission_date ASC;


