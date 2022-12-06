-- Due to the requirement of Step 13, some of queries slightly
-- differ from the original queries and relation algebra in Step 7.

-- 1. Find all courses opened in Fall for each department.
-- Return the result table ordered by department name alphabetically.
-- Expected output:

--+--------+------------------+----------+-------------------+-----------+----------------+
--| deptId | deptname         | courseid | course_name       | sectionid | professor      |
--+--------+------------------+----------+-------------------+-----------+----------------+
--|    103 | Chemistry        |        8 | General Chemistry |         1 | Jonason Master |
--|    103 | Chemistry        |        9 | General Chemistry |         2 | Rex Collin     |
--|    101 | Computer Science |        1 | Python            |         1 | Ira Barnes     |
--|    101 | Computer Science |        2 | Java              |         1 | Mack Hardy     |
--|    101 | Computer Science |        3 | Java              |         2 | Mack Hardy     |
--|    102 | Math             |        5 | CalculusI         |         1 | Seul Bang      |
--|    102 | Math             |        6 | CalculusI         |         2 | Lindsay Soto   |
--+--------+------------------+----------+-------------------+-----------+----------------+

SELECT d.deptId, d.deptname, c.courseid, c.course_name, c.sectionid, c.professor 
FROM department AS d JOIN course AS c 
ON d.deptid = c.dno 
WHERE c.semester = 'Fall2022' 
ORDER BY d.deptname ASC;

-- 2. Find the nuid and name for students who have registered at least two courses.
-- Return the result table ordered by students' name alphabetically.
-- Expected output:
--+-------+--------+----------+---------------+
--| nuid  | fname  | lname    | total_courses |
--+-------+--------+----------+---------------+
--| 10002 | Debra  | Lucas    |             2 |
--| 10003 | Janice | Casey    |             2 |
--| 10001 | Jerome | Joseph   |             2 |
--| 10008 | Julie  | Griffith |             2 |
--+-------+--------+----------+---------------+

SELECT s.nuid, s.fname, s.lname, COUNT(a.courseId) AS total_courses 
FROM student AS s JOIN adds AS a 
ON s.nuid = a.nuid 
LEFT OUTER JOIN drops AS d 
ON a.nuid = d.nuid AND a.courseid = d.courseid 
GROUP BY a.nuid 
HAVING COUNT(a.courseid) >= 2 
ORDER BY s.fName ASC;

-- 3. Find the total credits each student has registered so far.
-- Expected output:
--+-------+---------+-----------+--------------+
--| nuid  | fname   | lname     | total_credit |
--+-------+---------+-----------+--------------+
--| 10001 | Jerome  | Joseph    |            8 |
--| 10002 | Debra   | Lucas     |            8 |
--| 10008 | Julie   | Griffith  |            5 |
--| 10003 | Janice  | Casey     |            6 |
--| 10004 | Eloise  |  Buchanan |            4 |
--| 10005 | Tiffany | Long      |            3 |
--| 10006 | Alvin   | Colon     |            3 |
--| 10007 | Doyle   | Gibson    |            3 |
--+-------+---------+-----------+--------------+

SELECT s.nuid, s.fname, s.lname, SUM(c.credit) AS total_credit 
FROM student AS s JOIN adds AS a 
ON s.nuid = a.nuid 
JOIN COURSE AS c 
ON a.courseid = c.courseid 
LEFT OUTER JOIN drops AS d 
ON a.nuid = d.nuid AND a.courseid = d.courseid 
GROUP BY s.nuid;

-- 4. Find all courses that are not morning courses.
-- Return the result table sorted by courseId in ascending order.
-- Expected output:
--+----------+-----------+------------+-----------------------+-----------------------------------+--------+-------+-----------+----------------+------------+----------+------------+----------+------+------+
--| courseid | course_no | semester   | course_name           | course_description                | credit | dno | sectionid | professor      | class_time | capacity | waitlist | building | --room | days |
--+----------+-----------+------------+-----------------------+-----------------------------------+--------+-----+-----------+----------------+------------+----------+----------+------------+------+------+
--|        1 | cs5001    | Fall2022   | Python                | Intro level of Python             |      4 | 101 |         1 | Ira Barnes     | 18:00:00   |       50 |       40 | 4N 2ND   | --1010 | T    |
--|        3 | cs5004    | Fall2022   | Java                  | Intro level of Java               |      4 | 101 |         2 | Mack Hardy     | 13:00:00   |       55 |       35 | 4N 2ND   | --0920 | TH   |
--|        4 | cs5200    | Spring2023 | Databases             | Intro level of Databases          |      4 | 101 |         1 | Jeongkyu Lee   | 13:00:00   |       50 |       10 | 4 N 2nd  | --1035 | F    |
--|        9 | chem110   | Fall2022   | General Chemistry     | General Introduction of Chemistry |      3 | 103 |         2 | Rex Collin     | 14:00:00   |      120 |      100 | Thomas   | --100  | M    |
--|       10 | chem111   | Spring2023 | General Chemistry Lab | Supplemental Lab of Chem 110      |      1 | 103 |         1 | Jonason Master | 13:00:00   |       20 |        5 | McColin  | --121  | TH   |
--+----------+-----------+------------+-----------------------+-----------------------------------+--------+-----+-----------+----------------+------------+----------+----------+------------+------+------+

SELECT * FROM course 
WHERE class_time >= CAST('12:00:00' AS time) AND class_time <= CAST('24:00:00' AS time) 
ORDER BY courseid ASC;

-- 5. Find all courses that have total capacity at least 100.
-- Return the result table sorted by the total capacity in descending order.
-- Expected output:
--+----------+-------------------+----------------+
--| courseid | course_name       | total_capacity |
--+----------+-------------------+----------------+
--|        8 | General Chemistry |            240 |
--|        5 | CalculusI         |            120 |
--|        2 | Java              |            110 |
--+----------+-------------------+----------------+

SELECT courseid, course_name, SUM(capacity) AS total_capacity 
FROM course 
GROUP BY course_name 
HAVING SUM(capacity) >= 100 
ORDER BY SUM(capacity) DESC;

-- 6. Find contact information of all advisors in the Computer Science Department.
-- Return the result table ordered by the advisors' name alphabetically.
-- Expected output:
--+-------+----------+-----------------------+
--| fName | lName    | email                 |
--+-------+----------+-----------------------+
--| Gary  | Byrd     | GaryByrd@neu.edu      |
--| Jaime | Griffith | JaimeGriffith@neu.edu |
--+-------+----------+-----------------------+

SELECT fname, lname, email 
FROM advisor 
WHERE dno IN ( 
    SELECT deptid 
    FROM department 
    WHERE deptname = 'Computer Science' 
) 
ORDER BY fName ASC;