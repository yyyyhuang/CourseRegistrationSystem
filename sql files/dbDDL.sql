-- DEPARTMENT tableshos
CREATE TABLE department (
    deptid INT PRIMARY KEY,
    deptname VARCHAR(75)
);

-- STUDENT table
CREATE TABLE student(
    nuid INT PRIMARY KEY,
    fname VARCHAR(75) NOT NULL,
    lname VARCHAR(75) NOT NULL,
    email VARCHAR(75) NOT NULL,
    dno INT NOT NULL,
    passwords VARCHAR(75) NOT NULL,
    -- FOREIGN KEY
    CONSTRAINT fk_studentdept FOREIGN KEY (dno) REFERENCES department(deptid) ON DELETE CASCADE
);


-- ADVISOR table
CREATE TABLE advisor(
    nuid INT PRIMARY KEY,
    fname VARCHAR(75) NOT NULL,
    lname VARCHAR(75) NOT NULL,
    email VARCHAR(75) NOT NULL,
    passwords VARCHAR(75) NOT NULL,
    dno INT NOT NULL,
    -- FOREIGN KEY
    CONSTRAINT fk_advdept FOREIGN KEY (dno) REFERENCES department(deptid) ON DELETE CASCADE
);

-- ADMIN table
CREATE TABLE admin(
    nuid INT PRIMARY KEY,
    fname VARCHAR(75) NOT NULL,
    lname VARCHAR(75) NOT NULL,
    email VARCHAR(75) NOT NULL,
    passwords VARCHAR(75) NOT NULL
);

-- COURSE table
CREATE TABLE course(
    courseid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    course_no VARCHAR(75),
    semester VARCHAR(75) NOT NULL,
    course_name VARCHAR(75) NOT NULL,
    course_description VARCHAR(150),
    credit INT NOT NULL,
    dno INT NOT NULL,
    sectionid INT,
    professor VARCHAR(75) NOT NULL,
    class_time TIME NOT NULL,
    capacity INT NOT NULL,
    waitlist INT NOT NULL,
    building VARCHAR(75) NOT NULL,
    room VARCHAR(75),
    -- FOREIGN KEY
    CONSTRAINT fk_coursedept FOREIGN KEY (dno) REFERENCES department(deptid) ON DELETE CASCADE
);


-- ADDS table
CREATE TABLE adds(
    addsid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    courseid INT UNSIGNED,
    nuid INT,
    dates DATE,
    -- FOREIGN KEY
    CONSTRAINT fk_addstudentid FOREIGN KEY (nuid) REFERENCES student (nuid) ON DELETE CASCADE,
    CONSTRAINT fk_addcourseid FOREIGN KEY (courseid) REFERENCES course (courseid) ON DELETE CASCADE
);

-- DROPS table
CREATE TABLE drops(
    dropsid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    courseid INT UNSIGNED,
    nuid INT,
    dates DATE,
    -- FOREIGN KEY
    CONSTRAINT fk_dropstudentid FOREIGN KEY (nuid) REFERENCES student (nuid) ON DELETE CASCADE,
    CONSTRAINT fk_dropcourseid FOREIGN KEY (courseid) REFERENCES course (courseid) ON DELETE CASCADE
);

-- REQUESTS table
CREATE TABLE requests(
    rid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    courseid INT UNSIGNED,
    nuid INT,
    dates DATE,
    type VARCHAR(20),
    status VARCHAR(20),
    -- FOREIGN KEY
    CONSTRAINT fk_studentid FOREIGN KEY (nuid) REFERENCES student (nuid) ON DELETE CASCADE,
    CONSTRAINT fk_courseid FOREIGN KEY (courseid) REFERENCES course (courseid) ON DELETE CASCADE
);

-- SEND_MSG table
CREATE TABLE send_msg(
    ntid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    s_id INT,
    advid INT,
    dates DATE,
    messages VARCHAR(125),
    status VARCHAR(20),
    -- FOREIGN KEY
    CONSTRAINT fk_msgstudentid FOREIGN KEY (s_id) REFERENCES student (nuid) ON DELETE CASCADE,
    CONSTRAINT fk_msgadvid FOREIGN KEY (advid) REFERENCES advisor (nuid) ON DELETE CASCADE
);


-- ADVICE table
CREATE TABLE advice(
    aid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    advid INT,
    s_id INT,
    -- FOREIGN KEY
    CONSTRAINT fk_notstudentid FOREIGN KEY (s_id) REFERENCES student (nuid) ON DELETE CASCADE,
    CONSTRAINT fk_notadvid FOREIGN KEY (advid) REFERENCES advisor (nuid) ON DELETE CASCADE
);

-- NOTIFICATIONS table
CREATE TABLE notifications(
    ntid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    advid INT,
    s_id INT,
    dates DATE,
    nstatus VARCHAR(50),
    -- FOREIGN KEY
    CONSTRAINT fk_notstudentid FOREIGN KEY (s_id) REFERENCES student (nuid) ON DELETE CASCADE,
    CONSTRAINT fk_notadvid FOREIGN KEY (advid) REFERENCES advisor (nuid) ON DELETE CASCADE
);

-- ADVISOR UNREAD NOTIFICATION view
CREATE VIEW unread_nt
AS SELECT advid, s_id, nstatus, dates
   FROM notifications
   WHERE nstatus = "unread";


-- NEW_REQ trigger when INSERT ON ADDS
delimiter $$ ;
CREATE TRIGGER new_req
AFTER
INSERT ON adds FOR EACH ROW
BEGIN
	INSERT INTO requests(courseid, nuid, dates, type, status) values (new.courseid, new.nuid, NOW(), "add", "pending");
END; $$
delimiter ; $$

-- NEW_REQ trigger when INSERT ON DROPS
delimiter $$ ;
CREATE TRIGGER new_req_drop
AFTER
INSERT ON drops FOR EACH ROW
BEGIN
	INSERT INTO requests(courseid, nuid, dates, type, status) values (new.courseid, new.nuid, NOW(), "drop", "pending");
END; $$
delimiter ; $$

-- function to update unread notification to be read
DELIMITER $$ ;
CREATE PROCEDURE read_msg (IN advid INT, IN s_id INT)
BEGIN
    UPDATE notifications
    SET nstatus = "read"
    WHERE advid = advid and s_id = s_id;
END; $$
DELIMITER ; $$




