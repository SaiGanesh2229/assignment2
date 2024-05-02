create table Students (
student_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
date_of_birth DATE,
email VARCHAR(30),
phone_number VARCHAR(30)
);

create table Teacher (
teacher_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100)
);

create table Courses (
course_id INT AUTO_INCREMENT PRIMARY KEY,
course_name VARCHAR(100),
credits INT,
teacher_id INT,
FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

create table Enrollments (
enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE,
FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

create table Payments (
payment_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
amount DECIMAL(10, 2),
payment_date DATE,
FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
-- --------------------------task1 Database Design:  ------------------------------
-- 1)db ssid creation
create database SISDB;
use SISDB;
-- 2)create schemas ssid
create table Students (
student_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
date_of_birth DATE,
email VARCHAR(30),
phone_number VARCHAR(30)
);


create table Teacher (
teacher_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100)
);

create table Courses (
course_id INT AUTO_INCREMENT PRIMARY KEY,
course_name VARCHAR(100),
credits INT,
teacher_id INT,
FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

create table Enrollments (
enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
course_id INT,
enrollment_date DATE,
FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

create table Payments (
payment_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT,
amount DECIMAL(10, 2),
payment_date DATE,
FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
-- 3) er diagram --
-- 4) create pk fk constraints -- not created already created while creating table --
-- 5) -- 10 samples creation --
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) 
VALUES 
(1, 'John', 'Doe', '1995-06-10', 'john.doe@ex.com', '1234567890'),
(2, 'Jane', 'Smith', '1996-08-15', 'jane.smith@ex.com', '9876543210'),
(3, 'Michael', 'Johnson', '1997-04-20', 'michael.johnson@ex.com', '5551234567'),
(4, 'Emily', 'Brown', '2019-10-25', 'emily.brown@ex.com', '4442223333'),
(5, 'David', 'Martinez', '1999-12-30', 'david.martinez@ex.com', '1119998888'),
(6, 'Sophia', 'Wilson', '2000-03-05', 'sophia.wilson@ex.com', '7778889999'),
(7, 'Olivia', 'Garcia', '2017-05-10', 'olivia.garcia@ex.com', '2223334444'),
(8, 'Ethan', 'Lopez', '2002-07-15', 'ethan.lopez@ex.com', '6667778888'),
(9, 'Emma', 'Hernandez', '2003-01-26', 'emma.hernandez@ex.com', '5554443333'),
(10, 'Aiden', 'King', '2024-04-25', 'aiden.king@ex.com', '9998887777');


INSERT INTO Teacher (teacher_id, first_name, last_name, email) 
VALUES 
(1, 'Alice', 'Johnson', 'alice.johnson@example.com'),
(2, 'Bob', 'Smith', 'bob.smith@example.com'),
(3, 'Charlie', 'Brown', 'charlie.brown@example.com'),
(4, 'Diana', 'Martinez', 'diana.martinez@example.com'),
(5, 'Eva', 'Taylor', 'eva.taylor@example.com'),
(6, 'Frank', 'Davis', 'frank.davis@example.com'),
(7, 'Grace', 'Wilson', 'grace.wilson@example.com'),
(8, 'Henry', 'Clark', 'henry.clark@example.com'),
(9, 'Ivy', 'Garcia', 'ivy.garcia@example.com'),
(10, 'Jack', 'Lee', 'jack.lee@example.com');


INSERT INTO Courses (course_id, course_name, credits, teacher_id) 
VALUES 
(1, 'Mathematics', 3, 1),
(2, 'English Literature', 4, 2),
(3, 'Computer Science', 3, 3),
(4, 'History', 3, 4),
(5, 'Biology', 4, 5),
(6, 'Physics', 3, 1),
(7, 'Chemistry', 4, 2),
(8, 'Art', 2, 3),
(9, 'Geography', 3, 4),
(10, 'Economics', 4, 5);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) 
VALUES 
(1, 1, 1, '2024-01-15'),
(2, 2, 2, '2024-02-20'),
(3, 3, 3, '2024-03-10'),
(4, 4, 4, '2024-04-25'),
(5, 5, 5, '2024-05-05'),
(6, 6, 1, '2024-01-20'),
(7, 7, 2, '2024-02-25'),
(8, 8, 3, '2024-03-15'),
(9, 9, 4, '2024-04-30'),
(10, 10, 5, '2024-05-10');

INSERT INTO Payments (payment_id, student_id, amount, payment_date) 
VALUES 
(1, 1, 100.00, '2024-01-02'),
(2, 2, 150.00, '2024-02-05'),
(3, 3, 120.00, '2024-03-12'),
(4, 4, 180.00, '2024-04-20'),
(5, 5, 200.00, '2024-05-25'),
(6, 6, 90.00, '2024-01-05'),
(7, 7, 170.00, '2024-02-10'),
(8, 8, 110.00, '2024-03-20'),
(9, 9, 190.00, '2024-04-28'),
(10, 10, 220.00, '2024-05-30');
------------------ task2: Select, Where, Between, AND, LIKE:   ------------------
use sisdb;
-- 1.	Write an SQL query to insert a new student into the "Students" table with the following details: a. First Name: John 
-- b.	Last Name: Doe 
-- c.	Date of Birth: 1995-08-15 
-- d.	Email: john.doe@example.com 
-- e.	Phone Number: 1234567890 
desc students;
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) 
VALUES 
(11, 'John', 'Doe', '1995-08-15', 'john.doe@ex.com', '1234567890');
------------------------
-- 2. Write an SQL query to enroll a student in a course. 
-- Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date. 
desc enrollments;
select * from enrollments;
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) 
VALUES 
(11, 1, 1, '2024-04-25');
------------------------------
-- 3.Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address. 
select * from teacher;
update teacher set email = 'smith.bob@example.com' WHERE teacher_id = 2;
------------------------------
-- 4.Write an SQL query to delete a specific enrollment record from the "Enrollments" table.
-- Select an enrollment record based on the student and course. 
select * from enrollments;
delete from enrollments where student_id=3 and course_id=3;
-----------------------------
-- 5.Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables. 
select * from courses;
update courses set teacher_id=3 where course_name='physics';
-----------------------------
-- 6.	Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table.
-- Be sure to maintain referential integrity. 
select * from students;
start transaction;
delete from  enrollments WHERE student_id =4;
delete from students where first_name = 'emily';
---- got an error that cannot delete parent table value so delted based on reference table payments, student record --
START TRANSACTION;
DELETE FROM Payments
WHERE student_id = (select student_id from Students where first_name = 'Emily'); 
delete from Students where first_name = 'Emily';
--------------------------------
-- 7.	Update the payment amount for a specific payment record in the "Payments" table.
-- Choose any payment record and modify the payment amount. 
desc payments;
select * from payments;
update payments set amount=110 where payment_id=1;
-- -----------------Task3 Aggregate functions, Having, Order By, GroupBy and Joins: ----------------
-- 1.Write an SQL query to calculate the total payments made by a specific student. 
-- You will need to join the "Payments" table with the "Students" table based on the student's ID. 
select s.student_id, SUM(p.amount) AS totalpayments from Students s
join Payments p ON s.student_id = p.student_id where s.student_id = 2
group by s.student_id;

desc payments;
select * from payments;
---------------------------------
 -- 2.	Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. 
 -- Use a JOIN operation between the "Courses" table and the "Enrollments" table
select c.course_id, c.course_name, COUNT(*) AS enrolledstudents from Courses c
join Enrollments e ON c.course_id = e.course_id
group by c.course_id, c.course_name;

---------------------------------
-- 3.	Write an SQL query to find the names of students who have not enrolled in any course. 
-- Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments. 

select s.first_name, s.student_id from students s  
left join enrollments e on s.student_id = e.student_id where e.student_id is null;
select * from enrollments;

-- ----------------------------------
-- 4.	Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in.
-- Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables. 
select s.first_name,s.last_name,c.course_name from students s 
join Enrollments e ON s.student_id = e.student_id join Courses c ON e.course_id = c.course_id;  

------------------------------------
-- 5.	Create a query to list the names of teachers and the courses they are assigned to.
-- Join the "Teacher" table with the "Courses" table. 
select t.first_name,c.course_name from teacher t
join courses c on c.course_id=t.teacher_id;
-------------------------------------
-- 6.	Retrieve a list of students and their enrollment dates for a specific course. 
-- You'll need to join the "Students" table with the "Enrollments" and "Courses" tables. 
select s.first_name,e.enrollment_date,c.course_name from students s 
join Enrollments e ON s.student_id = e.student_id join Courses c ON e.course_id = c.course_id;  
-------------------------------------
-- 7.	Find the names of students who have not made any payments. Use a LEFT JOIN between the 
-- "Students" table and the "Payments" table and filter for students with NULL payment records. 
select s.first_name, s.student_id as notpaid from students s  
left join payments p on s.student_id = p.payment_id where p.payment_id is null;
--------------------------------------
-- 8.	Write a query to identify courses that have no enrollments.
-- You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records. 
select c.course_name, c.course_id,enrollment_id  from courses c 
left join enrollments e on c.course_id = e.enrollment_id where e.enrollment_id is null;
-- e_id 3,4 are null --
-------------------------------------
-- 9.	Identify students who are enrolled in more than one course.
-- Use a self-join on the "Enrollments" table to find students with multiple enrollment records. 
select e.student_id, count(e.course_id) AS multiple_enrollments FROM Enrollments e
group by e.student_id having count(e.course_id) > 1;
-------------------------------------
-- 10.	Find teachers who are not assigned to any courses.
-- Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments. 
select t.* FROM Teacher t left join Courses c on t.teacher_id = c.teacher_id where c.teacher_id is null;
-- -------------------------------------TASK4---------------------------------------
-- 1.Write an SQL query to calculate the average number of students enrolled in each course.
-- Use aggregate functions and subqueries to achieve this. 
select avg(num_students) as avgcount from(select course_id, count(student_id) as num_students from enrollments
group by course_id) as enrollment_counts;
--------------------------------------
-- 2.Identify the student(s) who made the highest payment.
-- Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount. 
select student_id,first_name,last_name from students where student_id IN (SELECT student_id from Payments 
where amount = (select max(amount) from Payments));
---------------------------------------
-- 3.	Retrieve a list of courses with the highest number of enrollments.
-- Use subqueries to find the course(s) with the maximum enrollment count. 
select course_id,course_name from courses where course_id in (select course_id from Enrollments group by course_id
having count(*) = (select MAX(enrollment_count) from (select course_id,count(*) as enrollment_count from 
enrollments group by course_id) as subquery));
---------------------------------------
-- 4.	Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses. 
select t.teacher_id,t.first_name,t.last_name,
(select SUM(p.amount) from Payments p
inner join Courses c on p.student_id = c.course_id
where c.teacher_id = t.teacher_id
) as sum from Teacher t;
select* from payments;
------------------------------------
-- 5.	Identify students who are enrolled in all available courses.
-- Use subqueries to compare a student's enrollments with the total number of courses. 
select student_id,first_name,last_name from students where (select count(distinct course_id)from Courses) 
= (select count(distinct course_id)from Enrollments where Enrollments.student_id = Students.student_id);
------------------------------------
-- 6.Retrieve the names of teachers who have not been assigned to any courses.
-- Use subqueries to find teachers with no course assignments. 
select t.first_name, t.last_name from Teacher t where t.teacher_id not in (select teacher_id FROM Courses);
------------------------------------
-- 7.	Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth. 
select avg(age) as avg_age from(select TIMESTAMPDIFF(year, date_of_birth, CURDATE()) as age from Students)as std_age;
------------------------------------
-- 8.	Identify courses with no enrollments. Use subqueries to find courses without enrollment records. 
select c.course_id, c.course_name from Courses c
where c.course_id not in (select course_id from enrollments);
------------------------------------
-- 9.	Calculate the total payments made by each student for each course they are enrolled in.
-- Use subqueries and aggregate functions to sum payments. 
select e.student_id, e.course_id, sum(p.amount) as total_payments from Enrollments e
left join Payments p on e.student_id = p.student_id group by e.student_id, e.course_id;
------------------------------------
-- 11.	Write an SQL query to calculate the total payments made by each student.
-- Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student. 
select p.student_id, sum(p.amount) as totalamount FROM Payments p
group by p.student_id;
---------------------------------------
-- 12.	Retrieve a list of course names along with the count of students enrolled in each course.
-- Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments. 
select c.course_name, COUNT(e.student_id) as count from Courses c left join Enrollments e ON c.course_id = e.course_id
group by c.course_name;
-----------------------------------------
-- 13.	Calculate the average payment amount made by students.
-- Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average. 
select p.student_id, avg(p.amount) as average_payment from Payments p
group by p.student_id;
