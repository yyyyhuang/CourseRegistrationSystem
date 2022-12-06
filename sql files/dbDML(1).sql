-- DEPARTMENT table


INSERT INTO department (deptid, deptname)
VALUES ("101", "Computer Science");

INSERT INTO department (deptid, deptname)
VALUES ("102", "Math");

INSERT INTO department (deptid, deptname)
VALUES ("103", "Chemistry");

INSERT INTO department (deptid, deptname)
VALUES ("104", "Physics");

INSERT INTO department (deptid, deptname)
VALUES ("105", "Mechanical Engineering");

INSERT INTO department (deptid, deptname)
VALUES ("106", "Electrical Engineering");

INSERT INTO department (deptid, deptname)
VALUES ("107", "Geoscience");

INSERT INTO department (deptid, deptname)
VALUES ("108", "Anthropology");

INSERT INTO department (deptid, deptname)
VALUES ("109", "Earth and Mineral Science");



-- STUDENT table
INSERT INTO student (nuid, fname, lname, email, passwords, dno) 
VALUES ("10001", "Jerome", "Joseph", "JeromeJoseph@neu.edu", "jeromejoseph10001", "101");

INSERT INTO student (nuid, fname, lname, email, passwords, dno) 
VALUES ("10002", "Debra", "Lucas", "DebraLucas@neu.edu", "debralucas10002", "101");

INSERT INTO student (nuid, fname, lname, email, passwords, dno) 
VALUES ("10003", "Janice", "Casey", "JaniceCasey@neu.edu", "JaniceCasey10003", "102");

INSERT INTO student (nuid, fname, lname, email, passwords, dno) 
VALUES ("10004", "Eloise"," Buchanan", "EloiseBuchanan@neu.edu", "EloiseBuchanan10004","102");

INSERT INTO student (nuid, fname, lname, email, passwords, dno) 
VALUES ("10005", "Tiffany", "Long", "TiffanyLong@neu.edu", "TiffanyLong10005", "103");

INSERT INTO student (nuid, fname, lname, email, passwords, dno) 
VALUES ("10006", "Alvin", "Colon", "AlvinColon@neu.edu", "AlvinColon10006", "103");

INSERT INTO student (nuid, fname, lname, email, passwords, dno) 
VALUES ("10007", "Doyle", "Gibson", "DoyleGibson@neu.edu", "DoyleGibson10007", "104");

INSERT INTO student (nuid, fname, lname, email, passwords, dno) 
VALUES ("10008", "Julie", "Griffith", "JulieGriffith@neu.edu", "JulieGriffith10008", "104");

INSERT INTO student (nuid, fname, lName, email, passwords, dno) 
VALUES ("10009", "Samuel", "Myers", "SamuelMyers@neu.edu", "SamuelMyers10009", "105");

INSERT INTO student (nuid, fname, lname, email, passwords, dno) 
VALUES ("10010", "Allan", "Hammond", "AllanHammond@neu.edu", "AllanHammond10010", "105");

-- ADVISOR table

INSERT INTO advisor (nuid, fname, lname, email, passwords, dno)
VALUES ("70001", "Gary", "Byrd", "GaryByrd@neu.edu", "GaryByrd70001", "101");

INSERT INTO advisor (nuid, fname, lname, email, passwords, dno)
VALUES ("70002", "Jaime", "Griffith", "JaimeGriffith@neu.edu", "JaimeGriffith70002", "101");

INSERT INTO advisor (nuid, fname, lname, email, passwords, dno)
VALUES ("70003", "Gertrude", "Neal", "GertrudeNeal@neu.edu", "GertrudeNeal70003", "102");

INSERT INTO advisor (nuid, fname, lname, email, passwords, dno)
VALUES ("70004", "Carole", "Poole", "CarolePoole@neu.edu", "CarolePoole70004", "102");

INSERT INTO advisor (nuid, fname, lname, email, passwords, dno)
VALUES ("70005", "Ray", "Andrews", "RayAndrews@neu.edu", "RayAndrews70005", "103");

INSERT INTO advisor (nuid, fname, lname, email, passwords, dno)
VALUES ("70006", "Pam", "Henderson", "PamHenderson@neu.edu", "PamHenderson70006", "104");

INSERT INTO advisor (nuid, fname, lname, email, passwords, dno)
VALUES ("70007", "Vicky", "Porter", "VickyPorter@neu.edu", "VickyPorter7007", "105");

INSERT INTO advisor (nuid, fname, lname, email, passwords, dno)
VALUES ("70008", "Perry", "Holt", "PerryHolt@neu.edu", "PerryHolt7008", "106");

INSERT INTO advisor (nuid, fname, lname, email, passwords, dno)
VALUES ("70009", "Mindy", "Wilkerson", "MindyWilkerson@neu.edu", "MindyWilkerson7009", "107");


-- ADMIN table

INSERT INTO admin (nuid, fname, lname, email, passwords)
VALUES ("80001", "Raul", "Wells", "RaulWells@neu.edu", "RaulWells80001");

INSERT INTO admin (nuid, fname, lname, email, passwords)
VALUES ("80002", "Belinda", "Carson", "BelindaCarson@neu.edu", "BelindaCarson80002");

INSERT INTO admin (nuid, fname, lname, email, passwords)
VALUES ("80003", "Stacy", "Watts", "StacyWatts@neu.edu", "StacyWatts80003");

INSERT INTO admin (nuid, fname, lname, email, passwords)
VALUES ("80004", "Jaime", "Bates", "JaimeBates@neu.edu", "JaimeBates80004");

INSERT INTO admin (nuid, fname, lname, email, passwords)
VALUES ("80005", "Ignacio", "Wade", "IgnacioWade@neu.edu", "IgnacioWade80005");

INSERT INTO admin (nuid, fname, lname, email, passwords)
VALUES ("80006", "Mark", "Henry", "MarkHenry@neu.edu", "MarkHenry80006");

INSERT INTO admin (nuid, fname, lname, email, passwords)
VALUES ("80007", "Gwen", "Norman", "GwenNorman@neu.edu", "GwenNorman80007");

INSERT INTO admin (nuid, fname, lname, email, passwords)
VALUES ("80008", "Grady", "Flowers", "GradyFlowers@neu.edu", "GradyFlowers80008");





-- SEND_MSG table

INSERT INTO send_msg (s_id, advid, dates, messages, status)
VALUES ("10001", "70001", "2022-08-11", "Hello Advisor, I want to add course cs5001", "unread");

INSERT INTO send_msg (s_id, advid, dates, messages, status)
VALUES ("10002", "70001", "2022-08-15", "Hello Advisor, I want to add course math 140", "unread");

INSERT INTO send_msg (s_id, advid, dates, messages, status)
VALUES ("10003", "70002", "2022-09-01", "Hi advisor I want to schedule a meeting with you next week", "unread");

INSERT INTO send_msg (s_id, advid, dates, messages, status)
VALUES ("10004", "70002", "2022-09-03", "Hi advisor, I want to drop a class", "unread");

INSERT INTO send_msg (s_id, advid, dates, messages, status)
VALUES ("10005", "70003", "2022-09-05", "Hi advisor, I want to drop a class", "unread");

INSERT INTO send_msg (s_id, advid, dates, messages, status)
VALUES ("10006", "70003", "2022-09-07", "Hi advisor, I want to add a class", "unread");

INSERT INTO send_msg (s_id, advid, dates, messages, status)
VALUES ("10007", "70004", "2022-09-03", "Hi advisor, I want to add a class", "unread");

-- DECLINE table

INSERT INTO decline (s_id, advid)
VALUES ("10001", "70001");

INSERT INTO decline (s_id, advid)
VALUES ("10002", "70001");

INSERT INTO decline (s_id, advid)
VALUES ("10003", "70002");

INSERT INTO decline (s_id, advid)
VALUES ("10004", "70002");

INSERT INTO decline (s_id, advid)
VALUES ("10005", "70003");

INSERT INTO decline (s_id, advid)
VALUES ("10006", "70003");

INSERT INTO decline (s_id, advid)
VALUES ("10007", "70004");

INSERT INTO decline (s_id, advid)
VALUES ("10008", "70008");

-- ADVICE table

INSERT INTO advice (aid, advid, s_id)
VALUES ("10000001" ,"70001", "10001");

INSERT INTO advice (aid, advid, s_id)
VALUES ("10000002" ,"70002", "10002");

INSERT INTO advice (aid, advid, s_id)
VALUES ("10000003" ,"70002", "10003");

INSERT INTO advice (aid, advid, s_id)
VALUES ("10000004", "70002", "10004");

INSERT INTO advice (aid, advid, s_id)
VALUES ("10000005", "70003", "10005");

INSERT INTO advice (aid, advid, s_id)
VALUES ("10000006", "70003", "10006");

INSERT INTO advice (aid, advid, s_id)
VALUES ("10000007", "70004", "10007");



-- COURSE table

INSERT INTO course (course_no, semester, course_name, course_description, credit, dno, sectionid, professor, class_time, capacity, waitlist, building, room)
VALUES ("cs5001", "Fall", "Python", "Intro level of Python", "4", "101", "001", "Ira Barnes", "18:00:00", "50", "40", "4N 2ND", "1010");

INSERT INTO course (course_no, semester, course_name, course_description, credit, dno, sectionid, professor, class_time, capacity, waitlist, building, room)
VALUES ("cs5004", "Fall", "Java", "Intro level of Java", "4", "101", "001", "Mack Hardy", "8:00:00", "55", "35", "4N 2ND", "0920");

INSERT INTO course (course_no, semester, course_name, course_description, credit, dno, sectionid, professor, class_time, capacity, waitlist, building, room)
VALUES ("cs5004", "Fall", "Java", "Intro level of Java", "4", "101", "002", "Mack Hardy", "13:00:00", "55", "35", "4N 2ND", "0920");

INSERT INTO course (course_no, semester, course_name, course_description, credit, dno, sectionid, professor, class_time, capacity, waitlist, building, room)
VALUES ("cs5200", "Spring", "Databases", "Intro level of Databases", "4", "101", "001", "Jeongkyu Lee", "13:00:00", "50", "10", "4 N 2nd", "1035");

INSERT INTO course (course_no, semester, course_name, course_description, credit, dno, sectionid, professor, class_time, capacity, waitlist, building, room)
VALUES ("math140", "Fall", "CalculusI", "Calculus with Analytic Geometry", "3", "102", "001", "Seul Bang", "8:00:00", "60", "50", "4N 2ND", "1100");

INSERT INTO course (course_no, semester, course_name, course_description, credit, dno, sectionid, professor, class_time, capacity, waitlist, building, room)
VALUES ("math140", "Fall", "CalculusI", "Calculus with Analytic Geometry", "3", "102", "002", "Lindsay Soto", "8:00:00", "60", "50", "Thomas", "100");


INSERT INTO course (course_no, semester, course_name, course_description, credit, dno, sectionid, professor, class_time, capacity, waitlist, building, room)
VALUES ("math230", "Spring", "CalculusIII", "Calculus and Vector Analysis", "4", "102", "001", "Seul Bang", "8:00:00", "60", "50", "4N 2ND", "1001");

INSERT INTO course (course_no, semester, course_name, course_description, credit, dno, sectionid, professor, class_time, capacity, waitlist, building, room)
VALUES ("chem110", "Fall", "General Chemistry", "General Introduction of Chemistry", "3", "103", "001", "Jonason Master", "10:00:00", "120", "100", "Thomas", "100");

INSERT INTO course (course_no, semester, course_name, course_description, credit, dno, sectionid, professor, class_time, capacity, waitlist, building, room)
VALUES ("chem110", "Fall", "General Chemistry", "General Introduction of Chemistry", "3", "103", "002", "Rex Collin", "14:00:00", "120", "100", "Thomas", "100");

INSERT INTO course (course_no, semester, course_name, course_description, credit, dno, sectionid, professor, class_time, capacity, waitlist, building, room)
VALUES ("chem111", "Spring", "General Chemistry Lab", "Supplemental Lab of Chem 110", "1", "103", "001", "Jonason Master", "13:00:00", "20", "5", "McColin", "121");

INSERT INTO course (course_no, semester, course_name, course_description, credit, dno, sectionid, professor, class_time, capacity, waitlist, building, room)
VALUES ("chem112", "Spring", "General Chemistry II", "Introduction of Organic Chemistry", "3", "103", "001", "Jonason Master", "10:00:00", "20", "5", "McColin", "121");

-- ADDS table

INSERT INTO adds (courseid, nuid, dates)
VALUES ("1", "10001", "2022-08-16");

INSERT INTO adds (courseid, nuid, dates)
VALUES ("2", "10001", "2022-08-16");

INSERT INTO adds (courseid, nuid, dates)
VALUES ("3", "10002", "2022-08-19");

INSERT INTO adds (courseid, nuid, dates)
VALUES ("4", "10002", "2022-09-12");

INSERT INTO adds (courseid, nuid,dates)
VALUES ("5", "10003", "2022-09-12");

INSERT INTO adds (courseid, nuid, dates)
VALUES ("6", "10003", "2022-09-12");

INSERT INTO adds (courseid, nuid, dates)
VALUES ("7", "10004", "2022-09-15");

INSERT INTO adds (courseid, nuid, dates)
VALUES ("8", "10005", "2022-09-16");

INSERT INTO adds (courseid, nuid, dates)
VALUES ("9", "10006", "2022-09-17");

INSERT INTO adds (courseid, nuid, dates)
VALUES ("11", "10007", "2022-09-18");

INSERT INTO adds (courseid, nuid, dates)
VALUES ("10", "10008", "2022-09-18");

INSERT INTO adds (courseid, nuid, dates)
VALUES ("4", "10008", "2022-09-18");

-- REQUESTS table
INSERT INTO requests (courseid, nuid, dates, type, status) 
VALUES ("1", "10001", "2022-08-16", "add", "approved");

INSERT INTO requests (courseid, nuid, dates, type, status) 
VALUES ("1", "10001", "2022-08-16", "drop", "pending");

-- DROPS table

INSERT INTO drops (courseid, nuid, dates)
VALUES ("1", "10001", "2022-08-16");

INSERT INTO drops (courseid, nuid, dates)
VALUES ("2", "10001", "2022-08-16");

INSERT INTO drops (courseid, nuid, dates)
VALUES ("3", "10002", "2022-08-19");

INSERT INTO drops (courseid, nuid, dates)
VALUES ("4", "10002", "2022-09-12");

INSERT INTO drops (courseid, nuid, dates)
VALUES ("5", "10003", "2022-09-12");

INSERT INTO drops (courseid, nuid, dates)
VALUES ("6", "10003", "2022-09-12");

INSERT INTO drops (courseid, nuid, dates)
VALUES ("7", "10004", "2022-09-15");

INSERT INTO drops (courseid, nuid, dates)
VALUES ("8", "10005", "2022-09-16");

