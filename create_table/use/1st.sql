-- Mudmee 12:28AM | 11 Feb 2025

-- use master;
-- create database Tutor_school_database
--use Tutor_school_database;

drop table if exists Student;
drop table if exists Tutor;
drop table if exists Room;
drop table if exists Course_onsite;
drop table if exists Course_online;
drop table if exists Register_onsite;
drop table if exists Register_online;
drop table if exists Promotion;

create table Student(
    StudentID INT UNIQUE,
    NationalID NUMERIC UNIQUE,
    FirstName NVARCHAR(30) NOT NULL,
    LastName NVARCHAR(30) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Age INT NOT NULL,
    Grade INT NOT NULL, -- define เด็กซิ่ว = 0

    PRIMARY KEY (StudentID)
);

create table Tutor (
    TutorID INT UNIQUE,
    NationalID NUMERIC UNIQUE,
    FirstName NVARCHAR(30) NOT NULL,
    LastName NVARCHAR(30) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    Education VARCHAR(50) NOT NULL,
    Teaching NVARCHAR(30) NOT NULL,

    PRIMARY KEY (TutorID)
);

create table Room (
    RoomID INT,
    PRIMARY KEY (RoomID)
);

create table Course_onsite(
    CourseID INT NOT NULL,
    TutorID INT UNIQUE,
    SubjectName VARCHAR(30) NOT NULL,
    CourseName VARCHAR(30) UNIQUE,
    Price INT NOT NULL,

    RoomID INT,
    Startdy char(3) check (Startdy in ('MON','TUE','WED','THU','FRI','SAT','SUN')),
    start_time time(0) NOT NULL,
    end_time time(0) NOT NULL,

    PRIMARY KEY (CourseID, RoomID, Startdy, start_time,end_time),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
    FOREIGN KEY (TutorID) REFERENCES Tutor(TutorID)
);

-- fix room | how do we know which schedule belongs to which schedule
-- Math 1 jt
-- mon 9-12 room101
-- fri 13-16 room101

-- Math 1 tw
-- sat 9-12 room101
-- sun 9-12 room101

create table Course_online (
    CourseID INT NOT NULL,
    SubjectName VARCHAR(30) NOT NULL,
    CourseName VARCHAR(30) UNIQUE,
    Price INT NOT NULL,
    
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    PRIMARY KEY (CourseID, start_time, end_time)
);
-- day     | time
-- mon     | 18-20
-- sat,sun | 12-14

create table Register_onsite (
    RegisterID INT UNIQUE,
    StudentID INT NOT NULL,
    TutorID INT NOT NULL,
    CourseID INT NOT NULL,
    enroll_time DATETIME NOT NULL,

    -- same course, different schedule
    -- ต้องใส่ซ้ำไหมเพราะใน tablse course มีอยู่แล้ว
    RoomID INT,
    Startdy char(3) check (Startdy in ('MON','TUE','WED','THU','FRI','SAT','SUN')),
    start_time time(0) NOT NULL,
    end_time time(0) NOT NULL,

    PRIMARY KEY (RegisterID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (TutorID) REFERENCES Tutor(TutorID),
    FOREIGN KEY (CourseID) REFERENCES Course_onsite(CourseID)
);

create table Register_online (
    RegisterID INT UNIQUE,
    StudentID INT NOT NULL,
    TutorID INT NOT NULL,
    CourseID INT NOT NULL,
    enroll_time DATETIME NOT NULL,
    
    PRIMARY KEY (RegisterID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (TutorID) REFERENCES Tutor(TutorID),
    FOREIGN KEY (CourseID) REFERENCES Course_online(CourseID)
);
