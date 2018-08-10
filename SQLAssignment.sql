CREATE TABLE Student(
StudentID VARCHAR2(10) NOT NULL,
StudentName VARCHAR2(30) NOT NULL,
StudentDOB DATE,
StudentAge INTEGER CHECK (StudentAge>=7),
ContactNumber VARCHAR2(15),
EmailID VARCHAR2(30),
CONSTRAINT PK_Student PRIMARY KEY (StudentID)
);

CREATE TABLE Course(
CourseID VARCHAR2(15) NOT NULL,
CourseName VARCHAR2(30) NOT NULL,
CourseStartDate DATE,
CourseEndDate DATE,
CourseFees VARCHAR2(10),
CONSTRAINT PK_Course PRIMARY KEY (CourseID)
);

CREATE TABLE Student_Course(
StudentID VARCHAR2(10) NOT NULL,
CourseID VARCHAR2(30) NOT NULL,
CONSTRAINT FK_StudentID FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
CONSTRAINT FK_CourseID FOREIGN KEY (CourseID) REFERENCES Course (CourseID)
);

CREATE TABLE Subject(
SubjectID VARCHAR2(30) NOT NULL,
SubjectName VARCHAR2(50) NOT NULL,
CONSTRAINT PK_Subject PRIMARY KEY (SubjectID)
);

CREATE TABLE Course_Subject(
CourseID VARCHAR2(30) NOT NULL,
SubjectID VARCHAR2(30) NOT NULL,
CONSTRAINT FK_CourseSubjectID FOREIGN KEY (CourseID) REFERENCES Course (CourseID),
CONSTRAINT FK_SubjectID FOREIGN KEY (SubjectID) REFERENCES Subject (SubjectID)
);

CREATE TABLE Student_Attendance(
StudentID VARCHAR2(10) NOT NULL,
SubjectID VARCHAR2(30) NOT NULL,
AttendanceDate DATE,
Attendance VARCHAR2(1) DEFAULT 'N',
CONSTRAINT FK_AttStudentID FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
CONSTRAINT FK_AttSubjectID FOREIGN KEY (SubjectID) REFERENCES Subject (SubjectID)
);

CREATE TABLE Student_Marks(
StudentID VARCHAR2(10) NOT NULL,
SubjectID VARCHAR2(30) NOT NULL,
Semester VARCHAR2(2) NOT NULL,
SemMarks VARCHAR2(3) NOT NULL,
Pass VARCHAR2(1) DEFAULT 'Y',
CONSTRAINT FK_MarksStudentID FOREIGN KEY (StudentID) REFERENCES Student (StudentID),
CONSTRAINT FK_MarksSubjectID FOREIGN KEY (SubjectID) REFERENCES Subject (SubjectID)
);

INSERT INTO Student VALUES ('1A001', 'John White', '12-JAN-2000', 18, '9876054123', 'johnwhite12@gmail.com');
INSERT ALL
INTO Student VALUES ('1A030','Thomas Hardy','18-MAY-1999',19,'8090768531','tommy1805@gmail.com')
INTO Student VALUES ('1S018','Mamatha K','02-JUN-2002',16,'9460812099','mamathak2002@yahoo.com')
INTO Student VALUES ('1B002','Elizabeth Patkins','25-MAR-2000',18,'9535007112','lizzypatkins@hotmail.com')
INTO Student VALUES ('1B005','Goutham Singh','05-OCT-2001',18,'8750337102','singhgoutham@gmail.com')
SELECT * FROM dual;

UPDATE Student SET StudentAge = 17 WHERE StudentID = '1B005';

INSERT ALL
INTO Course VALUES ('CS001', 'Computer Science', '01-JAN-2018', '01-JAN-2021', 'Rs 300000')
INTO Course VALUES ('AC001', 'Accountancy', '02-Jul-2018', '02-AUG-2020', 'Rs 250000')
INTO Course VALUES ('BA01', 'Business Administration', '01-JUN-2020', '01-JUL-2022', 'Rs 1000000')
SELECT * FROM DUAL;

INSERT ALL 
INTO Student_Course VALUES ('1A030','AC001')
INTO Student_Course VALUES ('1S018','CS001')
INTO Student_Course VALUES ('1B002','BA01')
INTO Student_Course VALUES ('1B005','BA01')
INTO Student_Course VALUES ('1A001','AC001')
SELECT * FROM DUAL;

INSERT ALL 
INTO Subject VALUES ('CS00101','C Programming')
INTO Subject VALUES ('CS00102','OO Programming with C++')
INTO Subject VALUES ('CS00103','Data Structures')
INTO Subject VALUES ('CS00104','Java Programming')
INTO Subject VALUES ('CS00105','Web Programming')
INTO Subject VALUES ('CS00106','Software Architecture')
INTO Subject VALUES ('AC00101','Financial Accounting')
INTO Subject VALUES ('AC00102','Taxation')
INTO Subject VALUES ('AC00103','Law & Ethics')
INTO Subject VALUES ('AC00104','Business Management')
INTO Subject VALUES ('BA0101','Operation Research')
INTO Subject VALUES ('BA0102','Economics')
INTO Subject VALUES ('BA0103','Business Communication & Information Systems')
INTO Subject VALUES ('BA0104','Entrepreneurship Development')
SELECT * FROM DUAL;

INSERT ALL
INTO Course_Subject VALUES ('CS001','CS00101')
INTO Course_Subject VALUES ('CS001','CS00102')
INTO Course_Subject VALUES ('CS001','CS00103')
INTO Course_Subject VALUES ('CS001','CS00104')
INTO Course_Subject VALUES ('CS001','CS00105')
INTO Course_Subject VALUES ('CS001','CS00106')
INTO Course_Subject VALUES ('AC001','AC00101')
INTO Course_Subject VALUES ('AC001','AC00102')
INTO Course_Subject VALUES ('AC001','AC00103')
INTO Course_Subject VALUES ('AC001','AC00104')
INTO Course_Subject VALUES ('BA01','BA0101')
INTO Course_Subject VALUES ('BA01','BA0102')
INTO Course_Subject VALUES ('BA01','BA0103')
INTO Course_Subject VALUES ('BA01','BA0104')
SELECT * FROM DUAL;

INSERT ALL
INTO Student_Attendance VALUES ('1A030','AC00101','08-AUG-2018','Y')
INTO Student_Attendance VALUES ('1A030','AC00102','08-AUG-2018','N')
INTO Student_Attendance VALUES ('1A001','AC00101','08-AUG-2018','Y')
INTO Student_Attendance VALUES ('1A001','AC00102','08-AUG-2018','Y')
INTO Student_Attendance VALUES ('1S018','CS00103','08-AUG-2018','Y')
INTO Student_Attendance VALUES ('1B002','BA0101','08-AUG-2018','N')
INTO Student_Attendance VALUES ('1B002','BA0102','08-AUG-2018','N')
INTO Student_Attendance VALUES ('1B005','BA0101','08-AUG-2018','N')
INTO Student_Attendance VALUES ('1B005','BA0102','08-AUG-2018','Y')
INTO Student_Attendance VALUES ('1S018','CS00104','08-AUG-2018','Y')
SELECT * FROM DUAL;

INSERT ALL
INTO Student_Marks VALUES ('1A030','AC00101',1,55,'Y')
INTO Student_Marks VALUES ('1A030','AC00102',1,67,'Y')
INTO Student_Marks VALUES ('1A001','AC00101',1,86,'Y')
INTO Student_Marks VALUES ('1A001','AC00101',1,34,'N')
INTO Student_Marks VALUES ('1S018','CS00103',2,72,'Y')
INTO Student_Marks VALUES ('1S018','CS00104',2,25,'N')
INTO Student_Marks VALUES ('1B002','BA0101',1,44,'Y')
INTO Student_Marks VALUES ('1B002','BA0102',1,73,'Y')
INTO Student_Marks VALUES ('1B005','BA0101',1,59,'Y')
INTO Student_Marks VALUES ('1B005','BA0102',1,65,'Y')
SELECT * FROM DUAL;

select * from dba_objects o where o.object_name in (upper('Student'), upper('Student_Marks'));