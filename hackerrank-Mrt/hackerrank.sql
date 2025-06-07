-- Select ALL
SELECT NAME
FROM CITY
WHERE CountryCode = 'USA' AND Population > 120000;
-- Revising the select query l
SELECT *
FROM CITY
WHERE CountryCode = 'USA'
  AND Population > 100000;
-- Revising the select query ll
SELECT NAME
FROM CITY
WHERE CountryCode = 'USA'
  AND Population > 120000;
-- select BY ID
SELECT *
FROM CITY
WHERE ID = 1661;
-- Japanese Cities' Attributes
SELECT *
FROM CITY
WHERE CountryCode = 'JPN';
-- Japanese Cities' Names
SELECT NAME
FROM CITY
WHERE CountryCode = 'JPN';
-- Weather observation station 1
SELECT CITY, STATE
FROM STATION;
-- weather observation station 3
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0;
-- Weather observation station 4
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;
-- Weather observation station 5
SELECT CITY, LENGTH(CITY) AS LEN
FROM STATION
ORDER BY LEN ASC, CITY ASC
LIMIT 1;
-- Weather observation station 6
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[aeiouAEIOU]';
-- Weather observation station 7
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '[aeiouAEIOU]$';
-- Weather observation station 8
SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '^[aeiouAEIOU].*[aeiouAEIOU]$';
-- Weather observation station 9
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[aeiouAEIOU]';
-- Weather observation station 10
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '[aeiouAEIOU]$';
-- Weather observation station 11
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[aeiouAEIOU]'
   OR CITY NOT REGEXP '[aeiouAEIOU]$';
-- Weather observation station 12
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT REGEXP '^[aeiouAEIOU]'
  AND CITY NOT REGEXP '[aeiouAEIOU]$';
-- Higher Than 75 Marks
SELECT Name
FROM STUDENTS
WHERE Marks > X
ORDER BY RIGHT(Name, 3) ASC, ID ASC;
-- Employee Names
SELECT name
FROM Employee
ORDER BY name ASC;
-- Employee Salaries
SELECT name
FROM Employee
WHERE salary > X
  AND months < Y
ORDER BY employee_id ASC;
-- type of triangle
SELECT
  CASE
    WHEN A + B <= C OR B + C <= A OR A + C <= B THEN 'Not A Triangle'
    WHEN A = B AND B = C THEN 'Equilateral'
    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
    ELSE 'Scalene'
  END AS TriangleType
FROM TRIANGLES;
-- the PADS
SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')') AS formatted_name
FROM OCCUPATIONS
ORDER BY Name ASC;
-- Occupations
WITH Ranked AS (
    SELECT 
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS row_num
    FROM OCCUPATIONS
)
SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM Ranked
GROUP BY row_num;
-- Binary tree nodes 
SELECT
    N,
    CASE
        WHEN P IS NULL THEN 'Root'
        WHEN N IN (SELECT P FROM BST) THEN 'Inner'
        ELSE 'Leaf'
    END AS NodeType
FROM BST
ORDER BY N;
-- new companies
SELECT
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code) AS no_of_lead_manager,
    COUNT(DISTINCT sm.senior_manager_code) AS no_of_senior_manager,
    COUNT(DISTINCT m.manager_code) AS no_of_manager,
    COUNT(DISTINCT e.employee_code) AS no_of_employee
FROM
    Company c
    LEFT JOIN Lead_Manager lm ON c.company_code = lm.company_code
    LEFT JOIN Senior_Manager sm ON lm.lead_manager_code = sm.lead_manager_code
    LEFT JOIN Manager m ON sm.senior_manager_code = m.senior_manager_code
    LEFT JOIN Employee e ON m.manager_code = e.manager_code
GROUP BY
    c.company_code, c.founder
ORDER BY
    c.company_code;
-- Revising Aggregations-the count fanction 
SELECT COUNT(ID)
FROM CITY
WHERE POPULATION > 100000;
-- Revising Aggregations-the sum function
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';
-- Revising Aggregations-averages
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';
-- AVERAGE population 
SELECT FLOOR(AVG(POPULATION))
FROM CITY;
-- japan population
SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';
-- population density difference
SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;
-- the blunder
SELECT CEIL(AVG(SALARY) - AVG(REPLACE(SALARY, '0', '')))
FROM EMPLOYEES;
-- top earnes 
SELECT MAX(SALARY * MONTHS) AS earnings, COUNT(*)
FROM EMPLOYEE
WHERE SALARY * MONTHS = (SELECT MAX(SALARY * MONTHS) FROM EMPLOYEE);
-- weather observation station 2
SELECT COUNT(*) 
FROM STATION
WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%';
-- Weather Observation Station 13
SELECT COUNT(*) 
FROM STATION
WHERE CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U';
-- Weather Observation Station 14
SELECT COUNT(*) 
FROM STATION
WHERE LENGTH(CITY) - LENGTH(REPLACE(CITY, ' ', '')) + 1 = 4;
-- Weather Observation Station 15
SELECT COUNT(*) 
FROM STATION
WHERE LENGTH(CITY) - LENGTH(REPLACE(CITY, ' ', '')) + 1 = 4
AND CITY REGEXP '^[A-Z][a-z]* [A-Z][a-z]* [A-Z][a-z]* [A-Z][a-z]*$';
-- Weather Observation Station 16
SELECT ROUND(MIN(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7780;
-- Weather Observation Station 17  
SELECT ROUND(MAX(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;
-- Weather Observation Station 18
SELECT ROUND(
    ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)),
    4
)
FROM STATION;
-- Weather Observation Station 19
SELECT COUNT(*)
FROM STATION
WHERE CITY LIKE '%a%';
-- Weather Observation Station 20
SET @row_count = (SELECT COUNT(*) FROM STATION);
SET @mid_row = FLOOR(@row_count / 2);

SELECT ROUND(LAT_N, 4)
FROM (
    SELECT LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num
    FROM STATION
) AS sorted
WHERE row_num = @mid_row + 1;
-- population census
SELECT COUNT(*)
FROM POPULATION
WHERE AGE > 18;
-- african cities 
SELECT CITY.NAME
FROM CITY
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent = 'Africa';
-- average population of each continent
SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population))
FROM COUNTRY
JOIN CITY ON COUNTRY.Code = CITY.CountryCode
GROUP BY COUNTRY.Continent;
-- the report
SELECT NAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);
-- top competitors
SELECT COMPETITOR_NAME
FROM COMPETITIONS
GROUP BY COMPETITOR_NAME
HAVING COUNT(*) > 5;
-- olivander's inventory
SELECT w.Name, w.Power
FROM Wands w
JOIN Wands_Property wp ON w.Code = wp.Code
WHERE w.Available = 'Y'
  AND wp.Is_Evil = 0
  AND (wp.Age, w.Power, w.Name, w.Cost) IN (
    SELECT Age, Power, Name, MIN(w2.Cost)
    FROM Wands w2
    JOIN Wands_Property wp2 ON w2.Code = wp2.Code
    WHERE w2.Available = 'Y' AND wp2.Is_Evil = 0
    GROUP BY wp2.Age, w2.Power
)
ORDER BY w.Power DESC, w.Name;
-- challenge 
SELECT h.Name, COUNT(c.ChallengeId) AS TotalChallenges
FROM Hackers h
JOIN Challenges c ON h.HackerId = c.HackerId
GROUP BY h.HackerId, h.Name
HAVING COUNT(c.ChallengeId) > 1
ORDER BY TotalChallenges DESC, h.Name;
-- constest leaderboard
SELECT h.HackerId, h.Name, SUM(MAX_SCORE) AS TotalScore
FROM Hackers h
JOIN Submissions s ON h.HackerId = s.HackerId
JOIN (
    SELECT HackerId, ChallengeId, MAX(Score) AS MAX_SCORE
    FROM Submissions
    GROUP BY HackerId, ChallengeId
) AS max_scores ON h.HackerId = max_scores.HackerId AND s.ChallengeId = max_scores.ChallengeId
GROUP BY h.HackerId, h.Name
HAVING TotalScore > 0
ORDER BY TotalScore DESC, h.HackerId;
-- sql projects planning
SELECT P1.ProjectID, P1.ProjectName
FROM Projects P1
WHERE NOT EXISTS (
    SELECT 1
    FROM Projects P2
    WHERE P1.ProjectID != P2.ProjectID
    AND P1.StartDate < P2.EndDate
    AND P1.EndDate > P2.StartDate
);
-- placements
SELECT s.StudentName, c.CompanyName, p.PlacementDate
FROM Students s
JOIN Placements p ON s.StudentID = p.StudentID
JOIN Companies c ON p.CompanyID = c.CompanyID;
-- symmetric pairs
SELECT A.ID1, A.ID2
FROM Relationships A
JOIN Relationships B ON A.ID1 = B.ID2 AND A.ID2 = B.ID1;
-- interviews
SELECT i.InterviewerName, COUNT(*) AS InterviewCount
FROM Interviews i
GROUP BY i.InterviewerName;
-- 15 days of learning sql
SELECT S.Name
FROM Students S
JOIN Friends F ON S.Student_ID = F.ID
JOIN Packages P_Friend ON F.Friend_ID = P_Friend.ID
JOIN (
    SELECT ID, MAX(Salary) AS Max_Historical_Salary
    FROM PackagesHistory
    GROUP BY ID
) AS PH ON S.Student_ID = PH.ID
WHERE P_Friend.Salary > PH.Max_Historical_Salary
ORDER BY S.Name;
-- draw the triangle 1
SELECT REPEAT('* ', @NUMBER := @NUMBER - 1) 
FROM information_schema.tables, (SELECT @NUMBER := 21) t 
LIMIT 20;
-- draw the triangle 2
SELECT REPEAT('* ', n) 
FROM (SELECT @row := @row + 1 AS n FROM information_schema.tables, (SELECT @row := 0) r LIMIT 20) AS rows;
-- print prime numbers
WITH RECURSIVE Numbers AS (
    SELECT 2 AS num
    UNION
    SELECT num + 1
    FROM Numbers
    WHERE num < 1000
)
SELECT GROUP_CONCAT(num SEPARATOR '&')
FROM Numbers
WHERE NOT EXISTS (
    SELECT 1
    FROM Numbers AS n
    WHERE n.num > 1 AND n.num < Numbers.num AND Numbers.num % n.num = 0
) AND num <= 1000;
