use schoo11

create table Student(
FName varchar(50),
LName varchar(50),
Stu_ID varchar(50) constraint sd primary key ,
Stu_Email varchar(50) ,
Stu_Stream varchar(50) ,
area varchar(100),
city varchar(100),
class_c varchar(50) references class(class_code),
Hostel_id varchar(50) references Hostel(Hostel_id)
)

create table class(
class_code varchar(50) constraint cc primary key,
no_of_stu int,
cl_teacher varchar(50)
)



create table enroll(
dt date,
stu_id varchar(50) references Student(Stu_ID),
cl_c varchar(50) references class(Class_code),
Primary key(stu_id,cl_c)
)

select*from enroll

create table Course(
Crs_name varchar(50),
CLass_Code varchar(50) references class(Class_code),
Crs_code varchar(50) primary key,
Crs_desc varchar(255) ,
crs_credit int
)
select * from Course

create table CrsName(
crs_name varchar(50),
class_code varchar(50) references class(Class_code),
Primary key(crs_name,Class_code)
)

create table Dept(
No_of_prof int,
Dept_name varchar(255),
dept_code varchar(50) primary key
)

create table Lecturer(
Prof_id varchar(50) primary key,
Lec_dept varchar(255),
FName Varchar(50),
LName Varchar(50),
Prof_email Varchar(50),
Dept_code varchar(50) references Dept(dept_code)
)

create table Teach(
prof_id varchar(50) references Lecturer(Prof_id),
Stu_id varchar(50) references Student(Stu_ID),
Primary key(prof_id,Stu_id)
)


create table lecturer_ph_no(
Prof_id Varchar(50) references Lecturer(Prof_id),
Ph_no varchar(50),
primary key(Prof_id,Ph_no)
)

create table Hostel(
Hostel_type varchar(255),
Hostel_id varchar(50) Primary Key,
Hostel_fee int
)
alter table Student
add Hostel_id Varchar(50);
add foreign key (Hostel_id) references Hostel(Hostel_id)

create table School(
School_name Varchar(255),
No_of_prof int,
School_code varchar(50) Primary key
)

create table Mentor(
Prof_id Varchar(50) references Lecturer(prof_id),
Class_code varchar(50) references Class(Class_code),
School_code varchar(50) references School(School_code),
Primary Key (Prof_id,Class_code,School_code)
)


create table Operate(
School_code Varchar(50) references School(School_code),
Dept_code Varchar(50) references Dept(dept_code),
Primary key(School_code,Dept_code)
)

create table Club(
No_of_Stu int,
Club_name varchar(50) Primary key,
Club_Coordinator Varchar(255),
Date_of_form date
)

create table Runs(
School_id varchar(50) references School(School_code),
Club_name Varchar(50) references Club(Club_name),
Primary key(School_id,Club_name)
)

create table Join_Club(
Student_id varchar(50) references Student(Stu_ID),
Club_name varchar(50) references Club(Club_name),
Primary key (Student_id,Club_name)
)

create Table Friends(
Student_id1 varchar(50) references Student(Stu_ID),
Student_id2 varchar(50) references Student(Stu_ID),
Primary key(Student_id1,Student_id2)
)

create table Grade(
course_code varchar(50) references Course(Crs_code),
Grade varchar(10),
Fname varchar(50),
Lname varchar(50),
Student_id varchar(50) references Student(Stu_ID),
Primary key (course_code,Student_id)
)

create table rooms(
Room_id varchar(50) Primary key,
Hostel_id Varchar(50) references Hostel(Hostel_id),
Room_type Varchar(50)
)

INSERT INTO Student (FName, LName, Stu_ID, Stu_Email, Stu_Stream , area, city, class_c, Hostel_id) VALUES ('Vicky', 'Roy', 'A01', 'Vicky.roy@gmail.com', 'Mathematics', 'Saket', 'Indore', '11A','UG1');
INSERT INTO Student (FName, LName, Stu_ID, Stu_Email, Stu_Stream , area, city, class_c, Hostel_id) VALUES ('Adarsh', 'Goel', 'A02', 'Adarsh.goel@gmail.com', 'Mathematics', 'vijay_nagar', 'Indore', '11A','UG1');
INSERT INTO Student (FName, LName, Stu_ID, Stu_Email, Stu_Stream , area, city, class_c, Hostel_id) VALUES ('Piyush', 'Soni', 'A03', 'Piyush.soni@gmail.com', 'Biology', 'Palasia', 'Indore', '11B','UG2');
INSERT INTO Student (FName, LName, Stu_ID, Stu_Email, Stu_Stream , area, city, class_c, Hostel_id) VALUES ('Sarthak', 'jain', 'A04', 'Sarthak,jain@gmail.com', 'Biology', 'LIG', 'Indore', '11B','UG2');
INSERT INTO Student (FName, LName, Stu_ID, Stu_Email, Stu_Stream , area, city, class_c, Hostel_id) VALUES ('Adesh', 'Pal', 'A05', 'Adesh.pal@gmail.com', 'Commerce', 'Silicon_city', 'Indore', '11c','UG3');
INSERT INTO Student (FName, LName, Stu_ID, Stu_Email, Stu_Stream , area, city, class_c, Hostel_id) VALUES ('Titas', 'Das', 'A06', 'Titas.das@gmail.com', 'Commerce', 'Shalimar', 'Indore', '11c','UG3');
INSERT INTO class (class_code, no_of_stu, cl_teacher) VALUES ('11A', '2', 'Mr.Pandey');
INSERT INTO class (class_code, no_of_stu, cl_teacher) VALUES ('11B', '2', 'Mr.Malviya');
INSERT INTO class (class_code, no_of_stu, cl_teacher) VALUES ('11C', '2', 'Mrs.Sharma');
INSERT INTO enroll (dt, stu_id, cl_c) VALUES ('01-04-2020', 'A01', '11A');
INSERT INTO enroll (dt, stu_id, cl_c) VALUES ('01-04-2020', 'A02', '11A');
INSERT INTO enroll (dt, stu_id, cl_c) VALUES ('01-04-2020', 'A03', '11B');
INSERT INTO enroll (dt, stu_id, cl_c) VALUES ('01-04-2020', 'A04', '11B');
INSERT INTO enroll (dt, stu_id, cl_c) VALUES ('01-04-2020', 'A05', '11C');
INSERT INTO enroll (dt, stu_id, cl_c) VALUES ('01-04-2020', 'A06', '11C');
INSERT INTO Course (Crs_name, CLass_Code, Crs_code, Crs_desc, crs_credit) VALUES ('PCM', '11A', 'M01', 'Maths', '24');
INSERT INTO Course (Crs_name, CLass_Code, Crs_code, Crs_desc, crs_credit) VALUES ('PCB', '11B', 'B01', 'Bio', '30');
INSERT INTO Course (Crs_name, CLass_Code, Crs_code, Crs_desc, crs_credit) VALUES ('COM', '11C', 'C01', 'Accounts', '25');
INSERT INTO CrsName (crs_name, class_code) VALUES ('PCM', '11A');
INSERT INTO CrsName (crs_name, class_code) VALUES ('PCB', '11A');
INSERT INTO CrsName (crs_name, class_code) VALUES ('COM', '11A');
INSERT INTO Dept (No_of_prof, Dept_name, dept_code) VALUES ('1', 'Science', 'ST101');
INSERT INTO Dept (No_of_prof, Dept_name, dept_code) VALUES ('1', 'Business', 'B103');
INSERT INTO Lecturer (Prof_id, Lec_dept, FName, LName, Prof_email, Dept_code) VALUES ('P01','Science', 'Sanjay', 'Pandey', 'Sanjay.panday@gmail.com', 'ST101');
INSERT INTO Lecturer (Prof_id, Lec_dept, FName, LName, Prof_email, Dept_code) VALUES ('P02','Science', 'Ayush', 'Malviya', 'Ayush.malviya@gmail.com', 'ST101');
INSERT INTO Lecturer (Prof_id, Lec_dept, FName, LName, Prof_email, Dept_code) VALUES ('P03','Business', 'Purnima', 'Sharma', 'Purnima.Sharma@gmail.com', 'B103');
INSERT INTO Teach (prof_id, Stu_id) VALUES ('P01', 'A01');
INSERT INTO Teach (prof_id, Stu_id) VALUES ('P01', 'A02');
INSERT INTO Teach (prof_id, Stu_id) VALUES ('P02', 'A03');
INSERT INTO Teach (prof_id, Stu_id) VALUES ('P02', 'A04');
INSERT INTO Teach (prof_id, Stu_id) VALUES ('P03', 'A05');
INSERT INTO Teach (prof_id, Stu_id) VALUES ('P03', 'A06');
INSERT INTO lecturer_ph_no (Prof_id, Ph_no) VALUES ('P01', '7702152121');
INSERT INTO lecturer_ph_no (Prof_id, Ph_no) VALUES ('P02', '6301761239');
INSERT INTO lecturer_ph_no (Prof_id, Ph_no) VALUES ('P03', '9575731506');
INSERT INTO Hostel (Hostel_type, Hostel_id, Hostel_fee) VALUES ('Single bed', 'UG1', '190000');
INSERT INTO Hostel (Hostel_type, Hostel_id, Hostel_fee) VALUES ('Double bed', 'UG2', '170000');
INSERT INTO Hostel (Hostel_type, Hostel_id, Hostel_fee) VALUES ('Triple bed', 'UG3', '150000');
INSERT INTO School (School_name, No_of_prof, School_code) VALUES ('Sishukunj', '3', 'Sk1005409');
INSERT INTO Mentor (Prof_id, Class_code, School_code) VALUES ('P01', '11A', 'Sk1005409');
INSERT INTO Mentor (Prof_id, Class_code, School_code) VALUES ('P02', '11B', 'Sk1005409');
INSERT INTO Mentor (Prof_id, Class_code, School_code) VALUES ('P03', '11C', 'Sk1005409');
INSERT INTO Club (No_of_Stu, Club_name, Club_Coordinator, Date_of_form) VALUES ('1', 'Green House', 'Vicky', '05-05-2020');
INSERT INTO Club (No_of_Stu, Club_name, Club_Coordinator, Date_of_form) VALUES ('2', 'Red House', 'Piyush', '05-05-2020');
INSERT INTO Club (No_of_Stu, Club_name, Club_Coordinator, Date_of_form) VALUES ('1', 'Yellow House', 'Adesh', '05-05-2020');
INSERT INTO Club (No_of_Stu, Club_name, Club_Coordinator, Date_of_form) VALUES ('2', 'Orange House', 'Titas', '05-05-2020');
INSERT INTO Runs (School_id, Club_name) VALUES ('Sk1005409', 'Green House');
INSERT INTO Runs (School_id, Club_name) VALUES ('Sk1005409', 'Red House');
INSERT INTO Runs (School_id, Club_name) VALUES ('Sk1005409', 'Yellow House');
INSERT INTO Runs (School_id, Club_name) VALUES ('Sk1005409', 'Orange House');
INSERT INTO Join_Club (Student_id, Club_name) VALUES ('A06', 'Orange House');
INSERT INTO Friends (Student_id1, Student_id2) VALUES ('A01', 'A02');
INSERT INTO Friends (Student_id1, Student_id2) VALUES ('A03', 'A04');
INSERT INTO Friends (Student_id1, Student_id2) VALUES ('A05', 'A06');
INSERT INTO Grade (course_code, Grade, Fname, Lname, Student_id) VALUES ('M01', 'A', 'Vicky', 'Roy', 'A01');
INSERT INTO Grade (course_code, Grade, Fname, Lname, Student_id) VALUES ('M01', 'A', 'Adarsh', 'Goel', 'A02');
INSERT INTO Grade (course_code, Grade, Fname, Lname, Student_id) VALUES ('B01', 'A', 'Piyush', 'Soni', 'A03');
INSERT INTO Grade (course_code, Grade, Fname, Lname, Student_id) VALUES ('B01', 'A', 'Sarthak', 'Atre', 'A04');
INSERT INTO Grade (course_code, Grade, Fname, Lname, Student_id) VALUES ('C01', 'A', 'Adesh', 'Pal', 'A05');
INSERT INTO Grade (course_code, Grade, Fname, Lname, Student_id) VALUES ('C01', 'A', 'Titas', 'Das', 'A06');
INSERT INTO rooms (Room_id, Hostel_id, Room_type) VALUES ('UG1001', 'UG1', 'Single bed');
INSERT INTO rooms (Room_id, Hostel_id, Room_type) VALUES ('UG1002', 'UG1', 'Single bed');
INSERT INTO rooms (Room_id, Hostel_id, Room_type) VALUES ('UG2001', 'UG2', 'Double bed');
INSERT INTO rooms (Room_id, Hostel_id, Room_type) VALUES ('UG2002', 'UG2', 'Double bed');
INSERT INTO rooms (Room_id, Hostel_id, Room_type) VALUES ('UG3001', 'UG3', 'Triple bed');
INSERT INTO rooms (Room_id, Hostel_id, Room_type) VALUES ('UG3002', 'UG3', 'Triple bed');
INSERT INTO Operate(School_code, Dept_code) VALUES ('Sk1005409', 'ST101');
INSERT INTO Operate(School_code, Dept_code) VALUES ('Sk1005409', 'B103');