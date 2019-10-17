--Structured Query Language (internatal standard querying relational databases)

CREATE TABLE student (
    student_id      INTEGER
   ,student_name    VARCHAR2(30)
);

DROP TABLE classes;

CREATE TABLE classes (
    class_id        INTEGER
   ,class_cd        CHAR(3)
   ,class_num       INTEGER
   ,class_desc      VARCHAR2(30)
);

CHAR(1) := y OR N OR NULL
VARCHAR2(10) := 'Brian'  "brian"

INSERT INTO student VALUES (1,'Brian');
INSERT INTO student VALUES (2,'Ismael');
INSERT INTO student VALUES (3,'Drew');
INSERT INTO student VALUES (4,'Robert');
COMMIT;

/*
*SELECT
*FROM
WHERE
GROUP BY
HAVING
ORDER BY
*/

SELECT --*  --* = Every column
      student_name
  FROM student
 WHERE --length(student_name) > 4
       student_name LIKE '%o%'  --Student names that contain the letter 'e'; % = 0 or more
   --and student_name like '%I%'
ORDER BY student_id DESC
;

INSERT INTO classes VALUES (1,'CCS',101,'Intro to Basic');
INSERT INTO classes VALUES (2,'ENG',101,'Intro to English');
INSERT INTO classes VALUES (3,'MTH',101,'Intro to Math');
INSERT INTO classes VALUES (4,'MUS',101,'Intro to Music');
COMMIT;

SELECT *
  FROM classes;

CREATE TABLE student_classes (
    student_id          INTEGER
   ,class_id            INTEGER
);

INSERT INTO student_classes VALUES (1,1);
INSERT INTO student_classes VALUES (1,3);
INSERT INTO student_classes VALUES (2,4);
INSERT INTO student_classes VALUES (3,2);
COMMIT;

SELECT q1.student_name
      ,count(*) AS row_cnt
  FROM (SELECT S.student_name
              --,sc.*
              ,C.class_cd
              ,C.class_num
              ,C.class_desc
          FROM student S
               INNER JOIN student_classes sc ON (sc.student_id = S.student_id)
               INNER JOIN classes C ON (C.class_id = sc.class_id)
        ORDER BY student_name
                ,class_cd
                ,class_num) q1
GROUP BY q1.student_name
;