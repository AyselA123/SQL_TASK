create database Many_ToMany
use Many_ToMany

create table StudentsTable(
    student_id int primary key identity,
	student_name nvarchar(30),
	age tinyint,
	grade int
)
create table CoursesTable(
    course_id int primary key identity,
	course_name nvarchar(30),
	credits int
)
create table Enrollments(
    EnrollmentsId int primary key identity,
	StudentsId int foreign key references StudentsTable(student_id),
	CoursesId int foreign key references CoursesTable(course_id)
)

drop table Enrollments

create table Enrollments(
    EnrollmentsId int primary key identity,
	StudentId int foreign key references StudentsTable(student_id),
	CourseId int foreign key references CoursesTable(course_id)
)

insert into StudentsTable values 
('Aysel',22,100),
('Vusale',23,90),
('Xanim',21,80),
('Aynur',24,70),
('Aysu',18,75),
('Qurban',17,66),
('Huseyn',24,85),
('Nigar',19,95),
('Nergiz',16,81),
('Sebine',25,60)

insert into CoursesTable values
('P145',90),
('P140',100),
('P120',80),
('P110',70),
('P150',50)

insert into Enrollments values
(2, 2),
(1, 1),
(5, 3),
(4, 5),
(7, 4),
(10, 3),
(6, 4),
(9, 1),
(2, 5),
(4, 2)


select StudentsTable.student_name,StudentsTable.age,StudentsTable.grade,Enrollments.CourseId,Enrollments.StudentId from StudentsTable
inner join Enrollments 
on Enrollments.StudentId=StudentsTable.student_id 

SELECT 
CoursesTable.course_name,AVG(StudentsTable.age) AS 'Average Age' FROM CoursesTable 
INNER JOIN Enrollments 
ON CoursesTable.course_id=Enrollments.CourseId 
INNER JOIN StudentsTable 
ON Enrollments.StudentId=StudentsTable.student_id 
GROUP BY CoursesTable.course_name

SELECT CoursesTable.course_name ,AVG(StudentsTable.Age) AS 'Average Age' FROM CoursesTable 
INNER JOIN Enrollments 
ON CoursesTable.course_id=Enrollments.CourseId 
INNER JOIN StudentsTable 
ON Enrollments.StudentId=StudentsTable.student_id 
GROUP BY CoursesTable.course_name 
HAVING AVG(StudentsTable.Age) <=25


