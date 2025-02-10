-- use master;
-- create database Tutor_school_database

use Tutor_school_database;

drop table if exists course_online
drop table if exists course_onsite;
drop table if exists course_main;
drop table if exists Room;
drop table if exists Tutor;
drop table if exists Student;

create table Student(
    StudentID INT PRIMARY KEY,
    NationalID NUMERIC UNIQUE,
    FirstName NVARCHAR(30) NOT NULL,
    LastName NVARCHAR(30) NOT NULL,
    Age INT NOT NULL,
    Grade INT NOT NULL, -- define เด็กซิ่ว = 0
    PhoneNumber VARCHAR(20)
);

create table Tutor (
    TutorID INT PRIMARY KEY,
    NationalID NUMERIC UNIQUE,
    FirstName NVARCHAR(30) NOT NULL,
    LastName NVARCHAR(30) NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Education VARCHAR(50) NOT NULL,
    Teaching NVARCHAR(30) NOT NULL
);

create table Room (
    RoomID INT PRIMARY KEY
);

create table course_main(
    course_id INT PRIMARY KEY,
    subject_name VARCHAR(10) NOT NULL,
    course_name VARCHAR(10) UNIQUE,
);

create table course_onsite(
    course_id INT NOT NULL,
    price INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    PRIMARY KEY (course_id,start_time,end_time),
);

create table course_online(
    course_id INT PRIMARY KEY,
    price INT NOT NULL,
);

-- Insert sample students
INSERT INTO Student (StudentID, NationalID, FirstName, LastName, Age, Grade, PhoneNumber) VALUES
(1, 123456789, 'John', 'Doe', 18, 12, '081-123-4567'),
(2, 987654321, 'Alice', 'Smith', 19, 0, '082-234-5678'), -- เด็กซิ่ว
(3, 456789123, 'Bob', 'Johnson', 17, 11, '083-345-6789'),
(4, 321654987, 'Emma', 'Brown', 16, 10, '084-456-7890'),
(5, 654987321, 'Liam', 'Williams', 18, 12, '085-567-8901');

-- Insert sample tutors
INSERT INTO Tutor (TutorID, NationalID, FirstName, LastName, Phone, Education, Teaching) VALUES
(1, 111222333, 'Michael', 'Taylor', '086-678-9012', 'M.Sc. in Mathematics', 'Mathematics'),
(2, 444555666, 'Sarah', 'Anderson', '087-789-0123', 'B.A. in English', 'English'),
(3, 777888999, 'David', 'Martinez', '088-890-1234', 'Ph.D. in Physics', 'Physics'),
(4, 222333444, 'Sophia', 'Harris', '089-901-2345', 'M.Ed. in Education', 'General Studies'),
(5, 999000111, 'James', 'Clark', '090-012-3456', 'B.Sc. in Chemistry', 'Chemistry');

-- Insert sample rooms
INSERT INTO Room (RoomID) VALUES
(101),
(102),
(103),
(104),
(105);

INSERT INTO course_main(course_id,subject_name,course_name) VALUES 
(1,'math','math I'),
(2,'math','math II');

INSERT INTO course_onsite(course_id,price,start_time,end_time) VALUES 
(1,2000,'2024-11-21 15:30','2024-11-21 16:30'),
(1,2000,'2024-11-22 15:30','2024-11-22 16:30'),
(1,2000,'2024-11-23 15:30','2024-11-23 16:30'),
(2,3000,'2025-11-21 15:30','2025-11-21 16:30'),
(2,4000,'2025-11-22 15:30','2025-11-22 16:30'),
(2,5000,'2025-11-23 15:30','2025-11-23 16:30');

select *
from course_onsite, course_main
where course_onsite.course_id = course_main.course_id;

-- create register()
