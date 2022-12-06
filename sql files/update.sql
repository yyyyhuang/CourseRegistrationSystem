update course
set semester = 'Fall2022'
where semester = 'Fall';

update course
set semester = 'Spring2023'
where semester = 'Spring';

alter table course
add column days VARCHAR(25);

update course
set days = 'T'
where courseid = 1;

update course
set days = 'M'
where courseid = 2;

update course
set days = 'TH'
where courseid = 3;

update course
set days = 'F'
where courseid = 4;

update course
set days = 'W'
where courseid = 5;

update course
set days = 'TH'
where courseid = 6;

update course
set days = 'M'
where courseid = 7;

update course
set days = 'F'
where courseid = 8;

update course
set days = 'M'
where courseid = 9;

update course
set days = 'TH'
where courseid = 10;

update course
set days = 'W'
where courseid = 11;
